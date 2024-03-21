/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DAL.DBContext;
import Model.Category;
import Model.ReportType;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author TTT
 */
public class SendFeedBack_DAO {

    private Connection con;
    private String status = "ok";
    PreparedStatement ps;
    ResultSet rs;

    public SendFeedBack_DAO() {
        try {
            con = new DBContext().getConnection();
        } catch (Exception e) {
            status = "Error at connection" + e.getMessage();
        }
    }

    public List<ReportType> loadAllReport() {
        List<ReportType> report = new ArrayList<ReportType>();
        String sql = "select* from ReportType";
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                report.add(new ReportType(rs.getInt(1), rs.getString(2)));
            }
        } catch (Exception e) {
            status = "error at load ReportType";
        }
        return report;
    }

    public void SendFeedBack(String uID, String title, String description) {
        String sql = "Insert into Feedback (userID , title , description)\n"
                + "values (?,?,?)";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, uID);
            ps.setString(2, title);
            ps.setString(3, description);
            ps.executeUpdate();

        } catch (Exception e) {
            String status = "error at load Chapter";
        }
    }

    public static void main(String[] args) {
        SendFeedBack_DAO dao = new SendFeedBack_DAO();
        //dao.SendFeedBack("13", "4", "hay");
        //List<ReportType> b = dao.loadAllReport();
        //System.out.println(b);

    }
}
