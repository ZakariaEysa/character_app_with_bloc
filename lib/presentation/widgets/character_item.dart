import 'package:character_app_with_bloc/constants/my_colors.dart';
import 'package:character_app_with_bloc/data/models/character_model.dart';
import 'package:flutter/material.dart';

class CharacterItem extends StatelessWidget {
  final CharacterModel character;

  const CharacterItem({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: const EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: MyColors.myWhite,
        borderRadius: BorderRadius.circular(8),
      ),
      child: GridTile(
        footer: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          color: Colors.black54,
          alignment: Alignment.bottomCenter,
          child: Text(
            character.name,
            textAlign: TextAlign.center,
            style: const TextStyle(
                height: 1.3,
                fontSize: 16,
                color: MyColors.myWhite,
                fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ),
        child: Container(
            color: MyColors.myGrey,
            child: character.image.isNotEmpty
                ? FadeInImage.assetNetwork(
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
                placeholder: 'assets/images/loading.gif',
                image: character.image)
                : Image.asset('assets/images/Screenshot_1713297862.png')),
      ),
    );
  }
}
