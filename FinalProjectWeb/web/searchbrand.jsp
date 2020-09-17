<%@page import="model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Customer"%>
<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="stylehome.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <%
            Customer cs = (Customer) request.getSession().getAttribute("customer");
            DecimalFormat decimal = new DecimalFormat("###.###############################");

            String nameBrand = (String) request.getAttribute("namebrand");
            ArrayList<Product> listProductByBrand = (ArrayList<Product>) request.getAttribute("productbybrand");


        %>
    </head>
    <body>
        <header class="header">
            <div class="header-top">
                <div class="container">
                    <div class="col-md-12 ">
                        <ul class="header-top-right">
                            <li style="color: white;">
                                <% if (cs == null) { %>
                            <li style="color: white;">
                                <a href="signin.jsp">
                                    <i class="fa fa-user" style="color: white; font-size: 15px">
                                        Đăng nhập	
                                    </i>

                                </a>
                            </li>

                            <li style="color: white;">
                                <a href="signup.jsp">
                                    <i class="fa fa-user-plus" style="color: white; font-size: 15px" >
                                        Đăng kí
                                    </i>
                                </a>
                            </li>
                            <%} else {%>
                            <li style="color: white;">
                                <a href="">
                                    <i class="fa fa-user" style="color: white; font-size: 15px">
                                        <%=cs.getName()%>	
                                    </i>
                                </a>
                            </li>

                            <li style="color: white;">
                                <a href="SignOut">
                                    <i class="fa fa-power-off" style="color: white; font-size: 15px" >
                                        Đăng xuất
                                    </i>
                                </a>
                            </li>
                            <%}%>
                            </li>

                            <li style="color: white;">
                                <a href="Cart">
                                    <i class="fa fa-shopping-cart" style="color: white; font-size: 15px" >
                                        Giỏ hàng
                                    </i>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="header-content">
                <div class="container">
                    <div class="row">
                        <div class="col-md-3 col-sm-4">
                            <div>
                                <a href="http://localhost:8080/FinalProjectWeb/Homepage" class="header-logo">
                                    <img src="mainlogo/12.png" style="width:225px; height:150px">
                                </a>
                            </div>	
                        </div>

                        <div class="col-md-9 col-sm-8">
                            <div class="header-content-right">
                                <div class="row">
                                    <div class="col-md-7 col-sm-12">
                                        <div class="header-search">
                                            <form action="SearchProduct" method="POST"  >
                                                <input type="text" id="header-search-input" style="padding: 6px 10px;" placeholder="Tìm kiếm sản phẩm" 
                                                       name="searchProduct">
                                                <button id = "header-search-btn" type="submit">Tìm

                                                </button>
                                            </form>
                                        </div>
                                    </div>
                                    <div class="col-md-3 col-sm-6">
                                        <div class="header-hotline">
                                            <a href="">
                                                <strong>Hotline: 0888839515</strong>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="col-md-2 col-sm-4">

                                    </div>
                                </div>
                            </div>
                            <div class="main-nav">
                                <div class="main-nav-content">
                                    <nav class="navbar navbar-expand-lg navbar-light bg-light">

                                        <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                                            <div class="navbar-nav">
                                                <a class="nav-item nav-link active" href="http://localhost:8080/FinalProjectWeb/Homepage">Trang chủ<span class="sr-only">(current)</span></a>
                                                <a class="nav-item nav-link" href="#">Giới thiệu</a>
                                                <a class="nav-item nav-link" href="#">Sản phẩm</a>
                                                <a class="nav-item nav-link" href="#">Đánh giá</a>
                                                <a class="nav-item nav-link" href="#">Tư vấn</a>
                                                <a class="nav-item nav-link" href="#">Thủ thuật - Mẹo hay</a>
                                                <a class="nav-item nav-link" href="#">Liên hệ</a>
                                            </div>
                                        </div>
                                    </nav>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>

        <div class="container" style="margin-top: 15px;">
            <div class="row" style="margin-top: 30px;">
                <div class="col-md-12">
                    <div class="product-home-title" style="margin-bottom: 10px">
                        <div class="title-product">
                            <h3><%=nameBrand%></h3>
                        </div>
                    </div>
                    <div class="product-list">
                        <div class="row">
                            <%for (Product p : listProductByBrand) {%>
                            <div class="col-md-2">
                                <div class="product-item">
                                    <div class="product-image">
                                        <img src="<%=p.getImage()%>">
                                    </div>
                                    <div class="product-content">
                                        <div class="product-name">
                                            <h4> <a href="detailproduct?id=<%= p.getId()%>"> <%=p.getName()%></a></h4>
                                        </div>
                                        <div class="product-price">
                                            <p >
                                                <%=decimal.format(p.getPrice())%>đ
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%}%>



                        </div>

                    </div>
                </div>
            </div>  

        </div>                    





        <footer class="footer" >
            <div class="container-fluid" style="height: 40px; background-color:#47d147;">
                <div>
                    <h4 style="    margin: 0;
                        font-size: 16px;
                        font-weight: 500;
                        line-height: 40px;
                        color: white; 
                        ">
                        <i>Cảm ơn quý khách !</i>
                    </h4>

                </div>
            </div>
            <div class="container footer-content">
                <div class="row">
                    <div class="col-md-4">
                        <h3 class="header1">Mobile Store - Mobiles & Accessories</h3>
                        <h4 class="header">THUẬN LÒNG KHÁCH ĐẾN AN LÒNG KHÁCH ĐI</h4>
                        <p class="for-p">Đại học Hàng Hải</p>
                        <p class="for-p">Hỗ trợ kĩ thuât : 8888888888</p>
                        <p class="for-p">Liện hệ mua hàng : 8888888888</p>
                        <p class="for-p">Chăm sóc khách hàng : 8888888888</p>
                        <p class="for-p">Fanpage Facebook : www.facebook.com/nhatduc1999</p>
                    </div>
                    <div class="col-md-1"></div>
                    <div class="col-md-3">
                        <h4 class="header">Giới thiệu chung</h4>
                        <p class="for-p">Trang chủ</p>
                        <p class="for-p">Sản phẩm</p>
                        <p class="for-p">Tin tức</p>
                        <p class="for-p">Liên hệ</p>

                        <h4 class="header" style="margin-top: 30px;">Kết nối với chúng tôi</h4>
                        <ul class="footerlist">
                            <li><i class="fa fa-facebook-square"></i></li>
                            <li><i class="fa fa-instagram"></i></li>
                            <li><i class="fa fa-google"></i></li>
                            <li><i class="fa fa-youtube"></i></li>
                            <li><i class="fa fa-twitter"></i></li>
                        </ul>
                    </div>
                    <div class="col-md-4">
                        <h4 class="header" ">Các hình thức thanh toán</h4>
                        <img src="https://bizweb.dktcdn.net/100/304/148/themes/648215/assets/pay.png?1570612224244">
                    </div>
                </div>
            </div>
        </footer>


        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>       
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    </body>
</html>
