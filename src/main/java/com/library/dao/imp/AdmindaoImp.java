package com.library.dao.imp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.library.dao.Admindao;
import com.library.dto.Admin;
import com.library.utility.Connector;

public class AdmindaoImp implements Admindao{
	
	private Connection con;
	
	public AdmindaoImp() {
		this.con=Connector.getConnection();
	}

	@Override
	public void addadmin(Admin a) {
		String query="insert into admin values(0,?,?,?,?)";
		int i=0;
		
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1, a.getName());
			ps.setString(2, a.getEmail());
			ps.setString(2, a.getPhone());
			ps.setString(4, a.getPassword());
			i=ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public void updateadmin(Admin a) {
		String query="update admin set name=?,password=?,phone=? where email=?";
		int i=0;
		
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1, a.getName());
			ps.setString(2, a.getPassword());
			ps.setString(3, a.getPhone());
			ps.setString(4, a.getEmail());
			i=ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

	@Override
	public void deleteadmin(Integer adminId) {
		String query="delete from admin where adminId=?";
		int i=0;
		
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setInt(1, adminId);
			i=ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public List<Admin> getalladmin() {
		String query="select * from admin";
		List<Admin> alist=new ArrayList<Admin>();
		Admin a=null;
		
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				a=new Admin();
				a.setAdminId(rs.getInt("adminId"));
				a.setName(rs.getString("name"));
				a.setPhone(rs.getString("phone"));
				a.setEmail(rs.getString("email"));
				a.setPassword(rs.getString("password"));
				alist.add(a);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return alist;
	}

	@Override
	public Admin getbymailandpassword(String email, String password) {
		String query="select * from admin where email=? and password=?";
		Admin a=null;
		
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1, email);
			ps.setString(2, password);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				a=new Admin();
				a.setAdminId(rs.getInt("adminId"));
				a.setName(rs.getString("name"));
				a.setPhone(rs.getString("phone"));
				a.setEmail(rs.getString("email"));
				a.setPassword(rs.getString("password"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return a;
	}

}
