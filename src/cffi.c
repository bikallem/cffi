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
    return -1;
  }
  return (int32_t)strlen((const char*)ptr);
}