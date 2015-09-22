#define ATS_DYNLOADFLAG 0

#include "share/atspre_staload.hats"

staload "pack.sats"
staload "unpack.sats"
staload "sbuffer.sats"
staload "object.sats"



implement main0 () = () where {
	val buf = msgpack_sbuffer_new ()
	val packer = msgpack_packer_new (buf, msgpack_sbuffer_write)

	val _ = msgpack_pack_array (packer, i2sz 3)
	val _ = msgpack_pack_int (packer, 1)
	val _ = msgpack_pack_true (packer)
	val _ = msgpack_pack_str (packer, i2sz 7)
	val _ = msgpack_pack_str_body (packer, "example", i2sz 7)

	val unpacker = msgpack_unpacker_new (MSGPACK_UNPACKER_INIT_BUFFER_SIZE)

	var unpacked : msgpack_unpacked
	val () = msgpack_unpacked_init unpacked

	val _ = msgpack_unpacker_reserve_buffer (unpacker, i2sz 100)
	val size = msgpack_sbuffer_size buf
	val _ = $extfcall (void, "memcpy", msgpack_unpacker_buffer unpacker, msgpack_sbuffer_buffer buf, size)
	val _ = msgpack_unpacker_buffer_consumed (unpacker, size)

	val result = msgpack_unpacker_next (unpacker, unpacked)
	val () = assertloc (result = MSGPACK_UNPACK_SUCCESS)
	val obj = msgpack_unpacked_data (unpacked)

	val _ = msgpack_object_print (stdout_ref, obj)
	val _ = $extfcall (void, "puts", "\nEND")

	val () = msgpack_unpacked_destroy unpacked
	val () = msgpack_unpacker_free unpacker

	val () = msgpack_packer_free packer 
	val () = msgpack_sbuffer_free buf 
}