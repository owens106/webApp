window.addEventListener('load', function () { //this loads when page is loaded, watches for signin
  document.getElementById('sign-out').onclick = function () { //uses firebase func to sign out
    firebase.auth().signOut();
  };

 
  // FirebaseUI config.
  var uiConfig = {
    signInSuccessUrl: '/',
    signInOptions: [
      // for now only google auth is avaailable
      firebase.auth.GoogleAuthProvider.PROVIDER_ID,
    ],

  };


  //trigers when user signs in or signs out
  firebase.auth().onAuthStateChanged(function (user) {
    if (user) { //user is != Null if signed in based on unique ID
      // User is signed in.
      document.getElementById('sign-out').hidden = false; //makes sign out button visable only when signed in
      document.getElementById('post-form').hidden = false; //allows you to make posts as field becomes visable
      document.getElementById('account-details').textContent =
          'Signed in as ' + user.displayName + ' (' + user.email + ')'; //displays user info
      user.getIdToken().then(function (accessToken) { //grabs user tokens for use in Firebase
        // Add the token to the post form. The user info will be extracted
        // from the token by the server.
        document.getElementById('token').value = accessToken;  //sets up token val in html to token from user auth
      });
    } else {
      // User is signed out.
      // display the firebase auth page UI
      var ui = new firebaseui.auth.AuthUI(firebase.auth());
      // Show the Firebase login button.
      ui.start('#firebaseui-auth-container', uiConfig);
      // Update the login state indicators.
      document.getElementById('sign-out').hidden = true;  //cant sign out if signed in
      document.getElementById('post-form').hidden = true;  //cant post if not signed in
      document.getElementById('account-details').textContent = ''; //"reset" current user so prev msgs dont show up
    }
  }, function (error) { //something went wrong, oops
    console.log(error);
    alert('Unable to log in: ' + error)
  });

});
