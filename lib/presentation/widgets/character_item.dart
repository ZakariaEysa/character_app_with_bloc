import '../../constants/strings.dart';
import '../../data/models/character_model.dart';
import 'package:flutter/material.dart';
import '../../constants/my_colors.dart';

class CharacterItem extends StatelessWidget {
  // final Characters characters;

  const CharacterItem({super.key, required this.character});

  final  CharacterModel character;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: const EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: (){

          Navigator.pushNamed(context, characterDetailsScreen, arguments: character);


        },
        child: Hero(
          tag: character.id,
          child: GridTile(
            footer: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              color: Colors.black54,
              alignment: Alignment.bottomCenter,
              child: Text(
                character.name,
                style: const TextStyle(
                  height: 1.3,
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.left,
              ),
            ),
            child: Container(
                color: MyColors.myGrey,
                child: character.image.isNotEmpty
                    ? FadeInImage.assetNetwork(
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: 'assets/images/Loading3.gif',
                    image: character.image)
                    : Image.asset('assets/images/place_holder.png')),
          ),
        ),
      ),
    );
  }
}
