# Benchmarks

Libraries:

- **Hashlib** : https://pub.dev/packages/hashlib
- **Crypto** : https://pub.dev/packages/crypto
- **PointyCastle** : https://pub.dev/packages/pointycastle
- **Hash** : https://pub.dev/packages/hash

With string of length 10 (100000 iterations):

| Algorithms    | `hashlib`     | `crypto`                     | `hash`                      | `PointyCastle`                 |
| ------------- | ------------- | ---------------------------- | --------------------------- | ------------------------------ |
| XXH64         | **68.20MB/s** | ➖                           | ➖                          | ➖                             |
| XXH3          | **8.61MB/s**  | ➖                           | ➖                          | ➖                             |
| MD5           | **22.80MB/s** | 10.07MB/s <br> `127% slower` | 7.46MB/s <br> `205% slower` | 10.99MB/s <br> `107% slower`   |
| SHA-1         | **16.18MB/s** | 8.51MB/s <br> `90% slower`   | 4.69MB/s <br> `245% slower` | 7.27MB/s <br> `122% slower`    |
| SHA-224       | **12.05MB/s** | 7.41MB/s <br> `63% slower`   | 2.59MB/s <br> `365% slower` | 3.05MB/s <br> `295% slower`    |
| SHA-256       | **12.27MB/s** | 7.47MB/s <br> `64% slower`   | 2.63MB/s <br> `366% slower` | 3.06MB/s <br> `301% slower`    |
| SHA-384       | **9.31MB/s**  | 3.00MB/s <br> `210% slower`  | 1.37MB/s <br> `581% slower` | 386.43KB/s <br> `2309% slower` |
| SHA-512       | **9.33MB/s**  | 2.97MB/s <br> `214% slower`  | 1.38MB/s <br> `578% slower` | 383.06KB/s <br> `2336% slower` |
| SHA-512/224   | **9.34MB/s**  | 3.01MB/s <br> `211% slower`  | ➖                          | 194.97KB/s <br> `4692% slower` |
| SHA-512/256   | **9.27MB/s**  | 3.03MB/s <br> `206% slower`  | ➖                          | 194.85KB/s <br> `4656% slower` |
| SHA3-256      | **12.17MB/s** | ➖                           | ➖                          | 224.11KB/s <br> `5331% slower` |
| SHA3-512      | **9.25MB/s**  | ➖                           | ➖                          | 221.98KB/s <br> `4068% slower` |
| BLAKE-2s      | **14.86MB/s** | ➖                           | ➖                          | ➖                             |
| BLAKE-2b      | **12.60MB/s** | ➖                           | ➖                          | 845.22KB/s <br> `1391% slower` |
| HMAC(MD5)     | **4.78MB/s**  | 3.74MB/s <br> `28% slower`   | 1.96MB/s <br> `145% slower` | ➖                             |
| HMAC(SHA-256) | **1.87MB/s**  | 1.61MB/s <br> `16% slower`   | ➖                          | ➖                             |

With string of length 1000 (5000 iterations):

| Algorithms    | `hashlib`      | `crypto`                     | `hash`                       | `PointyCastle`                |
| ------------- | -------------- | ---------------------------- | ---------------------------- | ----------------------------- |
| XXH64         | **441.19MB/s** | ➖                           | ➖                           | ➖                            |
| XXH3          | **106.73MB/s** | ➖                           | ➖                           | ➖                            |
| MD5           | **152.95MB/s** | 114.36MB/s <br> `34% slower` | 90.60MB/s <br> `69% slower`  | 78.31MB/s <br> `95% slower`   |
| SHA-1         | **140.83MB/s** | 92.62MB/s <br> `52% slower`  | 44.99MB/s <br> `213% slower` | 53.71MB/s <br> `162% slower`  |
| SHA-224       | **94.27MB/s**  | 78.74MB/s <br> `20% slower`  | 20.29MB/s <br> `365% slower` | 20.86MB/s <br> `352% slower`  |
| SHA-256       | **95.06MB/s**  | 78.81MB/s <br> `21% slower`  | 20.39MB/s <br> `366% slower` | 20.79MB/s <br> `357% slower`  |
| SHA-384       | **143.83MB/s** | 47.49MB/s <br> `203% slower` | 21.01MB/s <br> `584% slower` | 4.99MB/s <br> `2781% slower`  |
| SHA-512       | **145.61MB/s** | 47.38MB/s <br> `207% slower` | 20.86MB/s <br> `598% slower` | 4.97MB/s <br> `2831% slower`  |
| SHA-512/224   | **146.08MB/s** | 47.21MB/s <br> `209% slower` | ➖                           | 4.43MB/s <br> `3195% slower`  |
| SHA-512/256   | **148.26MB/s** | 47.00MB/s <br> `215% slower` | ➖                           | 4.44MB/s <br> `3243% slower`  |
| SHA3-256      | **95.72MB/s**  | ➖                           | ➖                           | 2.94MB/s <br> `3152% slower`  |
| SHA3-512      | **143.76MB/s** | ➖                           | ➖                           | 1.69MB/s <br> `8430% slower`  |
| BLAKE-2s      | **135.26MB/s** | ➖                           | ➖                           | ➖                            |
| BLAKE-2b      | **153.19MB/s** | ➖                           | ➖                           | 11.77MB/s <br> `1201% slower` |
| HMAC(MD5)     | **122.17MB/s** | 93.32MB/s <br> `31% slower`  | 67.87MB/s <br> `80% slower`  | ➖                            |
| HMAC(SHA-256) | **66.17MB/s**  | 55.79MB/s <br> `19% slower`  | ➖                           | ➖                            |

With string of length 500000 (10 iterations):

| Algorithms    | `hashlib`      | `crypto`                     | `hash`                       | `PointyCastle`                |
| ------------- | -------------- | ---------------------------- | ---------------------------- | ----------------------------- |
| XXH64         | **478.46MB/s** | ➖                           | ➖                           | ➖                            |
| XXH3          | **118.07MB/s** | ➖                           | ➖                           | ➖                            |
| MD5           | **160.08MB/s** | 119.61MB/s <br> `34% slower` | 69.30MB/s <br> `131% slower` | 82.72MB/s <br> `94% slower`   |
| SHA-1         | **152.65MB/s** | 95.88MB/s <br> `59% slower`  | 39.81MB/s <br> `283% slower` | 56.64MB/s <br> `170% slower`  |
| SHA-224       | **100.19MB/s** | 83.20MB/s <br> `20% slower`  | 19.47MB/s <br> `415% slower` | 21.54MB/s <br> `365% slower`  |
| SHA-256       | **100.34MB/s** | 84.02MB/s <br> `19% slower`  | 19.58MB/s <br> `412% slower` | 21.53MB/s <br> `366% slower`  |
| SHA-384       | **160.22MB/s** | 49.44MB/s <br> `224% slower` | 17.75MB/s <br> `803% slower` | 5.18MB/s <br> `2992% slower`  |
| SHA-512       | **160.45MB/s** | 49.45MB/s <br> `224% slower` | 17.63MB/s <br> `810% slower` | 5.18MB/s <br> `2995% slower`  |
| SHA-512/224   | **159.81MB/s** | 49.18MB/s <br> `225% slower` | ➖                           | 5.19MB/s <br> `2981% slower`  |
| SHA-512/256   | **158.64MB/s** | 49.02MB/s <br> `224% slower` | ➖                           | 5.11MB/s <br> `3005% slower`  |
| SHA3-256      | **100.69MB/s** | ➖                           | ➖                           | 3.20MB/s <br> `3043% slower`  |
| SHA3-512      | **160.69MB/s** | ➖                           | ➖                           | 1.71MB/s <br> `9308% slower`  |
| BLAKE-2s      | **143.60MB/s** | ➖                           | ➖                           | ➖                            |
| BLAKE-2b      | **164.93MB/s** | ➖                           | ➖                           | 12.42MB/s <br> `1228% slower` |
| HMAC(MD5)     | **159.29MB/s** | 120.42MB/s <br> `32% slower` | 68.40MB/s <br> `133% slower` | ➖                            |
| HMAC(SHA-256) | **100.23MB/s** | 83.31MB/s <br> `20% slower`  | ➖                           | ➖                            |

Argon2 benchmarks on different security parameters:

| Algorithms | test     | little   | moderate  | good       | strong      |
| ---------- | -------- | -------- | --------- | ---------- | ----------- |
| argon2i    | 0.377 ms | 2.732 ms | 16.251 ms | 204.234 ms | 2443.906 ms |
| argon2d    | 0.295 ms | 2.714 ms | 24.165 ms | 208.607 ms | 2420.881 ms |
| argon2id   | 0.312 ms | 2.538 ms | 16.764 ms | 211.54 ms  | 3959.699 ms |
