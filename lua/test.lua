-- package.path=package.path..";".."/Users/liuzhiwei/knowledge/lua/modules/?.lua"

-- local searchers = package.searchers
-- for k,v in pairs(searchers) do
--     print(k,v)
-- end

-- local set=require("set")
-- local s1 = set.new(1,2,3)
-- local s2 = set.new(3,4,5)
-- local s3 = s1 + s2
-- local s4 = s1 * s2
-- print(set.tostring(s3))
-- print(set.tostring(s4))
-- print(s3==s4)

-- coroutine
-- local co = coroutine.create(function() print("hi co") end)
-- print(coroutine.status(co))
-- coroutine.resume(co)
-- print(coroutine.status(co))


-- local co = coroutine.create(function(a,b,c) print(a,b,c) end)
-- coroutine.resume(co,1,2,3)
local startPos = {x=100,y=150}
local endPos = {x= 40,y=200}
local flagPos = {x=startPos.x, y=startPos.y - 10}
local v1 = {x= endPos.x - startPos.x, y = endPos.y-startPos.y}
local v2 = {x=flagPos.x - startPos.x, y= flagPos.y-startPos.y}
local potCalc = v1.x*v2.x + v1.y*v2.y
local len1= math.sqrt(v1.x*v1.x+v1.y*v1.y)
local len2 = math.sqrt(v2.x*v2.x+v2.y*v2.y)
local dir = potCalc/(len1*len2)
local aCosVal = math.acos(dir)
local angleVal = math.deg(aCosVal)
if endPos.x < startPos.x then
   angleVal = 360 - angleVal 
end
print(potCalc, len1, len2, dir,angleVal)


-- local arcVal = math.rad(150)
-- local cosVal = math.cos(arcVal)
-- local aCosVal = math.acos(cosVal)
-- local angleVal = math.deg(aCosVal)
--print(arcVal,cosVal,aCosVal,angleVal)
