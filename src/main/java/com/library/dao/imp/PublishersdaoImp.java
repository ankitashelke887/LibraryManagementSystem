package com.library.dao.imp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.library.dao.Publishersdao;
import com.library.dto.Publishers;
import com.library.utility.Connector;

public class PublishersdaoImp implements Publishersdao {

    private Connection con;

    public PublishersdaoImp() {
        this.con = Connector.getConnection();
    }

    @Override
    public void addpublisher(Publishers p) {
        String query = "insert into publishers values(0,?,?,?,?)";
        int i = 0;
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, p.getpName());
            ps.setString(2, p.getpEmail());
            ps.setString(3, p.getpPhone());
            ps.setString(4, p.getpAddress());
            i = ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updatepublisher(Publishers p) {
        String query = "update publishers set pName=?, pEmail=?, pPhone=?, pAddress=? where publisherId=?";
        int i = 0;
        try {
            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, p.getpName());
            ps.setString(2, p.getpEmail());
            ps.setString(3, p.getpPhone());
            ps.setString(4, p.getpAddress());
            ps.setInt(5, p.getPublisherId());
            i = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deletepublisher(Integer publisherId) {
        String query = "delete from publishers where publisherId=?";
        int i = 0;

        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, publisherId);
            i = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Publishers> getallpublishers() {
        String query = "select * from publishers";
        List<Publishers> publisherList = new ArrayList<Publishers>();
        Publishers p = null;

        try {
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                p = new Publishers();
                p.setPublisherId(rs.getInt("publisherId"));
                p.setpName(rs.getString("pName"));
                p.setpEmail(rs.getString("pEmail"));
                p.setpPhone(rs.getString("pPhone"));
                p.setpAddress(rs.getString("pAddress"));
                publisherList.add(p);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return publisherList;
    }

    @Override
    public Publishers getbymail(String pEmail) {
        String query = "select * from publishers where pEmail=?";
        Publishers p = null;

        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, pEmail);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                p = new Publishers();
                p.setPublisherId(rs.getInt("publisherId"));
                p.setpName(rs.getString("pName"));
                p.setpEmail(rs.getString("pEmail"));
                p.setpPhone(rs.getString("pPhone"));
                p.setpAddress(rs.getString("pAddress"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return p;
    }

}