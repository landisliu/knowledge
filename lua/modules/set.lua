local mt = {}
local Set = {}
function Set.new(...)
    local dt = {}
    setmetatable(dt,mt)
    dt.data = {}
    dt.data_helper = {}
    for _,v in pairs({...}) do
        if not dt.data_helper[v] then
            dt.data_helper[v] = true
            table.insert(dt.data,v)
        end
    end
    return dt
end

function Set.tostring(s)
    return table.concat(s.data,",")
end

function Set.add(s1, data)
    if not s1.data_helper[data] then
        s1.data_helper[data] = true
        table.insert(s1.data,data)
    end
end

function Set.union(s1,s2)
    local t1 = getmetatable(s1)
    local t2 = getmetatable(s2)
    if t1 ~= mt and t2~= mt then return end

    local tmp = Set.new()
    for _,v in pairs(s1.data) do
        Set.add(tmp,v)
    end
    for _,v in pairs(s2.data) do
        Set.add(tmp, v)
    end
    return tmp
end

function Set.interlace(s1,s2)
    local tmp = Set.new()
    for _,v in pairs(s1.data) do
        if s2.data_helper[v] then
            Set.add(tmp, v)
        end
    end
    return tmp
end

function Set.equals(s1,s2)
    if #s1.data ~= #s2.data then return end
    for _,v in pairs(s1.data) do
        if not s2.data_helper[v] then return end
    end
    return true
end

function Set.LessEquals(s1,s2)
    for _,v in pairs(s1) do
        if not s2.
    end
end

mt.__add = Set.union
mt.__mul = Set.interlace
mt.__eq =  Set.equals

return Set