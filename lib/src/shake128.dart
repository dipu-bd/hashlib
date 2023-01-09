// Copyright (c) 2023, Sudipto Chandra
// All rights reserved. Check LICENSE file for details.

import 'dart:convert';

import 'package:hashlib/src/algorithms/sha3.dart';
import 'package:hashlib/src/core/hash_base.dart';
import 'package:hashlib/src/core/hash_digest.dart';

/// SHAKE-128 is a member of SHA-3 family which uses 128-bit blocks to
/// generate a message digest of arbitrary length.
///
/// SHA-3 is a subset of Keccak cryptographic family, standardized by NIST
/// on 2015 to substitute SHA-2 if necessary. Since the algorithm uses the
/// [sponge construction][sponge], it can generate any arbitrary length of
/// message digest. This implementation generates a arbitrary length output
/// using the [standard SHA-3 algorithm][fips202].
///
/// [sponge]: https://en.wikipedia.org/wiki/Sponge_function
/// [fips202]: https://csrc.nist.gov/publications/detail/fips/202/final
///
/// **WARNING**: Not supported in Web
class Shake128 extends HashBase {
  final int outputSizeInBytes;

  const Shake128([this.outputSizeInBytes = 32]);

  @override
  Shake128Hash startChunkedConversion([Sink<HashDigest>? sink]) =>
      Shake128Hash(outputSizeInBytes);
}

/// Generates a SHAKE-128 checksum of arbitrary length
String shake128sum(
  String input,
  int outputSizeInBytes, [
  Encoding? encoding,
  bool uppercase = false,
]) {
  return Shake128(outputSizeInBytes).string(input, encoding).hex(uppercase);
}