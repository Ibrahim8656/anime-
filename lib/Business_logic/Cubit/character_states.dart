

import 'package:my_flutter_project/data/models/characters.dart';
abstract class CharacterStates {}
class CharacterInitialState extends CharacterStates {}
class CharacterLoadingState extends CharacterStates {}
class CharacterLoadedState extends CharacterStates {
  final List<Results> characters;

  CharacterLoadedState(this.characters);
}

// حالة الخطأ، تظهر عندما يحدث خطأ أثناء تحميل البيانات
class CharacterErrorState extends CharacterStates {
  final String error;

  CharacterErrorState(this.error);
}
