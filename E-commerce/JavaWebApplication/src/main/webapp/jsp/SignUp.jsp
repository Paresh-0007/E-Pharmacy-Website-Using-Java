<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="javaapplication.controller.JWAView" %>
<%@ page import="javawebapplication.utility.ServletUtility" %>    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE,edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <style>
        * {
            margin: 0;
            padding: 0;
            font-family: sans-serif;
            box-sizing: border-box;
        }

        body {
            height: 100vh;
            background: linear-gradient(to right, #335399, #00ff9d);
        }

        h1 {
            font-weight: bold;
        }

        a {
            text-decoration: none;
        }

        p:hover {
            text-decoration: underline;
        }

        .sign-up-page {
            width: 350px;
            height: 550px;
            margin-left: 1px;
            border-radius: 1rem;
            background: rgb(235, 235, 235);
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            color: #292929;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            transition: all .4s;
        }

        .sign-up-page:hover {
            box-shadow: 0 0 50px rgba(0, 0, 0, 0.500);
        }

        .sign-up-page h1 {
            margin-bottom: 25px;
        }

        .sign-up-page form {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        .sign-up-page form input {
            width: 250px;
            height: 35px;
            margin: 10px;
            background: rgb(218, 218, 218);
            border: none;
            padding-left: 10px;
            outline: none;
            transform: all .4s;
        }

        .sign-up-page form input:focus {
            background: rgb(194, 194, 194);
        }

        .btn {
            color: white;
            font-weight: 600;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .sign-up-page form .btn {
            width: 250px;
            height: 35px;
            margin: 15px;
            background:#10847e;
            border: none;
            border-radius: 1rem;
            outline: none;
            cursor: pointer;
            transition: all .4s;
        }

        .sign-up-page form .btn:hover {
            background-color: #10847ecb;
        }
    </style>
    <title>Sign-Up Page</title>
    <script>
        function checkPasswordMatch() {
            var password = document.getElementById("password").value;
            var confirm_password = document.getElementById("confirm_password").value;
            var error_message = document.getElementById("password_error_message");

            if (password === confirm_password) {
                error_message.innerHTML = "";
            } else {
                error_message.innerHTML = "Passwords do not match";
            }
        }
    </script>
</script>
    
</head>
<body>

    <div class="sign-up-page">
        <h1>Sign Up</h1>
        <h3 style="color: green;"><%=ServletUtility.getSuccessMessage(request)%></h3>
        <h3 style="color: red;"><%=ServletUtility.getErrorMessage(request)%></h3>
        <form action="<%=JWAView.SignUpCTL %>" method="post">
            <input type="name" name="fullname" placeholder="Enter Full Name" required>
            <input type="email" name="email" placeholder="Enter E-mail" required>
            <input type="password" name="password" id="password" placeholder="Enter Password" required>
            <input type="password" name="cpassword" id="confirm_password" placeholder="Confirm Password" required pattern="^.*$" title="Passwords do not match" oninput="checkPasswordMatch()">
            <div id="password_error_message" style="color: red;"></div>
            <input type="text" name="mobileNo" placeholder="Enter Mobile number" required pattern="[0-9]{10}" title="Please add a valid mobile number (exactly 10 digits)">
            <button action="" type="submit" class="btn">Sign Up</button>
            <a>Do you have an account?</a>
            <a href="<%= JWAView.LoginCTL %>"><p>Login Here</p></a>
        </form>
    </div>
    
</body>
</html>
    