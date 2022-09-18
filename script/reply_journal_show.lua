title = string.match(msg.fromMsg,"^[%s]*(.-)[%s]*$",#"查看笔记"+1)
if not title or #title==0 then
    return loadLua("reply_journal_list")
end
msg.title = title
list = getPlayerCardAttr(msg.uid,msg.gid or 0,"_Journal",{})
for i,item in ipairs(list) do
    if item.title==title then
        fmt={}
        for i,subnote in ipairs(list[i].note) do
            table.insert(fmt, " - "..subnote)
        end
        msg.li = table.concat(fmt,"\n")
        return "{reply_journal_show}"
    end
end
return "{reply_journal_not_found}"