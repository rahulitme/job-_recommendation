

![Screenshot 2024-10-09 111309](https://github.com/user-attachments/assets/09e1fe75-6709-455f-b3e3-f8cdcafcfc05)

![Screenshot 2024-10-09 111329](https://github.com/user-attachments/assets/85a3dce6-ff9d-4616-9155-06905a4eeec1)



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


