///|
extern "c" fn test_length() -> Pointer = "moonbit_cffi_test_length"

///|
test "Pointer::is_null" {
  // null pointer is true, test_length pointer is false
  let p_null : Pointer = Pointer::null()
  inspect(p_null.is_null(), content="true")
  let p : Pointer = test_length()
  inspect(p.is_null(), content="false")
}

///|
test "Pointer::length" {
  // null pointer length -> 0
  let p_null : Pointer = Pointer::null()
  inspect(p_null.length(), content="0")

  // test_length pointer length -> 5
  let p : Pointer = test_length()
  inspect(p.length(), content="5")
}
