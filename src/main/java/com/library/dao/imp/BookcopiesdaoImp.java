package com.library.dao.imp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.library.dao.Bookcopiesdao;
import com.library.dto.BookCopies;
import com.library.utility.Connector;

public class BookcopiesdaoImp implements Bookcopiesdao {

    private Connection con;

    public BookcopiesdaoImp() {
        this.con = Connector.getConnection();
    }

    @Override
    public void addbookcopies(BookCopies bc) {

        String query = "insert into bookcopies values(0,?,?,?)";
        int i = 0;

        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, bc.getBookId());
            ps.setString(2, bc.getLocation());
            ps.setString(3, bc.getStatus());

            i = ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updatebookcopies(BookCopies bc) {

        String query = "update bookcopies set bookId=?, location=?, status=? where copyId=?";
        int i = 0;

        try {
            PreparedStatement ps = con.prepareStatement(query);

            ps.setInt(1, bc.getBookId());
            ps.setString(2, bc.getLocation());
            ps.setString(3, bc.getStatus());
            ps.setInt(4, bc.getCopyId());

            i = ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deletebookcopies(Integer copyId) {

        String query = "delete from bookcopies where copyId=?";
        int i = 0;

        try {
            PreparedStatement ps = con.prepareStatement(query);

            ps.setInt(1, copyId);

            i = ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<BookCopies> getallbookcopies() {

        String query = "select * from bookcopies";

        List<BookCopies> bclist = new ArrayList<BookCopies>();
        BookCopies bc = null;

        try {

            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                bc = new BookCopies();
                bc.setCopyId(rs.getInt("copyId"));
                bc.setBookId(rs.getInt("bookId"));
                bc.setLocation(rs.getString("location"));
                bc.setStatus(rs.getString("status"));

                bclist.add(bc);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return bclist;
    }

    @Override
    public BookCopies getbybookid(Integer bookId) {

        String query = "select * from bookcopies where bookId=?";

        BookCopies bc = null;

        try {

            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, bookId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                bc = new BookCopies();

                bc.setCopyId(rs.getInt("copyId"));
                bc.setBookId(rs.getInt("bookId"));
                bc.setLocation(rs.getString("location"));
                bc.setStatus(rs.getString("status"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return bc;
    }
}