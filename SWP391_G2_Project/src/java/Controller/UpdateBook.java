/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.Book_DAO;
import Model.Book;
import Model.Category;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Arrays;
import java.util.List;

/**
 *
 * @author TTT
 */
public class UpdateBook extends HttpServlet {

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
            out.println("<title>Servlet UpdateBook</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateBook at " + request.getContextPath() + "</h1>");
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
        //processRequest(request, response);
        Book_DAO dao = new Book_DAO();
        List<Model.Category> cate = dao.loadAllCategory();
        List<Model.Tag> tag = dao.loadAllTag();
        int bookid = Integer.parseInt(request.getParameter("bookID"));
        Book book = dao.getBookDetailById(bookid);
        List<Category> selectedCategories = dao.getBookCateById(bookid);
        List<Model.Tag> selectedTags = dao.getBookTagById(bookid);

        request.setAttribute("category", cate);
        request.setAttribute("tag", tag);
        request.setAttribute("selectedCategories", selectedCategories);
        request.setAttribute("selectedTags", selectedTags);
        request.setAttribute("b", book);
        request.getRequestDispatcher("Updatebook.jsp").forward(request, response);
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        Book_DAO dao = new Book_DAO();
        try {
            int storyID = Integer.parseInt(request.getParameter("bookid"));
            String title = request.getParameter("title");
            String authorname = request.getParameter("authorname");
            String publishdate = request.getParameter("publishdate");
            String image = request.getParameter("image");
            String detail = request.getParameter("detail");
            String status = request.getParameter("status");
            List<String> cateIDs = Arrays.asList(request.getParameterValues("category"));
            List<String> tagIDs = Arrays.asList(request.getParameterValues("tag"));

            dao.UpdateBook(title, authorname, publishdate, image, detail, status, storyID, cateIDs, tagIDs);
        } catch (Exception ex) {
            request.setAttribute("exx", ex);
        }
        request.getRequestDispatcher("Postcomic.jsp").forward(request, response);
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
