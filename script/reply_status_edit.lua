items = string.match(msg.fromMsg,"^[%s]*(.-)[%s]*$",#"状态"+1)
if #items==0 then
    return "{reply_status_edit_empty}"
end
setPlayerCardAttr(msg.uid,msg.gid or 0,"__Update",os.time())
pc = getPlayerCard(msg.uid,msg.gid or 0)
list = pc._Status or {}
edit_list = {}
repeat
    sign,item,items=string.match(items,"^([+-])[%s]*([^+-]+)(.*)$")
    cnt = 1
    if string.find(item,"%^[%d%.]+") then
        item,cnt = string.match(item,"^(.-)%^([%d%.]+)[%s]*")
    end
    item = string.match(item,"^(.-)[%s]*$")
    if not item or #item==0 then goto continue end
    if sign=='-' then
        edit_list[item] = (edit_list[item] or 0) - tonumber(cnt or 1)
    else
        if not edit_list[item] then table.insert(list,{name = item,layer=0}) end
        edit_list[item] = (edit_list[item] or 0) + tonumber(cnt or 1)
    end
    ::continue::
until #items==0
fmt = {}
del_idx = {}
function printLayer(cnt)
    if not cnt or cnt==1 then
        return ""
    else
        return "^"..string.format("%.0f",cnt)
    end
end
for i,item in ipairs(list) do
    name=item.name
    if edit_list[name] and edit_list[name]~=0 then
        list[i].layer = (list[i].layer or 1) + edit_list[name]
        edit_list[name] = nil
    end
    if (list[i].layer or 1) > 0 then
        table.insert(fmt," - "..item.name..printLayer(item.layer))
    else
        table.insert(del_idx,1,i)
    end
end
for i,idx in ipairs(del_idx) do
    table.remove(list,idx)
end
pc._Status=list
msg.li = table.concat(fmt,"\n")
return "{reply_status_edited}"