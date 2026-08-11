cheatsheet do
    title 'Think Gin'
    docset_file_name 'Think_gin'
    keyword 'gin'
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
        id '报文响应'

        entry do
            command 'success'
            name '是否成功标识，bool 类型'
        end
        entry do
            command 'message'
            name '消息内容，经过 i18n 处理'
        end
        entry do
            command 'data'
            name '数据信息，当 success = false 时没有'
        end
    end

    category do
        id '路由'

        entry do
            command 'GET /api/setup'
            name '读取应用初始化状态，如果未初始化完毕，则返回 root 用户是否已初始化，以及主数据库的类型'
        end
        entry do
            command 'POST /api/setup'
            name '变更应用配置，用于当系统初始化失败时，用户可以通过页面调整，然后正确完成初始化'
        end
        entry do
            command 'GET /api/status'
            name '获取应用的信息'
        end
        entry do
            command 'GET /api/uptime/status'
            name ''
        end
        entry do
            command 'GET /api/models'
            name ''
        end
        entry do
            command 'GET /api/status/test'
            name ''
        end
        entry do
            command 'GET /api/notice'
            name ''
        end
        entry do
            command 'GET /api/user-agreement'
            name ''
        end
        entry do
            command 'GET /api/privacy-policy'
            name ''
        end
        entry do
            command 'GET /api/about'
            name ''
        end
        entry do
            command 'GET /api/home_page_content'
            name ''
        end
        entry do
            command 'GET /api/pricing'
            name ''
        end
        entry do
            command 'GET /api/perf-metrics/summary'
            name ''
        end
        entry do
            command 'GET /api/perf-metrics'
            name ''
        end
        entry do
            command 'GET /api/perf-metrics/summary'
            name ''
        end
    end

    category do
        id 'Playground'

        entry do
            name '主流程'
            notes <<-'END'
                ```
                gin.Engine.handleHttpRequest
                │    ↓
                │    middleware.RequestId：写入 common.RequestIdKey 到 gin.Context、http.Request.Context、http.Header
                │    ↓
                │    middleware.Version：写入 X-New-Api-Version 到 http.Header
                │    ↓
                │    middleware.I18n：写入 constant.ContextKeyLanguage 到 gin.Context
                │    ↓
                │    middleware.DecompressRequestMiddleware：将 Request.Body 解压，支持 gzip、br、zstd
                │    ↓
                │    middleware.BodyStorageCleanup：请求完成后，清理存储和文件
                │    ↓
                │    middleware.StatsMiddleware：全局 http 连接统计
                │    ↓
                │    middleware.RouteTag：写入 route_tag 到 gin.Context
                │    ↓
                │    middleware.SystemPerformanceCheck：检查系统性能是否超过阈值
                │    ↓
                │    middleware.UserAuth：检查是否有普通用户的权限
                │    ↓
                │    middleware.Distribute：
                ↓
                controller.Playground：
                ↓
                controller.Relay：
                │    ↓                                                          
                │    service.CheckSensitiveText：敏感词检查
                │    ↓  
                │    service.EstimateRequestToken：token 消耗计算
                │    ↓
                │    service.PreconsumeBilling：预扣费
                ↓
                controler.relayHandler
                ↓
                service.TextHelper
                ↓
                helper.ModelMapperHelper
                ↓
                relay.GetAdaptor
                ↓
                relay.Init
                ↓
                adaptor.ConvertOpenAIRequest
                ↓
                common.AppendRequestConversionFromRequest
                ↓
                common.Marshal
                ↓
                common.RemoveDisabledFields
                ↓
                common.NewOutboundJSONBody
                ↓
                adaptor.DoRequest
                ↓
                adaptor.DoResponse
                ↓
                adaptor.DoResponse
                ↓
                service.PostTextConsumeQuota
                ```
            END
        end
        entry do
            name 'token 使用估算'
            notes <<-'END'
                ```
                service.EstimateRequestToken
                ↓
                service.CountTextToken
                ↓(openai)                   ↓(非openai)
                service.getTokenEncoder     service.EstimateTokenByModel
                ↓                           ↓
                service.getTokenNum         service.EstimateToken
                ↓                              
                tokenizer.Count             
                ```
            END
        end
        entry do
            name '预扣费'
            notes <<-'END'
                预扣费偏好：

                - subscription_first
                - wallet_first 
                - subscription_only
                - wallet_only

                ```
                service.PreConsumeBilling
                ↓
                service.NewBillingSession
                ↓ subscription_only         ↓ wallet_only           ↓ wallet_first      ↓ subscription_first      
                trySubscription             tryWallet               tryWallet           trySubscription
                ↓                           ↓                       ↓ failed            ↓ failed
                service.preConsume          model.GetUserQuota      trySubscription     tryWallet
                                            ↓
                                            service.preConsume
                ```
            END
        end
        entry do
            name '限流'
            notes <<-'END'
                ```
                GlobalWebRateLimit      GlobalAPIRateLimit      CriticalRateLimit       UserCriticalRateLimit       DownloadRateLimit       UploadRateLimit
                ↓GW                     ↓GA                     ↓CT                     ↓UC:<scope>                 ↓DW                     ↓UP
                middleware.rateLimitFactory
                ↓redis                          ↓memory
                middleware.redisRateLimiter     middleware.memoryRateLimiter
                ↓rateLimit:v2:ip:<mark>:<ip>    ↓<mark><ip>
                middleware.redisFixedWindowTake common.InMemoryRateLimiter.Request
                ↓                               ↓
                底层: redis.String               底层结构: map[string]*[]int64
                ```
            END
        end
    end
end