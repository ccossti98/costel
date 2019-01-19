
	//validate fields
	// if(!document.getElementById('password').value === document.getElementById('password2').value) {
	// 	// set error fields to password fields
	// }
	// if(document.getElementById('username').value.trim().length === 0) {
	// 	//set error to username
	// 	document.getElementById('username').parentElement.classList += ' has-error';
	// 	var stringRegex = new RegExp("^([^0-9]*)$");
	// 	if(data.username != "" && data.username.match(stringRegex)){			       
	// 	    document.getElementById("username").classList.remove("input-error");
	// 	}else{
	// 	    document.getElementById("username").classList.add("input-error");	    
	// 	}
	// }
	// if(document.getElementById('email').value.trim().length === 0) {
	// 	//set error to email
	// 	var emailRegex = new RegExp("^([^0-9]*)$");
	// 	if(data.email!="" && data.email.match(stringRegex)){			       
	// 	    document.getElementById("email").classList.remove("input-error2");
	// 	}else{   
	// 	    document.getElementById("email").classList.add("input-error2");	    
	// 	}		
	// }
	// if(document.getElementById('password').value.trim().length === 0) {
	// 	//set error to password
	// 	if(data.password !="" && data.password.length > 5){
	// 		document.getElementById("password").classList.remove("input-error3");
	// 	}else{
	// 	    // this doesn't match
	// 	    document.getElementById("password").classList.add("input-error3");
		    
	// 	}
	// }
	// if(document.getElementById('password2').value.trim().length === 0) {
	// 	//set error to password2
	// }
	


	// var xhr = new XMLHttpRequest();
	// xhr.onreadystatechange = function() {
	// 	if(xhr.status === 200 && xhr.readyState === 4) {
	// 		console.log(JSON.parse(xhr.responseText).result);
	// 	}
	// }

	// xhr.open("POST", 'http://localhost/github_project/EneredMay/api/register', true);
	// xhr.send(JSON.stringify(data));


$('#register').on('click', function() {
	var data = {
		"username": $('#username').val(),
		"email": $('#email').val(),
		"password": $('#password').val(),
	}

	if(data.username.length < 5) {
		$($('#username')[0].parentElement).addClass('has-error');	
	} else {
		$($('#username')[0].parentElement).removeClass('has-error');
	}

	if(validateEmail(data.email)) {
		$($('#email')[0].parentElement).removeClass('has-error');
	} else {
		$($('#email')[0].parentElement).addClass('has-error');
	}

	if(data.password.trim().length === 0 && data.password.length > 5){
		$($('#password')[0].parentElement).removeClass('has-error');
	}else{
		$($('#password')[0].parentElement).addClass('has-error');
	}

	if(document.getElementById('password').value === document.getElementById('password2').value){
		$($('#password')[0].parentElement).removeClass('has-error');
		$($('#password2')[0].parentElement).removeClass('has-error');
	}else{
		$($('#password')[0].parentElement).addClass('has-error');
		$($('#password2')[0].parentElement).addClass('has-error');
	}


	$.ajax({
	  type: "POST",
	  // github_project\EneredMay\EneredMay\api
	  url: "http://localhost/github_project/EneredMay/api/register",
	  data: JSON.stringify(data),
	  success: function(response) {
	  	console.log(JSON.parse(response));
	  }
	});

});

function validateEmail(email) {
    var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(String(email).toLowerCase());
}

$('#goToRegister').on('click', function() {
	$('.register-form').removeClass('displayNone');
	$('.signIn-form').addClass('displayNone');
});

$('#goToSignIn').on('click', function() {
	$('.register-form').addClass('displayNone');
	$('.signIn-form').removeClass('displayNone');
});
