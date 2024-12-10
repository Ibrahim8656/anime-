
import 'dart:math';
import 'package:dio/dio.dart';
import 'package:my_flutter_project/data/models/characters.dart';
class CharactrersWebServicese {
 late Dio dio;
 CharactrersWebServicese(){
   BaseOptions options= BaseOptions(
    baseUrl:"https://rickandmortyapi.com/api/",
    receiveDataWhenStatusError: true,
    
    );
    dio=Dio(options);
 }
   Future <Map<String,dynamic>>  GetAllCharcters()async{
  try{
      Response response= await dio.get("character");
  
  return response.data;
  
  }catch(e){
    print(e.toString());
    return {};
  }

  
 }
}