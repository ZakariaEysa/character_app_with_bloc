import 'package:animated_text_kit/animated_text_kit.dart';
import '../../constants/my_colors.dart';
import '../../data/models/character_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/cubit/character_cubit.dart';

class CharacterDetailsScreen extends StatefulWidget {
  final CharacterModel character;
  const CharacterDetailsScreen({super.key, required this.character});

  @override
  State<CharacterDetailsScreen> createState() => _CharacterDetailsScreenState();
}

class _CharacterDetailsScreenState extends State<CharacterDetailsScreen> {
  @override
  initState() {
    super.initState();

    BlocProvider.of<CharacterCubit>(context).getQuotes();
  }

  Widget buildCharacterInfo(String title, String value) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
        text: title,
        style: const TextStyle(
            color: MyColors.myWhite, fontWeight: FontWeight.bold, fontSize: 18),
      ),
      TextSpan(
        text: value,
        style: const TextStyle(color: MyColors.myWhite, fontSize: 16),
      ),
    ]));
  }

  Widget buildDivider({required double endIndent}) {
    return Divider(
      height: 30,
      endIndent: endIndent,
      color: MyColors.myYellow,
    );
  }

  Widget buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: MyColors.myGrey,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          widget.character.name,
          style: const TextStyle(color: MyColors.myWhite),
        ),
        background: Hero(
          tag: widget.character.id,
          child: Image.network(
            widget.character.image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget showLoadingIndicator() {
    return const Center(
        child: CircularProgressIndicator(
      color: MyColors.myYellow,
    ));
  }

  Widget checkIfQuotesAreLoaded(CharacterState state) {
    if (state is QuotLoaded) {
      return displayQuote(state);
    } else {
      return showLoadingIndicator();
    }
  }

  Widget displayQuote(state) {
    if (state.quote != null) {
      return Center(
        child: DefaultTextStyle(
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: MyColors.myWhite,
              fontSize: 20,
              shadows: [
                Shadow(
                    color: MyColors.myYellow,
                    offset: Offset(0, 0),
                    blurRadius: 7),
              ],
            ),
            child: AnimatedTextKit(
              repeatForever: true,
              animatedTexts: [FlickerAnimatedText(state.quote.quote)],
            )),
      );
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myGrey,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              padding: const EdgeInsetsDirectional.all(8),
              margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  buildCharacterInfo('name : ', widget.character.name),
                  buildDivider(endIndent: 313),
                  buildCharacterInfo('status  : ', widget.character.status),
                  buildDivider(endIndent: 315),
                  buildCharacterInfo('species : ', widget.character.species),
                  buildDivider(endIndent: 300),
                  buildCharacterInfo('gender : ', widget.character.gender),
                  buildDivider(endIndent: 300),
                  const SizedBox(
                    height: 20,
                  ),
                  BlocBuilder<CharacterCubit, CharacterState>(
                    builder: (context, state) => checkIfQuotesAreLoaded(state),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 700,
            ),
          ])),
        ],
      ),
    );
  }
}
