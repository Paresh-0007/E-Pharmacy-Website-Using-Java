<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="javaapplication.controller.JWAView" %>
<%@ page import="javawebapplication.utility.ServletUtility" %> 

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
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

        .login-page {
            width: 350px;
            height: 450px;
            margin-left: 1px;
            border-radius: 1rem;
            background: rgb(235, 235, 235);
            position: absolute;
            top: 55%;
            left: 50%;
            transform: translate(-50%, -50%);
            color: #292929;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            transition: all .4s;
        }

        .login-page:hover {
            box-shadow: 0 0 50px rgba(0, 0, 0, 0.500);
        }

        .login-page h1 {
            margin-bottom: 25px;
        }

        .login-page form {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        .login-page form input {
            width: 250px;
            height: 35px;
            margin: 8px;
            background: rgb(218, 218, 218);
            border: none;
            padding-left: 10px;
            outline: none;
            transform: all .4s;
        }

        .login-page form input:focus {
            background: rgb(194, 194, 194);
        }

        .btn {
            color: white;
            font-weight: 600;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .login-page form .btn {
            width: 250px;
            height: 35px;
            margin: 8px;
            background: #10847e;
            border: none;
            border-radius: 1rem;
            outline: none;
            cursor: pointer;
            transition: all .9s;
        }

        .login-page form .btn:hover {
            background-color: #10847ecb;
        }

        .icons {
            width: 250px;
            height: 40px;
            margin: 10px 0;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .icons div {
            width: 122px;
            height: 40px;
            border: 2px solid #3b5998;
            border-radius: 4px;
            padding-left: 5px;
            display: flex;
            align-items: center;
            margin: 0 2px;
            transition: all .4s;
            cursor: pointer;
        }

        .icons div:nth-child(2) {
            border: 2px solid #4285f4;
        }

        .icons div i {
            margin: 8px;
            transition: all .4s;
            color: black;
        }

        .icons div:hover i {
            color: #e2e2e2;
        }

        .icons div:hover:nth-child(1) {
            background: #3b5998;
            color: #e2e2e2;
        }

        .icons div:hover:nth-child(2) {
            background: #4285f4;
            color: #e2e2e2;
        }

        .bi.bi-google {
            margin: 0;
        }

        .bi.bi-facebook {
            margin: 0;
        }

        .forgotpassword {
            margin-top: .8rem;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .link-fp {
            text-decoration: none;
            color: #df53df;
        }

        .link-fp:hover {
            color: #f585f5;
            text-decoration: underline;
        }
    </style>
    <title>Login Page</title>
</head>
<body>
    
    <div class="login-page">
        <h1>Login</h1>
        <h6 style="color: red;"><%=ServletUtility.getErrorMessage(request) %></h6>
        <form action="<%=JWAView.LoginCTL %>"  method="post">
            <input type="email" name="email" placeholder="Enter E-mail" required>
            <input type="password" name="password" placeholder="Enter Password" required>
            <button action="" type="submit" class="btn">Login</button>
            <P>Create an account</P>
            <a href="<%= JWAView.SignUpCTL %>"><p>or SignUp</p></a>
            

            <div class="forgotpassword"><a href="#" class="link-fp">Forgot password?</a></div>
        </form>
    </div>

</body>
</html>
    