package common

import (
	"sync"
	"time"
)

type InMemoryRateLimiter struct {
	store              map[string]*[]int64 // key -> [old << new]
	mutex              sync.Mutex          // 排他锁
	expirationDuration time.Duration       // 清理间隔，该值需要大于限流的间隔
}

// Init 可重复调用的初始化操作
func (l *InMemoryRateLimiter) Init(expirationDuration time.Duration) {
	if l.store == nil {
		l.mutex.Lock()
		if l.store == nil {
			l.store = make(map[string]*[]int64)
			l.expirationDuration = expirationDuration
			if expirationDuration > 0 {
				go l.clearExpiredItems()
			}
		}
		l.mutex.Unlock()
	}
}

// clearExpiredItems 提供了 TTL 能力
func (l *InMemoryRateLimiter) clearExpiredItems() {
	for {
		time.Sleep(l.expirationDuration)
		l.mutex.Lock()
		now := time.Now().Unix()
		for key := range l.store {
			queue := l.store[key]
			size := len(*queue)
			// 清理条件：空队列或者队列中最后一个元素超过了等待时长
			if size == 0 || now-(*queue)[size-1] > int64(l.expirationDuration.Seconds()) {
				delete(l.store, key)
			}
		}
		l.mutex.Unlock()
	}
}

// Request parameter duration's unit is seconds
func (l *InMemoryRateLimiter) Request(key string, maxRequestNum int, duration int64) bool {
	l.mutex.Lock()
	defer l.mutex.Unlock()
	// [old <-- new]
	queue, ok := l.store[key]
	now := time.Now().Unix()
	if ok {
		if len(*queue) < maxRequestNum { // 没有超过限制
			*queue = append(*queue, now)
			return true
		} else { // 超过限制
			if now-(*queue)[0] >= duration { // 首个元素的时间已经过期了，可以移除掉
				*queue = (*queue)[1:]
				*queue = append(*queue, now)
				return true
			} else { // 没有过期，代表有效期内超过了限制
				return false
			}
		}
	} else { // 首次存入队列
		s := make([]int64, 0, maxRequestNum)
		l.store[key] = &s
		*(l.store[key]) = append(*(l.store[key]), now)
	}
	return true
}
