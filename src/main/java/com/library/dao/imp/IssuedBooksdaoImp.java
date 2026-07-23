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
        String query = "insert into issued_books values(0,?,?,?,?,?,?,?)";
        int i = 0;

        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, ib.getUserId());
            ps.setInt(2, ib.getCopyId());
            ps.setDate(3, ib.getIssueDate());
            ps.setDate(4, ib.getDueDate());
            ps.setDate(5, ib.getReturnDate());
            ps.setDouble(6, ib.getFineAmount());
            ps.setString(7, ib.getStatus());
          
            i = ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updateibooks(IssuedBooks ib) {
        String query = "update issued_books set user_id=?, copy_id=?, issue_date=?, due_date=?, return_date=?,fine_amount=?, status=? where issue_id=?";
        int i = 0;

        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, ib.getUserId());
            ps.setInt(2, ib.getCopyId());
            ps.setDate(3, ib.getIssueDate());
            ps.setDate(4, ib.getDueDate());
            ps.setDate(5, ib.getReturnDate());
            ps.setDouble(6, ib.getFineAmount());
            ps.setString(7, ib.getStatus());
            ps.setInt(8, ib.getIssueId());
            i = ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteibooks(Integer issueId) {
        String query = "delete from issued_books where issue_id=?";
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
        String query = "select * from issued_books";
        List<IssuedBooks> issuedList = new ArrayList<IssuedBooks>();
        IssuedBooks ib = null;

        try {
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ib = new IssuedBooks();
                ib.setIssueId(rs.getInt("issue_id"));
                ib.setUserId(rs.getInt("user_id"));
                ib.setCopyId(rs.getInt("copy_id"));
                ib.setIssueDate(rs.getDate("issue_date"));
                ib.setDueDate(rs.getDate("due_date"));
                ib.setReturnDate(rs.getDate("return_date"));
                ib.setStatus(rs.getString("status"));
                ib.setFineAmount(rs.getDouble("fine_amount"));
                issuedList.add(ib);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return issuedList;
    }

	@Override
	public IssuedBooks getByCopyid(Integer copyId) {
		String query = "select * from issued_books where copy_id=?";
        IssuedBooks ib = null;

        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, copyId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ib = new IssuedBooks();
                ib.setIssueId(rs.getInt("issue_id"));
                ib.setUserId(rs.getInt("user_id"));
                ib.setIssueDate(rs.getDate("issue_date"));
                ib.setDueDate(rs.getDate("due_date"));
                ib.setReturnDate(rs.getDate("return_date"));
                ib.setStatus(rs.getString("status"));
                ib.setFineAmount(rs.getDouble("fine_amount"));
                ib.setCopyId(rs.getInt("copy_id"));
                
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return ib;
    }

}
   