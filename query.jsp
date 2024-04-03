<%@ page import="java.util.Properties" %>
<%@ page import="javax.mail.*" %>
<%@ page import="javax.mail.internet.*" %>
<%@ page import="java.io.*" %>

<%
    // Email configuration
    String host = "smtp.gmail.com";
    String port = "587";
    String username = "rohit.infoera@gmail.com";
    String password = "bcdb jbmt cmfx nvkq";
    String toEmail = "rohit.infoera@gmail.com"; // Change this to your email address

    // Form data
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String phno = request.getParameter("phno");
    String city = request.getParameter("city");
    String message = request.getParameter("message");

    // Email subject
    String subject = "New Form Submission";

    // Email body
    String body = "Name: " + name + "\n" +
                  "Email: " + email + "\n" +
                  "Phone Number: " + phno + "\n" +
                  "City: " + city + "\n" +
                  "Message: " + message;

    // Send email
    Properties props = new Properties();
    props.put("mail.smtp.host", host);
    props.put("mail.smtp.port", port);
    props.put("mail.smtp.auth", "true");
    props.put("mail.smtp.starttls.enable", "true");

    Session session = Session.getInstance(props, new javax.mail.Authenticator() {
        protected PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication(username, password);
        }
    });

    try {
        Message msg = new MimeMessage(session);
        msg.setFrom(new InternetAddress(username));
        msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
        msg.setSubject(subject);
        msg.setText(body);

        Transport.send(msg);

        // Redirect back to the page with a success message
        response.sendRedirect("index.html?success=true");
    } catch (MessagingException e) {
        out.println("Error: " + e.getMessage());
    }
%>
