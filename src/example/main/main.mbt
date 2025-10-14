///|
typealias @cffi.Pointer

///|
extern "c" fn test_pointer() -> Pointer = "moonbit_main_hello_pointer"

///|
fn main {
  try {
    let p : Pointer = test_pointer()
    guard !p.is_null() else { fail("p should not be null") }
    for _ in 0..<10_000 {
      let n = p.length()
      let b = Bytes::make(n, b'0')
      p.memcpy_to(b, n)
      guard b == b"hello" else { fail("failed") }
    }
  } catch {
    e => println("failed: \{e}")
  }
}
