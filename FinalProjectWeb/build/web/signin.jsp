<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đăng nhập</title>
        <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
        <% 
            Boolean check1 = (Boolean)request.getAttribute("check");
            if (check1 == null){
                check1 = true;
            }
        %>
    </head>

    <body style="background-image: url(2.png); background-repeat: no-repeat;">
        <div class="container">
            <div class="row" style="margin-top: 50px;">
                <div class="col-md-4 "></div>
                <div class="col-md-4 col-sm-4 col-xs-12" style="background-color: white">
                    <form action="signin" method="POST">
                        <h2>Đăng nhập</h2>

                        <div class="form-group">
                            <label>Tên đăng nhập</label>
                            <input type="text" class="form-control" placeholder="Tên đăng nhập" required name="user">	
                        </div>
                        <div class="form-group">
                            <label>Mật khẩu</label>
                            <input type="password" class="form-control" minlength="8" placeholder="Mật khẩu" required name="password">	
                        </div>

                        <div class="form-group">
                            <input type="radio" required name="access" value="1">
                            <label>Khách hàng</label>

<!--                            <input type="radio" name="access" required="" value="0">
                            <label>Quản lí</label>-->
                        </div>
                        <div class="form-group">
                            <label>Nếu bạn chưa có tài khoản, đăng kí<a href="CustomserSignUp"> tại đây</a> </label>
                        </div>
                        <div class="form-group" style="text-align: center">
                            <button class="btn btn-success" type="submit">Đăng nhập</button>
                                <% if(check1 == false){ %>
                                    <lable>Tên đăng nhập hoặc mật khẩu sai!</lable>
                                <%}%>
                        </div>
                    </form>
                </div>
                <div class="col-md-4 "></div>
            </div>
        </div>




        <script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>
    </body>
</html>
