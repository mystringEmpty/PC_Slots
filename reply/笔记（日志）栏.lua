msg_reply.journal_new = {
    keyword = {
        prefix = {"新建笔记","创建笔记"}
    },
    type = "order",
    limit = {
        cd = {
            user = 5
        }
    },
    echo = { lua = "reply_journal_new" }
}
msg_reply.journal_update = {
    keyword = {
        prefix = {"笔记更新","更新笔记"}
    },
    type = "order",
    limit = {
        cd = {
            user = 5
        }
    },
    echo = { lua = "reply_journal_update" }
}
msg_reply.journal_del = {
    keyword = {
        prefix = {"删除笔记"}
    },
    type = "order",
    limit = {
        cd = {
            user = 5
        }
    },
    echo = { lua = "reply_journal_del" }
}
msg_reply.journal_clr = {
    keyword = {
        prefix = {"清空笔记"}
    },
    type = "order",
    limit = {
        cd = {
            user = 5
        }
    },
    echo = { lua = "reply_journal_clr" }
}
msg_reply.journal_show = {
    keyword = {
        prefix = {"查看笔记"}
    },
    type = "order",
    limit = {
        cd = {
            user = 10
        }
    },
    echo = { lua = "reply_journal_show" }
}
msg_reply.journal_list = {
    keyword = {
        prefix = {"笔记列表"}
    },
    type = "order",
    limit = {
        cd = {
            user = 10
        }
    },
    echo = { lua = "reply_journal_list" }
}