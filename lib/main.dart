import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_project/Business_logic/Cubit/character_states.dart';
import 'package:my_flutter_project/Business_logic/Cubit/charchters_Cubit.dart';
import 'package:my_flutter_project/data/reposetory/charcters_reposetory.dart';
import 'package:my_flutter_project/data/web_services/charactrers_web_servicese.dart';
import 'package:my_flutter_project/presentaion/screens/charcters.dart';

void main(){
runApp(Myapp());

}
class Myapp extends StatelessWidget{
  final CharctersReposetory charctersReposetory = CharctersReposetory(CharactrersWebServicese());
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
    home: BlocProvider(create: (BuildContext context)=>CharchtersCubit(charctersReposetory)..GetAllCharcters(),
    child: Charcters(),),
    debugShowCheckedModeBanner: false,
   );
  }
  
}