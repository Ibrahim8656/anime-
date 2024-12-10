import 'package:my_flutter_project/data/models/characters.dart';
import 'package:my_flutter_project/data/web_services/charactrers_web_servicese.dart';
import 'package:my_flutter_project/presentaion/screens/charcters.dart';

class CharctersReposetory {
  final CharactrersWebServicese charactrersWebServicese;

  CharctersReposetory(this.charactrersWebServicese);

Future <List<Results>?>  GetAllCharcters()async{
  final Charcters=await charactrersWebServicese.GetAllCharcters();
  Charactersmodel charactersmodel=Charactersmodel.fromJson(Charcters);
  return charactersmodel.results;
  
}
}