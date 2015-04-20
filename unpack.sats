%{#
#ifndef __MSGPACK
#define __MSGPACK
#include "msgpack-c/include/msgpack.h"
#endif
%}


staload "object.sats"

//typedef struct msgpack_unpacked {
//    msgpack_zone* zone;
//    msgpack_object data;
//} msgpack_unpacked;

abst@ype msgpack_unpacked = $extype "msgpack_unpacked"

fun msgpack_unpacked_data (unpacked: &msgpack_unpacked): msgpack_object = "mac#"

%{#

static inline msgpack_object msgpack_unpacked_data (msgpack_unpacked* result)
{
    return result->data;
}

%}


//typedef enum {
//    MSGPACK_UNPACK_SUCCESS              =  2,
//    MSGPACK_UNPACK_EXTRA_BYTES          =  1,
//    MSGPACK_UNPACK_CONTINUE             =  0,
//    MSGPACK_UNPACK_PARSE_ERROR          = -1,
//    MSGPACK_UNPACK_NOMEM_ERROR          = -2
//} msgpack_unpack_return;

abst@ype msgpack_unpack_return = int 

macdef MSGPACK_UNPACK_SUCCESS     = $extval (int, "MSGPACK_UNPACK_SUCCESS")
macdef MSGPACK_UNPACK_EXTRA_BYTES = $extval (int, "MSGPACK_UNPACK_EXTRA_BYTES")
macdef MSGPACK_UNPACK_CONTINUE    = $extval (int, "MSGPACK_UNPACK_CONTINUE")
macdef MSGPACK_UNPACK_PARSE_ERROR = $extval (int, "MSGPACK_UNPACK_PARSE_ERROR")
macdef MSGPACK_UNPACK_NOMEM_ERROR = $extval (int, "MSGPACK_UNPACK_NOMEM_ERROR")


//MSGPACK_DLLEXPORT
//msgpack_unpack_return
//msgpack_unpack_next(msgpack_unpacked* result,
//        const char* data, size_t len, size_t* off);

///** @} */
//fun msgpack_unpack_next (unpacked: &msgpack_unpacked? >> _, )


///**
// * @defgroup msgpack_unpacker Streaming deserializer
// * @ingroup msgpack
// * @{
// */

//typedef struct msgpack_unpacker {
//    char* buffer;
//    size_t used;
//    size_t free;
//    size_t off;
//    size_t parsed;
//    msgpack_zone* z;
//    size_t initial_buffer_size;
//    void* ctx;
//} msgpack_unpacker;
absvtype msgpack_unpacker = $extype "msgpack_unpacker *"

//#ifndef MSGPACK_UNPACKER_INIT_BUFFER_SIZE
//#define MSGPACK_UNPACKER_INIT_BUFFER_SIZE (64*1024)
//#endif
macdef MSGPACK_UNPACKER_INIT_BUFFER_SIZE = $extval (size_t, "MSGPACK_UNPACKER_INIT_BUFFER_SIZE")

///**
// * Initializes a streaming deserializer.
// * The initialized deserializer must be destroyed by msgpack_unpacker_destroy(msgpack_unpacker*).
// */
//MSGPACK_DLLEXPORT
//bool msgpack_unpacker_init(msgpack_unpacker* mpac, size_t initial_buffer_size);

///**
// * Destroys a streaming deserializer initialized by msgpack_unpacker_init(msgpack_unpacker*, size_t).
// */
//MSGPACK_DLLEXPORT
//void msgpack_unpacker_destroy(msgpack_unpacker* mpac);


///**
// * Creates a streaming deserializer.
// * The created deserializer must be destroyed by msgpack_unpacker_free(msgpack_unpacker*).
// */
//MSGPACK_DLLEXPORT
//msgpack_unpacker* msgpack_unpacker_new(size_t initial_buffer_size);
fun msgpack_unpacker_new (bufsize: size_t): msgpack_unpacker = "mac#"


///**
// * Frees a streaming deserializer created by msgpack_unpacker_new(size_t).
// */
//MSGPACK_DLLEXPORT
//void msgpack_unpacker_free(msgpack_unpacker* mpac);
fun msgpack_unpacker_free (unpacker: msgpack_unpacker): void = "mac#"

//#ifndef MSGPACK_UNPACKER_RESERVE_SIZE
//#define MSGPACK_UNPACKER_RESERVE_SIZE (32*1024)
//#endif
macdef MSGPACK_UNPACKER_RESERVE_SIZE = $extval (int, "MSGPACK_UNPACKER_RESERVE_SIZE")


///**
// * Reserves free space of the internal buffer.
// * Use this function to fill the internal buffer with
// * msgpack_unpacker_buffer(msgpack_unpacker*),
// * msgpack_unpacker_buffer_capacity(const msgpack_unpacker*) and
// * msgpack_unpacker_buffer_consumed(msgpack_unpacker*).
// */
//static inline bool   msgpack_unpacker_reserve_buffer(msgpack_unpacker* mpac, size_t size);
fun msgpack_unpacker_reserve_buffer (unpacker: !msgpack_unpacker, size: size_t): bool = "mac#"


///**
// * Gets pointer to the free space of the internal buffer.
// * Use this function to fill the internal buffer with
// * msgpack_unpacker_reserve_buffer(msgpack_unpacker*, size_t),
// * msgpack_unpacker_buffer_capacity(const msgpack_unpacker*) and
// * msgpack_unpacker_buffer_consumed(msgpack_unpacker*).
// */
//static inline char*  msgpack_unpacker_buffer(msgpack_unpacker* mpac);
fun msgpack_unpacker_buffer (unpacker: !msgpack_unpacker): [l:addr | l>null] ptr l = "mac#"

///**
// * Gets size of the free space of the internal buffer.
// * Use this function to fill the internal buffer with
// * msgpack_unpacker_reserve_buffer(msgpack_unpacker*, size_t),
// * msgpack_unpacker_buffer(const msgpack_unpacker*) and
// * msgpack_unpacker_buffer_consumed(msgpack_unpacker*).
// */
//static inline size_t msgpack_unpacker_buffer_capacity(const msgpack_unpacker* mpac);
fun msgpack_unpacker_buffer_capacity (unpacker: !msgpack_unpacker): size_t = "mac#"

///**
// * Notifies the deserializer that the internal buffer filled.
// * Use this function to fill the internal buffer with
// * msgpack_unpacker_reserve_buffer(msgpack_unpacker*, size_t),
// * msgpack_unpacker_buffer(msgpack_unpacker*) and
// * msgpack_unpacker_buffer_capacity(const msgpack_unpacker*).
// */
//static inline void   msgpack_unpacker_buffer_consumed(msgpack_unpacker* mpac, size_t size);
fun msgpack_unpacker_buffer_consumed (unpacker: !msgpack_unpacker, size: size_t): void = "mac#"

///**
// * Deserializes one object.
// * Returns true if it successes. Otherwise false is returned.
// * @param pac  pointer to an initialized msgpack_unpacked object.
// */
//MSGPACK_DLLEXPORT
//msgpack_unpack_return msgpack_unpacker_next(msgpack_unpacker* mpac, msgpack_unpacked* pac);
fun msgpack_unpacker_next (unpacker: !msgpack_unpacker, obj: &msgpack_unpacked): int = "mac#"

///**
// * Initializes a msgpack_unpacked object.
// * The initialized object must be destroyed by msgpack_unpacked_destroy(msgpack_unpacker*).
// * Use the object with msgpack_unpacker_next(msgpack_unpacker*, msgpack_unpacked*) or
// * msgpack_unpack_next(msgpack_unpacked*, const char*, size_t, size_t*).
// */
//static inline void msgpack_unpacked_init(msgpack_unpacked* result);
fun msgpack_unpacked_init (obj: &msgpack_unpacked? >> _): void = "mac#"

///**
// * Destroys a streaming deserializer initialized by msgpack_unpacked().
// */
//static inline void msgpack_unpacked_destroy(msgpack_unpacked* result);
fun msgpack_unpacked_destroy (obj: &msgpack_unpacked >> _?): void = "mac#"

///**
// * Releases the memory zone from msgpack_unpacked object.
// * The released zone must be freed by msgpack_zone_free(msgpack_zone*).
// */
//static inline msgpack_zone* msgpack_unpacked_release_zone(msgpack_unpacked* result);


//MSGPACK_DLLEXPORT
//int msgpack_unpacker_execute(msgpack_unpacker* mpac);

//MSGPACK_DLLEXPORT
//msgpack_object msgpack_unpacker_data(msgpack_unpacker* mpac);
fun msgpack_unpacker_data (unpacker: !msgpack_unpacker): msgpack_object = "mac#"

//MSGPACK_DLLEXPORT
//msgpack_zone* msgpack_unpacker_release_zone(msgpack_unpacker* mpac);

//MSGPACK_DLLEXPORT
//void msgpack_unpacker_reset_zone(msgpack_unpacker* mpac);

//MSGPACK_DLLEXPORT
//void msgpack_unpacker_reset(msgpack_unpacker* mpac);

//static inline size_t msgpack_unpacker_message_size(const msgpack_unpacker* mpac);


///** @} */


//// obsolete
//MSGPACK_DLLEXPORT
//msgpack_unpack_return
//msgpack_unpack(const char* data, size_t len, size_t* off,
//        msgpack_zone* result_zone, msgpack_object* result);




//static inline size_t msgpack_unpacker_parsed_size(const msgpack_unpacker* mpac);

//MSGPACK_DLLEXPORT
//bool msgpack_unpacker_flush_zone(msgpack_unpacker* mpac);

//MSGPACK_DLLEXPORT
//bool msgpack_unpacker_expand_buffer(msgpack_unpacker* mpac, size_t size);

//static inline bool msgpack_unpacker_reserve_buffer(msgpack_unpacker* mpac, size_t size)
//{
//    if(mpac->free >= size) { return true; }
//    return msgpack_unpacker_expand_buffer(mpac, size);
//}

//static inline char* msgpack_unpacker_buffer(msgpack_unpacker* mpac)
//{
//    return mpac->buffer + mpac->used;
//}

//static inline size_t msgpack_unpacker_buffer_capacity(const msgpack_unpacker* mpac)
//{
//    return mpac->free;
//}

//static inline void msgpack_unpacker_buffer_consumed(msgpack_unpacker* mpac, size_t size)
//{
//    mpac->used += size;
//    mpac->free -= size;
//}

//static inline size_t msgpack_unpacker_message_size(const msgpack_unpacker* mpac)
//{
//    return mpac->parsed - mpac->off + mpac->used;
//}

//static inline size_t msgpack_unpacker_parsed_size(const msgpack_unpacker* mpac)
//{
//    return mpac->parsed;
//}


//static inline void msgpack_unpacked_init(msgpack_unpacked* result)
//{
//    memset(result, 0, sizeof(msgpack_unpacked));
//}

//static inline void msgpack_unpacked_destroy(msgpack_unpacked* result)
//{
//    if(result->zone != NULL) {
//        msgpack_zone_free(result->zone);
//        result->zone = NULL;
//        memset(&result->data, 0, sizeof(msgpack_object));
//    }
//}

//static inline msgpack_zone* msgpack_unpacked_release_zone(msgpack_unpacked* result)
//{
//    if(result->zone != NULL) {
//        msgpack_zone* z = result->zone;
//        result->zone = NULL;
//        return z;
//    }
//    return NULL;
//}


//#ifdef __cplusplus
//}
//#endif

//#endif /* msgpack/unpack.h */

