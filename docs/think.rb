cheatsheet do
    title 'Think'
    docset_file_name 'Think'
    keyword 'think'
    introduction '思考'
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
        id '框架/库'

        header '名称'
        header '版本'
        header '用途'

        entry do
            name 'Gin'
        td_notes 'v1.9.1'
            td_notes 'Go Web 网络框架'
        end
        entry do
            name 'GORM'
            td_notes 'v1.25.2'
            td_notes 'Go ORM 网络框架'
        end
        entry do
            name 'copier'
            td_notes 'v0.4.0'
            td_notes 'Go 的深度拷贝工具'
        end
        entry do
            name 'godotenv'
            td_notes 'v1.5.1'
            td_notes '读取 .env 文件，加载到环境变量中，以便支持 os.Getenv 方式读取'
        end
    end

    category do
        id '底层存储'

        header '名称'
        header '用途'

        entry do
            name 'mysql'
            td_notes '存储'
        end
        entry do
            name 'postgres'
            td_notes 'PostGres'
        end
        entry do
            name 'sqlite'
            td_notes 'SQLite'
        end
        entry do
            name 'redis'
            td_notes '限流，基于令牌桶的实现'
        end
    end

    category do
        id 'HTTP 请求头'

        entry do
            command 'Content-Type: text/event-stream'
        end
        entry do
            command 'Cache-Control'
        end
    end

    category do
        id '通道'

        entry do
            name '向已关闭的通道发送消息时会发生错误，使用recover()'
        end
    end

    category do
        id 'package'

        entry do
            name 'web'
            notes '前端UI'
        end
        entry do
            name 'middleware'
            notes '用于扩展 gin 的中间件包'
        end
        entry do
            name 'logger'
            notes '自定义的日志组件包'
        end
        entry do
            name 'i18n'
            notes '国际化组件包，支持简体中文、英文、繁体中文'
        end
        entry do
            name 'model'
            notes '封装了数据库对象以及对数据库表的操作'
        end
    end

    category do
        id 'Flag'

        header '名称'
        header '类型'
        header '默认值'
        header '用途'

        entry do
            name 'port'
            td_notes 'int'
            td_notes '3000'
            td_notes 'gin 应用启动端口'
        end
        entry do
            name 'version'
            td_notes 'bool'
            td_notes 'false'
            td_notes '输出应用版本信息并退出'
        end
        entry do
            name 'help'
            td_notes 'bool'
            td_notes 'false'
            td_notes '输出应用帮助信息并退出'
        end
        entry do
            name 'log-dir'
            td_notes 'string'
            td_notes './logs'
            td_notes '应用日志文件路径，存储到 common.init.go#LogDir 变量中，在初始化日志组件的时候会被使用'
        end
    end

    category do
        id '环境变量'

        header '名称'
        header '类型'
        header '默认值'
        header '用途'

        entry do
            name 'ENABLE_PPROF'
            td_notes 'string'
            td_notes ''
            td_notes '启动时获取，当发现为 true 时，在端口 8005 异步启动 pprof，获取 CPU 使用率，当首个使用率超过 80% 时，生成 pprof 文件'
        end
        entry do
            name 'VERSION'
            td_notes 'string'
            td_notes ''
            td_notes '应用版本'
        end
        entry do
            name 'SESSION_SECRET'
            td_notes 'string'
            td_notes ''
            td_notes ''
        end
        entry do
            name 'CRYPTO_SECRET'
            td_notes 'string'
            td_notes ''
            td_notes ''
        end
        entry do
            name 'SESSION_COOKIE_SECURE'
            td_notes 'string'
            td_notes ''
            td_notes ''
        end
        entry do
            name 'SESSION_COOKIE_TRUSTED_URL'
            td_notes 'string'
            td_notes ''
            td_notes ''
        end
        entry do
            name 'USER_SESSION_ACTIVE_LIMIT'
            td_notes 'int'
            td_notes ''
            td_notes ''
        end
        entry do
            name 'USER_SESSION_ISSUANCE_LIMIT'
            td_notes 'string'
            td_notes ''
        end
        entry do
            name 'USER_SESSION_ISSUANCE_WINDOW_SECONDS'
            td_notes 'string'
            td_notes ''
        end
        entry do
            name 'USER_SESSION_REVOKED_RETENTION_DAYS'
            td_notes 'string'
            td_notes ''
        end
        entry do
            name 'USER_SESSION_HOURLY_ALERT_THRESHOLD'
            td_notes 'string'
            td_notes ''
        end
        entry do
            name 'SQLITE_PATH'
            td_notes 'string'
            td_notes ''
        end
        entry do
            name 'DEBUG'
            td_notes 'string'
            td_notes ''
            td_notes <<-'END'
                Debug 模式，开启影响如下：
                Redis:


            END
        end
        entry do
            name 'SQL_DSN'
            td_notes 'string'
            td_notes ''
            td_notes <<-'END'
                数据库连接字符串，支持如下数据库：
                    - MySQL
                    - PostgreSQL
                    - SQLite
                如果没有设置的话，则退回到 SQLite
            END
        end
        entry do
            name 'LOG_SQL_DSN'
            td_notes 'string'
            td_notes ''
            td_notes <<-'END'
                日志数据库连接字符串，支持如下数据库：
                    - CLickHouse
            END
        end
        entry do
            name 'SQL_MAX_IDLE_CONNS'
            td_notes 'int'
            td_notes '100'
            td_notes '数据库最大存活连接数'
        end
        entry do
            name 'SQL_MAX_OPEN_CONNS'
            td_notes 'int'
            td_notes '1000'
            td_notes '数据库最大同时打开的连接数'
        end
        entry do
            name 'SQL_MAX_LIFETIME'
            td_notes 'int'
            td_notes '60'
            td_notes '数据库连接空闲时最大存活时间'
        end
        entry do
            name 'MEMORY_CACHE_ENABLED'
            td_notes 'string'
            td_notes ''
        end
        entry do
            name 'MEMORY_CACHE_ENABLED'
            td_notes 'string'
            td_notes ''
        end
        entry do
            name 'NODE_TYPE'
            td_notes 'string'
            td_notes ''
        end
        entry do
            name 'NODE_NAME'
            td_notes 'string'
            td_notes ''
        end
        entry do
            name 'TLS_INSECURE_SKIP_VERIFY'
            td_notes 'string'
            td_notes ''
        end
        entry do
            name 'SMTP_STARTTLS_ENABLE'
            td_notes 'string'
            td_notes ''
        end
        entry do
            name 'SMTP_INSECURE_SKIP_VERIFY'
            td_notes 'string'
            td_notes ''
        end
        entry do
            name 'POLLING_INTERVAL'
            td_notes 'string'
            td_notes ''
        end
        entry do
            name 'SYNC_FREQUENCY'
            td_notes 'string'
            td_notes ''
        end
        entry do
            name 'BATCH_UPDATE_INTERVAL'
            td_notes 'string'
            td_notes ''
        end
        entry do
            name 'RELAY_TIMEOUT'
            td_notes 'string'
            td_notes ''
        end
        entry do
            name 'RELAY_IDLE_CONN_TIMEOUT'
            td_notes 'string'
            td_notes ''
        end
        entry do
            name 'RELAY_MAX_IDLE_CONNS'
            td_notes 'string'
            td_notes ''
        end
        entry do
            name 'RELAY_MAX_IDLE_CONNS_PER_HOST'
            td_notes 'string'
            td_notes ''
        end
        entry do
            name 'GEMINI_SAFETY_SETTING'
            td_notes 'string'
            td_notes ''
        end
        entry do
            name 'COHERE_SAFETY_SETTING'
            td_notes 'string'
            td_notes ''
        end
        entry do
            name 'GLOBAL_API_RATE_LIMIT_ENABLE'
            td_notes 'string'
            td_notes ''
        end
        entry do
            name 'GLOBAL_API_RATE_LIMIT'
            td_notes 'string'
            td_notes ''
        end
        entry do
            name 'GLOBAL_API_RATE_LIMIT_DURATION'
            td_notes 'string'
            td_notes ''
        end
        entry do
            name 'GLOBAL_WEB_RATE_LIMIT_ENABLE'
            td_notes 'string'
            td_notes ''
        end
        entry do
            name 'GLOBAL_WEB_RATE_LIMIT'
            td_notes 'string'
            td_notes ''
        end
        entry do
            name 'GLOBAL_WEB_RATE_LIMIT_DURATION'
            td_notes 'string'
            td_notes ''
        end
        entry do
            name 'CRITICAL_RATE_LIMIT_ENABLE'
            td_notes 'string'
            td_notes ''
        end
        entry do
            name 'CRITICAL_RATE_LIMIT'
            td_notes 'string'
            td_notes ''
        end
        entry do
            name 'CRITICAL_RATE_LIMIT_DURATION'
            td_notes 'string'
            td_notes ''
        end
        entry do
            name 'SEARCH_RATE_LIMIT_ENABLE'
            td_notes 'string'
            td_notes ''
        end
        entry do
            name 'SEARCH_RATE_LIMIT'
            td_notes 'string'
            td_notes ''
        end
        entry do
            name 'SEARCH_RATE_LIMIT_DURATION'
            td_notes 'string'
            td_notes ''
        end
        entry do
            name 'STREAMING_TIMEOUT'
            td_notes 'string'
            td_notes ''
        end
        entry do
            name 'DIFY_DEBUG'
            td_notes 'string'
            td_notes ''
        end
        entry do
            name 'MAX_FILE_DOWNLOAD_MB'
            td_notes 'string'
            td_notes ''
        end
        entry do
            name 'STREAM_SCANNER_MAX_BUFFER_MB'
            td_notes 'string'
            td_notes ''
        end
        entry do
            name 'MAX_REQUEST_BODY_MB'
            td_notes 'string'
            td_notes ''
        end
        entry do
            name 'ANONYMOUS_REQUEST_BODY_LIMIT_KB'
            td_notes 'string'
            td_notes ''
        end
        entry do
            name 'FORCE_STREAM_OPTION'
            td_notes 'string'
            td_notes ''
        end
        entry do
            name 'CountToken'
            td_notes 'string'
            td_notes ''
        end
        entry do
            name 'GET_MEDIA_TOKEN'
            td_notes 'string'
            td_notes ''
        end
        entry do
            name 'GET_MEDIA_TOKEN_NOT_STREAM'
            td_notes 'string'
            td_notes ''
        end
        entry do
            name 'UPDATE_TASK'
            td_notes 'string'
            td_notes ''
        end
        entry do
            name 'AZURE_DEFAULT_API_VERSION'
            td_notes 'string'
            td_notes ''
        end
        entry do
            name 'NOTIFY_LIMIT_COUNT'
            td_notes 'string'
            td_notes ''
        end
        entry do
            name 'NOTIFICATION_LIMIT_DURATION_MINUTE'
            td_notes 'string'
            td_notes ''
        end
        entry do
            name 'GENERATE_DEFAULT_TOKEN'
            td_notes 'string'
            td_notes ''
        end
        entry do
            name 'ERROR_LOG_ENABLED'
            td_notes 'string'
            td_notes ''
        end
        entry do
            name 'TASK_QUERY_LIMIT'
            td_notes 'string'
            td_notes ''
        end
        entry do
            name 'TASK_TIMEOUT_MINUTES'
            td_notes 'string'
            td_notes ''
        end
        entry do
            name 'TASK_PRICE_PATCH'
            td_notes 'string'
            td_notes ''
        end
        entry do
            name 'TRUSTED_REDIRECT_DOMAINS'
            td_notes 'string'
            td_notes ''
        end
        entry do
            name ''
            td_notes 'string'
            td_notes ''
        end
        entry do
            name ''
            td_notes 'string'
            td_notes ''
        end
        entry do
            name ''
            td_notes 'string'
            td_notes ''
        end
        entry do
            name ''
            td_notes 'string'
            td_notes ''
        end
    end

    category do
        id '数据库表'

        header '表'
        header '用途'

        entry do
            name 'abilities'
            td_notes '通道能力表'
        end
        entry do
            name 'auth_flows'
            td_notes '认证流程表'
        end
        entry do
            name 'authz_roles'
            td_notes '认证角色表'
        end
        entry do
            name 'casbin_rule'
            td_notes ''
        end
        entry do
            name 'channel'
            td_notes '通道表'
        end
        entry do
            name 'checkins'
            td_notes '签到记录表'
        end
        entry do
            name 'custom_oauth_providers'
            td_notes '自定义的OAuth提供商表'
        end
        entry do
            name 'external_identify_claims'
            td_notes '外部身份签发表'
        end
        entry do
            name 'log'
            td_notes '日志记录表'
        end
        entry do
            name 'quota_data'
            td_notes 'Token 配额使用记录'
        end
        entry do
            name 'user_oauth_binding'
            td_notes '用户 OAuth 绑定记录表'
        end
        entry do
            name 'user_oauth_binding'
            td_notes '用户 OAuth 绑定记录表'
        end
        entry do
            name 'user_session'
            td_notes '用户会话表'
        end
        entry do
            name 'user'
            td_notes '用户表'
        end
        entry do
            name 'vendor'
            td_notes <<-'END'
                模型供应商的基本信息

                ```sql
                CREATE TABLE vendor (
                    id int
                    name varchar not null
                    description text
                    icon varchar(128)
                    status int default 1
                    created_time bigint
                    updated_time bigint
                    deleted_at 
                )
                ```
            END
        end
    end
end