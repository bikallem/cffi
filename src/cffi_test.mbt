///|
extern "c" fn test_pointer() -> Pointer = "moonbit_cffi_test_pointer"

///|
test "Pointer::is_null" {
  // null pointer is true, test_length pointer is false
  let p_null : Pointer = Pointer::null()
  inspect(p_null.is_null(), content="true")
  let p : Pointer = test_pointer()
  inspect(p.is_null(), content="false")
}

///|
test "Pointer::length" {
  // null pointer length -> 0
  let p_null : Pointer = Pointer::null()
  inspect(p_null.length(), content="0")

  // test_length pointer length -> 5
  let p : Pointer = test_pointer()
  inspect(p.length(), content="5")
}

///|
test "Pointer::memcpy_to copies data to dest" {
  let dest : Bytes = Bytes::make(5, b'0')
  let p = test_pointer()
  p.memcpy_to(dest, dest.length())
  inspect(
    dest,
    content=(
      #|b"hello"
    ),
  )
}

///|
test "Pointer::memcpy handles null or zero-length safely" {
  // null source
  let dest1 = Bytes::make(5, b'0')
  let pnull : Pointer = Pointer::null()
  pnull.memcpy_to(dest1, 0)
  inspect(
    dest1,
    content=(
      #|b"00000"
    ),
  )

  // zero-length dest - create zero length Bytes
  let dest2 = Bytes::make(0, b'0')
  let src : Pointer = test_pointer()
  src.memcpy_to(dest2, 0)
  inspect(
    dest2,
    content=(
      #|b""
    ),
  )
}
