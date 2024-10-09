// import 'package:flutter/material.dart';
// import 'package:myapp/services/recommendation_service.dart';


// class RecommendationScreen extends StatefulWidget {
//   const RecommendationScreen({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _RecommendationScreenState createState() => _RecommendationScreenState();
// }

// class _RecommendationScreenState extends State<RecommendationScreen> {
//   final RecommendationService _recommendationService = RecommendationService();
//   List<Map<String, dynamic>> _recommendedJobs = [];

//   @override
//   void initState() {
//     super.initState();
//     _getRecommendations('user_profile_id'); // Replace with the actual user ID
//   }

//   Future<void> _getRecommendations(String userId) async {
//     List<Map<String, dynamic>> jobs = await _recommendationService.recommendJobs(userId);
//     setState(() {
//       _recommendedJobs = jobs;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Recommended Jobs'),
//       ),
//       body: ListView.builder(
//         itemCount: _recommendedJobs.length,
//         itemBuilder: (context, index) {
//           final job = _recommendedJobs[index];
//           return ListTile(
//             title: Text(job['job_title']),
//             subtitle: Text('${job['company']} - ${job['location']}'),
//           );
//         },
//       ),
//     );
//   }
// }
// lib/screens/recommendations_screen.dart

import 'package:flutter/material.dart';

class RecommendationsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> recommendations;

  const RecommendationsScreen({super.key, required this.recommendations});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Job Recommendations', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.purple,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.purple, Colors.blue.shade200],
          ),
        ),
        child: ListView.builder(
          itemCount: recommendations.length,
          itemBuilder: (context, index) {
            final recommendation = recommendations[index];
            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                contentPadding: const EdgeInsets.all(16),
                title: Text(
                  recommendation['job_title'] ?? 'No Title',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.purple,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    Text(
                      '${recommendation['company_name'] ?? 'Unknown Company'} - ${recommendation['location'] ?? 'Unknown Location'}',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade100,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        recommendation['job_type'] ?? 'Not specified',
                        style: TextStyle(color: Colors.blue[800]),
                      ),
                    ),
                  ],
                ),
                trailing: const Icon(Icons.arrow_forward_ios, color: Color.fromARGB(255, 212, 145, 224)),
              ),
            );
          },
        ),
      ),
    );
  }
}

