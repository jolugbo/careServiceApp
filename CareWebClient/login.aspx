<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="CareWebClient.login" %>
<%@ Register TagPrefix="recaptcha" Namespace="Recaptcha" Assembly="Recaptcha" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
  <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=yes"/>
  <link rel='stylesheet prefetch' href='http://fonts.googleapis.com/css?family=Open+Sans'/>
      <link rel="stylesheet" href="assets/css/style.css"/>
    <link href="~/assets/css/bootstrap.css" rel="stylesheet" />
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
    
</head>
<body>
    <script type="text/javascript">
 var RecaptchaOptions = {
    theme : 'custom',
    custom_theme_widget: 'recaptcha_widget'
 };
 </script>
    
  <div class="cont">
  <div class="demo">
    <div class="login">
      <div class="login__check"></div>
      <div class="login__form">
          <asp:Label ID="lblErrorMsg" runat="server"  class="bigDang text-danger"></asp:Label>
              <form id="form1" runat="server">
        <div class="login__row">
          <svg class="login__icon name svg-icon" viewBox="0 0 20 20">
            <path d="M0,20 a10,8 0 0,1 20,0z M10,0 a4,4 0 0,1 0,8 a4,4 0 0,1 0,-8" />
          </svg>
            <asp:TextBox ID="txtUserName" type="text" class="login__input name" placeholder="Username" runat="server"></asp:TextBox>
        </div>
        <div class="login__row">
          <svg class="login__icon pass svg-icon" viewBox="0 0 20 20">
            <path d="M0,20 20,20 20,8 0,8z M10,13 10,16z M4,8 a6,8 0 0,1 12,0" />
          </svg>
            <asp:TextBox ID="txtPassword" type="password" class="login__input pass" placeholder="Password" runat="server"></asp:TextBox>
        </div>
               <div class="g-recaptcha" data-sitekey="6Lfr4RUUAAAAAFGtH6epEzkh2-RDbwk8RirLqlAg"></div>   
        <%--<recaptcha:RecaptchaControl
    ID="recaptcha"
    runat="server"
    PublicKey="6Lfr4RUUAAAAAFGtH6epEzkh2-RDbwk8RirLqlAg"
    PrivateKey="6Lfr4RUUAAAAAOIhoGB1GyZcTejsxjxPPWfO0FJ5"
    Theme="clean"
    />--%>
                  <%-- <div id="recaptcha_widget" style="display:none; margin-top: 3em">

   <div id="recaptcha_image" style="width: 80%;"></div>
   <div class="recaptcha_only_if_incorrect_sol" style="color:red">Incorrect please try again</div>

   <span class="recaptcha_only_if_image">Enter the words above:</span>
   <span class="recaptcha_only_if_audio">Enter the numbers you hear:</span>

   <input type="text" id="recaptcha_response_field" name="recaptcha_response_field" />

   <div><a href="javascript:Recaptcha.reload()">Get another CAPTCHA</a></div>
   <div class="recaptcha_only_if_image"><a href="javascript:Recaptcha.switch_type('audio')">Get an audio CAPTCHA</a></div>
   <div class="recaptcha_only_if_audio"><a href="javascript:Recaptcha.switch_type('image')">Get an image CAPTCHA</a></div>

   <div><a href="javascript:Recaptcha.showhelp()">Help</a></div>

 </div>

 <script type="text/javascript"
    src="http://www.google.com/recaptcha/api/challenge?k=6Lfr4RUUAAAAAFGtH6epEzkh2-RDbwk8RirLqlAg">
 </script>
 <noscript>
   <iframe src="http://www.google.com/recaptcha/api/noscript?k=6Lfr4RUUAAAAAFGtH6epEzkh2-RDbwk8RirLqlAg"
        height="300" width="300" frameborder="0"></iframe><br>
   <textarea name="recaptcha_challenge_field" rows="3" cols="40">
   </textarea>
   <input type="hidden" name="recaptcha_response_field"
        value="manual_challenge">
 </noscript>--%>
      <asp:Button ID="btnlogin" class="login__submit" runat="server" Text="Sign in" OnClientClick="return validateLogin();"  OnClick="Authenticate" />
        <p class="login__signup">Don't have an account? &nbsp;<a  href="signup.aspx"  >sign up</a></p>
        <p class="login__signup">Forgot your password? &nbsp;<a  href="signup.aspx"  >click here</a></p>
    </form>
      </div>
        

    </div>
    <div class="app">
      <!--  <div class="app__top">
        <div class="app__menu-btn">
          <span></span>
        </div>
        <svg class="app__icon search svg-icon" viewBox="0 0 20 20">
          <!-- yeap, its purely hardcoded numbers straight from the head :D (same for svg above) 
          <path d="M20,20 15.36,15.36 a9,9 0 0,1 -12.72,-12.72 a 9,9 0 0,1 12.72,12.72" />
        </svg>
        <p class="app__hello">Good Morning!</p>
        <div class="app__user">
          <img src="//s3-us-west-2.amazonaws.com/s.cdpn.io/142996/profile/profile-512_5.jpg" alt="" class="app__user-photo" />
          <span class="app__user-notif">3</span>
        </div>
        <div class="app__month">
          <span class="app__month-btn left"></span>
          <p class="app__month-name">March</p>
          <span class="app__month-btn right"></span>
        </div>
      </div>
    <div class="app__bot">
        <div class="app__days">
          <div class="app__day weekday">Sun</div>
          <div class="app__day weekday">Mon</div>
          <div class="app__day weekday">Tue</div>
          <div class="app__day weekday">Wed</div>
          <div class="app__day weekday">Thu</div>
          <div class="app__day weekday">Fri</div>
          <div class="app__day weekday">Sad</div>
          <div class="app__day date">8</div>
          <div class="app__day date">9</div>
          <div class="app__day date">10</div>
          <div class="app__day date">11</div>
          <div class="app__day date">12</div>
          <div class="app__day date">13</div>
          <div class="app__day date">14</div>
        </div>
        <div class="app__meetings">
          <div class="app__meeting">
            <img src="http://s3-us-west-2.amazonaws.com/s.cdpn.io/142996/profile/profile-80_5.jpg" alt="" class="app__meeting-photo" />
            <p class="app__meeting-name">Feed the cat</p>
            <p class="app__meeting-info">
              <span class="app__meeting-time">8 - 10am</span>
              <span class="app__meeting-place">Real-life</span>
            </p>
          </div>
          <div class="app__meeting">
            <img src="//s3-us-west-2.amazonaws.com/s.cdpn.io/142996/profile/profile-512_5.jpg" alt="" class="app__meeting-photo" />
            <p class="app__meeting-name">Feed the cat!</p>
            <p class="app__meeting-info">
              <span class="app__meeting-time">1 - 3pm</span>
              <span class="app__meeting-place">Real-life</span>
            </p>
          </div>
          <div class="app__meeting">
            <img src="//s3-us-west-2.amazonaws.com/s.cdpn.io/142996/profile/profile-512_5.jpg" alt="" class="app__meeting-photo" />
            <p class="app__meeting-name">FEED THIS CAT ALREADY!!!</p>
            <p class="app__meeting-info">
              <span class="app__meeting-time">This button is just for demo ></span>
            </p>
          </div>
        </div>
      </div>-->
      <div class="app__logout">
        <svg class="app__logout-icon svg-icon" viewBox="0 0 20 20">
          <path d="M6,3 a8,8 0 1,0 8,0 M10,0 10,12"/>
        </svg>
      </div>
    </div>
  </div>
</div>


  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <script src="assets/js/index.js"></script>
</body>
</html>
