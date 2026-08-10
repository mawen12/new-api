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
        id 'Channel'

        header '通道'
        header '适配器'
        header '模型列表'

        entry do
            name 'ali'
            td_notes 'ali'
            td_notes <<-'END'
                - qwen-turbo
                - qwen-plus
                - qwen-max
                - qwen-max-longcontext
                - qwq-32b
                - qweb3-235b-a22b
                - text-embedding-v1
                - gte-rerank-v2
            END
        end
        entry do
            name 'claude'
            td_notes 'claude'
            td_notes <<-'END'
                - claude-3-sonnet-20240229
                - claude-3-opus-20240229
                - claude-3-haiku-20240307
                - claude-3-5-haiku-20241022
                - claude-haiku-4-5-20251001
                - claude-3-5-sonnet-20240620
                - claude-3-5-sonnet-20241022
                - claude-3-7-sonnet-20250219
                - claude-3-7-sonnet-20250219-thinking
                - claude-sonnet-4-20250514
                - claude-sonnet-4-20250514-thinking
                - claude-opus-4-20250514
                - claude-opus-4-20250514-thinking
                - claude-opus-4-1-20250805
                - claude-opus-4-1-20250805-thinking
                - claude-sonnet-4-5-20250929
                - claude-sonnet-4-5-20250929-thinking
                - claude-opus-4-5-20251101
                - claude-opus-4-5-20251101-thinking
                - claude-opus-4-6
                - claude-opus-4-6-max
                - claude-opus-4-6-high
                - claude-opus-4-6-medium
                - claude-opus-4-6-low
                - claude-sonnet-4-6
                - claude-opus-4-7
                - claude-opus-4-7-max
                - claude-opus-4-7-xhigh
                - claude-opus-4-7-high
                - claude-opus-4-7-medium
                - claude-opus-4-7-low
                - claude-opus-4-7-thinking
                - claude-opus-4-8
                - claude-opus-4-8-max
                - claude-opus-4-8-xhigh
                - claude-opus-4-8-high
                - claude-opus-4-8-medium
                - claude-opus-4-8-low
                - claude-opus-4-8-thinking
            END
        end
    end
end