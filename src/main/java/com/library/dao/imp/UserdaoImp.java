package com.library.dao.imp;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import com.library.dao.Userdao;
import com.library.dto.Users;
import com.library.utility.Connector;

public class UserdaoImp implements Userdao {

    private Connection con;

    public UserdaoImp() {
        this.con = Connector.getConnection();
    }

    @Override
    public void adduser(Users u) {
        String query = "insert into users values(0,?,?,?,?,?,?)";
        int i = 0;

        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, u.getuName());
            ps.setString(2, u.getEmail());
            ps.setString(3, u.getuPhone());
            ps.setString(4, u.getAddress());
            ps.setString(5, u.getPassword());
            ps.setDate(6, Date.valueOf(u.getRegisteredDate()));
            i = ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updateuser(Users u) {
        String query = "update users set uName=?, email=?, uPhone=?, address=?, password=?, registeredDate=? where userId=?";
        int i = 0;

        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, u.getuName());
            ps.setString(2, u.getEmail());
            ps.setString(3, u.getuPhone());
            ps.setString(4, u.getAddress());
            ps.setString(5, u.getPassword());
            ps.setDate(6, Date.valueOf(u.getRegisteredDate()));
            ps.setInt(7, u.getUserId());
            i = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteuser(Integer userId) {
        String query = "delete from users where userId=?";
        int i = 0;

        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, userId);
            i = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Users> getallusers() {
        String query = "select * from users";
        List<Users> userList = new ArrayList<Users>();
        Users u = null;

        try {
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                u = new Users();
                u.setUserId(rs.getInt("userId"));
                u.setuName(rs.getString("uName"));
                u.setEmail(rs.getString("email"));
                u.setuPhone(rs.getString("uPhone"));
                u.setAddress(rs.getString("address"));
                u.setPassword(rs.getString("password"));
                Date date = rs.getDate("registeredDate");
                if (date != null) {
                    u.setRegisteredDate(date.toLocalDate());
                }
                userList.add(u);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userList;
    }

    @Override
    public Users getbymailandpassword(String email, String password) {
        String query = "select * from users where email=? and password=?";
        Users u = null;

        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                u = new Users();
                u.setUserId(rs.getInt("userId"));
                u.setuName(rs.getString("uName"));
                u.setEmail(rs.getString("email"));
                u.setuPhone(rs.getString("uPhone"));
                u.setAddress(rs.getString("address"));
                u.setPassword(rs.getString("password"));
                Date date = rs.getDate("registeredDate");
                if (date != null) {
                    u.setRegisteredDate(date.toLocalDate());
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return u;
    }

}