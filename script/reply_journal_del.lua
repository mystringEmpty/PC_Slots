title,content = string.match(msg.fromMsg,"^[%s]*(.-)[%s]*$",#"删除笔记"+1)
if #title==0 then
    return "{reply_journal_title_empty}"
end
msg.title = title
setPlayerCardAttr(msg.uid,msg.gid or 0,"__Update",os.time())
pc = getPlayerCard(msg.uid,msg.gid or 0)
list = pc._Journal or {}
for i,item in ipairs(list) do
    if item.title==title then
        idx=i
        table.remove(list,i)
        break
    end
end
if not idx then
    return "{reply_journal_not_found}"
end
pc._Journal = list
fmt = {}
for i,item in ipairs(list) do
    table.insert(fmt," - "..item.title..": "..item.note[#item.note])
end
msg.li = table.concat(fmt,"\n")
return "{reply_journal_del}"