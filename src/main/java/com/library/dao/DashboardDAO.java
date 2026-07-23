package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import db.DBConnection;

public class DashboardDAO {

    private Connection con;

    public DashboardDAO() {
        con = DBConnection.getConnection();
    }

    private int getCount(String tableName) {

        int count = 0;

        try {

            String sql = "SELECT COUNT(*) FROM " + tableName;

            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            if(rs.next()) {

                count = rs.getInt(1);

            }

        } catch(Exception e) {

            e.printStackTrace();

        }

        return count;
    }

    public int totalUsers() {
        return getCount("users");
    }

    public int totalBooks() {
        return getCount("books");
    }

    public int totalAuthors() {
        return getCount("authors");
    }

    public int totalCategories() {
        return getCount("categories");
    }

    public int totalPublishers() {
        return getCount("publishers");
    }

    public int totalCopies() {
        return getCount("book_copies");
    }

}