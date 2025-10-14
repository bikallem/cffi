#include "moonbit.h"
#include <string.h>

MOONBIT_FFI_EXPORT
int32_t
moonbit_cffi_is_null(const void* ptr)
{
  return ptr == NULL;
}

MOONBIT_FFI_EXPORT
int32_t
moonbit_cffi_length(const void* ptr)
{
  if (ptr == NULL) {
    return 0;
  }
  return (int32_t)strlen((const char*)ptr);
}

MOONBIT_FFI_EXPORT
const void*
moonbit_cffi_null(void)
{
  return NULL;
}

MOONBIT_FFI_EXPORT
const void*
moonbit_cffi_test_length(void)
{
  return "hello";
}