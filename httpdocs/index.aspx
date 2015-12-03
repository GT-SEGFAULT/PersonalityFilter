<!doctype html>
  <html>
  <head>
  <meta charset="utf-8">
  <title>Personality Filter</title>
  <link href="css/styles.css" rel="stylesheet" type="text/css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
 
 
  </head>
    
  <body>
  <script>
  var imgURL;
  var currentImage; 
 
  function upload() {
	try {
	var img = document.getElementById('canvas').toDataURL('image/jpeg', 0.9).split(',')[1];
	} catch(e) {
    var img = document.getElementById('canvas').toDataURL().split(',')[1];
    }

	$.ajax({
    	url: 'https://api.imgur.com/3/image',
    	type: 'post',
    	headers: {
        Authorization: 'Client-ID 3015ec00378f2d7'
    	},
    	data: {
        image: img
    	},
    	dataType: 'json',
    	success: function(response) {
        if(response.success) {
            imgURL = response.data.link;
			console.log(imgURL);
        }
    }
	});
	setTimeout(setProfPicture, 3000);
  }
  
 
  function setProfPicture() {
    FB.api('/me/photos', 'post', {
      message:'Uploaded with PersonalityFilter',
      url:imgURL
    }, function(response){

      if (!response || response.error) {
        alert(response.error.message);
      } else {
        window.top.location.assign("http://www.facebook.com/photo.php?fbid="+response.id+"&makeprofile=1");
      }
    });
  }
 
  function loadCanvas() {
    var c = document.getElementById("canvas");
    var ctx = c.getContext("2d");
    var img = document.getElementById("profPic");
    ctx.drawImage(img, 0, 0, 200, 200);
  }
 
  function merge(){
	
	console.log("Merge called.");  
	  
	var c=document.getElementById("canvas");
	var ctx=c.getContext("2d");
	var img1 = document.getElementById('profPic');
	var img2 = new Image();
	//img1.setAttribute('crossOrigin', 'anonymous');
	//img2.setAttribute('crossOrigin', 'anonymous');
	
	img2.src = currentImage;
    
	console.log(img1.src);
	console.log(img2.src);
	
	ctx.clearRect(0, 0, 200, 200);
	
	ctx.drawImage(img1, 0, 0, 200, 200);
	ctx.globalAlpha=0.3;
    ctx.drawImage(img2, 0, 0, 200, 200);
	    
	var img = c.toDataURL("image/png");
	document.getElementById('afterImage').innerHTML=('<img src="' + img + '" width="200" height="200" id="afterImage"/>');
	imgURL = img;
   }

  function changeIt(src){
	  currentImage = src;
	  console.log(currentImage);
	  merge();
  }
 
  window.fbAsyncInit = function() {
	FB.init({
      appId      : '402014916656854',
      xfbml      : true,
      version    : 'v2.3'
    });

    function onLogin(response) {
      if (response.status == 'connected') {
        FB.api('/me?fields=first_name', function(data) {
          var welcomeBlock = document.getElementById('fb-welcome');
          welcomeBlock.innerHTML = 'Hello, ' + data.first_name + '!';
        });
      }
    }

	function uploadPhoto(){
	}
	
	function overlayFilter(){
		var origPic = document.getLementbyId("profPic");
	}


    FB.getLoginStatus(function(response) {
      // Check login status on load, and if the user is
      // already logged in, go directly to the welcome message.
      if (response.status == 'connected') {
        onLogin(response);
      } else {
        // Otherwise, show Login dialog first.
        FB.login(function(response) {
          onLogin(response);
        }, {scope: 'user_friends, email, publish_actions'});
      }
	  
	 FB.api("/me/picture?width=400&height=400", function(response) {
     	console.log(response.data.url);
	 	imgURL = response.data.url;
		
		var img = new Image();
		var div = document.getElementById('original');
		img.src = imgURL;
		img.id = "profPic";
		img.setAttribute('crossOrigin', 'anonymous');
		img.setAttribute('height', '200px');
		img.setAttribute('width', '200px');

		img.onload = function() {
  		div.appendChild(img);
		loadCanvas();
		
};
	});  
    });
  };
  

  (function(d, s, id){
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) {return;}
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/en_US/sdk.js";
    fjs.parentNode.insertBefore(js, fjs);
  }(document, 'script', 'facebook-jssdk'));
  
</script>
  <div class="wrapper">
    
  <div class="content">
    <div class="prof_before">
    	<div class="clear_small" id="beforeTitle">
        <h3>&nbsp; </h3>
        <h3>&nbsp;</h3>
        <h2>Before</h2>
        <p>(click a filter to apply preview)</p>
        </div>
    	<div id="original" class="prof_picture">
        
        </div>
        <div class="clear_small"></div>
    </div>
    
    <div class="arrow_left">
    </div>
     
    <div class="center1">
    	<div class="filter">
        <img src="images/gayflag.png" width="80px" height="80px" onclick="changeIt(this.src);"> 
        </div>
    	
        <div class="filter">
        <img src="images/transflag.jpg" width="80px" height="80px" onclick="changeIt(this.src)"> 
        </div>
        
        <div class="filter">
        <img src="images/biflag.png" width="80px" height="80px" onclick="changeIt(this.src)"> 
        </div>
        
        <div class="filter">
        <img src="images/panflag.png" width="80px" height="80px" onclick="changeIt(this.src)"> 
        </div>
        
        <div class="filter">
        <img src="images/bdsm.png" width="80px" height="80px" onclick="changeIt(this.src)"> 
        </div>
    </div>
    
    <div class="center2">
    	<div class="filter">
        <img src="images/rainbowamericanflag.jpg" width="80px" height="80px" onclick="changeIt(this.src)"> 
        </div>
    	
        <div class="filter">
        <img src="images/lip_les.jpg" width="80px" height="80px" onclick="changeIt(this.src)"> 
        </div>
        
        <div class="filter">
        <img src="images/amflag.jpg" width="80px" height="80px" onclick="changeIt(this.src)"> 
        </div>
        
        <div class="filter">
        <img src="images/polyamory.png" width="80px" height="80px" onclick="changeIt(this.src)"> 
        </div>
        
        <div class="filter">
        <img src="images/canada.jpg" width="80px" height="80px" onclick="changeIt(this.src)"> 
        </div>
    </div>
    
    <div class="center3">
    	<div class="filter">
        <img src="images/bear.gif" width="80px" height="80px" onclick="changeIt(this.src)"> 
        </div>
    	
        <div class="filter">
        <img src="images/poly.jpg" width="80px" height="80px" onclick="changeIt(this.src)"> 
        </div>
        
        <div class="filter">
        <img src="images/asexual.png" width="80px" height="80px" onclick="changeIt(this.src)"> 
        </div>
        
        <div class="filter">
        <img src="images/firewoks.jpg" width="80px" height="80px" onclick="changeIt(this.src)"> 
        </div>
        
        <div class="filter">
        <img src="images/unionjack.jpg" width="80px" height="80px" onclick="changeIt(this.src)"> 
        </div>
    </div>
    
    <div class="arrow_right">
    </div>
    
    <div class="prof_after">
   		<div class="clear_small" id="afterText">
        <h3>&nbsp;</h3>
        <h3>&nbsp;</h3>
        <h2>After</h2>
        <p>(click to set profile picture)</p>
        </div>
   	  <div class="prof_picture" onclick="upload()">
        <canvas height="200px" width="200px" id="canvas"></canvas>
        <img id="afterImage">
        </div>
        <div class="clear_small">
        </div>
    </div>
  </div>

  </div>	
  
  
  </body>
  </html>
