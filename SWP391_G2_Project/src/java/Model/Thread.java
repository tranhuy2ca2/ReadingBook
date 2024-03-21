/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.sql.Timestamp;

/**
 *
 * @author ASUS
 */
public class Thread {
    private int threadID;
    private int userID;
    private String title;
    private String detail;
    private Timestamp publishDate;
    private int views;
    private String username;
    
    
    private String avatar;
    public Thread(int threadID, int userID, String title, String detail, Timestamp publishDate, int views, String username) {
        this.threadID = threadID;
        this.userID = userID;
        this.title = title;
        this.detail = detail;
        this.publishDate = publishDate;
        this.views = views;
        this.username = username;
    }

    public Thread(int threadID, int userID, String title, String detail, Timestamp publishDate, int views, String username, String avatar) {
        this.threadID = threadID;
        this.userID = userID;
        this.title = title;
        this.detail = detail;
        this.publishDate = publishDate;
        this.views = views;
        this.username = username;
        this.avatar = avatar;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }


    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    
    public int getThreadID() {
        return threadID;
    }

    public void setThreadID(int threadID) {
        this.threadID = threadID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public Timestamp getPublishDate() {
        return publishDate;
    }

    public void setPublishDate(Timestamp publishDate) {
        this.publishDate = publishDate;
    }

    public int getViews() {
        return views;
    }

    public void setViews(int views) {
        this.views = views;
    }
    
}
