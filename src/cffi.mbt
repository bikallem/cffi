///|
/// A foreign function interface (FFI) type for handling C memory pointers.
#external
type Pointer

///|
/// Returns true if this `Pointer` is null, false otherwise.
pub extern "c" fn Pointer::is_null(self : Pointer) -> Bool = "moonbit_cffi_is_null"

///|
/// Casts this `Pointer` to the specified external type `T`. 
/// NOTE: Ensure that `T` is an external type compatible with the underlying C pointer type. Otherwise
/// this function will introduce memory leak.
pub fn[T] Pointer::to_external(self : Pointer) -> T = "%identity"

///|
/// Converts a value of type `T` to a `Pointer`.
/// NOTE: Ensure that `T` is an external type compatible with the underlying C pointer type. Otherwise
/// this function will introduce memory leak.
pub fn[T] Pointer::from_external(t : T) -> Pointer = "%identity"

///|
/// Returns the length of the memory block pointed to by this `Pointer` in bytes.
/// If the pointer is null, the length is zero.
pub extern "c" fn Pointer::length(self : Pointer) -> Int = "moonbit_cffi_length"

///|
/// Returns a null pointer.
pub extern "c" fn Pointer::null() -> Pointer = "moonbit_cffi_null"

///|
pub extern "c" fn Pointer::free(self : Pointer) -> Unit = "moonbit_cffi_free"

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

///|
/// Converts the memory block pointed to by this `Pointer` into a `Bytes` object.
/// If the pointer is null, returns an empty `Bytes` object.
pub fn Pointer::to_bytes(self : Pointer) -> Bytes {
  let n = self.length()
  let b = Bytes::make(n, b'0')
  self.memcpy(b, n)
  b
}
