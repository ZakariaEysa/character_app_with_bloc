// class CharacterModel {
//   late int id;
//   late String name;
//   late String alias;
//   late String occupation;
//   late String gender;
//   late String status;
//   late String romance;
//   late String family;
//   late String firstAppearance;
//   late String lastAppearance;
//   late String playedBy;
//   late String image;
//   CharacterModel({
//     required this.id,
//     required this.name,
//     required this.alias,
//     required this.occupation,
//     required this.gender,
//     required this.status,
//     required this.romance,
//     required this.family,
//     required this.firstAppearance,
//     required this.lastAppearance,
//     required this.playedBy,
//     required this.image
//   });
//
//
//
//   factory CharacterModel.fromJson(Map<String, dynamic> json) {
//
//     return CharacterModel(
//         id: json['id'],
//         name: json['name'],
//         alias: json['alias'],
//         occupation: json['occupation'],
//         gender: json['gender'],
//         status: json['status'],
//         romance: json['romance'],
//         family: json['family'],
//         firstAppearance: json['first_appearance'],
//         lastAppearance: json['last_appearance'],
//         playedBy: json['played_by'],
//         image: json['image']
//
//
//     );
//
//   }
//
//
// }

class CharacterModel {
  late int id;
  late String name;
  late String status;
  late String species;
  late String type;
  late String gender;
  late String locationOrigin;
  late String locationLocation;
  late String image;
  late List<dynamic> episode;
  late String url;
  late String created;

  CharacterModel({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.locationOrigin,
    required this.locationLocation,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      species: json['species'],
      type: json['type'],
      gender: json['gender'],
      locationOrigin: json['origin']["url"],
      locationLocation: json['location']["url"],
      image: json['image'],
      episode: json['episode'],
      url: json['url'],
      created: json['created'],
    );
  }
}
