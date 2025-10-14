///|
#external
type Pointer

///|
pub extern "c" fn Pointer::is_null(self : Pointer) -> Bool = "moonbit_cffi_is_null"

///|
pub fn[T] Pointer::cast(self : Pointer) -> T = "%identity"

///|
pub extern "c" fn Pointer::length(self : Pointer) -> Int = "moonbit_cffi_length"

///|
pub extern "c" fn Pointer::null() -> Pointer = "moonbit_cffi_null"

///|
#borrow(dest)
pub extern "c" fn Pointer::memcpy_to(
  self : Pointer,
  dest : Bytes,
  n : Int,
) -> Unit = "moonbit_cffi_memcpy_to"
