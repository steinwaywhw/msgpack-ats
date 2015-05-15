# msgpack-ats
ATS Bindings for MessagePack


## Simple Buffer

This is a wrapper for `sbuffer.h` file.

### Types

* `msgpack_sbuffer` is an abstract linear boxed type, wrapping the same name structure.

### Functions

* `msgpack_sbuffer_new` and `msgpack_sbuffer_free`. Only use these two functions to create/destroy `msgpack_sbuffer` values.
* `msgpack_sbuffer_init` and `msgpack_sbuffer_destroy` are not wrapped because we don't use it.
* `msgpack_sbuffer_release` and `msgpack_sbuffer_clear` is wrapped. But the usage senario is unclear.
* `msgpack_sbuffer_buffer` and `msgpack_sbuffer_size` is added to access data inside abstract type.

## Object

This is a wrapper for `object.h` file.

### Types

* `msgpack_object` is an abstract nonlinear flat type, wrapping the same name structure.

### Functions

* `msgpack_object_print` 
* `msgpack_object_equal`

## Packer

This is a wrapper for `pack.h` file.

### Type

* `msgpack_buffer` is an abstract linear boxed type. It is the super class of all buffer implementations.
* `msgpack_packer` is an abstract linear boxed type.
* `msgpack_packer_write` is a function type.

### Functions

* `msgpack_packer_new` and `msgpack_packer_free`
