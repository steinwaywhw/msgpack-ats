%{#
#ifndef __MSGPACK
#define __MSGPACK
#include "msgpack-c/include/msgpack.h"
#endif
%}


staload "object.sats"


absvtype msgpack_buffer = ptr

//typedef int (*msgpack_packer_write)(void* data, const char* buf, size_t len);

typedef msgpack_packer_write = {l:addr | l>null} (!msgpack_buffer, ptr l, size_t) -> int 

//typedef struct msgpack_packer {
//    void* data;
//    msgpack_packer_write callback;
//} msgpack_packer;

absvtype msgpack_packer = $extype "msgpack_packer *"

//static void msgpack_packer_init(msgpack_packer* pk, void* data, msgpack_packer_write callback);
//static msgpack_packer* msgpack_packer_new(void* data, msgpack_packer_write callback);
//static void msgpack_packer_free(msgpack_packer* pk);

fun msgpack_packer_new  (buffer: !msgpack_buffer, callback: msgpack_packer_write): msgpack_packer = "mac#"
fun msgpack_packer_free (packer: msgpack_packer): void = "mac#"

//static int msgpack_pack_char(msgpack_packer* pk, char d);
//static int msgpack_pack_signed_char(msgpack_packer* pk, signed char d);
//static int msgpack_pack_short(msgpack_packer* pk, short d);
//static int msgpack_pack_int(msgpack_packer* pk, int d);
//static int msgpack_pack_long(msgpack_packer* pk, long d);
//static int msgpack_pack_long_long(msgpack_packer* pk, long long d);
//static int msgpack_pack_unsigned_char(msgpack_packer* pk, unsigned char d);
//static int msgpack_pack_unsigned_short(msgpack_packer* pk, unsigned short d);
//static int msgpack_pack_unsigned_int(msgpack_packer* pk, unsigned int d);
//static int msgpack_pack_unsigned_long(msgpack_packer* pk, unsigned long d);
//static int msgpack_pack_unsigned_long_long(msgpack_packer* pk, unsigned long long d);

//static int msgpack_pack_uint8(msgpack_packer* pk, uint8_t d);
//static int msgpack_pack_uint16(msgpack_packer* pk, uint16_t d);
//static int msgpack_pack_uint32(msgpack_packer* pk, uint32_t d);
//static int msgpack_pack_uint64(msgpack_packer* pk, uint64_t d);
//static int msgpack_pack_int8(msgpack_packer* pk, int8_t d);
//static int msgpack_pack_int16(msgpack_packer* pk, int16_t d);
//static int msgpack_pack_int32(msgpack_packer* pk, int32_t d);
//static int msgpack_pack_int64(msgpack_packer* pk, int64_t d);

//static int msgpack_pack_fix_uint8(msgpack_packer* pk, uint8_t d);
//static int msgpack_pack_fix_uint16(msgpack_packer* pk, uint16_t d);
//static int msgpack_pack_fix_uint32(msgpack_packer* pk, uint32_t d);
//static int msgpack_pack_fix_uint64(msgpack_packer* pk, uint64_t d);
//static int msgpack_pack_fix_int8(msgpack_packer* pk, int8_t d);
//static int msgpack_pack_fix_int16(msgpack_packer* pk, int16_t d);
//static int msgpack_pack_fix_int32(msgpack_packer* pk, int32_t d);
//static int msgpack_pack_fix_int64(msgpack_packer* pk, int64_t d);

//static int msgpack_pack_float(msgpack_packer* pk, float d);
//static int msgpack_pack_double(msgpack_packer* pk, double d);

//static int msgpack_pack_nil(msgpack_packer* pk);
//static int msgpack_pack_true(msgpack_packer* pk);
//static int msgpack_pack_false(msgpack_packer* pk);

//static int msgpack_pack_array(msgpack_packer* pk, size_t n);

//static int msgpack_pack_map(msgpack_packer* pk, size_t n);

//static int msgpack_pack_str(msgpack_packer* pk, size_t l);
//static int msgpack_pack_str_body(msgpack_packer* pk, const void* b, size_t l);

//static int msgpack_pack_bin(msgpack_packer* pk, size_t l);
//static int msgpack_pack_bin_body(msgpack_packer* pk, const void* b, size_t l);

//static int msgpack_pack_ext(msgpack_packer* pk, size_t l, int8_t type);
//static int msgpack_pack_ext_body(msgpack_packer* pk, const void* b, size_t l);

//int msgpack_pack_object(msgpack_packer* pk, msgpack_object d);

fun msgpack_pack_char                       (packer: !msgpack_packer, d: char):   int = "mac#"
fun msgpack_pack_signed_char                (packer: !msgpack_packer, d: schar):  int = "mac#"
fun msgpack_pack_short                      (packer: !msgpack_packer, d: sint):   int = "mac#"
fun msgpack_pack_int                        (packer: !msgpack_packer, d: int):    int = "mac#"
fun msgpack_pack_long                       (packer: !msgpack_packer, d: lint):   int = "mac#"
fun msgpack_pack_long_long                  (packer: !msgpack_packer, d: llint):  int = "mac#"
fun msgpack_pack_unsigned_char              (packer: !msgpack_packer, d: uchar):  int = "mac#"
fun msgpack_pack_unsigned_short             (packer: !msgpack_packer, d: usint):  int = "mac#"
fun msgpack_pack_unsigned_int               (packer: !msgpack_packer, d: uint):   int = "mac#"
fun msgpack_pack_unsigned_long              (packer: !msgpack_packer, d: ulint):  int = "mac#"
fun msgpack_pack_unsigned_long_long         (packer: !msgpack_packer, d: ullint): int = "mac#"
fun msgpack_pack_uint8                      (packer: !msgpack_packer, d: uint8):  int = "mac#"
fun msgpack_pack_uint16                     (packer: !msgpack_packer, d: uint16): int = "mac#"
fun msgpack_pack_uint32                     (packer: !msgpack_packer, d: uint32): int = "mac#"
fun msgpack_pack_uint64                     (packer: !msgpack_packer, d: uint64): int = "mac#"
fun msgpack_pack_int8                       (packer: !msgpack_packer, d: int8):   int = "mac#"
fun msgpack_pack_int16                      (packer: !msgpack_packer, d: int16):  int = "mac#"
fun msgpack_pack_int32                      (packer: !msgpack_packer, d: int32):  int = "mac#"
fun msgpack_pack_int64                      (packer: !msgpack_packer, d: int64):  int = "mac#"
fun msgpack_pack_fix_uint8                  (packer: !msgpack_packer, d: uint8):  int = "mac#"
fun msgpack_pack_fix_uint16                 (packer: !msgpack_packer, d: uint16): int = "mac#"
fun msgpack_pack_fix_uint32                 (packer: !msgpack_packer, d: uint32): int = "mac#"
fun msgpack_pack_fix_uint64                 (packer: !msgpack_packer, d: uint64): int = "mac#"
fun msgpack_pack_fix_int8                   (packer: !msgpack_packer, d: int8):   int = "mac#"
fun msgpack_pack_fix_int16                  (packer: !msgpack_packer, d: int16):  int = "mac#"
fun msgpack_pack_fix_int32                  (packer: !msgpack_packer, d: int32):  int = "mac#"
fun msgpack_pack_fix_int64                  (packer: !msgpack_packer, d: int64):  int = "mac#"
fun msgpack_pack_float                      (packer: !msgpack_packer, d: float):  int = "mac#"
fun msgpack_pack_double                     (packer: !msgpack_packer, d: double): int = "mac#"
fun msgpack_pack_nil                        (packer: !msgpack_packer): int            = "mac#"
fun msgpack_pack_true                       (packer: !msgpack_packer): int            = "mac#"
fun msgpack_pack_false                      (packer: !msgpack_packer): int            = "mac#"
fun msgpack_pack_bool                       (packer: !msgpack_packer, d: bool):   int 
 
fun msgpack_pack_array                      (packer: !msgpack_packer, n: size_t): int = "mac#"
fun msgpack_pack_map                        (packer: !msgpack_packer, n: size_t): int = "mac#"

fun msgpack_pack_str                        (packer: !msgpack_packer, n: size_t)             : int = "mac#"
fun msgpack_pack_str_body                   (packer: !msgpack_packer, d: string, n: size_t)  : int = "mac#"
 
fun msgpack_pack_bin                        (packer: !msgpack_packer, n: size_t)             : int = "mac#"
fun msgpack_pack_bin_body {l:addr | l>null} (packer: !msgpack_packer, d: ptr l, n: size_t)   : int = "mac#"
 
fun msgpack_pack_ext                        (packer: !msgpack_packer, n: size_t, type: int8) : int = "mac#"
fun msgpack_pack_ext_body {l:addr | l>null} (packer: !msgpack_packer, d: ptr l, n: size_t)   : int = "mac#"

fun msgpack_pack_object                     (packer: !msgpack_packer, d: msgpack_object)     : int = "mac#"


//#define msgpack_pack_inline_func(name) \
//    inline int msgpack_pack ## name

//#define msgpack_pack_inline_func_cint(name) \
//    inline int msgpack_pack ## name

//#define msgpack_pack_inline_func_fixint(name) \
//    inline int msgpack_pack_fix ## name

//#define msgpack_pack_user msgpack_packer*

//#define msgpack_pack_append_buffer(user, buf, len) \
//    return (*(user)->callback)((user)->data, (const char*)buf, len)

//#include "pack_template.h"

//inline void msgpack_packer_init(msgpack_packer* pk, void* data, msgpack_packer_write callback)
//{
//    pk->data = data;
//    pk->callback = callback;
//}

//inline msgpack_packer* msgpack_packer_new(void* data, msgpack_packer_write callback)
//{
//    msgpack_packer* pk = (msgpack_packer*)calloc(1, sizeof(msgpack_packer));
//    if(!pk) { return NULL; }
//    msgpack_packer_init(pk, data, callback);
//    return pk;
//}

//inline void msgpack_packer_free(msgpack_packer* pk)
//{
//    free(pk);
//}

