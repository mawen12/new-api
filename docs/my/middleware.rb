cheatsheet do
    title 'Middleware'
    docset_file_name 'Middleware'
    keyword 'middleware'
    style '
        code {
            border: none;
            white-space: pre;
        }
        
        code::before, code::after {
            content: "";
        }

        tr {
            border-bottom: 2px dashed #b8b8b8;
        }
    '

    category do
        id 'Trace'

        entry do
            name 'RequestId'
            notes '生成唯一ID，写入到响应头、go request context、gin context'
        end
        entry do
            name 'Version'
            notes '将系统版本写入到响应头'
        end
        entry do
            name 'RouteTag'
            notes '用于在日志中记录路由类型，支持 api/old_api/web/relay'
        end
    end

    category do
        id 'Metric'

        entry do
            name 'StatsMiddleware'
            notes '统计当前活跃的HTTP连接数'
        end
        entry do
            name 'SystemPerformanceCheck'
            notes '检查系统当前的 CPU、内存、磁盘是否超过超过阈值，当超过时拒绝处理'
        end
    end

    category do
        id 'Performance'

        entry do
            name 'Cache'
            notes '将 Cache-Control 和 Cache-Version 写入到响应头中，时长为 1周'
        end
        entry do
            name 'DisableCache'
            notes '将 Cache-Control、Pragma 和 Expires 写入到响应头中，禁用缓存'
        end
        entry do
            name 'DecompressRequestMiddleware'
            notes '将报文体按照 gzip 进行解压'
        end
    end

    category do
        id 'Traffic Control'

        entry do
            name 'EmailVerificationRateLimit'
            notes '实现对单个ip的邮箱发送限流，30s内最多2次。实现了基于内存和redis的两套限流，其中内存采用的滑动时间窗口，redis 采用的是固定时间窗口，当redis没有启用或者出错时，回退到内存'
        end
        entry do
            name 'ModelRequestRateLimit'
            notes '基于配置实现对指定分组（Token分组/用户分组）的限流。实现了基于内存和redis的两套限流。实现了基于内存和redis的两套限流，其中内存采用的滑动时间窗口，redis 采用的是固定时间窗口，当redis没有启用或者出错时，回退到内存'
        end
        entry do
            name 'GlobalWebRateLimit'
            notes '基于配置实现对全局前端资源访问的限流。'
        end
        entry do
            name 'GlobalAPIRateLimit'
            notes '基于配置实现对全局/api前缀接口的限流。'
        end
        entry do
            name 'CriticalRateLimit'
            notes '基于配置实现对敏感接口的限流，比如用户登录、认证等。'
        end
        entry do
            name 'UserCriticalRateLimit'
            notes '基于配置实现对token接口的限流。'
        end
        entry do
            name 'DownloadRateLimit'
            notes '基于配置实现对下载接口的限流。'
        end
        entry do
            name 'UploadRateLimit'
            notes '基于配置实现对上传接口的限流。'
        end
        entry do
            name 'AnonymousRequestBodyLimit'
            notes '基于配置实现对请求体大小的限制。'
        end
    end

    category do
        id 'Security'

        entry do
            name 'UserAuth'
            notes '检查用户是否具有 common 角色权限'
        end
        entry do
            name 'AdminAuth'
            notes '检查用户是否具有 admin 角色权限'
        end
        entry do
            name 'RootAuth'
            notes '检查用户是否具有 root 角色权限'
        end
        entry do
            name 'RelayPanicRecover'
            notes '处理 panic 报错，进行兜底'
        end
        entry do
            name 'ConfigureTrustedProxies'
            notes '配置受信代理，即仅允许这些地址访问'
        end
        entry do
            name 'TurnstileCheck'
            notes '基于cloudflare检查用户是否具有为真人而非机器'
        end
    end
end