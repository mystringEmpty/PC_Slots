items = string.match(msg.fromMsg,"^[%s]*(.-)[%s]*$",#"法术"+1)
if #items==0 then
    return "{reply_Spells_edit_empty}"
end
setPlayerCardAttr(msg.uid,msg.gid or 0,"__Update",os.time())
pc = getPlayerCard(msg.uid,msg.gid or 0)
list = pc._Spells or {}
del_list = {}
repeat
    sign,item,items=string.match(items,"^([+-])[%s]*([^+-]+)(.*)$")
    item = string.match(item,"^(.-)[%s]*$")
    if sign=='-' then
        del_list[item] = (del_list[item] or 0) +1
    else
        table.insert(list,item)
    end
until #items==0
fmt = {}
del_idx = {}
for i,item in ipairs(list) do
    if del_list[item] and del_list[item]~=0 then
        table.insert(del_idx, 1, i)
        del_list[item] = del_list[item] -1
    else
        table.insert(fmt," - "..item)
    end
end
for i,idx in ipairs(del_idx) do
    table.remove(list,idx)
end
pc._Spells=list
msg.li = table.concat(fmt,"\n")
return "{reply_Spells_edited}"