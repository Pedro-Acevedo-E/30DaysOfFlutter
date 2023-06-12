enum Gender { female, male, other }
enum ProgrammingLanguage { dart, javascript, kotlin, swift }

class Settings {
  final String username;
  final Gender gender;
  final Set<ProgrammingLanguage> programmingLanguages;
  final bool isEmployed;

  Settings({
    required this.username,
    required this.gender,
    required this.programmingLanguages,
    required this.isEmployed
  });
}