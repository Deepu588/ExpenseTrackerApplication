package com.jsp.expensetracker.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;

//... (import statements and servlet annotation)

@WebServlet("/SendEmail")
public class SendEmail extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Properties properties = new Properties();
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "465");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.ssl.enable", "true");
        properties.put("mail.smtp.ssl.protocols", "TLSv1.2");

        // Set your Gmail username and password
        final String username = "annamdeepak1912@gmail.com";
        final String password = "deepak@19_";

        // Enable debugging to see the detailed log
        properties.put("mail.debug", "true");

        try {
            Session session = Session.getInstance(properties, new Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(username, password);
                }
            });

            Message msg = new MimeMessage(session);

            msg.setFrom(new InternetAddress("annamdeepak1912@gmail.com"));
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse("deepuannam484@gmail.com", false));
            msg.setSubject("Hello");
            msg.setText("How are you");
            msg.setSentDate(new Date());

            Transport.send(msg);

            System.out.println("Message sent successfully.");
        } catch (MessagingException e) {
            System.out.println("Error sending email. Cause: " + e);
        }
    }
}
