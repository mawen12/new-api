package middleware

import "github.com/gin-gonic/gin"

// DisableCache 禁用 HTTP 缓存
// https://developer.mozilla.org/zh-CN/docs/Web/HTTP/Guides/Caching
func DisableCache() gin.HandlerFunc {
	return func(c *gin.Context) {
		c.Header("Cache-Control", "no-store, no-cache, must-revalidate, private, max-age=0")
		c.Header("Pragma", "no-cache")
		c.Header("Expires", "0")
		c.Next()
	}
}
