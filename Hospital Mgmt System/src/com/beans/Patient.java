package com.beans;

import java.util.Calendar;
import java.util.Date;

public class Patient {

	private String name;
	private String email;
	private String address;
	private String contact;
	private String msg ="";
	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}
	
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public boolean validate(String name,String email,String address,String contact,String doctor){
		if(name.equals("")){
			msg = msg +"Please enter Name<BR>";
		}
		if(email.equals("")){
			msg = msg +"Please enter Email<BR>";
		}
		if(address.equals("")){
			msg = msg +"Please enter Address<BR>";
		}
		if(contact.equals("")){
			msg = msg +"Please enter Contact No.<BR>";
		}
		if(doctor.equals("--select doctor--")){
			msg = msg +"Please select Doctor<BR>";
		}
		if(msg.equals("")){
			return true;
		}
		return false;
	}
	
	public Date fetchDate(int days){
		Date date = new Date(); //todays date
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.DATE, days);
		return cal.getTime();
		
	}
}
