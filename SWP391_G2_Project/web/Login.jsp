<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login in Frica</title>
        <link rel="stylesheet" href="./style.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    </head>
    <body>
        <div class="wrapper">
            <div class="title-text">
                <div class="title login">Login Form</div>
                <!--                <div class="title signup">Sign up Form</div>-->
            </div>
            <div class="form-container">
                <div class="form-inner">
                    <c:set var="cookie" value="${pageContext.request.cookies}"></c:set>
                    <form action="login" method="post" class="login">
                        <div class="field">
                            <input name="username" type="text" placeholder="Tên đăng nhập" value="${cookie.cuser.value}" required>
                        </div>
                        <div class="field">
                            <input name="password" type="password" placeholder="Mật khẩu" value="${cookie.cpass.value}" required>
                        </div>
                        <div class="pass-link"><a href="resetpass">Quên mật khẩu</a></div>
                        </br> 
                        <div class="pass-link">
                            <input type="checkbox" 
                                   ${(cookie.crem!=null?'checked':'')} name="rem" value="ON"/> Nhớ tài khoản  
                        </div>

                        <div class="field btn">
                            <div class="btn-layer"></div>
                            <input type="submit" value="Login">
                        </div>
                        <p class="alert-danger" >${mess}</p>
                        <div class="signup-link">Tạo tài khoản : <a href="Register.jsp">Đăng ký</a></div>
                    </form>
                </div>
            </div>
        </div>
        <script  src="./script.js"></script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    </body>
</html>