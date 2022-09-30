/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller.product;

import Model.Book;
import Model.User;
import context.BookDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author ttaad
 */
@WebServlet(name="ReportController", urlPatterns={"/Report"})
public class ReportController extends HttpServlet { 
  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        User user=(User)request.getSession().getAttribute("user");
        int uId=user.getId();
        int bid=Integer.parseInt(request.getParameter("bId"));
        
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        int bid=Integer.parseInt(request.getParameter("bId"));
       if(request.getSession() == null || request.getSession().getAttribute("user") == null){
           response.sendRedirect("./Login");
       }else{
           request.setAttribute("bid", bid);
           BookDAO bdao= new  BookDAO();
           Book b=bdao.getBookById(bid);
           request.setAttribute("book", b);
           request.getRequestDispatcher("/views/book/report.jsp").forward(request, response);
       }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
