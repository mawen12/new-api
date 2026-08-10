package middleware

import (
	"context"

	"github.com/QuantumNous/new-api/common"
	"github.com/gin-gonic/gin"
)

// RequestId 请求ID生成，并写入 gin 请求上下文、上下文和响应头
func RequestId() func(c *gin.Context) {
	return func(c *gin.Context) {
		id := common.NewRequestId()
		c.Set(common.RequestIdKey, id)
		ctx := context.WithValue(c.Request.Context(), common.RequestIdKey, id)
		c.Request = c.Request.WithContext(ctx)
		c.Header(common.RequestIdKey, id)
		c.Next()
	}
}
