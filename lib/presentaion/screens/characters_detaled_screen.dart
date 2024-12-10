import 'package:flutter/material.dart';
import 'package:my_flutter_project/constants/colors.dart';
import 'package:my_flutter_project/data/models/characters.dart';

class CharactersDetaled extends StatelessWidget {
  const CharactersDetaled({super.key, required this.charcters});
  final Results charcters;
  BuildSliverAppbar() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(charcters.name!),
        background: Hero(
          tag: charcters,
          child: Image.network(
            charcters.image!,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget charctersInfo(String title, String value) {
    return RichText(
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(children: [
          TextSpan(
              text: title,
              style: TextStyle(
                color: Mycolor.myWhite,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              )),
          TextSpan(
              text: value,
              style: TextStyle(
                color: Mycolor.myWhite,
                fontSize: 16,
              ))
        ]));
  }
  Widget     BuildDiveider(double endIndent){
    return Divider(
      height: 30,
      endIndent: endIndent,
      color: Mycolor.myYellow,
      thickness: 2,
    );
  }
  @override
  Widget build(BuildContext context) {
    return charcters != null
        ? Scaffold(
            backgroundColor: Mycolor.myGrey,
            body: CustomScrollView(
              slivers: [
                BuildSliverAppbar(),
                SliverList(
                  delegate: SliverChildListDelegate([
                    Container(
                      height: 580,
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.fromLTRB(15, 15, 15, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          
                    charctersInfo("Job :",charcters.location!.name!),
                    BuildDiveider(420),charctersInfo("Status :",charcters.status!),
                    BuildDiveider(400),charctersInfo("species :",charcters.species!),
                    BuildDiveider(390),
                        ],
                      ),
                    )
                  ]),
                ),
              ],
            ),
          )
        : Scaffold(
            body: Center(
              child: Text("nodeatails"),
            ),
          );
  }
}
