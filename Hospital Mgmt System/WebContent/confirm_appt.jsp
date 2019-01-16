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
SELECT * from doctor
</sql:query>   

<%
Patient  p = (Patient)request.getAttribute("p");
%>
<!-- Page Content -->
        <div id="page-content-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1>Book Patient Appointment</h1> 
                        <div class="alert alert-success fade in">
                                  <button data-dismiss="alert" class="close close-sm" type="button">
                                      <i class="icon-remove"></i>
                                     
                                  </button>
                                
                                   
                              </div>      
                        
                        
                        <form method="post" action="<%=request.getContextPath() %>/Controller">
                        <input type="hidden" name="page" value="book_appt_form">
                         <div class="form-group">
                         
                         <label class="col-sm-2 control-label">Name:</label>
                                      <div class="col-sm-7">
                                      
                                          <input type="text" class="form-control" name="name" value="<%=p.getName() %>">
                                      </div>
                                 
                         </div>
                         <BR><BR>	
                      
                          <label class="col-sm-2 control-label">Email:</label>
                                      <div class="col-sm-7">
                                          <input type="text" class="form-control" name="email" value="<%=p.getEmail() %>" >
                                      </div>
                                      
                           <BR><BR>            
                          <label class="col-sm-2 control-label">Address:</label>
                                      <div class="col-sm-7">
                                          <input type="text" class="form-control" name="address" value="<%=p.getAddress() %>">
                                      </div>                        
							<BR><BR> 
						<label class="col-sm-2 control-label">Contact:</label>
                                      <div class="col-sm-7">
                                          <input type="text" class="form-control" name="contact" value="<%=p.getContact() %>">
                                      </div>	
                        <BR><BR> 
                        <HR>
                        <BR><BR>
                        <label class="col-sm-2 control-label">Doctor:</label>
                        <div class="col-sm-7">
                        <select name="doctor" class="form-control">
                        <option>--select doctor--</option>
                        <c:forEach var="row" items="${result.rows}">
                        <option value="<c:out value="${row.id }"></c:out>"><c:out value="${row.dname }"></c:out> </option>
                        </c:forEach>
                        </select>
                        </div>
                        <br><BR>
                        <%
                        Patient p1 = new Patient();
                        Date d1=p1.fetchDate(1);
                        DateFormat df = DateFormat.getDateInstance();
                        %>
                        <label class="col-sm-2 control-label">Date:</label>
                         <div class="col-sm-7">
                         <select name="date" class="form-control">
                         <option value="<%=df.format(new Date()) %>"><%=df.format(new Date()) %></option>
                         <option value="<%=df.format(d1) %>"><%=df.format(d1) %></option>
                         </select>
                         </div>
                         <br><BR>
                         
                         <label class="col-sm-2 control-label">Time:</label>
                         <div class="col-sm-7">
                         <select name="time" class="form-control">
                         <option value="slot1">10AM - 1PM</option>
                         <option value="slot2">2PM - 5PM</option>
                         </select>
                         </div>
                         <BR><BR>
                        <input type="submit" name="submit" value="Book Appointment" class="btn btn-default">
                        </form>
                        <BR><BR>
                        <a href="#menu-toggle" class="btn btn-default" id="menu-toggle">Toggle Menu</a>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- /#page-content-wrapper -->