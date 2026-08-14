cheatsheet do
    title 'Think Redis'
    docset_file_name 'Think_redis'
    keyword 'redis'
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
        id '应用场景'

        entry do
            name '初始化'
            notes <<-'END'

                1. github.com/go-redis/redis/v8
                2. 全局变量维护在 common.RDB 
                3. 读取环境变量的值进行初始化
                    - REDIS_CONN_STRING 连接字符串
                    - SYNC_FREQUENCY 同步频率
                    - REDIS_POOL_SIZE 连接数量
                5.  
            END
        end
        entry do
            name '限流'
            notes <<-'END'
                
                1. middleware.XXXRateLimit 中使用 redis.String + Lua 实现固定窗口限流
                2. middleware.ModelRequestRateLimit 中使用 redis.List 实现的滑动窗口限流
                3.
            END
        end
    end
    
end