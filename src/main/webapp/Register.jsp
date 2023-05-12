<%@page import="com.helper.Message"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  
<title>MyCart:Register</title>
<%@include file="common_components/common_links.jsp" %>
</head>
<body>

<%@include file="common_components/navbar.jsp" %>
<div class="container" id="container">
            <div class="mycard" id="register-card">
           
                <div class="row" id="row">
            
                        <div class="col-md-2"></div>
                        <div class="col-md-6">
                                        <div class="myLeftCtn">
                                              <form autocomplete="off" action="RegisterServlet"  method="post" class="my form text-center" id="myregisterform">
                                                    <header>Create your account</header>
                                                    <div id="message"></div>
                                                    <div class="form-group">
                                                      <i  class="fas fa-user ii"> </i>
                                                    <input name="u_name" class="myInput"    type="text"  placeholder="username"  id="username" ><br>
                                                    <span class="danger" id="username_err" style="color:red;"> </span>
                                                     </div>
                                                       <div class="form-group">
                                                    <i class="fas fa-envelope ii"> </i>
                                                    <input name="u_email"  class="myInput"    type="email"  placeholder="Email"  id="email" ><br>
                                                    <span class="danger" id="email_err"  style="color:red;"> </span>
                                                     </div>
                                                   <div class="form-group"  style="margin-left: -23px; ">
                                                    <i class="fas fa-lock ii"> </i>
                                                    <input  name="u_password"  class="myInput"    type="password"  placeholder="password"  id="password">
                                                    <i class="far fa-eye" id="togglePassword1" style="margin-left: -40px; cursor: pointer;"></i>
                                                     <br>
                                                    <span class="danger" id="password_err" style="color:red;"> </span>
                                                     </div>
                                                     <div class="form-group "style="margin-left: -23px; ">
                                                      <i class="fas fa-lock ii"></i>
                                                      <input   name="u_cpassword"  class="myInput"    type="password"  placeholder="confirm password"  id="cpassword">
                                                      <i class="far fa-eye" id="togglePassword2" style="margin-left: -40px; cursor: pointer;"></i>
                                                      <br>
                                                      <span class="danger" id="cpassword_err" style="color:red;"> </span>
                                                       </div>
                                                      <div class="form-group">
                                                    <i class="fa fa-phone-square ii"> </i>
                                                    <input  name="u_phone"  class="myInput"    type="text"  placeholder="phonenumber"  id="phone" ><br>
                                                    <span class="danger" id="mobile_err" style="color:red;"> </span>
                                                     </div>
                                                      <div class="form-group">
                                                    <i class="fas fa-home ii"></i>
                                                    <input  name="u_address"  class="myInput"   type="text"  placeholder="Address"  id="address" >
                                                    <br>
                                                    <span class="danger" id="address_err" style="color:red;"> </span>
                                                     </div>
                                                    <div class="form-group">
                                                   <label>
                                                    <input id="check_1" name="check_1" type="checkbox"  required>
                                                    <small>I read  and agree to Terms and Conditions</small>
                                                     </label>
                                                       </div>
                                                        <button type="submit" id="submitbtn" class="butt">CREATE ACCOUNT</button>
                                                  <!--    <input id="submitbtn"  type="submit" class="butt" value="CREATE ACCOUNT" > -->
                                                      <input type="reset" class="buttreset " value="RESET">
                                              </form>
                                        </div>
                        </div>
                        <div class="col-md-4">
                                <div class="myRightCtn">
                                   <div class="box"><header>Hello there!!!</header>
                                   <p>Nepal, formerly the Federal Democratic Republic of Nepal,
                                    is a landlocked country in South Asia. It is mainly situated in the Himalayas, 
                                    but also includes parts of the Indo-Gangetic Plain, bordering ...
                                   </p>
                                   <input type="button" class="butt_out" value="Learn more">
                                   </div>
                                </div>
                        </div>
                       
                </div>
            </div>
        </div>
        <!--  -validation-->
        <script>
          $(document).ready(function () {
            $('#username').on('input', function () {
             checkuser();
             });
             $('#email').on('input', function () {
                checkemail();
            });
               $('#password').on('input', function () {
              checkpass();
            });
            $('#cpassword').on('input', function () {
                checkcpass();
            });
            $('#phone').on('input', function () {
                checkmobile();
            });
            $('#address').on('input', function () {
                checkaddress();
            });
            $('#submitbtn').click(function () {

              if (!checkuser() && !checkemail() && !checkmobile() && !checkpass() && !checkcpass() && !checkaddress ()) {
            console.log("er1");
            $("#message").html(`<div class="alert alert-danger">Please fill all required field</div>`);
            }
            else if (!checkuser() || !checkemail() || !checkmobile() || !checkpass() || !checkcpass() || !checkcpass()) {
            $("#message").html(`<div class="alert alert-danger">Please fill all required field</div>`);
            console.log("er");
          }
          else {
            console.log("ok");
            $("#message").html("");
            var form = $('#myregisterform')[0];
            var data = new FormData(form);
          
            $.ajax({
                  url:"RegisterServlet",
			      type:'POST',
				 data:  data	,
				 processData: false,
	                contentType: false,
	                cache: false,
	                async: false,
	                beforeSend: function () {
	                    $('#submitbtn').html('<i class="fa-solid fa-spinner fa-spin"></i>');
	                    $('#submitbtn').attr("disabled", true);
	                    $('#submitbtn').css({ "border-radius": "50%" });
	                },
           success: function (data) {
              console.log(data);
                 swal({
					  title: "Registration Successfully!!!",
					  text:  "Login and enjoy your shopping",
					  icon: "success",
					  successMode: true,
					})
					.then((value) => {
					window.location="Login.jsp";
					});
                     },
                     complete: function () {
                         setTimeout(function () {
                             $('.myform').trigger("reset");
                             $('#submitbtn').html('Submit');
                             $('#submitbtn').attr("disabled", false);
                             $('#submitbtn').css({ "border-radius": "4px" });
                         }, 50000);
                     }
            });
          }

     });
 });
          
          function checkuser() {
              var pattern = /^[A-Z a-z 0-9]+$/;
              var user = $('#username').val();
              var validuser = pattern.test(user);
              if ($('#username').val().length < 4) {
                  $('#username_err').html('username length is too short');
                  return false;
              } else if (!validuser) {
                  $('#username_err').html('username should be a-z ,A-Z only');
                  return false;
              } else {
                  $('#username_err').html('');
                  return true;
              }
          }
          function checkemail() {
    var pattern1 = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
    var email = $('#email').val();
    var validemail = pattern1.test(email);
    if (email == "") {
        $('#email_err').html('required field');
        return false;
    } else if (!validemail) {
        $('#email_err').html('invalid email');
        return false;
    } else {
        $('#email_err').html('');
        return true;
    }
}
function checkpass() {
    console.log("sass");
    var pattern2 = /^(?=.*\d)(?=.*[!@#$%^&*])(?=.*[a-z])(?=.*[A-Z]).{8,}$/;
    var pass = $('#password').val();
    var validpass = pattern2.test(pass);

    if (pass == "") {
        $('#password_err').html('password can not be empty');
        return false;
    } else if (!validpass) {
        $('#password_err').html('Minimum 5 and upto 15 characters, at least one uppercase letter, one lowercase letter, one number and one special character:');
        return false;

    } else {
        $('#password_err').html("");
        return true;
    }
}
function checkcpass() {
    var pass = $('#password').val();
    var cpass = $('#cpassword').val();
    if (cpass == "") {
        $('#cpassword_err').html('confirm password cannot be empty');
        return false;
    } else if (pass !== cpass) {
        $('#cpassword_err').html('confirm password did not match');
        return false;
    } else {
        $('#cpassword_err').html('');
        return true;
    }
}

function checkmobile() {
    if (!$.isNumeric($("#phone").val())) {
        $("#mobile_err").html("only number is allowed");
        return false;
    } else if ($("#phone").val().length != 10) {
        $("#mobile_err").html("10 digit required");
        return false;
    }
    else {
        $("#mobile_err").html("");
        return true;
    }
}
function checkaddress() {
	var address = $('#address').val();
    
    if (address == "") {
         $('#address_err').html('Address can not be empty');
     return false;}
     else {
        $('#address_err').html('');
        return true;
     }

}
const togglePassword1 = document.querySelector('#togglePassword1');
  const password1 = document.querySelector('#password');
  togglePassword1.addEventListener('click', function (e) {
    // toggle the type attribute
    const type = password1.getAttribute('type') === 'password' ? 'text' : 'password';
    password.setAttribute('type', type);
    // toggle the eye slash icon
    this.classList.toggle('fa-eye-slash');
    });

  const togglePassword2=document.querySelector('#togglePassword2');
  const password2 = document.querySelector('#cpassword');
  togglePassword2.addEventListener('click', function (e) {
    const type = password2.getAttribute('type') === 'password' ? 'text' : 'cpassword';
    cpassword.setAttribute('type', type);
    // toggle the eye slash icon
    this.classList.toggle('fa-eye-slash');
    });
 </script>

</body>
</html>