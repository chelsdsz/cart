package com.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.account.Account;
import com.beans.Patient;

public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String page = request.getParameter("page");//null
		if(page == null){
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		else{
			doPost(request,response);
		}
		 
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String page = request.getParameter("page");//book_appt
		if(page.equals("book_appt")){
			request.setAttribute("msg", "");
			request.getRequestDispatcher("book_appt.jsp").forward(request, response);
		}
		
		if(page.equals("book_appt_form")){
			String name = request.getParameter("name");
			String email=request.getParameter("email");
			String address=request.getParameter("address");
			String contact=request.getParameter("contact");
			String doctor=request.getParameter("doctor"); //id
			String date=request.getParameter("date");
			String slot=request.getParameter("time");
			
			Patient p = new Patient();
			boolean status = p.validate(name,email,address,contact,doctor);
			
			if(status == true){
				Account account = new Account();
				try{
					account.dbConnect();
				boolean status1  = account.checkPatient(email);	
				if(status1 == false){
					account.insertPatient(name,email,address,contact);
				}
				int id = account.fetchId(email);
				account.insertAppt(id,doctor,date,slot);
				account.dbClose();
				}
				catch(Exception e){
					e.printStackTrace();
				}
				
				request.setAttribute("name", name);
				request.setAttribute("email", email);
				request.setAttribute("address", address);
				request.setAttribute("contact", contact);
				request.setAttribute("doctor", doctor);
				request.setAttribute("date", date);
				request.setAttribute("time", slot);
				
				request.getRequestDispatcher("appt_confirm.jsp").forward(request, response);
			}
			else{
				request.setAttribute("name", name);
				request.setAttribute("email", email);
				request.setAttribute("address", address);
				request.setAttribute("contact", contact);
				request.setAttribute("msg", p.getMsg());
				request.getRequestDispatcher("book_appt.jsp").forward(request, response);
			}
		}
		
		if(page.equals("search_p")){
			request.getRequestDispatcher("search_patient.jsp").forward(request, response);
		}
		
		if(page.equals("search_patient_form")){
			String name=request.getParameter("name");
			Account account = new Account();
			ArrayList<Patient> list = new ArrayList<Patient>();
			try {
				list = account.searchPatient(name);
			} catch (Exception e) {
				
				e.printStackTrace();
			}
			request.setAttribute("name", name);
			request.setAttribute("list", list);
			request.getRequestDispatcher("search_patient1.jsp").forward(request, response);
		}
		if(page.equals("all_appt")){
			request.getRequestDispatcher("all_appt.jsp").forward(request, response);
		}
		
		if(page.equals("all_appt_tom")){
			request.getRequestDispatcher("all_appt_tom.jsp").forward(request, response);
		}
		if(page.equals("cancel_appt")){
			String pid = request.getParameter("patient_id");
			String did = request.getParameter("doctor_id");
			Account account = new Account();
			try {
				account.cancelAppt(pid,did);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("msg", "Patient Appointment Cancelled");
			request.getRequestDispatcher("all_appt.jsp").forward(request, response);
		}
		
		if(page.equals("cancel_appt_tom")){
			String pid = request.getParameter("patient_id");
			String did = request.getParameter("doctor_id");
			Account account = new Account();
			try {
				account.cancelAppt(pid,did);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("msg", "Patient Appointment Cancelled");
			request.getRequestDispatcher("all_appt_tom.jsp").forward(request, response);
		}
		
		if(page.equals("existing_patient")){
			request.getRequestDispatcher("existing_patient_appt.jsp").forward(request, response);
		}
		if(page.equals("existing_patient_form")){
			String email = request.getParameter("email");
			Account account = new Account();
			Patient p = new Patient();
			try {
				account.dbConnect();
				 p =account.fetchPatient(email); // P -- null
				 account.dbClose();
			} catch (Exception e) {
				
				e.printStackTrace();
			}
			
			if(p == null){
				request.setAttribute("msg", "Patient Record Doesnot Exists");
				request.getRequestDispatcher("existing_patient_appt.jsp").forward(request, response);
			}
			else{
				//record exists in DB
				request.setAttribute("p", p);
				request.getRequestDispatcher("confirm_appt.jsp").forward(request, response);
			}
				
		}
	}

}




