import 'package:character_app_with_bloc/business_logic/cubit/character_cubit.dart';
import 'package:character_app_with_bloc/constants/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/character_model.dart';
import '../widgets/character_item.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({super.key});

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  late List<CharacterModel> allCharacters;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    allCharacters =
        BlocProvider.of<CharacterCubit>(context).getAllCharacters();
  }

  Widget buildBlocWidget() {
    return BlocBuilder<CharacterCubit, CharacterState>(
      builder: (context, state) {
        if (state is CharacterLoading) {
          return showLoadingIndicator();
        }
        if (state is CharacterSuccess) {
          allCharacters = state.characterList;
          return buildLoadedListWidget();
        }
        else {
          debugPrint(state.toString());
          return const SnackBar(content: Text("SORRY, THERE WAS AN ERROR. PLEASE CONTACT THE DEVELOPER."));
        }
      },
    );
  }

  Widget buildLoadedListWidget() {
    return SingleChildScrollView(
      child: Container(
        color: MyColors.myGrey,
        child: Column(
          children: [
            buildCharacterList(),
          ],
        ),
      ),
    );
  }

  Widget buildCharacterList() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsetsDirectional.zero,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
         childAspectRatio: 2/3, crossAxisCount: 2, mainAxisSpacing: 1, crossAxisSpacing: 1,),
      itemBuilder: (context, index) {
        return CharacterItem(character: allCharacters[index]);
      },
      itemCount: allCharacters.length,
    );
  }

  Widget showLoadingIndicator() {
    return const Center(
      child: CircularProgressIndicator(
        color: MyColors.myYellow,
      ),
    );
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
