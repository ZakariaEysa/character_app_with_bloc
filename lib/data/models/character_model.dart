class CharacterModel {
  late int id;
  late String name;
  late String alias;
  late String occupation;
  late String gender;
  late String status;
  late String romance;
  late String family;
  late String firstAppearance;
  late String lastAppearance;
  late String playedBy;
  late String image;
  CharacterModel({
    required this.id,
    required this.name,
    required this.alias,
    required this.occupation,
    required this.gender,
    required this.status,
    required this.romance,
    required this.family,
    required this.firstAppearance,
    required this.lastAppearance,
    required this.playedBy,
    required this.image
  });



  factory CharacterModel.fromJson(Map<String, dynamic> json) {

    return CharacterModel(
        id: json['id'],
        name: json['name'],
        alias: json['alias'],
        occupation: json['occupation'],
        gender: json['gender'],
        status: json['status'],
        romance: json['romance'],
        family: json['family'],
        firstAppearance: json['first_appearance'],
        lastAppearance: json['last_appearance'],
        playedBy: json['played_by'],
        image: json['image']


    );

  }


}

