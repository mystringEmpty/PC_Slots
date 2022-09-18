function printNum(num)
    if not num then return "0" end
    s = string.format("%.4f",num)
    s = string.reverse(string.match(string.reverse(s),"^0*[%.]?(.*)$"))
    return s
end
function printPlural(num)
    if not num or num==1 then return "" end
    return "*"..printNum(num)
end