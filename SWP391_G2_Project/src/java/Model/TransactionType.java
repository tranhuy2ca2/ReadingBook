/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author TTT
 */
public class TransactionType {
    private int TransactionTypeID;
    private String TransactionTypeName;

    public TransactionType() {
    }

    public TransactionType(int TransactionTypeID, String TransactionTypeName) {
        this.TransactionTypeID = TransactionTypeID;
        this.TransactionTypeName = TransactionTypeName;
    }

    public int getTransactionTypeID() {
        return TransactionTypeID;
    }

    public void setTransactionTypeID(int TransactionTypeID) {
        this.TransactionTypeID = TransactionTypeID;
    }

    public String getTransactionTypeName() {
        return TransactionTypeName;
    }

    public void setTransactionTypeName(String TransactionTypeName) {
        this.TransactionTypeName = TransactionTypeName;
    }

    @Override
    public String toString() {
        return "TransactionType{" + "TransactionTypeID=" + TransactionTypeID + ", TransactionTypeName=" + TransactionTypeName + '}';
    }
    
}
