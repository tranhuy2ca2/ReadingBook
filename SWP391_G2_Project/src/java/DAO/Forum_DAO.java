/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DAL.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import Model.Thread;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Vector;
/**
 *
 * @author ASUS
 */
public class Forum_DAO {
    private Connection con;
    private String status = "ok";
    PreparedStatement ps;
    ResultSet rs;

    public Forum_DAO() {
        try {
            con = new DBContext().getConnection();
        } catch (Exception e) {
            status = "Error at connection" + e.getMessage();
        }
    }
    public List<Model.Thread> getAllThread(){
        List<Model.Thread> thread = new Vector<Model.Thread>();
        String sql = "select t.*,u.userName from Thread t join [User] u on t.userID = u.userID order by publishDate desc";
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {                
                thread.add(new Thread(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getTimestamp(5), rs.getInt(6),rs.getString(7)));
            }
        } catch (Exception e) {
            status = "error at get thread";
        }
        return thread;
    }
    public List<Model.Thread> getThreadByUserId(int userID){
        List<Model.Thread> thread = new Vector<Model.Thread>();
        String sql = "select t.*,u.userName from Thread t join [User] u on t.userID = u.userID where u.userID = ? order by publishDate desc";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, userID);
            rs = ps.executeQuery();
            while (rs.next()) {                
                thread.add(new Thread(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getTimestamp(5), rs.getInt(6),rs.getString(7)));
            }
        } catch (Exception e) {
            status = "error at get thread";
        }
        return thread;
    }
    
    public Model.Thread getThreadDetailById(int threadId){
        Model.Thread t = null;
        String sql = "select t.*,u.userName,u.avatar from Thread t join [User] u on t.userID = u.userID where t.threadId = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, threadId);
            rs = ps.executeQuery();
            while (rs.next()) {                
                t = new Thread(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getTimestamp(5), rs.getInt(6), rs.getString(7), rs.getString(8));
            }
        } catch (Exception e) {
            status = "error at get thread detail";
        }
        return t;
    }
    
    public void createNewThread(int userID,String title,String detail){
        String sql = "insert into Thread values (?,?,?,?,?)";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, userID);
            ps.setString(2, title);
            ps.setString(3, detail);
            ps.setTimestamp(4, new Timestamp(System.currentTimeMillis()));
            ps.setInt(5, 0);
            ps.execute();
        } catch (Exception e) {
            status = "error at create new thread";
        }
    }
    public void updateThread(int threadId,String title,String detail){
        String sql = "update Thread set title = ?,detail = ?,publishDate = ? where threadId = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(3, threadId);
            ps.setString(1, title);
            ps.setString(2, detail);
            ps.setTimestamp(3, new Timestamp(System.currentTimeMillis()));
            ps.execute();
        } catch (Exception e) {
            status = "error at update thread";
        }
    }
    
    public void deleteThread(int threadId){
        String sql ="delete from SavedThread where threadId = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, threadId);
            ps.execute();
        } catch (Exception e) {
            status = "error at delete from saved thread";
        }
        sql = "delete from Thread where threadId = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, threadId);
            ps.execute();
        } catch (Exception e) {
            status = "error at delete from thread";
        }
    }
    
    public HashMap<Integer,Model.Thread> getSavedThreadByUserId(int userID){
        HashMap<Integer,Model.Thread> thread = new HashMap<Integer,Model.Thread>();
        String sql = "select t.*,u.userName from Thread t join [User] u on t.userID = u.userID join SavedThread st on st.threadId = t.threadId where st.userID = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, userID);
            rs = ps.executeQuery();
            while (rs.next()) {                
                thread.put(rs.getInt(1),new Thread(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getTimestamp(5), rs.getInt(6),rs.getString(7)));
            }
        } catch (Exception e) {
            status = "error at get saved thread";
        }
        return thread;
    }
    public List<Model.Thread> getSavedThreadByUserIdList(int userID){
        List<Model.Thread> thread = new Vector<Model.Thread>();
        String sql = "select t.*,u.userName from Thread t join [User] u on t.userID = u.userID join SavedThread st on st.threadId = t.threadId where st.userID = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, userID);
            rs = ps.executeQuery();
            while (rs.next()) {                
                thread.add(new Thread(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getTimestamp(5), rs.getInt(6),rs.getString(7)));
            }
        } catch (Exception e) {
            status = "error at get thread";
        }
        return thread;
    }
    
    public void insertSavedThread(int threaId,int userID){
        String sql = "insert into SavedThread values(?,?)";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, threaId);
            ps.setInt(2, userID);
            ps.execute();
        } catch (Exception e) {
            status = "error at insert to SavedThread";
        }
    }
    public void deleteSavedThread(int threaId,int userID){
        String sql = "delete from SavedThread where threadId = ? and userID = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, threaId);
            ps.setInt(2, userID);
            ps.execute();
        } catch (Exception e) {
            status = "error at delete from SavedThread";
        }
    }
    public static void main(String[] args) {
        Forum_DAO dao = new Forum_DAO();
        dao.deleteSavedThread(1, 16);
        System.out.println(dao.status);
    }
}
