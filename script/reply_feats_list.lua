--查看当前栏位
list = getPlayerCardAttr(msg.uid,msg.gid or 0,"_Feats",{})
if #list==0 then
    return "{reply_feats_empty}"
end
fmt = {}
for i,item in ipairs(list) do
    table.insert(fmt," - "..item)
end
msg.inv = table.concat(fmt,"\n")
return "{reply_feats_list}"