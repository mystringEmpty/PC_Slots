name = string.match(msg.fromMsg,"^[%s]*(.-)[%s]*$",#"移出物品"+1)
if #name==0 then
    return "{reply_inventory_del_empty}"
end
setPlayerCardAttr(msg.uid,msg.gid or 0,"__Update",os.time())
pc = getPlayerCard(msg.uid,msg.gid or 0)
list = pc._Inventory or {}
if list[item] then
    list[item] = nil
else
    return "{reply_inventory_not_found}"
end
fmt = {}
loadLua("printNum")
for item,cnt in pairs(list) do
    table.insert(fmt," - "..item..printPlural(cnt))
end
msg.item = name
pc._Inventory=list
msg.li = table.concat(fmt,"\n")
return "{reply_inventory_del}"