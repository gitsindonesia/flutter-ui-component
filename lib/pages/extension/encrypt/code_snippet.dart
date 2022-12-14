String codeSnippetEncryptExtension = '''import 'package:encrypt/encrypt.dart';

extension EncryptExtension on String {
  String encrypt(String secretKey) {
    final key = Key.fromUtf8(secretKey);
    final iv = IV.fromLength(16);
    final encrypter = Encrypter(AES(key, mode: AESMode.ctr, padding: null));

    final encrypted = encrypter.encrypt(this, iv: iv);
    return encrypted.base64;
  }

  String decrypt(String secretKey) {
    final key = Key.fromUtf8(secretKey);
    final iv = IV.fromLength(16);
    final encrypter = Encrypter(AES(key, mode: AESMode.ctr, padding: null));

    final encrypted = Encrypted.fromBase64(this);
    return encrypter.decrypt(encrypted, iv: iv);
  }
}
''';
