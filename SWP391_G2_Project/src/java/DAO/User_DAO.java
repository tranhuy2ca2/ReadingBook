/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DAL.DBContext;
import Model.User;
import jakarta.servlet.http.Part;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Random;

/**
 *
 * @author ADMIN
 */
public class User_DAO {

    private Connection con;
    private String status = "ok";
    private List<User> user;
    PreparedStatement ps;
    ResultSet rs;

    public User_DAO() {
        try {
            con = new DBContext().getConnection();
        } catch (Exception e) {
            status = "Error at connection" + e.getMessage();
        }
    }

    public User login(String username, String password) {
        String sql = "select * from [User] where [username] = ? and [password] = ?";
        User u = null;
        try {
            ps = con.prepareStatement(sql);

            ps.setString(1, username);
            ps.setString(2, password);
            rs = ps.executeQuery();
            while (rs.next()) {
                u = new User(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getInt(9));
                System.out.println("add");
            }
        } catch (Exception e) {
            status = "error at login";
        }

        return u;
    }

    public void logout() {
        user = null;
    }

    public boolean checkExistAcc(String username) {
        User u = null;
        String sql = "select * from [User] where username = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, username);
            rs = ps.executeQuery();
            while (rs.next()) {
                u = new User(rs.getInt(1),
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
        if (u != null) {
            return true;
        }
        return false;
    }

    public boolean checkExistEmail(String email) {
        User u = null;
        String sql = "select * from [User] where email = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, email);
            rs = ps.executeQuery();
            while (rs.next()) {
                u = new User(rs.getInt(1),
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
            status = "error at checking exist email";
        }
        if (u != null) {
            return true;
        }
        return false;
    }

    public void resetPassword(String email, String pass) {
        String sql = "update [User] set [password] = ? where email = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, pass);
            ps.setString(2, email);
            ps.execute();
        } catch (Exception e) {
            status = "error at reset password";
        }
    }

    public String randomSentence() {
        String regex = "[A-Z0-9a-z]+{5}";
        char[] result = new char[6];
        Random rd = new Random();
        while (true) {
            for (int i = 0; i < 6; i++) {
                result[i] = (char) rd.nextInt(255);
            }
            String a = new String(result);
            if (a.matches(regex)) {
                return a;
            }
        }
    }

    public void register(String username, String password) {
        String sql = "insert into [User] values(?,?,?,?,?,?,?,?)";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, null);
            ps.setString(4, null);
            ps.setString(5, null);
            ps.setString(6, null);
            ps.setString(7, null);
            ps.setInt(8, 1);
            ps.execute();
        } catch (Exception e) {
        }
    }

    public boolean ChangePassword(String user_id, String user_pass) {
        String sql = "update [User] set [password] = ?\n"
                + "where [userID] = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, user_pass);
            ps.setString(2, user_id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return true;
    }

    public User getAccountByID(String id) {
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

    public String getUserAvatarByID(String userID) {
    String sql = "SELECT avatar FROM [User] WHERE userID = ?";
    try {
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, userID);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            return rs.getString("avatar");
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return null;
}

    public boolean UpdateUser(String uID, String email, String address, String phone, String avatar) {
        String query = "update [User]\n"
                + "set [email] = ?,\n"
                + "[address] = ?\n,"
                + "[phone] = ?\n,"
                + "[avatar] = ?\n"
                + "where userID = ?";

        try {
            ps = con.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, address);
            ps.setString(3, phone);
            ps.setString(4, avatar);
            ps.setString(5, uID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return true;
    }

    public boolean updateTransaction(long amount, String userID) {
        String sql = "UPDATE [User] SET [transaction] = [transaction] + ? "
                + "WHERE userID = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setLong(1, amount);
            ps.setString(2, userID);
            ps.executeUpdate();
            // Đóng PreparedStatement sau khi thực hiện
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return true;
    }
    
    public boolean WithdrawMoney(long amount, String userID) {
    String sql = "SELECT [transaction] FROM [User] WHERE userID = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, userID);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                long currentBalance = rs.getLong("transaction");
                if (currentBalance >= amount) {
                    // Nếu số dư đủ, thực hiện trừ tiền
                    sql = "UPDATE [User] SET [transaction] = [transaction] - ? WHERE userID = ?";
                    ps = con.prepareStatement(sql);
                    ps.setLong(1, amount);
                    ps.setString(2, userID);
                    ps.executeUpdate();
                    // Đóng PreparedStatement sau khi thực hiện
                    ps.close();
                } else {
                    // Nếu số dư không đủ, không thực hiện trừ tiền
                    amount = 0;
                }
            }
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return true;
    }

    public static void main(String[] args) {
        User_DAO dao = new User_DAO();
        dao.WithdrawMoney(10000, "13");
    }

}
