import '../constants/constants.dart';

String pageUrl(String query) => "https://pokeapi.co/api/v2/pokemon/?offset=$query&limit=$paginationNumber";