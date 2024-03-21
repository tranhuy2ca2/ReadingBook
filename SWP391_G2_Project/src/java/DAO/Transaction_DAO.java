/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DAL.DBContext;
import Model.TransactionHistory;
import Model.TransactionType;
import Model.User;
import jakarta.servlet.http.Part;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

/**
 *
 * @author TTT
 */
public class Transaction_DAO {

    private Connection con;
    private String status = "ok";
    private List<User> user;
    PreparedStatement ps;
    ResultSet rs;

    public Transaction_DAO() {
        try {
            con = new DBContext().getConnection();
        } catch (Exception e) {
            status = "Error at connection" + e.getMessage();
        }
    }

    public User getTransactionHistoryByUserID(String id) {
        String query = "select * from [User]\n"
                + "where userID = ?";
        try {
            ps = con.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new User(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getInt(9));
            }
        } catch (Exception e) {

        }
        return null;
    }

    public List<TransactionHistory> ListTransactionByUserID(int userID) {

        List<TransactionHistory> transaction = new ArrayList<>();
        String sql = "select * from TransactionHistory h join TransactionType t\n"
                + "on h.TransactionType = t.TransactionTypeID\n"
                + "where UserID = ?";

        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, userID);
            rs = ps.executeQuery();
            while (rs.next()) {
                transaction.add(new TransactionHistory(rs.getInt(1),
                        rs.getInt(2),
                        rs.getLong(3),
                        rs.getInt(4),
                        rs.getString(5)));
            }
        } catch (Exception e) {
            System.out.println("bug" + e);
        }
        return transaction;
    }

    public List<TransactionType> ListTransactionTypeByUserID(int userID) {
        List<TransactionType> transactionTypes = new ArrayList<>();
        String sql = "SELECT t.TransactionTypeID, t.TransactionTypeName "
                + "FROM TransactionType t "
                + "JOIN TransactionHistory h ON t.TransactionTypeID = h.TransactionType "
                + "WHERE UserID = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, userID);
            rs = ps.executeQuery();
            while (rs.next()) {
                int transactionTypeID = rs.getInt("TransactionTypeID");
                String transactionTypeName = rs.getString("TransactionTypeName");
                transactionTypes.add(new TransactionType(transactionTypeID, transactionTypeName));
            }
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        } finally {
            // Đảm bảo đóng kết nối và tài nguyên
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
            } catch (Exception ex) {
                System.out.println("Error: " + ex.getMessage());
            }
        }
        return transactionTypes;
    }

    public void insertTransactionHistory(String userID, long amount, int transactionType, String transactionDate) {
        String sql = "INSERT INTO TransactionHistory (UserID, Amount, TransactionType, TransactionDate) VALUES (?, ?, ?, ?)";
        try {
            // Tạo một PreparedStatement
            PreparedStatement ps = con.prepareStatement(sql);
            // Thiết lập các tham số trong câu lệnh SQL
            ps.setString(1, userID);
            ps.setLong(2, amount);
            ps.setInt(3, transactionType);
            ps.setString(4, transactionDate);
            // Thực thi câu lệnh Insert
            ps.executeUpdate();
            // Đóng PreparedStatement sau khi thực hiện
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        Transaction_DAO dao = new Transaction_DAO();
        //List<TransactionHistory> b = dao.ListTransactionByUserID(13);
        dao.insertTransactionHistory("13", 10000, 2, "2024-03-15 08:45:38");
        //List<TransactionType> b = dao.ListTransactionTypeByUserID(3);
        //System.out.println(b);
    }
}
