# Documenting

## API：Swagger

```bash
swag init
```

官方文档地址：https://www.newapi.ai/zh/docs/api

## Table: GORM

```go
`gorm:"comment:xxx"`
```

## SQL: GORM

```sql
SELECT xxx FROM xxx 
```

# OpenTelemetry Protocol

# Testing

- CREATE POST
- UPDATE PUT
- SEARCH GET
- DELETE DELETE

# 代码优化改善

## constant 中的 context_key 未被正确使用，有些直接使用字面值，不够规范和统一

典型场景：auth.go

## 