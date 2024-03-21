/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author TTT
 */
public class TransactionHistory {
    private int TransactionID;
    private int UserID;
    private long Amount;
    private int TransactionType;
    private String TransactionDate;

    public TransactionHistory(int TransactionID, int UserID, long Amount, int TransactionType, String TransactionDate) {
        this.TransactionID = TransactionID;
        this.UserID = UserID;
        this.Amount = Amount;
        this.TransactionType = TransactionType;
        this.TransactionDate = TransactionDate;
    }

    public TransactionHistory() {
    }

    public int getTransactionID() {
        return TransactionID;
    }

    public void setTransactionID(int TransactionID) {
        this.TransactionID = TransactionID;
    }

    public int getUserID() {
        return UserID;
    }

    public void setUserID(int UserID) {
        this.UserID = UserID;
    }

    public long getAmount() {
        return Amount;
    }

    public void setAmount(long Amount) {
        this.Amount = Amount;
    }

    public int getTransactionType() {
        return TransactionType;
    }

    public void setTransactionType(int TransactionType) {
        this.TransactionType = TransactionType;
    }

    public String getTransactionDate() {
        return TransactionDate;
    }

    public void setTransactionDate(String TransactionDate) {
        this.TransactionDate = TransactionDate;
    }

    @Override
    public String toString() {
        return "TransactionHistory{" + "TransactionID=" + TransactionID + ", UserID=" + UserID + ", Amount=" + Amount + ", TransactionType=" + TransactionType + ", TransactionDate=" + TransactionDate + '}';
    }
    
    
}
