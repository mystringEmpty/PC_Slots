msg_reply.inventory_edit = {
    keyword = {
        prefix = {"物品+","物品-","背包+","背包-"}
    },
    type = "order",
    limit = {
        cd = {
            user = 5
        }
    },
    echo = { lua = "reply_inventory_edit" }
}
msg_reply.inventory_del = {
    keyword = {
        prefix = {"删除物品","移出物品","移除物品","丢弃物品"}
    },
    type = "order",
    limit = {
        cd = {
            user = 5
        }
    },
    echo = { lua = "reply_inventory_del" }
}
msg_reply.inventory_add = {
    keyword = {
        prefix = {"放入物品","新增物品","添加物品","加入物品","放入背包"}
    },
    type = "order",
    limit = {
        cd = {
            user = 5
        }
    },
    echo = { lua = "reply_inventory_add" }
}
msg_reply.inventory_show = {
    keyword = {
        match = {"查看物品","物品栏","当前物品","查看背包"}
    },
    type = "order",
    limit = {
        cd = {
            user = 10
        }
    },
    echo = { lua = "reply_inventory_list" }
}
msg_reply.inventory_clr = {
    keyword = {
        prefix = {"清空物品"}
    },
    type = "order",
    limit = {
        cd = {
            user = 5
        }
    },
    echo = { lua = "reply_inventory_clr" }
}