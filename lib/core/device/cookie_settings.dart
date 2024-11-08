abstract class CookieSettings {
  bool? get isPersonalizedAdvertisementEnabled;

  Future<void> updatePersonalizedAdvertisementEnabled(bool isEnabled);
}
