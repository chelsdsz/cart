<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<%@ page import ="com.beans.Patient" %>
<%@ page import="java.util.*" %>
<%@page import="java.text.DateFormat" %>
<c:import url="header.jsp"></c:import>


<!-- Page Content -->
        <div id="page-content-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1>Search patient</h1> 
                        
                        
                        
                        <form method="post" action="<%=request.getContextPath() %>/Controller">
                        <input type="hidden" name="page" value="search_patient_form">
                         <div class="form-group">
                                             
                          
                           <div class="alert alert-success fade in">
                                  <button data-dismiss="alert" class="close close-sm" type="button">
                                      <i class="icon-remove"></i>
                                     
                                  </button>
                                
                                 Search Results
                              </div>      
                           
                           
                                    
                         </div>
                         </form>
                         <%
                         ArrayList<Patient> list = ( ArrayList<Patient>)request.getAttribute("list");
                         
                         if(list == null){
                        	 out.println("Results do not Match <BR> No such patient Exists");
                         }
                         else{
                        	 for(Patient p:list){
                        %>		
                        <a href="<%=request.getContextPath() %>/Controller?page=existing_patient_form&email=<%=p.getEmail() %>" ><% out.println("<H4>" +p.getName() +"</H4>"); %> </a> 
                        	<%
                        		 
                        		 out.println("<BR>" + p.getAddress());
                        		 out.println("<BR>" + p.getContact());
                        		 out.println("<BR>" + p.getEmail());
                        		 out.println("<BR><HR>");
                        		 
                        	                      		 
                        	 }
                         }
                         %>
                         <BR><BR>
                        <a href="#menu-toggle" class="btn btn-default" id="menu-toggle">Toggle Menu</a>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- /#page-content-wrapper -->