import 'package:dio/dio.dart';

class DioHelper {
  late Dio dio;
  DioHelper(){
    BaseOptions options=BaseOptions(
      baseUrl: "https://rickandmortyapi.com/api/",

    );
    dio=Dio(options);
  }
  Future<Response> Getdata({
    required String URL,
   Map<String, dynamic>? queryParameters //دي الداتا اللي بتبعتها لو مطلوب حاجه زي  
     })async{
      
try{
  Response response= await dio.get(URL,queryParameters: queryParameters);
  return response;
}catch(e){
  print(e.toString());
  rethrow;
}
  }
}