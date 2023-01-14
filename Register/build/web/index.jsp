<%-- 
    Document   : index
    Created on : 21-Aug-2022, 5:42:31 pm
    Author     : manik
--%>
<%
    if (session.getAttribute("name") == null) {
        response.sendRedirect("signup.jsp");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- Compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

        <!-- Compiled and minified JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
        <style>

        </style>

    </head>
    <body style="background: url(img/ali-mahmoudi-pPV3C0H-Xo0-unsplash.jpg);background-size: cover;background-attachment: fixed;">       
        <input type="hidden" id="status" value="<%= request.getAttribute("status")%>">
        <nav>
            <div class="nav-wrapper #212121 grey darken-4">
                <a href="#!" class="brand-logo"  style="color:#f44336 ;">Logo</a>
                <a href="#" data-target="mobile-demo" class="sidenav-trigger"><i class="material-icons">menu</i></a>
                <ul class="right hide-on-med-and-down ">
                    <li><a href="http://wa.me/+918695823041">Chat us</a></li>
                    <li><a href="#" style="color: #D32F2F;">Hello <%= session.getAttribute("name")%></a></li>
                    <li><a href="logout" style="color: #D32F2F;">logout</a></li>

                </ul>
            </div>
        </nav>

        <!--/////////////////-->
        <div class="container">
            <div class="row">
                <div class="col m6 offset-m3">
                    <div class="card"style="margin-top:50px;">
                        <div class="card-content">
                            <h3 class="center-align" style="margin-top: 10px;">Your Profile</h3>
                            <div class="form center-align">
                                <div class="card blue-grey darken-1">
                                    <div id="mycard" class="card-content white-text ">
                                        <span class="card-title"><%= session.getAttribute("name")%></span>
                                        <h6>Your ID: <%= session.getAttribute("id")%></h6>
                                        <h6>Your email: <%= session.getAttribute("email")%></h6>
                                        <h6>Your password: <%= session.getAttribute("password")%></h6>

                                        <p></p>
                                    </div>
                                    <div class="card-action">
                                        <a href="editform.jsp">Update email</a>
                                        <a href="editform.jsp">Change password</a>
                                    </div>
                                </div>                     
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>










        <footer class="page-footer #212121 grey darken-4"style="margin-top:160px">
            <div class="container center-align">
                Contact us:-><br><!-- comment -->
                Mobile: +91 6295525438
                Email: manikparua568@gmail.com

            </div>
            <div class="footer-copyright">
                <div <style="text-align:center">
                    © 2014 Copyright Text
                </div>
            </div>
        </footer>
    </body>


    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <link rel="stylesheet" href="alert/dist/sweetalert.css">
    <script>
        var status = document.getElementById("status").value;
        if (status == "success") {
            swal("Congratulation", "Login Successfull", "success")
        }

    </script>
</html>
