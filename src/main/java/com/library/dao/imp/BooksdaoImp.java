package com.library.dao.imp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.library.dao.Booksdao;
import com.library.dto.Books;
import com.library.utility.Connector;

public class BooksdaoImp implements Booksdao {

    private Connection con;

    public BooksdaoImp() {
        this.con = Connector.getConnection();
    }

    @Override
    public void addbook(Books b) {

        String query = "insert into books values(0,?,?,?,?,?,?,?)";
        int i = 0;

        try {
            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, b.getTitle());
            ps.setInt(2, b.getAuthorId());
            ps.setInt(3, b.getCategoryId());
            ps.setInt(4, b.getPublisherId());
            ps.setInt(5, b.getPublishYear());
            ps.setString(6, b.getLanguage());
            ps.setDouble(7, b.getPrice());

            i = ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updatebook(Books b) {

        String query = "update books set title=?, author_id=?, category_id=?, publisher_id=?, publish_year=?, language=?, price=?  where book_id=?";
        int i = 0;

        try {
            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, b.getTitle());
            ps.setInt(2, b.getAuthorId());
            ps.setInt(3, b.getCategoryId());
            ps.setInt(4, b.getPublisherId());
            ps.setInt(5, b.getPublishYear());
            ps.setString(6, b.getLanguage());
            ps.setDouble(7, b.getPrice());

            ps.setInt(8, b.getBookId());

            i = ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deletebook(Integer bookId) {

        String query = "delete from books where book_id=?";
        int i = 0;

        try {
            PreparedStatement ps = con.prepareStatement(query);

            ps.setInt(1, bookId);

            i = ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Books> getallbooks() {

        String query = "select * from books";

        List<Books> booklist = new ArrayList<Books>();
        Books b = null;

        try {
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                b = new Books();

                b.setBookId(rs.getInt("book_id"));
                b.setTitle(rs.getString("title"));
                b.setAuthorId(rs.getInt("author_id"));
                b.setCategoryId(rs.getInt("category_id"));
                b.setPublisherId(rs.getInt("publisher_id"));
                b.setPublishYear(rs.getInt("publish_year"));
                b.setLanguage(rs.getString("language"));
                b.setPrice(rs.getDouble("price"));

                booklist.add(b);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return booklist;
    }

    @Override
    public Books getbytitleandcategoryid(String title, Integer categoryId) {

        String query = "select * from books where title=? and category_id=?";

        Books b = null;

        try {
            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, title);
            ps.setInt(2, categoryId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                b = new Books();

                b.setBookId(rs.getInt("book_id"));
                b.setTitle(rs.getString("title"));
                b.setAuthorId(rs.getInt("author_id"));
                b.setCategoryId(rs.getInt("category_id"));
                b.setPublisherId(rs.getInt("publisher_id"));
                b.setPublishYear(rs.getInt("publish_year"));
                b.setLanguage(rs.getString("language"));
                b.setPrice(rs.getDouble("price"));
                
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return b;
    }

}