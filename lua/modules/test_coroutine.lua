-- coroutine status  suspend,running ,normal,dead
-- normal  是一个特殊状态
local co = coroutine.create(function() print("hi co") end)
print(coroutine.status(co))
coroutine.resume(co)
print(coroutine.status(co))


local co = coroutine.create(function(a,b,c) print(a,b,c) end)
coroutine.resume(co,1,2,3)