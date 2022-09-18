msg_reply.status_edit = {
    keyword = {
        prefix = {"状态+","状态-"}
    },
    type = "order",
    limit = {
        cd = {
            user = 5
        }
    },
    echo = { lua = "reply_status_edit" }
}
msg_reply.status_show = {
    keyword = {
        match = {"查看状态","当前状态","状态栏","状态列表"}
    },
    type = "order",
    limit = {
        cd = {
            user = 10
        }
    },
    echo = { lua = "reply_status_list" }
}
msg_reply.status_update = {
    keyword = {
        prefix = {"更新状态"}
    },
    type = "order",
    limit = {
        cd = {
            user = 5
        }
    },
    echo = { lua = "reply_status_update" }
}
msg_reply.status_clr = {
    keyword = {
        prefix = {"清空状态"}
    },
    type = "order",
    limit = {
        cd = {
            user = 5
        }
    },
    echo = { lua = "reply_status_clr" }
}