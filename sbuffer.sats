//typedef struct msgpack_sbuffer {
//    size_t size;
//    char* data;
//    size_t alloc;
//} msgpack_sbuffer;

absvtype msgpack_sbuffer = $extype "msgpack_sbuffer *"
assume msgpack_buffer = msgpack_sbuffer 

//static inline void msgpack_sbuffer_init(msgpack_sbuffer* sbuf)
//{
//    memset(sbuf, 0, sizeof(msgpack_sbuffer));
//}

//static inline void msgpack_sbuffer_destroy(msgpack_sbuffer* sbuf)
//{
//    free(sbuf->data);
//}

//static inline msgpack_sbuffer* msgpack_sbuffer_new(void)
//{
//    return (msgpack_sbuffer*)calloc(1, sizeof(msgpack_sbuffer));
//}
fun msgpack_sbuffer_new (): msgpack_sbuffer = "mac#"


//static inline void msgpack_sbuffer_free(msgpack_sbuffer* sbuf)
//{
//    if(sbuf == NULL) { return; }
//    msgpack_sbuffer_destroy(sbuf);
//    free(sbuf);
//}
fun msgpack_sbuffer_free (msgpack_sbuffer): void = "mac#"

//#ifndef MSGPACK_SBUFFER_INIT_SIZE
//#define MSGPACK_SBUFFER_INIT_SIZE 8192
//#endif

// TODO: return result
fun msgpack_sbuffer_write {l:addr | l>null} (buf: !msgpack_sbuffer, data: ptr l, len: size_t): int 
//static inline int msgpack_sbuffer_write(void* data, const char* buf, size_t len)
//{
//    msgpack_sbuffer* sbuf = (msgpack_sbuffer*)data;

//    if(sbuf->alloc - sbuf->size < len) {
//        void* tmp;
//        size_t nsize = (sbuf->alloc) ?
//                sbuf->alloc * 2 : MSGPACK_SBUFFER_INIT_SIZE;

//        while(nsize < sbuf->size + len) {
//            size_t tmp_nsize = nsize * 2;
//            if (tmp_nsize <= nsize) {
//                nsize = sbuf->size + len;
//                break;
//            }
//            nsize = tmp_nsize;
//        }

//        tmp = realloc(sbuf->data, nsize);
//        if(!tmp) { return -1; }

//        sbuf->data = (char*)tmp;
//        sbuf->alloc = nsize;
//    }

//    memcpy(sbuf->data + sbuf->size, buf, len);
//    sbuf->size += len;
//    return 0;
//}

fun msgpack_sbuffer_release (buf: !msgpack_sbuffer): [l:addr | l>null] ptr l = "mac#"
//static inline char* msgpack_sbuffer_release(msgpack_sbuffer* sbuf)
//{
//    char* tmp = sbuf->data;
//    sbuf->size = 0;
//    sbuf->data = NULL;
//    sbuf->alloc = 0;
//    return tmp;
//}

fun msgpack_sbuffer_clear(buf: !msgpack_sbuffer): void = "mac#"
//static inline void msgpack_sbuffer_clear(msgpack_sbuffer* sbuf)
//{
//    sbuf->size = 0;
//}
