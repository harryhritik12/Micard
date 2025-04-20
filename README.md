![Hosted on Firebase](https://img.shields.io/badge/Hosted_on-Firebase-FFCA28?logo=firebase&logoColor=white)

# 🚀 Deploy Flutter Web App to Firebase Hosting

## 1. Prerequisites

Make sure you have the following installed:

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- [Node.js and npm](https://nodejs.org/)
- [Firebase CLI](https://firebase.google.com/docs/cli)

Install Firebase CLI globally:

```bash
npm install -g firebase-tools
2. Enable Web Support in Flutter
If web support is not already enabled, run:

bash
Copy
Edit
flutter channel stable
flutter upgrade
flutter config --enable-web
Verify that web devices are available:

bash
Copy
Edit
flutter devices
You should see a web server or Chrome listed.

3. Build Your Flutter Web App
Navigate to your Flutter project directory and build the web version:

bash
Copy
Edit
flutter build web
This will create a build/web directory containing your static web app files.

4. Create a Firebase Project
Go to the Firebase Console.

Click on Add Project and follow the setup prompts.

5. Initialize Firebase in Your Project
Log in to Firebase:

bash
Copy
Edit
firebase login
Initialize Firebase inside your project folder:

bash
Copy
Edit
firebase init
During initialization:

Select Hosting (press spacebar to select, then Enter).

Choose the Firebase project you created.

Set the public directory to build/web.

Configure as a single-page app: select Yes.

When asked to overwrite index.html, choose No.

6. Deploy to Firebase Hosting
Deploy your app using:

bash
Copy
Edit
firebase deploy
After deployment, Firebase will provide you with a live URL to access your app!

🎯 Done!
Your Flutter web app is now live on Firebase Hosting! 🚀
