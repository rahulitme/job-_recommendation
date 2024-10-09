// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:myapp/models/user_profile.dart';

// class RecommendationService {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   Future<List<Map<String, dynamic>>> recommendJobs(String userId) async {
//     // Fetch user profile
//     DocumentSnapshot userProfileDoc =
//         await _firestore.collection('user_profiles').doc(userId).get();
//     Map<String, dynamic> userProfile =
//         userProfileDoc.data() as Map<String, dynamic>;

//     // Fetch job postings
//     QuerySnapshot jobPostingDocs =
//         await _firestore.collection('job_postings').get();
//     List<Map<String, dynamic>> recommendedJobs = [];

//     for (var job in jobPostingDocs.docs) {
//       Map<String, dynamic> jobData = job.data() as Map<String, dynamic>;

//       // Simple matching logic
//       if (userProfile['experience_level'] == jobData['experience_level'] &&
//           userProfile['preferences']['job_type'] == jobData['job_type'] &&
//           userProfile['preferences']['desired_roles']
//               .contains(jobData['job_title'])) {
//         recommendedJobs.add(jobData);
//       }
//     }

//     return recommendedJobs;
//   }

//   Future<List<Map<String, dynamic>>> getJobRecommendations(
//       UserProfile profile) async {
//     // This function should implement logic to fetch jobs and match them
//     // based on UserProfile object (profile).
//     // Simulate job matching logic here or call Firestore jobs collection.
    
//     QuerySnapshot jobPostingDocs =
//         await _firestore.collection('job_postings').get();
//     List<Map<String, dynamic>> recommendedJobs = [];

//     for (var job in jobPostingDocs.docs) {
//       Map<String, dynamic> jobData = job.data() as Map<String, dynamic>;

//       // Example matching logic based on user profile's skills
//       if (profile.skills.any((skill) => jobData['skills'].contains(skill)) &&
//           profile.experienceLevel == jobData['experience_level']) {
//         recommendedJobs.add(jobData);
//       }
//     }

//     return recommendedJobs;
//   }
// }
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/foundation.dart';
// import 'package:myapp/models/user_profile.dart';

// class RecommendationService {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   // Fetch job recommendations based on user's profile (by userId)
//   Future<List<Map<String, dynamic>>> recommendJobs(String userId) async {
//     try {
//       // Fetch user profile from Firestore
//       DocumentSnapshot userProfileDoc = await _firestore
//           .collection('user_profiles')
//           .doc(userId)
//           .get();

//       // Ensure user profile exists
//       if (!userProfileDoc.exists) {
//         if (kDebugMode) {
//           print("User profile not found for userId: $userId");
//         }
//         return [];
//       }

//       // Cast user profile data to a map
//       Map<String, dynamic> userProfile =
//           userProfileDoc.data() as Map<String, dynamic>;

//       // Fetch all job postings
//       QuerySnapshot jobPostingDocs =
//           await _firestore.collection('job_postings').get();

//       List<Map<String, dynamic>> recommendedJobs = [];

//       // Loop through each job posting and match based on user profile
//       for (var job in jobPostingDocs.docs) {
//         Map<String, dynamic> jobData = job.data() as Map<String, dynamic>;

//         // Simple matching logic: match based on experience level, job type, and desired role
//         if (userProfile['experience_level'] == jobData['experience_level'] &&
//             userProfile['preferences']['job_type'] == jobData['job_type'] &&
//             userProfile['preferences']['desired_roles']
//                 .contains(jobData['job_title'])) {
//           recommendedJobs.add(jobData);
//         }
//       }

//       return recommendedJobs;
//     } catch (e) {
//       if (kDebugMode) {
//         print("Error fetching job recommendations: $e");
//       }
//       return [];
//     }
//   }

//   // Fetch job recommendations based on user profile object (alternative approach)
//   Future<List<Map<String, dynamic>>> getJobRecommendations(
//       UserProfile profile) async {
//     try {
//       // Fetch all job postings
//       QuerySnapshot jobPostingDocs =
//           await _firestore.collection('job_postings').get();

//       List<Map<String, dynamic>> recommendedJobs = [];

//       // Loop through each job posting and match based on user profile's skills and experience
//       for (var job in jobPostingDocs.docs) {
//         Map<String, dynamic> jobData = job.data() as Map<String, dynamic>;

//         // Check if the user's skills match the job's required skills
//         if (profile.skills.any((skill) => jobData['required_skills'].contains(skill)) &&
//             profile.experienceLevel == jobData['experience_level']) {
//           recommendedJobs.add(jobData);
//         }
//       }

//       return recommendedJobs;
//     } catch (e) {
//       if (kDebugMode) {
//         print("Error fetching job recommendations: $e");
//       }
//       return [];
//     }
//   }
// }

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/foundation.dart';
// import 'package:myapp/models/user_profile.dart';

// class RecommendationService {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   // Fetch job recommendations based on user's profile (by userId)
//   Future<List<Map<String, dynamic>>> recommendJobs(String userId) async {
//     try {
//       // Fetch user profile from Firestore
//       DocumentSnapshot userProfileDoc = await _firestore
//           .collection('user_profiles')
//           .doc(userId)
//           .get();

//       // Ensure user profile exists
//       if (!userProfileDoc.exists) {
//         if (kDebugMode) {
//           print("User profile not found for userId: $userId");
//         }
//         return [];
//       }

//       // Cast user profile data to a map
//       Map<String, dynamic> userProfile =
//           userProfileDoc.data() as Map<String, dynamic>;

//       // Ensure required fields exist in the user profile
//       if (userProfile['experience_level'] == null ||
//           userProfile['preferences'] == null ||
//           userProfile['preferences']['job_type'] == null ||
//           userProfile['preferences']['desired_roles'] == null) {
//         if (kDebugMode) {
//           print("Incomplete user profile data: $userProfile");
//         }
//         return [];
//       }

//       // Fetch all job postings
//       QuerySnapshot jobPostingDocs =
//           await _firestore.collection('job_postings').get();

//       List<Map<String, dynamic>> recommendedJobs = [];

//       // Loop through each job posting and match based on user profile
//       for (var job in jobPostingDocs.docs) {
//         Map<String, dynamic> jobData = job.data() as Map<String, dynamic>;

//         // Ensure job data has the necessary fields
//         if (jobData['experience_level'] != null &&
//             jobData['job_type'] != null &&
//             jobData['job_title'] != null) {
//           // Simple matching logic: match based on experience level, job type, and desired role
//           if (userProfile['experience_level'] == jobData['experience_level'] &&
//               userProfile['preferences']['job_type'] == jobData['job_type'] &&
//               userProfile['preferences']['desired_roles']
//                   .contains(jobData['job_title'])) {
//             recommendedJobs.add(jobData);
//           }
//         } else {
//           if (kDebugMode) {
//             print("Incomplete job data: $jobData");
//           }
//         }
//       }

//       return recommendedJobs;
//     } catch (e) {
//       if (kDebugMode) {
//         print("Error fetching job recommendations: $e");
//       }
//       return [];
//     }
//   }

//   // Fetch job recommendations based on user profile object (alternative approach)
//   Future<List<Map<String, dynamic>>> getJobRecommendations(
//       UserProfile profile) async {
//     try {
//       // Ensure profile has the necessary fields
//       QuerySnapshot jobPostingDocs =
//           await _firestore.collection('job_postings').get();

//       List<Map<String, dynamic>> recommendedJobs = [];

//       // Loop through each job posting and match based on user profile's skills and experience
//       for (var job in jobPostingDocs.docs) {
//         Map<String, dynamic> jobData = job.data() as Map<String, dynamic>;

//         // Ensure job data contains required fields
//         if (jobData['required_skills'] != null &&
//             jobData['experience_level'] != null) {
//           // Check if the user's skills match the job's required skills
//           if (profile.skills.any((skill) =>
//                   jobData['required_skills'].contains(skill)) &&
//               profile.experienceLevel == jobData['experience_level']) {
//             recommendedJobs.add(jobData);
//           }
//         } else {
//           if (kDebugMode) {
//             print("Incomplete job posting data: $jobData");
//           }
//         }
//       }

//       return recommendedJobs;
//     } catch (e) {
//       if (kDebugMode) {
//         print("Error fetching job recommendations: $e");
//       }
//       return [];
//     }
//   }
// }
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/foundation.dart';
// import 'package:myapp/models/user_profile.dart';

// class RecommendationService {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   // Fetch job recommendations based on user profile object
//   Future<List<Map<String, dynamic>>> getJobRecommendations(
//       UserProfile profile) async {
//     try {
//       QuerySnapshot jobPostingDocs =
//           await _firestore.collection('job_postings').get();

//       List<Map<String, dynamic>> recommendedJobs = [];

//       for (var job in jobPostingDocs.docs) {
//         Map<String, dynamic> jobData = job.data() as Map<String, dynamic>;

//         // Ensure job data contains required fields
//         if (jobData['required_skills'] != null &&
//             jobData['experience_level'] != null) {
          
//           // Convert required_skills to a list (assuming stored as comma-separated string)
//           List<String> jobSkills = (jobData['required_skills'] as String).split(',').map((e) => e.trim()).toList();

//           // Check if the user's skills match the job's required skills
//           if (profile.skills.any((skill) => jobSkills.contains(skill)) &&
//               profile.experienceLevel == jobData['experience_level']) {
//             recommendedJobs.add(jobData);
//           }
//         } else {
//           if (kDebugMode) {
//             print("Incomplete job posting data: $jobData");
//           }
//         }
//       }

//       return recommendedJobs;
//     } catch (e) {
//       if (kDebugMode) {
//         print("Error fetching job recommendations: $e");
//       }
//       return [];
//     }
//   }
// }


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:myapp/models/user_profile.dart';

class RecommendationService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> getJobRecommendations(UserProfile profile) async {
    try {
      QuerySnapshot jobPostingDocs = await _firestore.collection('job_postings').get();

      List<Map<String, dynamic>> recommendedJobs = [];

      for (var job in jobPostingDocs.docs) {
        Map<String, dynamic> jobData = job.data() as Map<String, dynamic>;

        if (_isValidJobPosting(jobData)) {
          List<String> jobSkills = _parseSkills(jobData['required_skills']);

          if (_isJobMatch(profile, jobSkills, jobData['experience_level'])) {
            recommendedJobs.add(jobData);
          }
        } else {
          _logIncompleteJobData(jobData);
        }
      }

      return recommendedJobs;
    } catch (e) {
      _logError("Error fetching job recommendations", e);
      return [];
    }
  }

  bool _isValidJobPosting(Map<String, dynamic> jobData) {
    return jobData['required_skills'] != null &&
           jobData['experience_level'] != null &&
           jobData['required_skills'] is String &&
           jobData['experience_level'] is String;
  }

  List<String> _parseSkills(String skillsString) {
    return skillsString.split(',').map((e) => e.trim().toLowerCase()).toList();
  }

  bool _isJobMatch(UserProfile profile, List<String> jobSkills, String jobExperienceLevel) {
    List<String> userSkills = profile.skills.map((s) => s.toLowerCase()).toList();
    return userSkills.any((skill) => jobSkills.contains(skill)) &&
           profile.experienceLevel.toLowerCase() == jobExperienceLevel.toLowerCase();
  }

  void _logIncompleteJobData(Map<String, dynamic> jobData) {
    if (kDebugMode) {
      print("Incomplete job posting data: $jobData");
    }
  }

  void _logError(String message, dynamic error) {
    if (kDebugMode) {
      print("$message: $error");
    }
  }
}