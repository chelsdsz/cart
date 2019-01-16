package com.account;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.beans.Patient;

public class Account {
	String user="root";
	String pass = "";
	String url="jdbc:mysql://localhost:3306/";
	String dbname ="hospital";
	String driver="com.mysql.jdbc.Driver";
		Connection con;
		
		public void dbConnect() throws Exception{
			Class.forName(driver);
			con = DriverManager.getConnection(url+dbname,user,pass);
		}
		public void dbClose() throws Exception{
			con.close();
		}
		public void insertPatient(String name,String email,String address,String contact) throws Exception{
				
			String sql ="insert into patient(name,email,address,contact) values (?,?,?,?)";
			PreparedStatement pstmt=con.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			pstmt.setString(3, address);
			pstmt.setString(4, contact);
			
			
			pstmt.executeUpdate();
			
			pstmt.close();
			
		}
		
		public int fetchId(String email) throws Exception{
			int id=0;
			String sql ="select id from patient where email = ?";
			PreparedStatement pstmt=con.prepareStatement(sql);
			pstmt.setString(1, email);
						
			ResultSet rst = pstmt.executeQuery(); 
			
			while(rst.next()){
				id = rst.getInt("id");
			}
			rst.close();
			pstmt.close();
			
			return id;
		}
		
		public void insertAppt(int id,String doctor,String date,String slot) throws Exception{
			String sql ="insert into books_appt(patient_id,doctor_id,date,time) values (?,?,?,?)";
			PreparedStatement pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, id);
			pstmt.setInt(2, Integer.parseInt(doctor));
			pstmt.setString(3, date);
			pstmt.setString(4, slot);
			
			
			pstmt.executeUpdate();
			
			pstmt.close();
		}
		
		public Patient fetchPatient(String email) throws Exception{
			int count = 0;
			String sql ="select * from patient where email = ?";
			PreparedStatement pstmt=con.prepareStatement(sql);
			pstmt.setString(1, email);
						
			ResultSet rst = pstmt.executeQuery(); 
			Patient p = new Patient();
			while(rst.next()){
				count = 1;
				p.setName(rst.getString("name"));
				p.setEmail(email);
				p.setAddress(rst.getString("address"));
				p.setContact(rst.getString("contact"));
				
			}
			rst.close();
			pstmt.close();
			if(count == 0){
				return null;
			}
			return p;
		}
		
		public boolean checkPatient(String email) throws Exception{
			int count =0;
			String sql ="select * from patient where email = ?";
			PreparedStatement pstmt=con.prepareStatement(sql);
			pstmt.setString(1, email);
						
			ResultSet rst = pstmt.executeQuery(); 
			
			while(rst.next()){
				count = 1;
			}
			rst.close();
			pstmt.close();
			if(count == 0){
				return false;
			}
			return true;
		}
		
		public ArrayList<Patient> searchPatient(String name) throws Exception{
			dbConnect();
			ArrayList<Patient> list = new ArrayList<Patient>();
			
			String sql ="select * from patient where name LIKE ?" ;
			PreparedStatement pstmt=con.prepareStatement(sql);
			pstmt.setString(1, "%" +name +"%");
						
			ResultSet rst = pstmt.executeQuery(); 
			
			while(rst.next()){
				Patient p = new Patient();
				p.setName(rst.getString("name"));
				p.setEmail(rst.getString("email"));
				p.setAddress(rst.getString("address"));
				p.setContact(rst.getString("contact"));
				list.add(p);
				
			}
			rst.close();
			pstmt.close();
			dbClose();
			return list;
		}
		
		 public void cancelAppt(String pid,String did) throws Exception{
			 dbConnect();
			 String sql ="delete from books_appt where patient_id = ? AND doctor_id=?";
				PreparedStatement pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, Integer.parseInt(pid));
				pstmt.setInt(2, Integer.parseInt(did));
			 
				pstmt.executeUpdate();
				
				pstmt.close();
			 dbClose();
		 }
}







