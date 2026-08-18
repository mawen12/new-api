# 启动

```bash
cp .env.example .env

go run main.go
```

# 初始化

## 网页

访问 http://localhost:3000/setup

## 命令行

```bash
# 检查是否已经初始化
curl http://localhost:3000/api/setup

# 初始化
curl -X POST http://localhost:3000/api/setup \
 -H "Content-Type: application/json" \
 -d '{
    "username": "root",
    "password": "12345678",
    "confirmPassword": "12345678",
    "SelfUseModeEnabled": true,
    "DemoSiteEnabled": false
 }'
```