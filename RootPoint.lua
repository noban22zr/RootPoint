-- RootPoint.lua

local RootPoint = {}
RootPoint.__index = RootPoint

function RootPoint:new(value)
    assert(value ~= nil, "Cannot create RootPoint with nil value.")
    local obj = setmetatable({}, self)
    obj.value = value
    return obj
end

function RootPoint:get()
    return self.value
end

function RootPoint:set(value)
    self.value = value
end

function RootPoint:address()
    return self
end

function RootPoint:__unm()
    return self:get()
end

function RootPoint:increment(amount)
    self.value = self.value + amount
end

function RootPoint:decrement(amount)
    self.value = self.value - amount
end

function RootPoint:indirect()
    if type(self.value) == "table" and getmetatable(self.value) == RootPoint then
        return self.value:get()
    end
    return nil
end

function RootPoint:__eq(other)
    return self == other
end

function RootPoint:type_check(expected_type)
    if type(self.value) ~= expected_type then
        error("Expected type " .. expected_type .. " but got " .. type(self.value))
    end
end

function RootPoint:weak()
    return setmetatable({}, { __mode = "v", __index = self })
end

function RootPoint:__index(key)
    if type(self.value) == "table" then
        return self.value[key]
    end
end

function RootPoint:pauseGC()
    collectgarbage("stop")
end

function RootPoint:resumeGC()
    collectgarbage("restart")
end

function RootPoint:serialize()
    return string.dump(self.value)
end

function RootPoint.deserialize(serialized)
    return loadstring(serialized)()
end

local PointerArray = {}
PointerArray.__index = RootPointArray

function PointerArray:new(size)
    local arr = {}
    for i = 1, size do
        arr[i] = RootPoint:new(i)
    end
    return setmetatable(arr, self)
end

function PointerArray:get(index)
    return self[index]:get()
end

local function newPointer(value)
    return RootPoint:new(value)
end

return {
    newRootPoint = newPointer,
    RootPoint = RootPoint,
    RootPointArray = RootPointArray,
}
