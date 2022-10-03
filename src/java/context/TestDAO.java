/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package context;

import Model.Book;
import Model.PaymentAccount;
import Model.PaymentMethod;
import Model.User;

/**
 *
 * @author Khuat Thi Minh Anh
 */
public class TestDAO {

    public static void main(String[] args) {
        UserDAO userDBC = new UserDAO();
        User user = new User();
        user.setId(106);

        PaymentAccountDAO payAccDBC = new PaymentAccountDAO();
        PaymentMethodDAO payMedDBC = new PaymentMethodDAO();
        TransactionDAO transactionDAO = new TransactionDAO();
        BookOwnDAO bookOwnDAO = new BookOwnDAO();
//        BookDAO bookDAO = new BookDAO();
//        Book book = new Book();
//        book.setId(4);
//        System.out.println(bookDAO.isOwn(user, book));
//        System.out.println(user.isOwnBook(book.getId()));

//    PaymentMethod paymentMethod = new PaymentMethod(0, user, new PaymentAccount(10028714113l), "Bank 3", true);
//    payMedDBC.insert(paymentMethod);
//        System.out.println(transactionDAO.getTransactionList(user).size());
//    transactionDAO.generateData();
//    payAccDBC.generateData();
//    payMedDBC.generateData();
//    user.createWallet();
//    PaymentAccount paymentAccount = user.getPaymentAccount();
//    payAccDBC.insert(paymentAccount);
//    userDBC.setWalletNumber(user.getPaymentAccount(), user);
//    userDBC.changePassword(1, "admin1");
//    userDBC.generateData();
//        user = new User("MrA", "Male", "2000-01-01", "abc@def", "0000000000", "username", "123456");
//user = userDBC.getUser(101);
//        System.out.println(user.getDob());
//        user.setEmail("Bookie_User101@qa.team");
//        user.setIs_super(1);
//        userDBC.addUser(user);
    }
}
