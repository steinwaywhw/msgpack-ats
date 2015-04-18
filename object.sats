

///**
// * @defgroup msgpack_object Dynamically typed object
// * @ingroup msgpack
// * @{
// */

//typedef enum {
//    MSGPACK_OBJECT_NIL                  = 0x00,
//    MSGPACK_OBJECT_BOOLEAN              = 0x01,
//    MSGPACK_OBJECT_POSITIVE_INTEGER     = 0x02,
//    MSGPACK_OBJECT_NEGATIVE_INTEGER     = 0x03,
//    MSGPACK_OBJECT_FLOAT                = 0x04,
//#if defined(MSGPACK_USE_LEGACY_NAME_AS_FLOAT)
//    MSGPACK_OBJECT_DOUBLE               = MSGPACK_OBJECT_FLOAT, /* obsolete */
//#endif /* MSGPACK_USE_LEGACY_NAME_AS_FLOAT */
//    MSGPACK_OBJECT_STR                  = 0x05,
//    MSGPACK_OBJECT_ARRAY                = 0x06,
//    MSGPACK_OBJECT_MAP                  = 0x07,
//    MSGPACK_OBJECT_BIN                  = 0x08,
//    MSGPACK_OBJECT_EXT                  = 0x09
//} msgpack_object_type;


//struct msgpack_object;
//struct msgpack_object_kv;

//typedef struct {
//    uint32_t size;
//    struct msgpack_object* ptr;
//} msgpack_object_array;

//typedef struct {
//    uint32_t size;
//    struct msgpack_object_kv* ptr;
//} msgpack_object_map;

//typedef struct {
//    uint32_t size;
//    const char* ptr;
//} msgpack_object_str;

//typedef struct {
//    uint32_t size;
//    const char* ptr;
//} msgpack_object_bin;

//typedef struct {
//    int8_t type;
//    uint32_t size;
//    const char* ptr;
//} msgpack_object_ext;

//typedef union {
//    bool boolean;
//    uint64_t u64;
//    int64_t  i64;
//#if defined(MSGPACK_USE_LEGACY_NAME_AS_FLOAT)
//    double   dec; /* obsolete*/
//#endif /* MSGPACK_USE_LEGACY_NAME_AS_FLOAT */
//    double   f64;
//    msgpack_object_array array;
//    msgpack_object_map map;
//    msgpack_object_str str;
//    msgpack_object_bin bin;
//    msgpack_object_ext ext;
//} msgpack_object_union;

//typedef struct msgpack_object {
//    msgpack_object_type type;
//    msgpack_object_union via;
//} msgpack_object;
abst@ype msgpack_object = $extype "msgpack_object"

//typedef struct msgpack_object_kv {
//    msgpack_object key;
//    msgpack_object val;
//} msgpack_object_kv;

//MSGPACK_DLLEXPORT
//void msgpack_object_print(FILE* out, msgpack_object o);
fun msgpack_object_print (out: FILEref, o: msgpack_object): void = "#mac"

//MSGPACK_DLLEXPORT
//bool msgpack_object_equal(const msgpack_object x, const msgpack_object y);
fun msgpack_object_equal (x: msgpack_object, y: msgpack_object): bool = "#mac"


///** @} */


//#ifdef __cplusplus
//}
//#endif

//#endif /* msgpack/object.h */