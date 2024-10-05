// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:rick_and_morty/business_logic/cubit/characters_cubit.dart';
import 'package:rick_and_morty/constants/colors.dart';
import 'package:rick_and_morty/data/models/character.dart';
import 'package:rick_and_morty/presentation/widgets/character_item.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late List<Character> allCharacters;
  late List<Character> filteredCharacters;
  bool isSearching = false;
  final searchTextController = TextEditingController();

  @override
  void initState() {
    BlocProvider.of<CharactersCubit>(context).getAllCharacters();
    super.initState();
  }

  Widget buildSearchField() {
    return TextField(
      controller: searchTextController,
      cursorColor: MyColors.myBlue,
      decoration: InputDecoration(
        hintText: 'Search Characters',
        hintStyle: TextStyle(color: MyColors.myBlue, fontSize: 18),
        border: InputBorder.none,
      ),
      style: TextStyle(color: MyColors.myBlue, fontSize: 18),
      onChanged: (filter) {
        addFilteredToFilteredCharacters(filter);
      },
    );
  }

  void addFilteredToFilteredCharacters(String filter) {
    filteredCharacters = allCharacters
        .where(
          (character) => character.name.toLowerCase().startsWith(filter),
        )
        .toList();
    setState(() {});
  }

  void startSearch() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: stopSearch));
    setState(() {
      isSearching = true;
    });
  }

  void stopSearch() {
    clearSearch();
    setState(() {
      isSearching = false;
    });
  }

  void clearSearch() {
    setState(() {
      searchTextController.clear();
    });
  }

  Widget buildBlocWidget() {
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        if (state is CharactersLoaded) {
          allCharacters = state.characters;
          return buildList();
        } else {
          return showLoadingIndicator();
        }
      },
    );
  }

  Widget showLoadingIndicator() {
    return Center(
      child: Image.asset('assets/images/loading.gif'),
    );
  }

  Widget buildList() {
    return Container(
      color: MyColors.myBlue,
      child: buildListItems(),
    );
  }

  Widget buildListItems() {
    return GridView.builder(
      itemCount: searchTextController.text.isEmpty
          ? allCharacters.length
          : filteredCharacters.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        mainAxisSpacing: 1,
        crossAxisSpacing: 1,
      ),
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return CharacterItem(
            character: searchTextController.text.isEmpty
                ? allCharacters[index]
                : filteredCharacters[index]);
      },
    );
  }

  List<Widget> buildAppBarActions() {
    if (isSearching) {
      return [
        IconButton(
          onPressed: () {
            clearSearch();
            Navigator.pop(context);
          },
          icon: Icon(Icons.clear),
        )
      ];
    } else {
      return [
        IconButton(
          onPressed: startSearch,
          icon: Icon(
            Icons.search,
          ),
        )
      ];
    }
  }

  Widget buildAppBarTitle() {
    if (isSearching) {
      return buildSearchField();
    } else {
      return Text(
        'Characters',
        style: TextStyle(fontWeight: FontWeight.w500),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myBlue,
      appBar: AppBar(
        backgroundColor: MyColors.myGreen,
        title: buildAppBarTitle(),
        actions: buildAppBarActions(),
      ),
      body: OfflineBuilder(
        connectivityBuilder: (context, connectivity, child) {
          final bool connected =
              !connectivity.contains(ConnectivityResult.none);

          if (connected) {
            return buildBlocWidget();
          } else {
            return buildNoInternetWidge();
          }
        },
        child: Container(),
      ),
    );
  }

  Widget buildNoInternetWidge() {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Image.asset('assets/images/no_internet.png'),
          Text(
            'Can\'t connect to the internet.\nCheck your internet connection.',
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
