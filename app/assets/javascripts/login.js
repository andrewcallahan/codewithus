$(document).ready(function() {

  $('#login-button').click(function(e){
    e.preventDefault();

    var login_buttons = $('#sign-in-ajax');
    var email_login = $('#email-login');

    login_buttons.addClass("hide");
    email_login.removeClass("hide");

  });
});