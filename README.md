# Weight Tracker - Firebase

This is a clone of the original weight tracker app which was built on Hive NoSQL DB.

In this app, instead of Hive, I am using Firebase as backend.

## LOG

### 28-12-2020:

After going through the official docs, I was able to implement firestore as the backend for this app. Even though everything still looks the same, the backend is firebase now. Next planned update is to implement google sign in, so that each user can have their own separate tracker. 

### 29-12-2020

Finally implemented Google sign in. Also updated the code so that each user gets their own document in firestore.

Already logged in users will go directly to homepage(skipping login screen).

Learned that for signing out a user, both Firestore instance and Google sign in instance have to be logged out. Had to spent quite a some time to figure this out.

Added logos, launcher icon, splash screen, changed app name.

The main homepage is now messy, as I added user display name and signout button for debugging. Have to fix that by adding sidebar and moving user details there. 

## ToDo

* Update the sidebar to include the logged in user details
* Add more features like BMI calculator etc(by using 3rd party API's)
* Fix routing
* Back button on homepage shouldn't pop to login screen

## Done

* Implemented Google sign in
