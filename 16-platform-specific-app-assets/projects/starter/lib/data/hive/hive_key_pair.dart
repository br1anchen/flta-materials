import 'package:hive/hive.dart';
import 'package:webcrypto/webcrypto.dart';

part 'hive_key_pair.g.dart';

@HiveType(typeId: 2)
class HiveKeyPair extends HiveObject {
  @HiveField(0)
  final Map<String, dynamic> privateJsonWebKey;

  @HiveField(1)
  final Map<String, dynamic> publicJsonWebKey;

  HiveKeyPair(
      {required this.privateJsonWebKey, required this.publicJsonWebKey});

  static Future<HiveKeyPair> generateKeyPair() async {
    final keyPair = await RsaOaepPrivateKey.generateKey(
        2048, BigInt.parse('65537'), Hash.sha256);
    return HiveKeyPair(
        privateJsonWebKey: await keyPair.privateKey.exportJsonWebKey(),
        publicJsonWebKey: await keyPair.publicKey.exportJsonWebKey());
  }

  Future<RsaOaepPrivateKey> getPrivateKey() {
    return RsaOaepPrivateKey.importJsonWebKey(privateJsonWebKey, Hash.sha256);
  }

  Future<RsaOaepPublicKey> getPublicKey() {
    return RsaOaepPublicKey.importJsonWebKey(publicJsonWebKey, Hash.sha256);
  }
}
