items = string.match(msg.fromMsg,"^[%s]*(.-)[%s]*$",#"物品"+1)
if #items==0 then
    return "{reply_inventory_edit_empty}"
end
setPlayerCardAttr(msg.uid,msg.gid or 0,"__Update",os.time())
pc = getPlayerCard(msg.uid,msg.gid or 0)
list = pc._Inventory or {}
edit_list = {}
repeat
    sign,item,items=string.match(items,"^([+-])[%s]*([^+-]+)(.*)$")
    cnt = 1
    if string.find(item,"%*[%d%.]+") then
        item,cnt = string.match(item,"^(.-)%*([%d%.]+)[%s]*")
    end
    item = string.match(item,"^(.-)[%s]*$")
    if not item or #item==0 then goto continue end
    if sign=='-' then
        edit_list[item] = (edit_list[item] or 0) - tonumber(cnt or 1)
    else
        edit_list[item] = (edit_list[item] or 0) + tonumber(cnt or 1)
    end
    ::continue::
until #items==0
fmt = {}
del_item = {}
loadLua("printNum")
for item,cnt in pairs(edit_list) do
    if not cnt or cnt==0 then goto continue end
    old_cnt = list[item] or 0
    new_cnt = old_cnt + cnt
    table.insert(fmt," - "..item..": "..printNum(old_cnt).."->"..printNum(new_cnt))
    list[item] = new_cnt
    if new_cnt==0 then table.insert(del_item,item) end
    ::continue::
end
for i,item in pairs(del_item) do
    list[item] = nil
end
pc._Inventory=list
msg.li = table.concat(fmt,"\n")
return "{reply_inventory_edited}"