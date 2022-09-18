--查看背包
list = getPlayerCardAttr(msg.uid,msg.gid or 0,"_Inventory",{})
fmt = {}
loadLua("printNum")
for item,cnt in pairs(list) do
    table.insert(fmt," - "..item..printPlural(cnt))
end
if #fmt==0 then
    return "{reply_inventory_empty}"
end
msg.li = table.concat(fmt,"\n")
return "{reply_inventory_list}"