package controller

import (
	"net/http"

	"github.com/QuantumNous/new-api/service/authz"

	"github.com/gin-gonic/gin"
)

// GetPermissionCatalog godoc
// @Summary 返回客户端用户渲染权限编辑器的 schema
// @Description returns the permission schema used by the client to render the permission editor: the registry of resources with their actions and display label keys, plus the roles with their baseline grant matrices. Defining it in the authz package keeps the schema in a single place.
// @Tags 权限
// @Router /api/authz/catalog [get]
func GetPermissionCatalog(c *gin.Context) {
	c.JSON(http.StatusOK, gin.H{
		"success": true,
		"message": "",
		"data": gin.H{
			"resources": authz.Catalog(),
			"roles":     authz.Roles(),
		},
	})
}
