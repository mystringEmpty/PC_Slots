item = string.match(msg.fromMsg,"^[%s]*(.-)[%s]*$",#"放入背包"+1)
if #item==0 then
    return "{reply_inventory_add_empty}"
end
setPlayerCardAttr(msg.uid,msg.gid or 0,"__Update",os.time())
pc = getPlayerCard(msg.uid,msg.gid or 0)
list = pc._Inventory or {}
--若取消数量上限判定，将--[[以下代码]]--注释
if pc._Inventory_cnt_limit or 128 <= #list then
    return "{reply_inventory_cnt_limited}"
end
if string.find(item,"%*[%d%.]+") then
    item,cnt = string.match(item,"^(.-)%*([%d%.]+)[%s]*")
end
old_cnt = list[item] or 0
list[item] = old_cnt + tonumber(cnt or 1)
if list[item]==0 then list[item]=nil end
pc._Inventory=list
fmt = {}
loadLua("printNum")
for name,cnt in pairs(list) do
    if item==name then
        table.insert(fmt," - "..name..": "..printNum(old_cnt).."->"..printNum(cnt))
    else
        table.insert(fmt," - "..name..printPlural(cnt))
    end
end
msg.item = item
msg.li = table.concat(fmt,"\n")
return "{reply_inventory_add}"