import 'package:day_16_17_pokedex/modules/pokemon/models/pokemon_details.dart';
import 'package:day_16_17_pokedex/modules/pokemon/models/version_detail.dart';

class MoveInfo {
  final PokeDetails move;
  final List<VersionDetail> versionGroupDetails;

  MoveInfo({required this.move, required this.versionGroupDetails});

  factory MoveInfo.fromJson(Map<String, dynamic> json) {
    final move = PokeDetails.fromJson(json['move']);
    final versionGroupDetails = (json['version_group_details'] as List)
        .map((listingJson) => VersionDetail.fromJson(listingJson))
        .toList();

    return MoveInfo(move: move, versionGroupDetails: versionGroupDetails);
  }
}