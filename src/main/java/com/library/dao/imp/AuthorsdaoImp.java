package com.library.dao.imp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.library.dao.Authorsdao;
import com.library.dto.Authors;
import com.library.utility.Connector;

public class AuthorsdaoImp implements Authorsdao{
	
	private Connection con;
	
	public AuthorsdaoImp() {
		this.con=Connector.getConnection();
	}

	@Override
	public void addauthors(Authors au) {
		String query="insert into authors values(0,?,?,?,?)";
		int i=0;
		
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1, au.getAuthorName());
			ps.setString(2, au.getEmail());
			ps.setString(3, au.getCountry());
			ps.setString(4, au.getBio());
			i=ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public void updateauthor(Authors au) {
		String query="update authors set authorname=?,country=?,bio=? where email=?";
		int i=0;
		
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1, au.getAuthorName());
			ps.setString(2, au.getCountry());
			ps.setString(3, au.getBio());
			ps.setString(4, au.getEmail());
			i=ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public void deleteauthor(Integer authorId) {
		String query="delete from author where authorId=?";
		int i=0;
		
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setInt(1, authorId);
			i=ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public List<Authors> getallauthors() {
		String query="select * from authors";
		List<Authors> aulist=new ArrayList<Authors>();
		Authors a=null;
		
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				a=new Authors();
				a.setAuthorId(rs.getInt("authorId"));
				a.setAuthorName(rs.getString("authorName"));
				a.setEmail(rs.getString("email"));
				a.setCountry(rs.getString("country"));
				a.setBio(rs.getString("bio"));
				aulist.add(a);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return aulist;
	}

	@Override
	public Authors getbyname(String authorname) {
		String query="select * from authors where authorName=?";
		Authors a=null;
		
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1, authorname);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				a=new Authors();
				a.setAuthorId(rs.getInt("authorId"));
				a.setAuthorName(rs.getString("authorName"));
				a.setEmail(rs.getString("email"));
				a.setCountry(rs.getString("country"));
				a.setBio(rs.getString("bio"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return a;
	}

}
