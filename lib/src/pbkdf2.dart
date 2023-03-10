// Copyright (c) 2023, Sudipto Chandra
// All rights reserved. Check LICENSE file for details.

import 'package:hashlib/hashlib.dart';
import 'package:hashlib/src/algorithms/hmac.dart';
import 'package:hashlib/src/core/block_hash.dart';
import 'package:hashlib/src/core/hash_digest.dart';
import 'package:hashlib/src/core/mac_base.dart';

export 'package:hashlib/src/algorithms/pbkdf2.dart' show PBKDF2;

/// Extension on [BlockHashBase] to get an [PBKDF2] instance
extension PBKDF2onBlockHashBase on BlockHashBase {
  /// Get an [PBKDF2] instance that uses this hash function for key derivation.
  HashDigest pbkdf2(
    List<int> password,
    List<int> salt,
    int iterations, {
    int? keyLength,
  }) {
    return PBKDF2
        .sink(
          HMACSink(createSink()),
          salt,
          iterations,
          keyLength: keyLength,
        )
        .convert(password);
  }
}

/// Extension to the HashBase to get an [PBKDF2] instance
extension PBKDF2onHMAC on MACHashBase {
  /// Get an [PBKDF2] instance that uses this hash function for key derivation.
  HashDigest pbkdf2(
    List<int> salt,
    int iterations, {
    int? length,
  }) {
    return PBKDF2(
      this,
      salt,
      iterations,
      keyLength: length,
    ).convert();
  }
}
