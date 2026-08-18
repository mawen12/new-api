package controller

import (
	"time"

	"github.com/QuantumNous/new-api/common"
	"github.com/QuantumNous/new-api/constant"
	"github.com/QuantumNous/new-api/model"
	"github.com/QuantumNous/new-api/setting/operation_setting"
	"github.com/gin-gonic/gin"
)

type Setup struct {
	Status       bool   `json:"status"`        // 状态
	RootInit     bool   `json:"root_init"`     // root 用户是否存在
	DatabaseType string `json:"database_type"` // 数据库类型
}

type SetupRequest struct {
	Username           string `json:"username"`           // 用户名
	Password           string `json:"password"`           // 密码
	ConfirmPassword    string `json:"confirmPassword"`    // 确认密码
	SelfUseModeEnabled bool   `json:"SelfUseModeEnabled"` // 自用模式开关
	DemoSiteEnabled    bool   `json:"DemoSiteEnabled"`    // 演示站点开关
}

// GetSetup godoc
// @Summary 检查应用初始化状态
// @Description 如果应用尚未初始化，则应使用 /api/setup [post] 接口进行初始化
// @Tags 通用
// @Router /api/setup [get]
func GetSetup(c *gin.Context) {
	setup := Setup{
		Status: constant.Setup,
	}
	if constant.Setup {
		c.JSON(200, gin.H{
			"success": true,
			"data":    setup,
		})
		return
	}
	setup.RootInit = model.RootUserExists()
	setup.DatabaseType = string(common.MainDatabaseType())
	c.JSON(200, gin.H{
		"success": true,
		"data":    setup,
	})
}

// PostSetup godoc
// @Summary 初始化应用，创建 Root 用户
// @Description 仅当应用尚未初始化时才能调用，仅能起效一次
// @Tags 通用
// @Router /api/setup [post]
func PostSetup(c *gin.Context) {
	// Check if setup is already completed
	if constant.Setup {
		c.JSON(200, gin.H{
			"success": false,
			"message": "系统已经初始化完成",
		})
		return
	}

	// Check if root user already exists
	rootExists := model.RootUserExists()

	var req SetupRequest
	err := c.ShouldBindJSON(&req)
	if err != nil {
		c.JSON(200, gin.H{
			"success": false,
			"message": "请求参数有误",
		})
		return
	}

	// If root doesn't exist, validate and create admin account
	if !rootExists {
		// Validate username length: max 12 characters to align with model.User validation
		if len(req.Username) > 12 {
			c.JSON(200, gin.H{
				"success": false,
				"message": "用户名长度不能超过12个字符",
			})
			return
		}
		// Validate password
		if req.Password != req.ConfirmPassword {
			c.JSON(200, gin.H{
				"success": false,
				"message": "两次输入的密码不一致",
			})
			return
		}

		if len(req.Password) < 8 {
			c.JSON(200, gin.H{
				"success": false,
				"message": "密码长度至少为8个字符",
			})
			return
		}

		// Create root user
		hashedPassword, err := common.Password2Hash(req.Password)
		if err != nil {
			c.JSON(200, gin.H{
				"success": false,
				"message": "系统错误: " + err.Error(),
			})
			return
		}
		rootUser := model.User{
			Username:    req.Username,
			Password:    hashedPassword,           // 保存 hash 加密后的密码
			Role:        common.RoleRootUser,      // Root 用户
			Status:      common.UserStatusEnabled, // 启用状态
			DisplayName: "Root User",
			AccessToken: nil,
			Quota:       100000000,
		}
		// INSERT INTO users
		err = model.DB.Create(&rootUser).Error
		if err != nil {
			c.JSON(200, gin.H{
				"success": false,
				"message": "创建管理员账号失败: " + err.Error(),
			})
			return
		}
	}

	// Set operation modes
	operation_setting.SelfUseModeEnabled = req.SelfUseModeEnabled
	operation_setting.DemoSiteEnabled = req.DemoSiteEnabled

	// Save operation modes to database for persistence
	err = model.UpdateOption("SelfUseModeEnabled", boolToString(req.SelfUseModeEnabled))
	if err != nil {
		c.JSON(200, gin.H{
			"success": false,
			"message": "保存自用模式设置失败: " + err.Error(),
		})
		return
	}

	err = model.UpdateOption("DemoSiteEnabled", boolToString(req.DemoSiteEnabled))
	if err != nil {
		c.JSON(200, gin.H{
			"success": false,
			"message": "保存演示站点模式设置失败: " + err.Error(),
		})
		return
	}

	// Update setup status
	constant.Setup = true

	setup := model.Setup{
		Version:       common.Version,
		InitializedAt: time.Now().Unix(),
	}
	err = model.DB.Create(&setup).Error
	if err != nil {
		c.JSON(200, gin.H{
			"success": false,
			"message": "系统初始化失败: " + err.Error(),
		})
		return
	}

	c.JSON(200, gin.H{
		"success": true,
		"message": "系统初始化成功",
	})
}

func boolToString(b bool) string {
	if b {
		return "true"
	}
	return "false"
}
