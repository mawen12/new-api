package model

type Setup struct {
	ID            uint   `json:"id" gorm:"primaryKey;comment:系统初始化ID"`
	Version       string `json:"version" gorm:"type:varchar(50);not null;comment:应用版本"`
	InitializedAt int64  `json:"initialized_at" gorm:"type:bigint;not null;comment:系统初始化时间"`
}

func GetSetup() *Setup {
	var setup Setup
	err := DB.First(&setup).Error
	if err != nil {
		return nil
	}
	return &setup
}
