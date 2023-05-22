local Person = {}
local function new(age,name)
    return {Age=age,Name=name}
end

Person.new = new

function Person.Display()
    print("Age:",Person.Age,"Name:",Person.Name)
end

return Person