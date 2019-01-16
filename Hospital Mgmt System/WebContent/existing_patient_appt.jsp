<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<%@ page import ="com.beans.Patient" %>
<%@ page import="java.util.Date" %>
<%@page import="java.text.DateFormat" %>
<c:import url="header.jsp"></c:import>
  

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
                                 <c:out value="${msg }"></c:out>
                                 
                              </div>      
                        
                        
                        <form method="post" action="<%=request.getContextPath() %>/Controller">
                        <input type="hidden" name="page" value="existing_patient_form">
                         <div class="form-group">
                                             
                          <label class="col-sm-2 control-label">Email:</label>
                                      <div class="col-sm-7">
                                          <input type="text" class="form-control" name="email" value="<c:out value="${email }"></c:out>" >
                                      </div>
                                      
                           <BR><BR>
                           <input type="submit" name="submit" value="Book Appointment" class="btn btn-default">
                           <BR><BR>            
                         </div>
                         </form>
                        <a href="#menu-toggle" class="btn btn-default" id="menu-toggle">Toggle Menu</a>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- /#page-content-wrapper -->