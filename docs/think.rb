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
end