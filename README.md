# AI Talent Acquisition Platform - Job Recommendation Feature

## Overview
This feature recommends relevant job postings to users based on their profiles (skills, experience, preferences) using a custom matching algorithm.

## Key Features
- **Personalized Job Recommendations**: Matches user profiles with job postings.
- **Real-time Updates**: Updates recommendations as profiles or jobs change.
- **Backend**: Powered by Firebase Firestore for user profiles and job listings.

## Matching Algorithm
The system scores jobs based on:
1. **Skills & Experience Match**
2. **Location Preferences**

Top matches are shown to the user.

## Database Schema
### User Profiles
```json
{
  "Name": "jhone Deo",
  "skills": ["JavaScript", "React"],
  "location": "New York",
  "preferences": { "job_type": "Remote" }
}


