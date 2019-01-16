
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page import="java.util.Date" %>
<%@page import="java.text.DateFormat" %>
<%@page import="com.beans.Patient" %>
<c:import url="header.jsp"></c:import>

<sql:setDataSource var="ds" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost/hospital" 
     user="root"  password=""/>
<%
Patient p = new Patient();
Date date = p.fetchDate(1);
%>

<sql:query dataSource="${ds}" var="result">
SELECT * from patient,books_appt,doctor where patient.id = books_appt.patient_id AND books_appt.doctor_id = doctor.id 
AND date = '<%=DateFormat.getDateInstance().format(date) %>';
</sql:query>   


<!-- Page Content -->
        <div id="page-content-wrapper">
            <div class="container-fluid">
                <div class="row">
                      <div class="col-lg-12">
                        <h1>All Appointments for Tomorrow(<%=DateFormat.getDateInstance().format(date) %>)</h1>
                        </div>
                        
                       
                      <section class="panel">
                          <font color="red"><c:out value="${msg }"></c:out></font>
                          
                          <table class="table table-striped table-advance table-hover">
                           <tbody>
                              <tr>
                                 <th><i class="icon_profile"></i> Patient Name</th>
                                 <th><i class="icon_mail_alt"></i> Email</th>
                                 <th><i class="icon_mobile"></i> Mobile</th>
                                  <th><i class="icon_pin_alt"></i> Doctor Name</th>
                                   <th><i class="icon_pin_alt"></i> Time Slot</th>
                                 <th><i class="icon_cogs"></i> Action</th>
                              </tr>

                              <c:forEach var="row" items="${result.rows}">
                                                            
 								<tr>
                                 <td><c:out value="${row.name }"></c:out></td>
                                 <td><c:out value="${row.email }"></c:out></td>
                                 <td><c:out value="${row.contact }"></c:out></td>
                                 <td><c:out value="${row.dname }"></c:out></td>
                                 <td>
                                 <c:if test='${row.time == "slot1" }'>
                                 <c:out value="10.00 AM - 1.00 PM"></c:out>
                                 </c:if>
                                 <c:if test='${row.time == "slot2" }'>
                                 <c:out value="2.00 PM - 5.00 PM"></c:out>
                                 </c:if>
                                 
                                 </td>
                                 <td>
                                  <div class="btn-group">
                                     
                                      <a class="btn btn-danger" href="<%=request.getContextPath() %>/Controller?page=cancel_appt_tom&patient_id=<c:out value="${row.patient_id }"></c:out>&doctor_id=<c:out value="${row.doctor_id }"></c:out>">Cancel Appointment</a>
                                  </div>
                                  </td>
                              </tr>
                              
								</c:forEach>
                              
                             
                              
                        </tbody>
                        </table>
                        </section>
                        
                </div>
            </div>
        </div>
        
        <!-- /#page-content-wrapper -->
        
        

    <!-- Menu Toggle Script -->
    
        