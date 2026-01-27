/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.footy.blog.servlets;

import com.footy.blog.dao.PostDao;
import com.footy.blog.entities.Post;
import com.footy.blog.helper.ConnectionProvider;
import com.footy.blog.helper.Helper;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;

@MultipartConfig
public class AddPostServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        try (PrintWriter out = response.getWriter()) {
            
            // 1. Fetch Form Data
            int cid = Integer.parseInt(request.getParameter("cid"));
            String pTitle = request.getParameter("pTitle");
            String pContent = request.getParameter("pContent");
            String pPublisher = request.getParameter("pPublisher");
            
            // 2. Handle Image Upload
            Part part = request.getPart("pPic");
            String image = part.getSubmittedFileName();
            
            // 3. Create Post Object
            Post p = new Post(pTitle, pContent, image, null, cid, pPublisher);
            
            // 4. Initialize DAO with Cloud Connection
            // (Assumes ConnectionProvider is updated to use System.getenv)
            PostDao dao = new PostDao(ConnectionProvider.getConnection());
            
            if (dao.savePost(p)) {
                
                // --- FIXED PATH LOGIC FOR CLOUD/LINUX ---
                
                // Get the real path of the "web" folder on the server
                String webPath = request.getServletContext().getRealPath("/");
                
                // Construct path to "blogpics"
                String savePath = webPath + "blogpics" + File.separator + image;
                
                // Create the folder if it doesn't exist (Critical for new deployments)
                File fileSaveDir = new File(webPath + "blogpics");
                if (!fileSaveDir.exists()) {
                    fileSaveDir.mkdir();
                }
                
                // Save the file
                Helper.saveFile(part.getInputStream(), savePath);
                
                out.println("done");
                
            } else {
                out.println("error");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
