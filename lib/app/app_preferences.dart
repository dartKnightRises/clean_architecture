
import 'package:clean_architecture/presentation/resources/language_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String PREFS_KEY_LANG = "PREFS_KEY_LANG";

class AppPreferences {
  SharedPreferences sharedPreferences;
  AppPreferences(this.sharedPreferences);
  
  Future<String> getAppLanguage() async{
    String? language = sharedPreferences.getString(PREFS_KEY_LANG);

    if(language!.isNotEmpty){
      return language;
    }else{
      return LanguageType.ENGLISH.getValue();
    }

  }
}