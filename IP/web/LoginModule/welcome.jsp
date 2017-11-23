<!DOCTYPE html>
<html>
    
<title>INTEGER HOMESTAY</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Inconsolata">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
body, html {
    height: 100%;
    font-family: "Inconsolata", sans-serif;
}
.bgimg {
    background-position: center;
    background-size: cover;
    background-image: url("ny.jpg");
    min-height: 100%;
}
.menu {
    display: none;
}
</style>

<body>
<!-- Links (sit on top) -->
<div class="w3-top">
  <div class="w3-row w3-padding w3-black">
    <div class="w3-col s3">
      <a href="welcome.jsp" class="w3-button w3-block w3-black">HOME</a>
    </div>
    <div class="w3-col s3">
      <a href="#about" class="w3-button w3-block w3-black">BOOKING</a>
    </div>
    <div class="w3-col s3">
      <a class="w3-button w3-block w3-black" onclick="document.getElementById('id01').style.display='block'">SIGN-UP</a>
    </div>
    <div class="w3-col s3">
      <a class="w3-button w3-block w3-black" onclick="document.getElementById('id02').style.display='block'">SIGN-IN</a>
    </div>
  </div>
</div>

<!--Modal 1--> 
<div id="id01" class="w3-modal">
    <div class="w3-modal-content w3-card-4 w3-animate-top">
    <header class="w3-container w3-theme-l1"> 
        <span onclick="document.getElementById('id01').style.display='none'"
        class="w3-button w3-display-topright">×</span>
        <center><h4>WELCOME</h4></center>
    </header>
        
      <form method="post" action="SignUpServlet" class="w3-container w3-card-4 w3-light-grey w3-text-grey w3-margin">
        <h2 class="w3-center">SIGN-UP</h2>
        <div class="w3-row w3-section">
            <div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-user"></i></div>
                <div class="w3-rest">
                    <input class="w3-input w3-border" name="username" type="text" placeholder="User Name" required>
                </div>
        </div>
        <div class="w3-row w3-section">
            <div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-user"></i></div>
                <div class="w3-rest">
                    <input class="w3-input w3-border" name="fullname" type="text" placeholder="Full Name" required>
                </div>
        </div>
        <div class="w3-row w3-section">
            <div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-at"></i></div>
                <div class="w3-rest">
                    <input class="w3-input w3-border" name="email" type="text" placeholder="Email" required>
                </div>
        </div>
        <div class="w3-row w3-section">
            <div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-asterisk"></i></div>
                <div class="w3-rest">
                    <input class="w3-input w3-border" name="password" type="password" placeholder="Password" required>
                </div>
        </div>
        <button class="w3-button w3-block w3-section w3-dark-grey w3-ripple w3-padding">Submit</button>
      </form>      
    </div>
</div>

<!--Modal 1--> 
<div id="id02" class="w3-modal">
    <div class="w3-modal-content w3-card-4 w3-animate-top">
    <header class="w3-container w3-theme-l1"> 
        <span onclick="document.getElementById('id02').style.display='none'"
        class="w3-button w3-display-topright">×</span>
        <center><h4>WELCOME</h4></center>
    </header>
        
      <form method="post" action="SignInServlet" class="w3-container w3-card-4 w3-light-grey w3-text-grey w3-margin">
        <h2 class="w3-center">SIGN-IN</h2>
        <div class="w3-row w3-section">
            <div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-user"></i></div>
                <div class="w3-rest">
                    <input class="w3-input w3-border" name="username" type="text" placeholder="User Name" required>
                </div>
        </div>
        <div class="w3-row w3-section">
            <div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-asterisk"></i></div>
                <div class="w3-rest">
                    <input class="w3-input w3-border" name="password" type="password" placeholder="Password" required>
                </div>
        </div>
        <button class="w3-button w3-block w3-section w3-dark-grey w3-ripple w3-padding">Submit</button>
      </form>      
    </div>
</div>

<!-- Header with image -->
<header class="bgimg w3-display-container w3-grayscale-min" id="home">
  <div class="w3-display-bottomleft w3-center w3-padding-large w3-hide-small">
  </div>
  <div class="w3-display-middle w3-center">
    <span class="w3-text-white" style="font-size:90px">INTEGER<br>homestay</span>
  </div>
  <div class="w3-display-bottomright w3-center w3-padding-large">
  </div>
</header>

</body>
</html>