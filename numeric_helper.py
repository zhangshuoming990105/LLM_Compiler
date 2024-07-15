import struct

int_to_float = lambda n: struct.unpack("@f", struct.pack("@I", n))[0]
float_to_int = lambda f: struct.unpack("@I", struct.pack("@f", f))[0]
int_to_double = lambda n: struct.unpack("@d", struct.pack("@Q", n))[0]
double_to_int = lambda f: struct.unpack("@Q", struct.pack("@d", f))[0]