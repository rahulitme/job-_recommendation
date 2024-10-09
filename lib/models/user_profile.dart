// class UserProfile {
//   final String name;
//   final List<String> skills;
//   final String experienceLevel;
//   final Map<String, dynamic> preferences;

//   UserProfile({
//     required this.name,
//     required this.skills,
//     required this.experienceLevel,
//     required this.preferences,
//   });

//   // Convert from JSON
//   factory UserProfile.fromJson(Map<String, dynamic> json) {
//     return UserProfile(
//       name: json['name'],
//       skills: List<String>.from(json['skills']),
//       experienceLevel: json['experience_level'],
//       preferences: json['preferences'],
//     );
//   }

//   // Convert to JSON
//   Map<String, dynamic> toJson() {
//     return {
//       'name': name,
//       'skills': skills,
//       'experience_level': experienceLevel,
//       'preferences': preferences,
//     };
//   }
// }
class UserProfile {
  final String name;
  final List<String> skills;
  final String experienceLevel;
  final Map<String, dynamic> preferences;

  UserProfile({
    required this.name,
    required this.skills,
    required this.experienceLevel,
    required this.preferences,
  });
}
