old_one, new_one = string.match(msg.fromMsg,"^[%s]*(.-)=(.-)[%s]*$",#"更新状态"+1)
if not old_one or old_one==0 or new_one==0 then
    return "{reply_status_update_error}"
end
setPlayerCardAttr(msg.uid,msg.gid or 0,"__Update",os.time())
pc = getPlayerCard(msg.uid,msg.gid or 0)
list = pc._Status or {}
for i,item in ipairs(list) do
    if item.name==old_one then
        idx=i
        list[i].name = new_one
        layer = list[i].layer
        break
    end
end
if not idx then
    return "{reply_status_not_found}"
end
pc._Status = list
function printLayer(cnt)
    if not cnt or cnt==1 then
        return ""
    else
        return "^"..string.format("%.0f",cnt)
    end
end
msg.change = old_one..printLayer(layer).."->"..new_one..printLayer(layer)
return "{reply_status_update}"