msg_reply.spells_add = {
    keyword = {
        prefix = {"法术+","法术-"}
    },
    type = "order",
    limit = {
        cd = {
            user = 5
        }
    },
    echo = { lua = "reply_spells_edit" }
}
msg_reply.spells_show = {
    keyword = {
        match = {"查看法术","法术栏","法术列表"}
    },
    type = "order",
    limit = {
        cd = {
            user = 10
        }
    },
    echo = { lua = "reply_spells_list" }
}
msg_reply.spells_clr = {
    keyword = {
        prefix = {"清空法术"}
    },
    type = "order",
    limit = {
        cd = {
            user = 5
        }
    },
    echo = { lua = "reply_spells_clr" }
}