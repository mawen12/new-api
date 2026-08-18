cheatsheet do
    title '核心概念'
    docset_file_name 'concepts'
    keyword 'concepts'
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
        id 'Core'

        header '英文'
        header '中文'
        header '说明'

        entry do
            name 'Ratio'
            td_notes '倍率'
            td_notes '用于计算价格的乘数因子'
        end
        entry do
            name 'Token'
            td_notes '令牌、词元'
            td_notes 'API访问凭证，也指模型处理的文本单元'
        end
        entry do
            name 'Channel'
            td_notes '渠道'
            td_notes 'API服务提供商的接入渠道'
        end
        entry do
            name 'Group'
            td_notes '分组'
            td_notes '用户或令牌的分类，影响价格倍率'
        end
        entry do
            name 'Quota'
            td_notes '额度'
            td_notes '用户可用的服务额度'
        end
        entry do
            name 'Credit'
            td_notes '额度'
            td_notes '同 Quota'
        end
    end

    category do
        id 'Authentication'

        header '英文'
        header '中文'
        header '说明'

        entry do
            name 'Access Token'
            td_notes '访问 Token'
            td_notes '有效期15分钟的 JWT，只保存在浏览器内存中，通过 `Authentication: Bearer <token>` 发送'
        end
        entry do
            name 'Refresh Token'
            td_notes '刷新 Token'
            td_notes '随机不透明值，有效期30天。浏览器只通过 `HttpOnly`、`SameSite=Strict` Cookie持有它，服务端仅保存 HMAC 摘要，并在每次刷新时轮换'
        end
        entry do
            name 'User Sessions'
            td_notes '用户会话'
            td_notes '表`user_sessions`是登录会话控制面，记录设备、IP、登录方式、最后活跃时间、到期时间和撤销状态。数据库中的 Session 状态是最终权威；撤销传播速度取决于 Redis 拓扑'
        end
        entry do
            name 'Auth Version'
            td_notes '认证版本'
            td_notes '当用户的密码、状态、角色或安全因子发生安全相关变化时，`auth_version` 会递增并使旧登录会话失效。订阅带来的分组升降级值刷新授权缓存，不会退出任何登录设备'
        end
        entry do
            name 'Redis Cache'
            td_notes 'Redis 会话缓存'
            td_notes 'Redis缓存保存用户鉴权快照和登录会话快照。版本栅栏和撤销 tombstone 防止旧缓存重新授权；Session 快照使用跟随 `SYNC_FREQUNCY` 的短TTL，缓存未命中会未启用 Redis 时回退到数据库校验'
        end
        entry do
            name 'Session Secret'
            td_notes '会话密钥'
            td_notes '用于派生 Access Token、Security Proof、Refresh Token 摘要和 AuthFlow 摘要的不同用途密钥。生产环境及多节点部署必须在所有节点配置相同的高强度随机值；更换该值会使现有登录、临时鉴权流程和 Security Proof 全部失效'
        end
    end

    category do
        id 'Big Model'

        header '英文'
        header '中文'
        header '说明'

        entry do
            name 'Prompt'
            td_notes '提示'
            td_notes '模型输入内容'
        end
        entry do
            name 'Completion'
            td_notes '补全'
            td_notes '模型输出内容'
        end
        entry do
            name 'Input'
            td_notes '输入'
            td_notes '同 Prompt'
        end
        entry do
            name 'Output'
            td_notes '输出'
            td_notes '同 Completion'
        end
        entry do
            name 'Reasoning'
            td_notes '推理'
            td_notes '模型为了获得答案，在最终输出之前的多步分析、判断、规划和验证过程'
        end
        entry do
            name 'Model Ratio'
            td_notes '模型倍率'
            td_notes '不同模型的计费倍率'
        end
        entry do
            name 'Completion Ratio'
            td_notes '模型倍率'
            td_notes '输出内容的额外计费倍率'
        end
        entry do
            name 'Price per call'
            td_notes '固定价格'
            td_notes '按次计费的价格'
        end
        entry do
            name 'Pay-as-you-go'
            td_notes '按量计费'
            td_notes '根据使用量计费'
        end
        entry do
            name 'Pay-per-view'
            td_notes '按次计费'
            td_notes '每次调用固定价格'
        end
    end

    category do
        id 'User'

        header '英文'
        header '中文'
        header '说明'

        entry do
            name 'Root User'
            td_notes '超级管理员'
            td_notes '最高权限管理员'
        end
        entry do
            name 'Admin User'
            td_notes '管理员'
            td_notes '系统管理员'
        end
        entry do
            name 'Normal User'
            td_notes '普通用户'
            td_notes '普通权限用户'
        end
    end

    category do
        id 'Recharge'

        header '英文'
        header '中文'
        header '说明'

        entry do
            name 'Top up'
            td_notes '充值'
            td_notes '为账户增加额度'
        end
        entry do
            name 'Redemption Code'
            td_notes '兑换码'
            td_notes '可兑换额度的代码'
        end
    end

    category do
        id 'Channel'

        header '英文'
        header '中文'
        header '说明'

        entry do
            name 'Channel'
            td_notes '渠道'
            td_notes 'API服务提供通道'
        end
        entry do
            name 'Key'
            td_notes '密钥'
            td_notes 'API访问密钥'
        end
        entry do
            name 'Priority'
            td_notes '优先级'
            td_notes '渠道选择优先级，优先级越大的渠道优先被使用'
        end
        entry do
            name 'Weight'
            td_notes '权重'
            td_notes '同优先级的渠道中，按权重比例分配请求'
        end
        entry do
            name 'Proxy'
            td_notes '代理'
            td_notes '代理服务器地址'
        end
        entry do
            name 'Model Mapping'
            td_notes '模型重定向'
            td_notes '请求体中模型名称替换'
        end
    end

    category do
        id 'Security'

        header '英文'
        header '中文'
        header '说明'

        entry do
            name 'Two-Factor Authentication'
            td_notes '两因素验证'
            td_notes '为账户提供额外安全保护的验证方式'
        end
        entry do
            name '2FA'
            td_notes 'Two-Factor Authentication'
            td_notes '两因素验证缩写'
        end
    end

    category do
        id 'Token'

        header '英文'
        header '中文'
        header '说明'

        entry do
            name 'API Token'
            td_notes 'API 访问令牌'
            td_notes '用于访问模型API服务的访问令牌'
        end
        entry do
            name 'Text Token'
            td_notes '词元'
            td_notes '模型处理的文本单元'
        end
        entry do
            name 'Access Token'
            td_notes '系统访问令牌'
            td_notes '用于访问 new-api 系统的访问令牌'
        end
    end

    category do
        id 'Quota'

        header '英文'
        header '中文'
        header '说明'

        entry do
            name 'Quota'
            td_notes '额度'
            td_notes <<-'END'
                额度计算公式：
                ```
                额度 = 分组倍率 * 模型倍率 * (提示 token 数 + 补全 token 数 * 补全倍率)
                ```

                补全倍率：

                - GPT3.5: 固定为 1.33
                - GPT4: 固定为 2(与官方保持一致)
            END
        end
    end

    category do
        id ''

        header '英文'
        header '中文'
        header '说明'

        entry do
            name ''
            td_notes ''
            td_notes ''
        end
    end
end