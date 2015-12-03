  (function(d, s, id){
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) {return;}
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/en_US/sdk.js";
    fjs.parentNode.insertBefore(js, fjs);
  }(document, 'script', 'facebook-jssdk'));

function getAndSetProfilePicture(){
	var img = new Image();
	var div = document.getElementById('profile_picture');
	
	img.onload = function() {
		div.appengChild(img);
	};
	
	FB.api("/me/picture?width=180&height=180",  function(response) {
        console.log(response.data.url);
		img.src = response.data.url;
	});  
}