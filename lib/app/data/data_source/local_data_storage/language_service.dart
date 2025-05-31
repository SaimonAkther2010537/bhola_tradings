import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LanguageService extends GetxService {
  final GetStorage _storage = GetStorage();
  final String _languageKey = "selected_language";
  var selectedLanguage = "en".obs;

  @override
  void onInit() {
    super.onInit();
    loadLanguage();
  }

  void saveLanguage(String languageCode) {
    _storage.write(_languageKey, languageCode);
    selectedLanguage.value = languageCode;
  }

  void loadLanguage() {
    selectedLanguage.value = _storage.read<String>(_languageKey) ?? "en";
  }
}
