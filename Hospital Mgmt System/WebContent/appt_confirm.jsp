<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<%@ page import ="com.beans.Patient" %>
<%@ page import="java.util.Date" %>
<%@page import="java.text.DateFormat" %>


<c:import url="header.jsp"></c:import>

<sql:setDataSource var="ds" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost/hospital" 
     user="root"  password=""/>
<sql:query dataSource="${ds}" var="result">
SELECT dname from doctor where id = '<%=request.getAttribute("doctor") %>' ;
</sql:query>   


<!-- Page Content -->
        <div id="page-content-wrapper">
            <div class="container-fluid">
                <div class="row">
 <div class="alert alert-success fade in">
                                  <button data-dismiss="alert" class="close close-sm" type="button">
                                      <i class="icon-remove"></i>
                                  </button>
                                 <strong> Appointment Confirmation</strong>
                              </div>      
                              
 Name: <%=request.getAttribute("name") %>
 <BR><BR>
 Email: <%=request.getAttribute("email") %>
 <BR><BR>
 Contact: <%=request.getAttribute("contact") %>
 <BR><BR>
 Address: <%=request.getAttribute("address") %>
 <BR><BR>
 <HR>
 <BR><BR>
 <c:forEach var="row" items="${result.rows}">
 Doctor: <c:out value="${row.dname }"></c:out>
 <BR><BR>
 </c:forEach>
 Date: <%=request.getAttribute("date") %>
 <BR><BR>
  
 <% 
 String time  = (String)request.getAttribute("time");
 if(time.equals("slot1")){
	 time = "10.00AM to 1.00 PM";
 }
 else{
	 time = "2.00PM to 5.00 PM";
 }
 %>
 Time: <%=time %>
 <BR><BR>
 </div>
 </div>
 </div>
 
 
 
 
 
                              