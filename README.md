# RootPoint
Library that adds "Pointers" to lua

## Documentary

RootPoint Documentation:

RootPoint:new(value) - Creates a new RootPoint object that holds a reference to a given value.

RootPoint:get() - Returns the current value stored in the RootPoint object.

RootPoint:set(value) - Sets the value stored in the RootPoint object to the given value.

RootPoint:address() - Returns the RootPoint object itself, acting as a reference (or pointer) to the value stored.

RootPoint:__unm() - The unary minus metamethod, used for dereferencing the RootPoint object to access the value stored inside. It allows direct access to the value by using the - operator.

RootPoint:increment(amount) - Increments the value stored in the RootPoint object by a specified amount.

RootPoint:decrement(amount) - Decrements the value stored in the RootPoint object by a specified amount.

RootPoint:indirect() - Attempts to dereference a RootPoint object, returning the value it points to if it's another RootPoint object.

RootPoint:__eq(other) - The equality metamethod, used for comparing two RootPoint objects. Returns true if both point to the same value.

RootPoint:type_check(expected_type) - Checks if the value stored inside the RootPoint is of the specified type. If not, it raises an error.

RootPoint:weak() - Creates a weak reference to the RootPoint object. Weak references do not prevent garbage collection of the original object.

RootPoint:pauseGC() - Pauses Lua’s garbage collection.

RootPoint:resumeGC() - Resumes Lua’s garbage collection after it has been paused.

RootPoint:serialize() - Serializes the RootPoint object into a binary string, allowing it to be saved or transferred.

RootPoint.deserialize(serialized) - Deserializes a serialized RootPoint string back into a RootPoint object.

RootPointArray:new(size) - Creates a new array of RootPoint objects, each initialized with an integer value from 1 to size.

RootPointArray:get(index) - Returns the RootPoint object at the specified index of the array.
