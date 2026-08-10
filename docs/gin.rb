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
end