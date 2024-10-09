

// import 'package:flutter/material.dart';
// import '../models/user_profile.dart';
// import '../services/recommendation_service.dart';

// class ProfileScreen extends StatefulWidget {
//   const ProfileScreen({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _ProfileScreenState createState() => _ProfileScreenState();
// }

// class _ProfileScreenState extends State<ProfileScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final _nameController = TextEditingController();
//   final _skillsController = TextEditingController();
//   final _experienceController = TextEditingController();
//   final _locationController = TextEditingController();

//   final RecommendationService _recommendationService = RecommendationService();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('User Profile')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               TextFormField(
//                 controller: _nameController,
//                 decoration: const InputDecoration(labelText: 'Name'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your name';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: _skillsController,
//                 decoration: const InputDecoration(
//                     labelText: 'Skills (comma separated)'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your skills';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: _experienceController,
//                 decoration:
//                     const InputDecoration(labelText: 'Experience Level'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your experience level';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: _locationController,
//                 decoration:
//                     const InputDecoration(labelText: 'Location Preferences'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter location preferences';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () async {
//                   if (_formKey.currentState!.validate()) {
//                     UserProfile profile = UserProfile(
//                       name: _nameController.text,
//                       skills: _skillsController.text.split(','),
//                       experienceLevel: _experienceController.text,
//                       preferences: {
//                         'locations': [_locationController.text],
//                         'desired_roles': ['Backend Developer'],
//                         'job_type': 'Full-Time',
//                       },
//                     );
                    
//                     // Fetch recommendations
//                     List<Map<String, dynamic>> recommendations =
//                         await _recommendationService
//                             .getJobRecommendations(profile);

//                     // Only navigate if context is still valid
//                     if (mounted) {
//                       Navigator.push(
//                         // ignore: use_build_context_synchronously
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => RecommendationsScreen(
//                             recommendations: recommendations,
//                           ),
//                         ),
//                       );
//                     }
//                   }
//                 },
//                 child: const Text('Get Recommendations'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class RecommendationsScreen extends StatelessWidget {
//   final List<Map<String, dynamic>> recommendations;

//   const RecommendationsScreen({super.key, required this.recommendations});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Job Recommendations')),
//       body: ListView.builder(
//         itemCount: recommendations.length,
//         itemBuilder: (context, index) {
//           final recommendation = recommendations[index];
//           return ListTile(
//             title: Text(recommendation['job_title']),
//             subtitle: Text(recommendation['company_name']),
//           );
//         },
//       ),
//     );
//   }
// }
// lib/screens/profile_screen.dart

// import 'package:flutter/material.dart';
// import '../models/user_profile.dart';
// import '../services/recommendation_service.dart';
// import 'recommendations_screen.dart';

// class ProfileScreen extends StatefulWidget {
//   const ProfileScreen({super.key});

//   @override
//   _ProfileScreenState createState() => _ProfileScreenState();
// }

// class _ProfileScreenState extends State<ProfileScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final _nameController = TextEditingController();
//   final _skillsController = TextEditingController();
//   final _experienceController = TextEditingController();
//   final _locationController = TextEditingController();

//   final RecommendationService _recommendationService = RecommendationService();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('User Profile')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               TextFormField(
//                 controller: _nameController,
//                 decoration: const InputDecoration(labelText: 'Name'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your name';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: _skillsController,
//                 decoration: const InputDecoration(
//                     labelText: 'Skills (comma separated)'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your skills';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: _experienceController,
//                 decoration: const InputDecoration(labelText: 'Experience Level'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your experience level';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: _locationController,
//                 decoration:
//                     const InputDecoration(labelText: 'Location Preferences'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter location preferences';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () async {
//                   if (_formKey.currentState!.validate()) {
//                     UserProfile profile = UserProfile(
//                       name: _nameController.text,
//                       skills: _skillsController.text.split(','),
//                       experienceLevel: _experienceController.text,
//                       preferences: {
//                         'locations': [_locationController.text],
//                         'desired_roles': ['Backend Developer'], // You can adjust this
//                         'job_type': 'Full-Time',
//                       },
//                     );

//                     // Fetch recommendations
//                     List<Map<String, dynamic>> recommendations =
//                         await _recommendationService.getJobRecommendations(profile);

//                     if (mounted) {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => RecommendationsScreen(
//                             recommendations: recommendations,
//                           ),
//                         ),
//                       );
//                     }
//                   }
//                 },
//                 child: const Text('Get Recommendations'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// lib/screens/profile_screen.dart

import 'package:flutter/material.dart';
import '../models/user_profile.dart';
import '../services/recommendation_service.dart';
import 'recommendations_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _skillsController = TextEditingController();
  final _experienceController = TextEditingController();
  final _locationController = TextEditingController();

  final RecommendationService _recommendationService = RecommendationService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 144, 39, 176),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.purple[100]!, Colors.blue[100]!],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        _buildTextField(
                          controller: _nameController,
                          label: 'Name',
                          icon: Icons.person,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        _buildTextField(
                          controller: _skillsController,
                          label: 'Skills (comma separated)',
                          icon: Icons.build,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your skills';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        _buildTextField(
                          controller: _experienceController,
                          label: 'Experience Level',
                          icon: Icons.work,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your experience level';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        _buildTextField(
                          controller: _locationController,
                          label: 'Location Preferences',
                          icon: Icons.location_on,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter location preferences';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      UserProfile profile = UserProfile(
                        name: _nameController.text,
                        skills: _skillsController.text.split(','),
                        experienceLevel: _experienceController.text,
                        preferences: {
                          'locations': [_locationController.text],
                          'desired_roles': ['Backend Developer'],
                          'job_type': 'Full-Time',
                        },
                      );

                      List<Map<String, dynamic>> recommendations =
                          await _recommendationService.getJobRecommendations(profile);

                      if (mounted) {
                        Navigator.push(
                          // ignore: use_build_context_synchronously
                          context,
                          MaterialPageRoute(
                            builder: (context) => RecommendationsScreen(
                              recommendations: recommendations,
                            ),
                          ),
                        );
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  ),
                  child: const Text(
                    'Get Recommendations',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    required String? Function(String?) validator,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.purple),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.purple.shade200),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.purple, width: 2),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
      validator: validator,
    );
  }
}
