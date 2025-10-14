///|
/// A foreign function interface (FFI) type for handling C memory pointers.
#external
type Pointer

///|
/// Returns true if this `Pointer` is null, false otherwise.
pub extern "c" fn Pointer::is_null(self : Pointer) -> Bool = "moonbit_cffi_is_null"

///|
/// Casts this `Pointer` to the specified type `T`.
pub fn[T] Pointer::cast(self : Pointer) -> T = "%identity"

///|
/// Returns the length of the memory block pointed to by this `Pointer` in bytes.
/// If the pointer is null, the length is zero.
pub extern "c" fn Pointer::length(self : Pointer) -> Int = "moonbit_cffi_length"

///|
/// Returns a null pointer.
pub extern "c" fn Pointer::null() -> Pointer = "moonbit_cffi_null"

///|
/// Copies `n` bytes from the memory location pointed to by this `Pointer` to the given `Bytes` object `dest`.
/// If the pointer is null, or if `n` is zero or negative, the function does nothing.
/// 
#borrow(dest)
pub extern "c" fn Pointer::memcpy(
  self : Pointer,
  dest : Bytes,
  n : Int,
) -> Unit = "moonbit_cffi_memcpy"
