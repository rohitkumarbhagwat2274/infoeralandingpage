<%@ page import="org.bson.Document" %>
<%@ page import="com.mongodb.MongoClient" %>
<%@ page import="com.mongodb.client.MongoCollection" %>
<%@ page import="com.mongodb.client.MongoDatabase" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>

<%
    // MongoDB connection details
    String host = "localhost";
    int port = 27017;
    String databaseName = "infoeradb"; // Change this to your database name
    String collectionName = "lead"; // Change this to your collection name

    // Data to be inserted 
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String phno = request.getParameter("phno");
    String city = request.getParameter("city");
    String message = request.getParameter("message");

    // Create a MongoClient to connect to the MongoDB server
    MongoClient mongoClient = null;
    try {
        mongoClient = new MongoClient(host, port);

        // Access the database
        mongodb+srv://rohit:<LXtZaBhpH3hJvDB3 >@cluster0.vcigych.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0
        //MongoDatabase database = mongoClient.getDatabase(infoeradb);

        // Access the collection
       // MongoCollection<Document> collection = database.getCollection(lead);

        // Create a document to insert into the collection
        Document document = new Document();
        document.put("name", name);
        document.put("email", email);
        document.put("phno", phno);
        document.put("city", city);
        document.put("message", message);

        // Insert the document into the collection
        collection.insertOne(document);

        // Redirect back to the page with a success message
        response.sendRedirect("index.html?success=true");
    } catch (Exception e) {
        // Handle exceptions
        out.println("Error: " + e.getMessage());
    } finally {
        // Close the MongoClient
        if (mongoClient != null) {
            mongoClient.close();
        }
    }
%>
