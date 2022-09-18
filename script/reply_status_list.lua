--查看当前栏位
list = getPlayerCardAttr(msg.uid,msg.gid or 0,"_Status",{})
if #list==0 then
    return "{reply_status_empty}"
end
fmt = {}
function printLayer(cnt)
    if not cnt or cnt==1 then
        return ""
    else
        return "^"..string.format("%.0f",cnt)
    end
end
for i,item in ipairs(list) do
    table.insert(fmt," - "..item.name..printLayer(item.layer))
end
msg.li = table.concat(fmt,"\n")
return "{reply_status_list}"