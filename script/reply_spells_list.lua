--查看当前栏位
list = getPlayerCardAttr(msg.uid,msg.gid or 0,"_Spells",{})
if #list==0 then
    return "{reply_spells_empty}"
end
fmt = {}
for i,item in ipairs(list) do
    table.insert(fmt," - "..item)
end
msg.inv = table.concat(fmt,"\n")
return "{reply_spells_list}"