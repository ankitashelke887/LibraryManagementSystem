package com.library.dao.imp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.library.dao.IssuedBooksdao;
import com.library.dto.IssuedBooks;
import com.library.utility.Connector;

public class IssuedBooksdaoImp implements IssuedBooksdao {

    private Connection con;

    public IssuedBooksdaoImp() {
        this.con = Connector.getConnection();
    }

    @Override
    public void addissuedbook(IssuedBooks ib) {
        String query = "insert into issuedbooks values(0,?,?,?,?,?,?)";
        int i = 0;

        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, ib.getUserId());
            ps.setInt(2, ib.getBookId());
            ps.setDate(3, ib.getIssueDate());
            ps.setDate(4, ib.getDueDate());
            ps.setDate(5, ib.getReturnDate());
            ps.setString(6, ib.getStatus());
            i = ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updateibooks(IssuedBooks ib) {
        String query = "update issuedbooks set userId=?, bookId=?, issueDate=?, dueDate=?, returnDate=?, status=? where issueId=?";
        int i = 0;

        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, ib.getUserId());
            ps.setInt(2, ib.getBookId());
            ps.setDate(3, ib.getIssueDate());
            ps.setDate(4, ib.getDueDate());
            ps.setDate(5, ib.getReturnDate());
            ps.setString(6, ib.getStatus());
            ps.setInt(7, ib.getIssueId());
            i = ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteibooks(Integer issueId) {
        String query = "delete from issuedbooks where issueId=?";
        int i = 0;

        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, issueId);
            i = ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<IssuedBooks> getallibooks() {
        String query = "select * from issuedbooks";
        List<IssuedBooks> issuedList = new ArrayList<IssuedBooks>();
        IssuedBooks ib = null;

        try {
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ib = new IssuedBooks();
                ib.setIssueId(rs.getInt("issueId"));
                ib.setUserId(rs.getInt("userId"));
                ib.setBookId(rs.getInt("bookId"));
                ib.setIssueDate(rs.getDate("issueDate"));
                ib.setDueDate(rs.getDate("dueDate"));
                ib.setReturnDate(rs.getDate("returnDate"));
                ib.setStatus(rs.getString("status"));
                issuedList.add(ib);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return issuedList;
    }

    @Override
    public IssuedBooks getbybookid(Integer bookId) {
        String query = "select * from issuedbooks where bookId=?";
        IssuedBooks ib = null;

        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, bookId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ib = new IssuedBooks();
                ib.setIssueId(rs.getInt("issueId"));
                ib.setUserId(rs.getInt("userId"));
                ib.setBookId(rs.getInt("bookId"));
                ib.setIssueDate(rs.getDate("issueDate"));
                ib.setDueDate(rs.getDate("dueDate"));
                ib.setReturnDate(rs.getDate("returnDate"));
                ib.setStatus(rs.getString("status"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return ib;
    }

}