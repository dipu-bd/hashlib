// Copyright (c) 2021, Sudipto Chandra
// All rights reserved. Check LICENSE file for details.

import 'package:benchmark/benchmark.dart';
import 'package:crypto/crypto.dart' as crypto;
import 'package:hashlib/hashlib.dart' as hashlib;

void main() {
  group("MD5 benchmark", () {
    group("A string of length 17", () {
      final input = List<int>.generate(17, (i) => i);
      benchmark('crypto.md5()', () {
        crypto.md5.convert(input).bytes;
      }, iterations: 1000);
      benchmark('hashlib.md5()', () {
        hashlib.md5buffer(input);
      }, iterations: 1000);
    });
    group("A string of length 1777", () {
      final input = List<int>.generate(1777, (i) => i);
      benchmark('crypto.md5()', () {
        crypto.md5.convert(input).bytes;
      }, iterations: 50);
      benchmark('hashlib.md5()', () {
        hashlib.md5buffer(input);
      }, iterations: 50);
    });
    group("A string of length 111k", () {
      final input = List<int>.generate(111 * 1000, (i) => i);
      benchmark('crypto.md5()', () {
        crypto.md5.convert(input).bytes;
      }, iterations: 1);
      benchmark('hashlib.md5()', () {
        hashlib.md5buffer(input);
      }, iterations: 1);
    });
  });
}
