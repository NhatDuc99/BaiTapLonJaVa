<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đăng kí</title>
        <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
    </head>
    <body style="background-image: url(1.jpg); background-repeat: no-repeat;">
        <div class="container">
            <div class="row">
                <div class="col-md-1 col-sm-1 col-xs-12"></div>
                <div class="col-md-5 col-sm-5 col-xs-12" style="background-color: white">
                    <form action="CustomserSignUp" method="POST">
                        <h2>Đăng ký</h2>
                        <div class="row">
                            <div class="col">
                                <label>Họ và Tên</label>
                                <input type="text" class="form-control" placeholder="Họ và tên của bạn" required name="name">
                            </div>

                        </div>
                        <div class="form-group">
                            <label>Email</label>
                            <input type="Email" class="form-control" placeholder="Email của bạn" required name="email">	
                        </div>
                        <div class="form-group">
                            <label>Tên đăng nhập</label>
                            <input type="text" class="form-control" placeholder="Tên đăng nhập" required name="user">	
                        </div>
                        <div class="form-group">
                            <label>Mật khẩu</label>
                            <input type="password" class="form-control" minlength="8" placeholder="Mật khẩu" required name="password">	
                        </div>
                        <div class="form-group">
                            <label>Giới tính</label>
                            <div class="row" data-toggle="buttons">
                                <div class="col">
                                    <label class="btn btn-outline-secondary">Nam
                                        <input type="radio" name="gender" value="1">

                                    </label>
                                </div>
                                <div class="col">
                                    <label class="btn btn-outline-secondary">Nữ
                                        <input type="radio" name="gender" value="0">

                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>Ngày sinh</label>
                            <input type="text" class="form-control" placeholder="yyyy-MM-dd" required name="date">	
                        </div>
                        <div class="form-group">
                            <label>Điện thoại liên hệ</label>
                            <input type="text" class="form-control" placeholder="Số điện thoại của bạn" required name="telephone">	
                        </div>
<!--                        <div class="form-group">
                            <label>Địa chỉ</label>
                            <input type="text" class="form-control" placeholder="Địa chỉ" required name="add">	
                        </div>-->


                        <div class="form-group">
                            <input type="checkbox" required="" name="">
                            <label>Tôi đồng ý với điều khoản sử dụng</label>
                        </div>

                        <div class="form-group">
                            <button class="btn btn-success" type="submit">Gửi</button>	

                        </div>
                    </form>
                </div>
            </div>
        </div>




        <script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>
    </body>
</html>
