msg_reply.feats_edit = {
    keyword = {
        prefix = {"专长+","专长-"}
    },
    type = "order",
    limit = {
        cd = {
            user = 5
        }
    },
    echo = { lua = "reply_feats_edit" }
}
msg_reply.feats_show = {
    keyword = {
        match = {"查看专长","专长栏","专长列表"}
    },
    type = "order",
    limit = {
        cd = {
            user = 10
        }
    },
    echo = { lua = "reply_feats_list" }
}
msg_reply.feats_clr = {
    keyword = {
        prefix = {"清空专长"}
    },
    type = "order",
    limit = {
        cd = {
            user = 5
        }
    },
    echo = { lua = "reply_feats_clr" }
}