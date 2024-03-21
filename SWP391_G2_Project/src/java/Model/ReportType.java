/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author TTT
 */
public class ReportType {
    private int reportID;
    private String reportType;

    @Override
    public String toString() {
        return "ReportType{" + "reportID=" + reportID + ", reportType=" + reportType + '}';
    }

    public int getReportID() {
        return reportID;
    }

    public void setReportID(int reportID) {
        this.reportID = reportID;
    }

    public String getReportType() {
        return reportType;
    }

    public void setReportType(String reportType) {
        this.reportType = reportType;
    }

    public ReportType(int reportID, String reportType) {
        this.reportID = reportID;
        this.reportType = reportType;
    }

    public ReportType() {
    }
    
}
