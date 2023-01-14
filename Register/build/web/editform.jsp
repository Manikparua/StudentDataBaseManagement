<%-- 
    Document   : signup
    Created on : 28-Mar-2022, 10:42:52 am
    Author     : manik
--%>

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
    </head>
    <body style="background: url(img/ali-mahmoudi-pPV3C0H-Xo0-unsplash.jpg);background-size: cover;background-attachment: fixed;">
        <input type="hidden" id="status" value="<%= request.getAttribute("status")%>" >
        <!--/////////-->
        <nav>
            <div class="nav-wrapper #212121 grey darken-4
                 ">
                <a href="#!" class="brand-logo" #f44336 >Logo</a>
                <a href="#" data-target="mobile-demo" class="sidenav-trigger"><i class="material-icons">menu</i></a>
                <ul class="right hide-on-med-and-down ">
                    <li><a href="#">Chat us</a></li>
                    <li><a href="#" style="color: #D32F2F;">Hello <%= session.getAttribute("name")%></a></li>
                    <li><a href="logout" style="color: #D32F2F;">logout</a></li>

                </ul>
            </div>
        </nav>
        <!--////////////-->

        <div class="container">
            <div class="row">
                <div class="col m6 offset-m3">
                    <div class="card"style="margin-top:50px;">
                        <div class="card-content">
                            <h3 class="center-align" style="margin-top: 10px;">Edit Here</h3>
                            <div class="form center-align">
                                <form action="Edit" method="get">

                                    <input type="hidden" placeholder="Enter id" name="user_id" value="<%=session.getAttribute("id")%>" >
                                    <input type="text" placeholder="Enter name" name="user_name" value="<%=session.getAttribute("name")%>" >
                                    <input type="email" placeholder="Enter email" name="user_email" value="<%=session.getAttribute("email")%>">
                                    <input type="password" placeholder="Enter password" name="user_pass" value="<%=session.getAttribute("password")%>">



                                    <button class="btn waves-effect waves-light #ff6d00 orange accent-4" type="submit" name="action">Submit
                                    </button>
                                    <button class="btn waves-effect waves-light #ff6d00 orange accent-4" type="back" name="back" href="index.jsp">Go back
                                    </button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script
            src="https://code.jquery.com/jquery-3.6.0.min.js"
            integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
        crossorigin="anonymous"></script>


        <script>
            $(document).ready(function () {
                console.log("Ready..")
            })
        </script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <link rel="stylesheet" href="alert/dist/sweetalert.css">
        <script>
            var status = document.getElementById("status").value;
            if (status == "failed") {
                swal("Sorry", "Problem occured)", "error")
            }

        </script>
    </body>
</html>
