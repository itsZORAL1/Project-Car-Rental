package com.jsp.servlet.LoginSignUp;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Date;

import com.jsp.Service.carService;

@WebServlet("/AddCarServlet")
public class AddCarServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    EntityManagerFactory factory;
    private carService carService;

    @Override
    public void init() {
        factory = Persistence.createEntityManagerFactory("LocationVoiture");
        carService = new carService(factory);
      
    }

    @Override
    public void destroy() {
        if (factory != null && factory.isOpen()) {
            factory.close();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
        try {
            String marque = req.getParameter("marque");
            String prix = req.getParameter("convertedPrix");
            String date_dispoStr = req.getParameter("date_dispo");
            String annee_fabricationStr = req.getParameter("annee_fabrication");
            String  filePart = req.getParameter("image");

            System.out.println(marque+" "+prix+" "+date_dispoStr+" "+annee_fabricationStr+" "+filePart);


            if (marque != null && prix != null && date_dispoStr != null && annee_fabricationStr != null) {
                Date date_dispo = Date.valueOf(date_dispoStr);
                Date annee_fabrication = Date.valueOf(annee_fabricationStr);
                
                carService.addCar(marque, prix, date_dispo, annee_fabrication, filePart);

                req.getRequestDispatcher("EspacePersonnel.jsp").forward(req, res);
            } else {
                req.setAttribute("errorMessage", "You missed one of the fields.");
                req.getRequestDispatcher("AjoutVoiture.jsp").forward(req, res);
            }
        } catch (Exception e) {
            e.printStackTrace();
            res.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Internal Server Error");
        }
    }


 
}
