const functions = require('firebase-functions');
const admin = require('firebase-admin');
admin.initializeApp();
const db = admin.firestore();

// Cloud Function to get job recommendations
exports.getJobRecommendations = functions.https.onCall(async (data, context) => {
  const { skills, experience_level, preferences } = data;

  try {
    // Query to match job postings with user's skills, experience level, and preferences
    const jobPostings = await db.collection('job_postings')
      .where('required_skills', 'array-contains-any', skills)
      .where('experience_level', '==', experience_level)
      .where('location', 'in', preferences.locations)
      .get();
    const recommendations = [];
    jobPostings.forEach((doc) => {
      recommendations.push(doc.data());
    });

    return recommendations;
  } catch (error) {
    throw new functions.https.HttpsError('internal', 'Failed to fetch job recommendations', error.message);
  }
});
