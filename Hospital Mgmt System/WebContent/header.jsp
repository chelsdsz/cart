<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Hospital(Patient) Management System</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/simple-sidebar.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <div id="wrapper">

        <!-- Sidebar -->
        <div id="sidebar-wrapper">
            <ul class="sidebar-nav">
                <li class="sidebar-brand">
                    <a href="<%=request.getContextPath() %>/Controller">
                        HMS
                    </a>
                </li>
                <li>
                    <a href="<%=request.getContextPath() %>/Controller?page=book_appt">Book Appointment</a>
                </li>
                <li>
                    <a href="<%=request.getContextPath() %>/Controller?page=search_p">Search Patient</a>
                </li>
                <li>
                    <a href="<%=request.getContextPath() %>/Controller?page=all_appt">All Appointments(Today)</a>
                </li>
                <li>
                    <a href="<%=request.getContextPath() %>/Controller?page=all_appt_tom">All Appointments(Tomorrow)</a>
                </li>
                
            </ul>
        </div>
        <!-- /#sidebar-wrapper -->

        
<!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script> 
    
    <!-- /#wrapper -->

   
</body>

</html>
