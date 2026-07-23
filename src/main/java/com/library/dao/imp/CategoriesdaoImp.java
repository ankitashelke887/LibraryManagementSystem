package com.library.dao.imp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.library.dao.Categoriesdao;
import com.library.dto.Categories;
import com.library.utility.Connector;

public class CategoriesdaoImp implements Categoriesdao {

    private Connection con;

    public CategoriesdaoImp() {
        this.con = Connector.getConnection();
    }

    @Override
    public void addcategory(Categories c) {
        String query = "insert into categories values(0,?,?)";
        int i = 0;

        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, c.getcName());
            ps.setString(2, c.getDescription());
            i = ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updatecategory(Categories c) {
        String query = "update categories set c_name=?, description=? where category_id=?";
        int i = 0;

        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, c.getcName());
            ps.setString(2, c.getDescription());
            ps.setInt(3, c.getCategoryId());
            i = ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deletecategory(Integer categoryId) {
        String query = "delete from categories where category_id=?";
        int i = 0;
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, categoryId);
            i = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Categories> getallcategories() {
        String query = "select * from categories";
        List<Categories> categorylist = new ArrayList<Categories>();
        Categories c = null;

        try {
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                c = new Categories();
                c.setCategoryId(rs.getInt("category_id"));
                c.setcName(rs.getString("c_name"));
                c.setDescription(rs.getString("description"));
                categorylist.add(c);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return categorylist;
    }

    @Override
    public Categories getbyidandname(Integer categoryId, String cName) {
        String query = "select * from categories where category_id=? and c_name=?";
        Categories c = null;

        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, categoryId);
            ps.setString(2, cName);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                c = new Categories();
                c.setCategoryId(rs.getInt("category_id"));
                c.setcName(rs.getString("c_name"));
                c.setDescription(rs.getString("description"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return c;
    }

}