package middleware

import (
	"fmt"

	"github.com/QuantumNous/new-api/common"
	"github.com/gin-gonic/gin"
)

// TODO by mawen 需要同一迁移到 context_key.go，提升可读性和代码导航
// 用于在日志记录路由类型，支持 api/old_api/web/relay
const RouteTagKey = "route_tag"

func RouteTag(tag string) gin.HandlerFunc {
	return func(c *gin.Context) {
		// 写入 route_tag:<tag>
		c.Set(RouteTagKey, tag)
		c.Next()
	}
}

// SetUpLogger
func SetUpLogger(server *gin.Engine) {
	server.Use(gin.LoggerWithFormatter(func(param gin.LogFormatterParams) string {
		var requestID string
		if param.Keys != nil {
			// 从 Request 上下文中读取
			requestID, _ = param.Keys[common.RequestIdKey].(string)
		}
		// 从 Request 上下文中读取
		tag, _ := param.Keys[RouteTagKey].(string)
		if tag == "" {
			tag = "web"
		}
		// 日志格式：[GIN] 时间 | 路由类型 | 请求ID | 响应状态码 | 响应延迟 | 客户端IP | 请求方法 | 请求路径
		return fmt.Sprintf("[GIN] %s | %s | %s | %3d | %13v | %15s | %7s %s\n",
			param.TimeStamp.Format("2006/01/02 - 15:04:05"),
			tag,
			requestID,
			param.StatusCode,
			param.Latency,
			param.ClientIP,
			param.Method,
			param.Path,
		)
	}))
}
