--查看所有笔记（每页展示最新一条）
list = getPlayerCardAttr(msg.uid,msg.gid or 0,"_Journal",{})
if #list==0 then
    return "{reply_journal_empty}"
end
fmt = {}
for i,item in ipairs(list) do
    table.insert(fmt," - "..item.title..": "..item.note[#item.note])
end
msg.li = table.concat(fmt,"\n")
return "{reply_journal_list}"