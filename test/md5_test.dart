import 'dart:math';

import 'package:hashlib/hashlib.dart' as hashlib;
import 'package:hashlib/src/core/utils.dart';
import 'package:test/test.dart';

void main() {
  group('MD5 tests', () {
    test('from RFC doc', () {
      final data = {
        "": "d41d8cd98f00b204e9800998ecf8427e",
        "a": "0cc175b9c0f1b6a831c399e269772661",
        "abc": "900150983cd24fb0d6963f7d28e17f72",
        "message digest": "f96b697d7cb7938d525a2f31aaf161d0",
        "abcdefghijklmnopqrstuvwxyz": "c3fcd3d76192e4007dfb496cca67e13b",
        "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789":
            "d174ab98d277d9f5a5611c2c9f419d9f",
        "12345678901234567890123456789012345678901234567890123456789012345678901234567890":
            "57edf4a22be3c955ac49da2e2107b67a",
      };
      data.forEach((key, value) {
        expect(hashlib.md5(key), value);
      });
    });

    test('from Wikipedia', () {
      final data = {
        "The quick brown fox jumps over the lazy dog":
            "9e107d9d372bb6826bd81d3542a419d6",
        "The quick brown fox jumps over the lazy dog.":
            "e4d909c290d0fb1ca068ffaddf22cbd0",
      };
      data.forEach((key, value) {
        expect(hashlib.md5(key), value);
      });
    });

    test('with stream', () async {
      final data = {
        "123": "202cb962ac59075b964b07152d234b70",
        "test": "098f6bcd4621d373cade4e832627b4f6",
        'message': "78e731027d8fd50ed642340b7c9a63b3",
        "Hello World": "b10a8db164e0754105b7a99be72e3fe5",
        "fcnbqnfziebjnvbvqwwzzpdfafnvpyhkeemxxyijwuhkqyogkhdzovbvbbfguudzalavojxashfhzxrfmcjikzas":
            "6859ce201fd3ec059370d9eba4e86307",
        "fcnbqnfziebjnvbvqwwzzpdfafnvpyhkeemxxyijwuhkqyogkhdzovbvbbfguudzalavojxashfhzxrfmcjikz":
            "0e530931b1bb74c3df3a40a6854b6bf1",
        "fcnbqnfziebjnvbvqwwzzpdfafnvpyhkeemxxyijwuhkqyogkhdzovbvbbfguudzalavojxashfhzxrfmcjikzc":
            "e9227380933753a03dad1cb5d7be39bb",
        "simewkidgzgesatfyviqesladjafoclbwppqplhcwfqsbfnijiqsydxzpckbqxumulitsxzrpqhmdqhobhnhyoboijhcnulmxrhystmijucbnnnstecepnsynugxnqiqnssfbakzavpqxiyjkqjdcgvcrotocqsrlejuauleazpwnohknnuheooopltmjuqjcudewmtboqhlvgpawztiglmvxmolgzihczqcxfzebudlapnyeufbgijckqi":
            "9703e12025a2119b23a2b2da791ea44a",
      };
      for (final entry in data.entries) {
        final stream = Stream.fromIterable(
                List.generate(1 + (entry.key.length >> 3), (i) => i << 3))
            .map((e) => entry.key.substring(e, min(entry.key.length, e + 8)))
            .map(toBytes);
        final result = await hashlib.md5stream(stream);
        expect(toHexString(result), entry.value);
      }
    });

    test('with 2 random numbers', () {
      final random = Random.secure();
      for (int i = 0; i < 1000; ++i) {
        final a = random.nextInt(1000000).toString();
        final b = random.nextInt(1000000).toString();
        if (a == b) {
          expect(hashlib.md5(a), hashlib.md5(b));
        } else {
          assert(hashlib.md5(a) != hashlib.md5(b));
        }
      }
    });
  });
}
