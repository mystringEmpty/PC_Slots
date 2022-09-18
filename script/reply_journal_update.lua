title,content = string.match(msg.fromMsg,"^[%s]*(.-)=(.-)[%s]*$",#"更新笔记"+1)
if not title or #title==0 then
    return "{reply_journal_title_empty}"
end
if not content or #content==0 then
    return "{reply_journal_content_empty}"
end
msg.title = title
setPlayerCardAttr(msg.uid,msg.gid or 0,"__Update",os.time())
pc = getPlayerCard(msg.uid,msg.gid or 0)
list = pc._Journal or {}
for i,item in ipairs(list) do
    if item.title==title then
        idx=i
        table.insert(list[i].note,content)
        fmt={}
        for i,subnote in ipairs(list[i].note) do
            table.insert(fmt, " - "..subnote)
        end
        msg.li = table.concat(fmt,"\n")
        break
    end
end
if not idx then
    return "{reply_journal_not_found}"
end
pc._Journal = list
return "{reply_journal_update}"