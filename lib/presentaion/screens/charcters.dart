import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_project/Business_logic/Cubit/character_states.dart';
import 'package:my_flutter_project/Business_logic/Cubit/charchters_Cubit.dart';
import 'package:my_flutter_project/constants/colors.dart';
import 'package:my_flutter_project/data/models/characters.dart';
import 'package:my_flutter_project/presentaion/Widgets/charcttersGridview.dart';

class Charcters extends StatefulWidget {
  const Charcters({super.key});
  @override
  State<Charcters> createState() => _CharctersState();
}

class _CharctersState extends State<Charcters> {
  @override
  late List<Results> allcharacters;
  late List<Results> ListofSearchedchrcters = [];
  TextEditingController searchCharcter = TextEditingController();
  bool _isSearching = false;
  void clearsearch() {
    setState(() {
      searchCharcter.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Mycolor.myGrey,
      appBar: AppBar(
        actions: [BuildAppbarAction()],
        backgroundColor: Mycolor.myYellow,
        title: Center(
            child: _isSearching
                ? BuildTexfild()
                : Center(
                    child: Text("charcters"),
                  )),
      ),
      body: BlocBuilder<CharchtersCubit, CharacterStates>(
        builder: (context, state) {
          if (state is CharacterLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CharacterLoadedState) {
            if (state.characters != null) {
              allcharacters = state.characters;
              return CharactersGridView(
                  allcharacters:
                      _isSearching ? ListofSearchedchrcters : allcharacters);
            } else {
              return Center(
                child: Text("no xharecter found"),
              );
            }
          } else if (state is CharacterErrorState) {
            return Center(
              child: Text(state.error),
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget BuildTexfild() {
    return TextField(
      cursorColor: Mycolor.myGrey,
      cursorHeight: 17,
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Find Charcter...",
          hintStyle: TextStyle(
            color: Mycolor.myGrey,
            fontSize: 16,
          )),
      style: TextStyle(
        color: Mycolor.myGrey,
        fontSize: 16,
      ),
      controller: searchCharcter,
      onChanged: (searchCharcter) {
        ListofSearchedchrcters = BlocProvider.of<CharchtersCubit>(context)
            .AddSearchedCharcterTolist(searchCharcter);
        setState(() {});
      },
    );
  }

  Widget BuildAppbarAction() {
    return _isSearching
        ? IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {
              _isSearching = false;
              setState(() {});
            },
          )
        : IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              clearsearch();

              setState(() {
                _isSearching = true;
              });
            });
  }
}
