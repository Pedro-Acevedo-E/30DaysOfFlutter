import 'package:day_16_17_pokedex/modules/pokemon/models/pokemon_details.dart';

class VersionDetail {
  final int levelLearnedAt;
  final PokeDetails moveLearnMethod;
  final PokeDetails versionGroup;

  VersionDetail({required this.levelLearnedAt, required this.moveLearnMethod, required this.versionGroup});

  factory VersionDetail.fromJson(Map<String, dynamic> json) {
    final levelLearnedAt = json['level_learned_at'];
    final moveLearnMethod = PokeDetails.fromJson(json['move_learn_method']);
    final versionGroup = PokeDetails.fromJson(json['version_group']);

    return VersionDetail(levelLearnedAt: levelLearnedAt, moveLearnMethod: moveLearnMethod, versionGroup: versionGroup);
  }
}
