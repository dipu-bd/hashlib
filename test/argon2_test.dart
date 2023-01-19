import 'package:hashlib/src/algorithms/argon2.dart';
import 'package:test/test.dart';

/// Test cases generated by https://argon2.online/

void main() {
  group('Argon2 v19 test', () {
    test("argon2i m=16, t=2, p=1 @ out = 16", () {
      final argon2 = Argon2Context(
        version: Argon2Version.v13,
        hashType: Argon2Type.argon2i,
        hashLength: 16,
        iterations: 2,
        parallelism: 1,
        memorySizeKB: 16,
        salt: "some salt".codeUnits,
      ).toInstance();
      final matcher = "bb5794ea66451b8fce3a84dd02d33949";
      expect(argon2.encode('password'.codeUnits).hex(), matcher);
    }, tags: 'skip-js');
    test("argon2d m=16, t=2, p=1 @ out = 16", () {
      final argon2 = Argon2Context(
        version: Argon2Version.v13,
        hashType: Argon2Type.argon2d,
        hashLength: 16,
        iterations: 2,
        parallelism: 1,
        memorySizeKB: 16,
        salt: "some salt".codeUnits,
      ).toInstance();
      final matcher = "cf916880b91ba8a1390fff6b624baa27";
      expect(argon2.encode('password'.codeUnits).hex(), matcher);
    }, tags: 'skip-js');
    test("argon2id m=16, t=2, p=1 @ out = 16", () {
      final argon2 = Argon2Context(
        version: Argon2Version.v13,
        hashType: Argon2Type.argon2id,
        hashLength: 16,
        iterations: 2,
        parallelism: 1,
        memorySizeKB: 16,
        salt: "some salt".codeUnits,
      ).toInstance();
      final matcher = "88c91661b3cea3c3853593608881f324";
      expect(argon2.encode('password'.codeUnits).hex(), matcher);
    }, tags: 'skip-js');

    test("argon2i m=8192, t=8, p=4 @ out = 32", () {
      final argon2 = Argon2Context(
        version: Argon2Version.v13,
        hashType: Argon2Type.argon2i,
        hashLength: 32,
        iterations: 8,
        parallelism: 4,
        memorySizeKB: 8192,
        salt: "some salt".codeUnits,
      ).toInstance();
      final matcher =
          "d09d33fca16b25523bab27eb9a6970893d5717ccab42c0dcf6b270c5c360431e";
      expect(argon2.encode('password'.codeUnits).hex(), matcher);
    }, tags: 'skip-js');
    test("argon2d m=8192, t=8, p=4 @ out = 32", () {
      final argon2 = Argon2Context(
        version: Argon2Version.v13,
        hashType: Argon2Type.argon2d,
        hashLength: 32,
        iterations: 8,
        parallelism: 4,
        memorySizeKB: 8192,
        salt: "some salt".codeUnits,
      ).toInstance();
      final matcher =
          "8ba5f2da1bc2aec3d29187c3c5b5ea450b38fba2795c997b0bc473d02faed017";
      expect(argon2.encode('password'.codeUnits).hex(), matcher);
    }, tags: 'skip-js');
    test("argon2id m=8192, t=8, p=4 @ out = 32", () {
      final argon2 = Argon2Context(
        version: Argon2Version.v13,
        hashType: Argon2Type.argon2id,
        hashLength: 32,
        iterations: 8,
        parallelism: 4,
        memorySizeKB: 8192,
        salt: "some salt".codeUnits,
      ).toInstance();
      final matcher =
          "7cfe6b4ffb846d67f1c5b5917d759ea75c1ac7b31a1e4200e9adf9f4b1c0523d";
      expect(argon2.encode('password'.codeUnits).hex(), matcher);
    }, tags: 'skip-js');

    test("multiple call with same instance", () {
      final argon2 = Argon2Context(
        version: Argon2Version.v13,
        hashType: Argon2Type.argon2i,
        hashLength: 16,
        iterations: 2,
        parallelism: 1,
        memorySizeKB: 16,
        salt: "some salt".codeUnits,
      ).toInstance();
      final matcher = "bb5794ea66451b8fce3a84dd02d33949";
      expect(argon2.encode('password'.codeUnits).hex(), matcher);
      expect(argon2.encode('password'.codeUnits).hex(), matcher);
      expect(argon2.encode('password'.codeUnits).hex(), matcher);
    }, tags: 'skip-js');
  });
}
