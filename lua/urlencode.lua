local UrlHandler = {
}

function UrlHandler:Encode(tbl)
    local tmp = {}
    for key,val in pairs(tbl) do
        table.insert(tmp,self:escape(key).."="..self:escape(val)) 
    end
    return table.concat(tmp,"&")
end
function UrlHandler:escape(s)
    s = string.gsub(s,"[&=+%%%c]",function(c)
    return string.format("%%%02X",string.byte(c))
    end)

    s = string.gsub(s," ","+")
    return s
end

function UrlHandler:Decode(s)
    local tbl = {} 
    for key,val  in string.gmatch(s,"([^&=]+)=([^&=]+)") do
        tbl[self:unescape(key)] = self:unescape(val)
    end
    return tbl
end

function UrlHandler:unescape(s)
    s=string.gsub(s,"+"," ")
    s=string.gsub(s,"%%(%x%x)",function(c)
    return string.char(tonumber(c,16))
    end)
    return s
end

local org = {a = "b"; c= "d";}
local encodeStr = UrlHandler:Encode(org)
local decodeStr = UrlHandler:Decode(encodeStr)

print(encodeStr)
for k,v in pairs(decodeStr) do
    print(k,v)
end


