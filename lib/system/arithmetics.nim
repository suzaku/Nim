proc succ*[T: Ordinal](x: T, y = 1): T {.magic: "Succ", noSideEffect.}
  ## Returns the ``y``-th successor (default: 1) of the value ``x``.
  ## ``T`` has to be an `ordinal type <#Ordinal>`_.
  ##
  ## If such a value does not exist, ``OverflowError`` is raised
  ## or a compile time error occurs.
  ##
  ## .. code-block:: Nim
  ##   let x = 5
  ##   echo succ(5)    # => 6
  ##   echo succ(5, 3) # => 8

proc pred*[T: Ordinal](x: T, y = 1): T {.magic: "Pred", noSideEffect.}
  ## Returns the ``y``-th predecessor (default: 1) of the value ``x``.
  ## ``T`` has to be an `ordinal type <#Ordinal>`_.
  ##
  ## If such a value does not exist, ``OverflowError`` is raised
  ## or a compile time error occurs.
  ##
  ## .. code-block:: Nim
  ##   let x = 5
  ##   echo pred(5)    # => 4
  ##   echo pred(5, 3) # => 2

proc inc*[T: Ordinal](x: var T, y = 1) {.magic: "Inc", noSideEffect.}
  ## Increments the ordinal ``x`` by ``y``.
  ##
  ## If such a value does not exist, ``OverflowError`` is raised or a compile
  ## time error occurs. This is a short notation for: ``x = succ(x, y)``.
  ##
  ## .. code-block:: Nim
  ##  var i = 2
  ##  inc(i)    # i <- 3
  ##  inc(i, 3) # i <- 6

proc dec*[T: Ordinal](x: var T, y = 1) {.magic: "Dec", noSideEffect.}
  ## Decrements the ordinal ``x`` by ``y``.
  ##
  ## If such a value does not exist, ``OverflowError`` is raised or a compile
  ## time error occurs. This is a short notation for: ``x = pred(x, y)``.
  ##
  ## .. code-block:: Nim
  ##  var i = 2
  ##  dec(i)    # i <- 1
  ##  dec(i, 3) # i <- -2



# --------------------------------------------------------------------------
# built-in operators

when defined(nimNoZeroExtendMagic):
  proc ze*(x: int8): int {.deprecated.} =
    ## zero extends a smaller integer type to ``int``. This treats `x` as
    ## unsigned.
    ## **Deprecated since version 0.19.9**: Use unsigned integers instead.
    cast[int](uint(cast[uint8](x)))

  proc ze*(x: int16): int {.deprecated.} =
    ## zero extends a smaller integer type to ``int``. This treats `x` as
    ## unsigned.
    ## **Deprecated since version 0.19.9**: Use unsigned integers instead.
    cast[int](uint(cast[uint16](x)))

  proc ze64*(x: int8): int64 {.deprecated.} =
    ## zero extends a smaller integer type to ``int64``. This treats `x` as
    ## unsigned.
    ## **Deprecated since version 0.19.9**: Use unsigned integers instead.
    cast[int64](uint64(cast[uint8](x)))

  proc ze64*(x: int16): int64 {.deprecated.} =
    ## zero extends a smaller integer type to ``int64``. This treats `x` as
    ## unsigned.
    ## **Deprecated since version 0.19.9**: Use unsigned integers instead.
    cast[int64](uint64(cast[uint16](x)))

  proc ze64*(x: int32): int64 {.deprecated.} =
    ## zero extends a smaller integer type to ``int64``. This treats `x` as
    ## unsigned.
    ## **Deprecated since version 0.19.9**: Use unsigned integers instead.
    cast[int64](uint64(cast[uint32](x)))

  proc ze64*(x: int): int64 {.deprecated.} =
    ## zero extends a smaller integer type to ``int64``. This treats `x` as
    ## unsigned. Does nothing if the size of an ``int`` is the same as ``int64``.
    ## (This is the case on 64 bit processors.)
    ## **Deprecated since version 0.19.9**: Use unsigned integers instead.
    cast[int64](uint64(cast[uint](x)))

  proc toU8*(x: int): int8 {.deprecated.} =
    ## treats `x` as unsigned and converts it to a byte by taking the last 8 bits
    ## from `x`.
    ## **Deprecated since version 0.19.9**: Use unsigned integers instead.
    cast[int8](x)

  proc toU16*(x: int): int16 {.deprecated.} =
    ## treats `x` as unsigned and converts it to an ``int16`` by taking the last
    ## 16 bits from `x`.
    ## **Deprecated since version 0.19.9**: Use unsigned integers instead.
    cast[int16](x)

  proc toU32*(x: int64): int32 {.deprecated.} =
    ## treats `x` as unsigned and converts it to an ``int32`` by taking the
    ## last 32 bits from `x`.
    ## **Deprecated since version 0.19.9**: Use unsigned integers instead.
    cast[int32](x)

elif not defined(js):
  proc ze*(x: int8): int {.magic: "Ze8ToI", noSideEffect, deprecated.}
    ## zero extends a smaller integer type to ``int``. This treats `x` as
    ## unsigned.
    ## **Deprecated since version 0.19.9**: Use unsigned integers instead.

  proc ze*(x: int16): int {.magic: "Ze16ToI", noSideEffect, deprecated.}
    ## zero extends a smaller integer type to ``int``. This treats `x` as
    ## unsigned.
    ## **Deprecated since version 0.19.9**: Use unsigned integers instead.

  proc ze64*(x: int8): int64 {.magic: "Ze8ToI64", noSideEffect, deprecated.}
    ## zero extends a smaller integer type to ``int64``. This treats `x` as
    ## unsigned.
    ## **Deprecated since version 0.19.9**: Use unsigned integers instead.

  proc ze64*(x: int16): int64 {.magic: "Ze16ToI64", noSideEffect, deprecated.}
    ## zero extends a smaller integer type to ``int64``. This treats `x` as
    ## unsigned.
    ## **Deprecated since version 0.19.9**: Use unsigned integers instead.

  proc ze64*(x: int32): int64 {.magic: "Ze32ToI64", noSideEffect, deprecated.}
    ## zero extends a smaller integer type to ``int64``. This treats `x` as
    ## unsigned.
    ## **Deprecated since version 0.19.9**: Use unsigned integers instead.

  proc ze64*(x: int): int64 {.magic: "ZeIToI64", noSideEffect, deprecated.}
    ## zero extends a smaller integer type to ``int64``. This treats `x` as
    ## unsigned. Does nothing if the size of an ``int`` is the same as ``int64``.
    ## (This is the case on 64 bit processors.)
    ## **Deprecated since version 0.19.9**: Use unsigned integers instead.

  proc toU8*(x: int): int8 {.magic: "ToU8", noSideEffect, deprecated.}
    ## treats `x` as unsigned and converts it to a byte by taking the last 8 bits
    ## from `x`.
    ## **Deprecated since version 0.19.9**: Use unsigned integers instead.

  proc toU16*(x: int): int16 {.magic: "ToU16", noSideEffect, deprecated.}
    ## treats `x` as unsigned and converts it to an ``int16`` by taking the last
    ## 16 bits from `x`.
    ## **Deprecated since version 0.19.9**: Use unsigned integers instead.

  proc toU32*(x: int64): int32 {.magic: "ToU32", noSideEffect, deprecated.}
    ## treats `x` as unsigned and converts it to an ``int32`` by taking the
    ## last 32 bits from `x`.
    ## **Deprecated since version 0.19.9**: Use unsigned integers instead.

# integer calculations:
proc `+`*(x: int): int {.magic: "UnaryPlusI", noSideEffect.}
  ## Unary `+` operator for an integer. Has no effect.
proc `+`*(x: int8): int8 {.magic: "UnaryPlusI", noSideEffect.}
proc `+`*(x: int16): int16 {.magic: "UnaryPlusI", noSideEffect.}
proc `+`*(x: int32): int32 {.magic: "UnaryPlusI", noSideEffect.}
proc `+`*(x: int64): int64 {.magic: "UnaryPlusI", noSideEffect.}

proc `-`*(x: int): int {.magic: "UnaryMinusI", noSideEffect.}
  ## Unary `-` operator for an integer. Negates `x`.
proc `-`*(x: int8): int8 {.magic: "UnaryMinusI", noSideEffect.}
proc `-`*(x: int16): int16 {.magic: "UnaryMinusI", noSideEffect.}
proc `-`*(x: int32): int32 {.magic: "UnaryMinusI", noSideEffect.}
proc `-`*(x: int64): int64 {.magic: "UnaryMinusI64", noSideEffect.}

proc `not`*(x: int): int {.magic: "BitnotI", noSideEffect.}
  ## Computes the `bitwise complement` of the integer `x`.
  ##
  ## .. code-block:: Nim
  ##   var
  ##     a = 0'u8
  ##     b = 0'i8
  ##     c = 1000'u16
  ##     d = 1000'i16
  ##
  ##   echo not a # => 255
  ##   echo not b # => -1
  ##   echo not c # => 64535
  ##   echo not d # => -1001
proc `not`*(x: int8): int8 {.magic: "BitnotI", noSideEffect.}
proc `not`*(x: int16): int16 {.magic: "BitnotI", noSideEffect.}
proc `not`*(x: int32): int32 {.magic: "BitnotI", noSideEffect.}
proc `not`*(x: int64): int64 {.magic: "BitnotI", noSideEffect.}

proc `+`*(x, y: int): int {.magic: "AddI", noSideEffect.}
  ## Binary `+` operator for an integer.
proc `+`*(x, y: int8): int8 {.magic: "AddI", noSideEffect.}
proc `+`*(x, y: int16): int16 {.magic: "AddI", noSideEffect.}
proc `+`*(x, y: int32): int32 {.magic: "AddI", noSideEffect.}
proc `+`*(x, y: int64): int64 {.magic: "AddI", noSideEffect.}

proc `-`*(x, y: int): int {.magic: "SubI", noSideEffect.}
  ## Binary `-` operator for an integer.
proc `-`*(x, y: int8): int8 {.magic: "SubI", noSideEffect.}
proc `-`*(x, y: int16): int16 {.magic: "SubI", noSideEffect.}
proc `-`*(x, y: int32): int32 {.magic: "SubI", noSideEffect.}
proc `-`*(x, y: int64): int64 {.magic: "SubI", noSideEffect.}

proc `*`*(x, y: int): int {.magic: "MulI", noSideEffect.}
  ## Binary `*` operator for an integer.
proc `*`*(x, y: int8): int8 {.magic: "MulI", noSideEffect.}
proc `*`*(x, y: int16): int16 {.magic: "MulI", noSideEffect.}
proc `*`*(x, y: int32): int32 {.magic: "MulI", noSideEffect.}
proc `*`*(x, y: int64): int64 {.magic: "MulI", noSideEffect.}

proc `div`*(x, y: int): int {.magic: "DivI", noSideEffect.}
  ## Computes the integer division.
  ##
  ## This is roughly the same as ``trunc(x/y)``.
  ##
  ## .. code-block:: Nim
  ##   ( 1 div  2) ==  0
  ##   ( 2 div  2) ==  1
  ##   ( 3 div  2) ==  1
  ##   ( 7 div  3) ==  2
  ##   (-7 div  3) == -2
  ##   ( 7 div -3) == -2
  ##   (-7 div -3) ==  2
proc `div`*(x, y: int8): int8 {.magic: "DivI", noSideEffect.}
proc `div`*(x, y: int16): int16 {.magic: "DivI", noSideEffect.}
proc `div`*(x, y: int32): int32 {.magic: "DivI", noSideEffect.}
proc `div`*(x, y: int64): int64 {.magic: "DivI", noSideEffect.}

proc `mod`*(x, y: int): int {.magic: "ModI", noSideEffect.}
  ## Computes the integer modulo operation (remainder).
  ##
  ## This is the same as ``x - (x div y) * y``.
  ##
  ## .. code-block:: Nim
  ##   ( 7 mod  5) ==  2
  ##   (-7 mod  5) == -2
  ##   ( 7 mod -5) ==  2
  ##   (-7 mod -5) == -2
proc `mod`*(x, y: int8): int8 {.magic: "ModI", noSideEffect.}
proc `mod`*(x, y: int16): int16 {.magic: "ModI", noSideEffect.}
proc `mod`*(x, y: int32): int32 {.magic: "ModI", noSideEffect.}
proc `mod`*(x, y: int64): int64 {.magic: "ModI", noSideEffect.}

when defined(nimOldShiftRight) or not defined(nimAshr):
  const shrDepMessage = "`shr` will become sign preserving."
  proc `shr`*(x: int, y: SomeInteger): int {.magic: "ShrI", noSideEffect, deprecated: shrDepMessage.}
  proc `shr`*(x: int8, y: SomeInteger): int8 {.magic: "ShrI", noSideEffect, deprecated: shrDepMessage.}
  proc `shr`*(x: int16, y: SomeInteger): int16 {.magic: "ShrI", noSideEffect, deprecated: shrDepMessage.}
  proc `shr`*(x: int32, y: SomeInteger): int32 {.magic: "ShrI", noSideEffect, deprecated: shrDepMessage.}
  proc `shr`*(x: int64, y: SomeInteger): int64 {.magic: "ShrI", noSideEffect, deprecated: shrDepMessage.}
else:
  proc `shr`*(x: int, y: SomeInteger): int {.magic: "AshrI", noSideEffect.}
    ## Computes the `shift right` operation of `x` and `y`, filling
    ## vacant bit positions with the sign bit.
    ##
    ## **Note**: `Operator precedence <manual.html#syntax-precedence>`_
    ## is different than in *C*.
    ##
    ## See also:
    ## * `ashr proc <#ashr,int,SomeInteger>`_ for arithmetic shift right
    ##
    ## .. code-block:: Nim
    ##   0b0001_0000'i8 shr 2 == 0b0000_0100'i8
    ##   0b0000_0001'i8 shr 1 == 0b0000_0000'i8
    ##   0b1000_0000'i8 shr 4 == 0b1111_1000'i8
    ##   -1 shr 5 == -1
    ##   1 shr 5 == 0
    ##   16 shr 2 == 4
    ##   -16 shr 2 == -4
  proc `shr`*(x: int8, y: SomeInteger): int8 {.magic: "AshrI", noSideEffect.}
  proc `shr`*(x: int16, y: SomeInteger): int16 {.magic: "AshrI", noSideEffect.}
  proc `shr`*(x: int32, y: SomeInteger): int32 {.magic: "AshrI", noSideEffect.}
  proc `shr`*(x: int64, y: SomeInteger): int64 {.magic: "AshrI", noSideEffect.}


proc `shl`*(x: int, y: SomeInteger): int {.magic: "ShlI", noSideEffect.}
  ## Computes the `shift left` operation of `x` and `y`.
  ##
  ## **Note**: `Operator precedence <manual.html#syntax-precedence>`_
  ## is different than in *C*.
  ##
  ## .. code-block:: Nim
  ##  1'i32 shl 4 == 0x0000_0010
  ##  1'i64 shl 4 == 0x0000_0000_0000_0010
proc `shl`*(x: int8, y: SomeInteger): int8 {.magic: "ShlI", noSideEffect.}
proc `shl`*(x: int16, y: SomeInteger): int16 {.magic: "ShlI", noSideEffect.}
proc `shl`*(x: int32, y: SomeInteger): int32 {.magic: "ShlI", noSideEffect.}
proc `shl`*(x: int64, y: SomeInteger): int64 {.magic: "ShlI", noSideEffect.}

when defined(nimAshr):
  proc ashr*(x: int, y: SomeInteger): int {.magic: "AshrI", noSideEffect.}
    ## Shifts right by pushing copies of the leftmost bit in from the left,
    ## and let the rightmost bits fall off.
    ##
    ## Note that `ashr` is not an operator so use the normal function
    ## call syntax for it.
    ##
    ## See also:
    ## * `shr proc <#shr,int,SomeInteger>`_
    ##
    ## .. code-block:: Nim
    ##   ashr(0b0001_0000'i8, 2) == 0b0000_0100'i8
    ##   ashr(0b1000_0000'i8, 8) == 0b1111_1111'i8
    ##   ashr(0b1000_0000'i8, 1) == 0b1100_0000'i8
  proc ashr*(x: int8, y: SomeInteger): int8 {.magic: "AshrI", noSideEffect.}
  proc ashr*(x: int16, y: SomeInteger): int16 {.magic: "AshrI", noSideEffect.}
  proc ashr*(x: int32, y: SomeInteger): int32 {.magic: "AshrI", noSideEffect.}
  proc ashr*(x: int64, y: SomeInteger): int64 {.magic: "AshrI", noSideEffect.}
else:
  # used for bootstrapping the compiler
  proc ashr*[T](x: T, y: SomeInteger): T = discard

proc `and`*(x, y: int): int {.magic: "BitandI", noSideEffect.}
  ## Computes the `bitwise and` of numbers `x` and `y`.
  ##
  ## .. code-block:: Nim
  ##   (0b0011 and 0b0101) == 0b0001
  ##   (0b0111 and 0b1100) == 0b0100
proc `and`*(x, y: int8): int8 {.magic: "BitandI", noSideEffect.}
proc `and`*(x, y: int16): int16 {.magic: "BitandI", noSideEffect.}
proc `and`*(x, y: int32): int32 {.magic: "BitandI", noSideEffect.}
proc `and`*(x, y: int64): int64 {.magic: "BitandI", noSideEffect.}

proc `or`*(x, y: int): int {.magic: "BitorI", noSideEffect.}
  ## Computes the `bitwise or` of numbers `x` and `y`.
  ##
  ## .. code-block:: Nim
  ##   (0b0011 or 0b0101) == 0b0111
  ##   (0b0111 or 0b1100) == 0b1111
proc `or`*(x, y: int8): int8 {.magic: "BitorI", noSideEffect.}
proc `or`*(x, y: int16): int16 {.magic: "BitorI", noSideEffect.}
proc `or`*(x, y: int32): int32 {.magic: "BitorI", noSideEffect.}
proc `or`*(x, y: int64): int64 {.magic: "BitorI", noSideEffect.}

proc `xor`*(x, y: int): int {.magic: "BitxorI", noSideEffect.}
  ## Computes the `bitwise xor` of numbers `x` and `y`.
  ##
  ## .. code-block:: Nim
  ##   (0b0011 xor 0b0101) == 0b0110
  ##   (0b0111 xor 0b1100) == 0b1011
proc `xor`*(x, y: int8): int8 {.magic: "BitxorI", noSideEffect.}
proc `xor`*(x, y: int16): int16 {.magic: "BitxorI", noSideEffect.}
proc `xor`*(x, y: int32): int32 {.magic: "BitxorI", noSideEffect.}
proc `xor`*(x, y: int64): int64 {.magic: "BitxorI", noSideEffect.}

type
  IntMax32 = int|int8|int16|int32

proc `+%`*(x, y: IntMax32): IntMax32 {.magic: "AddU", noSideEffect.}
proc `+%`*(x, y: int64): int64 {.magic: "AddU", noSideEffect.}
  ## Treats `x` and `y` as unsigned and adds them.
  ##
  ## The result is truncated to fit into the result.
  ## This implements modulo arithmetic. No overflow errors are possible.

proc `-%`*(x, y: IntMax32): IntMax32 {.magic: "SubU", noSideEffect.}
proc `-%`*(x, y: int64): int64 {.magic: "SubU", noSideEffect.}
  ## Treats `x` and `y` as unsigned and subtracts them.
  ##
  ## The result is truncated to fit into the result.
  ## This implements modulo arithmetic. No overflow errors are possible.

proc `*%`*(x, y: IntMax32): IntMax32 {.magic: "MulU", noSideEffect.}
proc `*%`*(x, y: int64): int64 {.magic: "MulU", noSideEffect.}
  ## Treats `x` and `y` as unsigned and multiplies them.
  ##
  ## The result is truncated to fit into the result.
  ## This implements modulo arithmetic. No overflow errors are possible.

proc `/%`*(x, y: IntMax32): IntMax32 {.magic: "DivU", noSideEffect.}
proc `/%`*(x, y: int64): int64 {.magic: "DivU", noSideEffect.}
  ## Treats `x` and `y` as unsigned and divides them.
  ##
  ## The result is truncated to fit into the result.
  ## This implements modulo arithmetic. No overflow errors are possible.

proc `%%`*(x, y: IntMax32): IntMax32 {.magic: "ModU", noSideEffect.}
proc `%%`*(x, y: int64): int64 {.magic: "ModU", noSideEffect.}
  ## Treats `x` and `y` as unsigned and compute the modulo of `x` and `y`.
  ##
  ## The result is truncated to fit into the result.
  ## This implements modulo arithmetic. No overflow errors are possible.


# unsigned integer operations:
proc `not`*(x: uint): uint {.magic: "BitnotI", noSideEffect.}
  ## Computes the `bitwise complement` of the integer `x`.
proc `not`*(x: uint8): uint8 {.magic: "BitnotI", noSideEffect.}
proc `not`*(x: uint16): uint16 {.magic: "BitnotI", noSideEffect.}
proc `not`*(x: uint32): uint32 {.magic: "BitnotI", noSideEffect.}
proc `not`*(x: uint64): uint64 {.magic: "BitnotI", noSideEffect.}

proc `shr`*(x: uint, y: SomeInteger): uint {.magic: "ShrI", noSideEffect.}
  ## Computes the `shift right` operation of `x` and `y`.
proc `shr`*(x: uint8, y: SomeInteger): uint8 {.magic: "ShrI", noSideEffect.}
proc `shr`*(x: uint16, y: SomeInteger): uint16 {.magic: "ShrI", noSideEffect.}
proc `shr`*(x: uint32, y: SomeInteger): uint32 {.magic: "ShrI", noSideEffect.}
proc `shr`*(x: uint64, y: SomeInteger): uint64 {.magic: "ShrI", noSideEffect.}

proc `shl`*(x: uint, y: SomeInteger): uint {.magic: "ShlI", noSideEffect.}
  ## Computes the `shift left` operation of `x` and `y`.
proc `shl`*(x: uint8, y: SomeInteger): uint8 {.magic: "ShlI", noSideEffect.}
proc `shl`*(x: uint16, y: SomeInteger): uint16 {.magic: "ShlI", noSideEffect.}
proc `shl`*(x: uint32, y: SomeInteger): uint32 {.magic: "ShlI", noSideEffect.}
proc `shl`*(x: uint64, y: SomeInteger): uint64 {.magic: "ShlI", noSideEffect.}

proc `and`*(x, y: uint): uint {.magic: "BitandI", noSideEffect.}
  ## Computes the `bitwise and` of numbers `x` and `y`.
proc `and`*(x, y: uint8): uint8 {.magic: "BitandI", noSideEffect.}
proc `and`*(x, y: uint16): uint16 {.magic: "BitandI", noSideEffect.}
proc `and`*(x, y: uint32): uint32 {.magic: "BitandI", noSideEffect.}
proc `and`*(x, y: uint64): uint64 {.magic: "BitandI", noSideEffect.}

proc `or`*(x, y: uint): uint {.magic: "BitorI", noSideEffect.}
  ## Computes the `bitwise or` of numbers `x` and `y`.
proc `or`*(x, y: uint8): uint8 {.magic: "BitorI", noSideEffect.}
proc `or`*(x, y: uint16): uint16 {.magic: "BitorI", noSideEffect.}
proc `or`*(x, y: uint32): uint32 {.magic: "BitorI", noSideEffect.}
proc `or`*(x, y: uint64): uint64 {.magic: "BitorI", noSideEffect.}

proc `xor`*(x, y: uint): uint {.magic: "BitxorI", noSideEffect.}
  ## Computes the `bitwise xor` of numbers `x` and `y`.
proc `xor`*(x, y: uint8): uint8 {.magic: "BitxorI", noSideEffect.}
proc `xor`*(x, y: uint16): uint16 {.magic: "BitxorI", noSideEffect.}
proc `xor`*(x, y: uint32): uint32 {.magic: "BitxorI", noSideEffect.}
proc `xor`*(x, y: uint64): uint64 {.magic: "BitxorI", noSideEffect.}

proc `+`*(x, y: uint): uint {.magic: "AddU", noSideEffect.}
  ## Binary `+` operator for unsigned integers.
proc `+`*(x, y: uint8): uint8 {.magic: "AddU", noSideEffect.}
proc `+`*(x, y: uint16): uint16 {.magic: "AddU", noSideEffect.}
proc `+`*(x, y: uint32): uint32 {.magic: "AddU", noSideEffect.}
proc `+`*(x, y: uint64): uint64 {.magic: "AddU", noSideEffect.}

proc `-`*(x, y: uint): uint {.magic: "SubU", noSideEffect.}
  ## Binary `-` operator for unsigned integers.
proc `-`*(x, y: uint8): uint8 {.magic: "SubU", noSideEffect.}
proc `-`*(x, y: uint16): uint16 {.magic: "SubU", noSideEffect.}
proc `-`*(x, y: uint32): uint32 {.magic: "SubU", noSideEffect.}
proc `-`*(x, y: uint64): uint64 {.magic: "SubU", noSideEffect.}

proc `*`*(x, y: uint): uint {.magic: "MulU", noSideEffect.}
  ## Binary `*` operator for unsigned integers.
proc `*`*(x, y: uint8): uint8 {.magic: "MulU", noSideEffect.}
proc `*`*(x, y: uint16): uint16 {.magic: "MulU", noSideEffect.}
proc `*`*(x, y: uint32): uint32 {.magic: "MulU", noSideEffect.}
proc `*`*(x, y: uint64): uint64 {.magic: "MulU", noSideEffect.}

proc `div`*(x, y: uint): uint {.magic: "DivU", noSideEffect.}
  ## Computes the integer division for unsigned integers.
  ## This is roughly the same as ``trunc(x/y)``.
proc `div`*(x, y: uint8): uint8 {.magic: "DivU", noSideEffect.}
proc `div`*(x, y: uint16): uint16 {.magic: "DivU", noSideEffect.}
proc `div`*(x, y: uint32): uint32 {.magic: "DivU", noSideEffect.}
proc `div`*(x, y: uint64): uint64 {.magic: "DivU", noSideEffect.}

proc `mod`*(x, y: uint): uint {.magic: "ModU", noSideEffect.}
  ## Computes the integer modulo operation (remainder) for unsigned integers.
  ## This is the same as ``x - (x div y) * y``.
proc `mod`*(x, y: uint8): uint8 {.magic: "ModU", noSideEffect.}
proc `mod`*(x, y: uint16): uint16 {.magic: "ModU", noSideEffect.}
proc `mod`*(x, y: uint32): uint32 {.magic: "ModU", noSideEffect.}
proc `mod`*(x, y: uint64): uint64 {.magic: "ModU", noSideEffect.}




proc `+=`*[T: SomeInteger](x: var T, y: T) {.
  magic: "Inc", noSideEffect.}
  ## Increments an integer.

proc `+=`*[T: enum|bool](x: var T, y: T) {.
  magic: "Inc", noSideEffect, deprecated: "use `inc` instead".}
  ## **Deprecated since v0.20**: use `inc` instead.

proc `-=`*[T: SomeInteger](x: var T, y: T) {.
  magic: "Dec", noSideEffect.}
  ## Decrements an integer.

proc `-=`*[T: enum|bool](x: var T, y: T) {.
  magic: "Dec", noSideEffect, deprecated: "0.20.0, use `dec` instead".}
  ## **Deprecated since v0.20**: use `dec` instead.

proc `*=`*[T: SomeInteger](x: var T, y: T) {.
  inline, noSideEffect.} =
  ## Binary `*=` operator for integers.
  x = x * y