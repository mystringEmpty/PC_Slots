content = string.match(msg.fromMsg,"^[%s]*(.-)[%s]*$",#"新建笔记"+1)
if #content==0 then
    return "{reply_journal_title_empty}"
end
setPlayerCardAttr(msg.uid,msg.gid or 0,"__Update",os.time())
pc = getPlayerCard(msg.uid,msg.gid or 0)
list = pc._Journal or {}
--若取消数量上限判定，将--[[以下代码]]--注释
if #list >127 then --未设定_journal_cnt_limit则取10
    return "{reply_journal_limited}"
end
if string.find(content,"=") then
    title,content=string.match(content,"^(.-)=(.*)$")
end
if not title or #title==0 then 
    title = string.format("%d",#list)
end
table.insert(list,{title=title,note={content}})
pc._Journal=list
fmt = {}
for i,item in ipairs(list) do
    table.insert(fmt," - "..item.title..": "..item.note[#item.note])
end
msg.title = title
msg.li = table.concat(fmt,"\n")
return "{reply_journal_new}"