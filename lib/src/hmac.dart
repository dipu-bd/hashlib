// Copyright (c) 2023, Sudipto Chandra
// All rights reserved. Check LICENSE file for details.

import 'dart:convert';

import 'package:hashlib/src/algorithms/hmac.dart';
import 'package:hashlib/src/core/block_hash.dart';
import 'package:hashlib/src/core/hash_base.dart';

/// HMAC is a hash-based message authentication code that can be used to
/// simultaneously verify both the data integrity and authenticity of a message.
class HMAC extends HashBase {
  final List<int> key;
  final BlockHashBase algo;

  const HMAC(this.algo, this.key);

  @override
  HMACSink createSink() => HMACSink(algo.createSink())..init(key);
}

/// Extension on [BlockHashBase] to get an [HMAC] instance
extension HMAConBlockHashBase on BlockHashBase {
  /// Get an [HMAC] instance for this hash algorithm.
  ///
  /// HMAC is a hash-based message authentication code that can be used to
  /// simultaneously verify both the data integrity and authenticity of a message.
  HMAC hmac(List<int> key) {
    return HMAC(this, key);
  }

  /// Get an [HMAC] instance for this hash algorithm.
  ///
  /// HMAC is a hash-based message authentication code that can be used to
  /// simultaneously verify both the data integrity and authenticity of a message.
  HMAC hmacBy(String key, [Encoding? encoding]) {
    if (encoding != null) {
      return HMAC(this, encoding.encode(key));
    } else {
      return HMAC(this, key.codeUnits);
    }
  }
}
