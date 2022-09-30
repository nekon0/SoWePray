/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package context;

import Model.PaymentAccount;
import Model.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Khuat Thi Minh Anh
 */
public class PaymentAccountDAO {

    Connection cnn; // ket noi db
    PreparedStatement stm; // thuc thi cac cau lenh sql
    ResultSet rs; // luu tru va xu ly du lieu

    public PaymentAccountDAO() {
        connectDB();
    }

    private void connectDB() {
        try {
            cnn = (new DBContext().getConnection());
            System.out.println("Connect successfully!");
        } catch (Exception e) {
            System.out.println("Connect error:" + e.getMessage());
        }
    }

    public PaymentAccount get(PaymentAccount paymentAccount) {
        try {
            String sql = "SELECT [accountNumber]\n"
                    + "      ,[balance]\n"
                    + "  FROM [Payment_Account]"
                    + "  WHERE [accountNumber] = ?";
            stm = cnn.prepareStatement(sql);
            stm.setLong(1, paymentAccount.getAccountNumber());
            rs = stm.executeQuery();
            if(rs.next()){
                paymentAccount.setBalance(rs.getFloat("balance"));
            }
            else{
                paymentAccount = null;
            }
        } catch (SQLException ex) {
            Logger.getLogger(PaymentAccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return paymentAccount;
    }
    
    public PaymentAccount getWallet(User user){
        return user.getPaymentAccount();
    }
}

/**
 *  SQL template
 
        try {
            String sql = "";
            stm = cnn.prepareStatement(sql);
            rs = stm.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(PaymentAccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
 **/