import 'package:character_app_with_bloc/business_logic/cubit/character_cubit.dart';
import 'package:character_app_with_bloc/constants/my_colors.dart';
import 'package:character_app_with_bloc/presentation/widgets/character_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({super.key});

  @override
  State<CharacterScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharacterScreen> {
  late List allCharacters;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    BlocProvider.of<CharacterCubit>(context).getAllCharacters();
  }

  Widget buildBlocWidget() {
    return BlocBuilder<CharacterCubit, CharacterState>(
        builder: (context, state) {
      if (state is CharacterSuccess) {
        allCharacters = (state).characterList;

        return buildLoadedWidget();
      } else {
        return showLoadingIndicator();
      }
    });
  }

  Widget showLoadingIndicator() {
    return const Center(
        child: CircularProgressIndicator(
      color: MyColors.myYellow,
    ));
  }

  Widget buildLoadedWidget() {
    return SingleChildScrollView(
      child: Container(
        color: MyColors.myGrey,
        child: Column(
          children: [
            buildCharactersList(),
          ],
        ),
      ),
    );
  }

  Widget buildCharactersList() {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 3,
            crossAxisSpacing: 1,
            mainAxisSpacing: 1),
        itemCount: allCharacters.length,
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.zero,
        // scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return CharacterItem(
            character: allCharacters[index],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.myYellow,
        title: const Text(
          "Characters",
          style: TextStyle(color: MyColors.myGrey),
        ),
      ),
      body: buildBlocWidget(),
    );
  }
}
