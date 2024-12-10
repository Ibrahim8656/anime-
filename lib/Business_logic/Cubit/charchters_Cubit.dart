import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_project/Business_logic/Cubit/character_states.dart';
import 'package:my_flutter_project/data/models/characters.dart';
import 'package:my_flutter_project/data/reposetory/charcters_reposetory.dart';

class CharchtersCubit extends Cubit<CharacterStates>{
  final CharctersReposetory charctersReposetory;
 CharchtersCubit(this.charctersReposetory) : super(CharacterInitialState());
  List<Results>? character;
   late List<Results> ListofSearchedchrcters=[];
  Future<void>GetAllCharcters()async{ 
   try{
    character=await charctersReposetory.GetAllCharcters() ;
    emit(CharacterLoadedState(character!));

   }catch(e){
    emit(CharacterErrorState(e.toString()));
    print(e.toString());
   }
    
  }
    List<Results> AddSearchedCharcterTolist(String _searchCharcter){
    ListofSearchedchrcters=character!.where((charcter)=>charcter.name!.toLowerCase().startsWith(_searchCharcter)).toList();
     
   return ListofSearchedchrcters;
  }
  
}