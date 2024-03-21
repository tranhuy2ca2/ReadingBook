/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.Book_DAO;
import Model.Book;
import Model.Category;
import Model.Chapter;
import Model.Tag;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class Book_detail extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Book</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Book at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Book_DAO dao = new Book_DAO();
        
        int bookid = Integer.parseInt(request.getParameter("bookID"));
        try {
            int userID = Integer.parseInt(request.getParameter("userID"));
            if (!dao.isViewRecordExist(userID, bookid)) {
                dao.updateBookViews(userID, bookid);
            }
        } catch (Exception e) {
        }
        Book b = dao.getBookDetailById(bookid);
        List<Category> cate = dao.loadAllCategory();
        List<Category> book_cate = dao.getBookCateById(bookid);
        List<Tag> book_tag = dao.getBookTagById(bookid);

        List<Chapter> chapter = dao.getChapterByBookId(bookid);

        request.setAttribute("category", cate);
        request.setAttribute("book", b);
        request.setAttribute("bookcate", book_cate);
        request.setAttribute("booktag", book_tag);
        request.setAttribute("chapter", chapter);
        request.getRequestDispatcher("Book.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
