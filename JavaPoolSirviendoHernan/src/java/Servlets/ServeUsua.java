/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.HibernateUtil;
import models.Usuarios;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author GOMEZ MARQUEZ
 */
@WebServlet(name = "ServeUsua", urlPatterns = {"/ServeUsua"})
public class ServeUsua extends HttpServlet {
   
    private void RegiUsua(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            PrintWriter out = response.getWriter();
            HttpSession session = request.getSession();
            
            Usuarios usua;
            if(session.getAttribute("ActualizarUsuario")!=null){
                usua = (Usuarios) session.getAttribute("ActualizarUsuario");
                usua.setDocumento(request.getParameter("Documento"));
                usua.setNombres(request.getParameter("Nombres"));
                usua.setApellidos(request.getParameter("Apellidos"));
                usua.setDireccion(request.getParameter("Direccion"));
                usua.setEmail(request.getParameter("Email"));
                usua.setPerfil(request.getParameter("Perfil"));
            }else
            usua = new Usuarios(request.getParameter("Documento"), request.getParameter("Nombres"),request.getParameter("Apellidos"),request.getParameter("Direccion"),request.getParameter("Email"),request.getParameter("Perfil"));
            
            Session s = HibernateUtil.getSessionFactory().openSession();
            Transaction tx = s.beginTransaction();
            s.saveOrUpdate(usua);
            //Obtenemos la session del cliente
            
            session.setAttribute("User", usua);
            tx.commit();
            s.close();
            response.sendRedirect("ServeUsua?u=VerUsua");
    }
    private void VerUsua(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     
        PrintWriter out = response.getWriter();
        Session s = HibernateUtil.getSessionFactory().openSession();
        Query q = s.createQuery("SELECT l FROM Usuarios l");
        ArrayList<Usuarios> Usuario =  (ArrayList) q.list();
       
        request.setAttribute("Usuarios", Usuario);
        s.close();
        request.getRequestDispatcher("Usuarios.jsp").forward(request, response);
    }
    private void updateUsuario(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        
        Session s = HibernateUtil.getSessionFactory().openSession();
        Query q = s.createQuery("SELECT c FROM Usuarios c WHERE Documento=?");
        q.setInteger(0, Integer.parseInt(request.getParameter("i")));
        
        Usuarios usuario = (Usuarios) q.uniqueResult();
        s.close();
        
        HttpSession sh = request.getSession();
        sh.setAttribute("ActualizarUsuario", usuario);
        
        request.setAttribute("UpUsua", usuario);
        request.getRequestDispatcher("Usuarios.jsp").forward(request, response);
        
    }
    private void DeleteUsuarios (HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        Session s = HibernateUtil.getSessionFactory().openSession();
        Query q = s.createQuery("DELETE Usuarios WHERE Documento=?");
        q.setInteger(0, Integer.parseInt(request.getParameter("i")));
        
        int celular = q.executeUpdate();
        s.close();
        
        HttpSession sh = request.getSession();      
        request.getRequestDispatcher("ServeUsua?u=VerUsua").forward(request, response);
    }
     private void Login(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        HttpSession s = request.getSession(); 
        Session sesion = HibernateUtil.getSessionFactory().openSession();
                
        String Usu, Doc;
        Usu = request.getParameter("Email");
        Doc = request.getParameter("Documento");
        Query q = sesion.createQuery("SELECT u FROM Usuarios u WHERE u.Email=? AND u.Documento=?");
        
        q.setString(0, Usu);
        q.setString(1, Doc);
        
        
       Usuarios doc = (Usuarios) q.uniqueResult();
        
        
        //deberíamos buscar el usuario en la base de datos, pero dado que se escapa de este tema, ponemos un ejemplo en el mismo código
        if( (doc!=null)){
            //si coincide usuario y password y además no hay sesión iniciada
            s.setAttribute("usuario", Usu);
            //redirijo a página con información de login exitoso
            response.sendRedirect("Usuarios.jsp");
            
        }else{
            response.sendRedirect("Login/index.html");
        }
    }
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
        
        if(request.getParameter("u").equalsIgnoreCase("RegiUsua")){
            
            RegiUsua(request,response);
        }
        
        else if(request.getParameter("u").equalsIgnoreCase("VerUsua"))
        {
            VerUsua(request,response);
            
        }else if(request.getParameter("u").equalsIgnoreCase("update")){
            
            updateUsuario(request,response); 
            
        }else if(request.getParameter("u").equalsIgnoreCase("delete")){
            
            DeleteUsuarios(request,response); 
        }else if(request.getParameter("u").equalsIgnoreCase("ingresar")){
            
            Login(request,response); 
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
        processRequest(request, response);
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
