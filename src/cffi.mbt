///|
#external
type Pointer

///|
pub extern "c" fn Pointer::is_null(self : Pointer) -> Bool = "moonbit_cffi_is_null"

///|
pub fn[T] Pointer::cast(self : Pointer) -> T = "%identity"

///|
pub extern "c" fn Pointer::length(self : Pointer) -> Int = "moonbit_cffi_length"
