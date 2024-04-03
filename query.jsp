<%@ page import="org.bson.Document" %>
<%@ page import="com.mongodb.MongoClient" %>
<%@ page import="com.mongodb.client.MongoCollection" %>
<%@ page import="com.mongodb.client.MongoDatabase" %>
<%@ page import="com.mongodb.MongoClientURI" %>
<%@ page import="com.mongodb.client.MongoClients" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="javax.servlet.http.HttpServletRequest"%>
<%@ page import="javax.servlet.http.HttpServletResponse"%>

<%
    // MongoDB connection details
    String databaseName = "infoeradb"; // Change this to your database name
    String collectionName = "lead"; // Change this to your collection name

    // Retrieve form data
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String phno = request.getParameter("phno");
    String city = request.getParameter("city");
    String message = request.getParameter("message");

    // Create a MongoClient to connect to the MongoDB server
    MongoClient mongoClient = null;
    PrintWriter out = response.getWriter();
    try {
        // Connect to MongoDB Atlas cluster
        String uri = "mongodb+srv://rohit:LXtZaBhpH3hJvDB3@cluster0/infoeradb?retryWrites=true&w=majority";
        MongoClientURI clientURI = new MongoClientURI(uri);
        mongoClient = MongoClients.create(clientURI);

        // Access the database
        MongoDatabase database = mongoClient.getDatabase(databaseName);

        // Access the collection
        MongoCollection<Document> collection = database.getCollection(collectionName);

        // Create a document to insert into the collection
        Document document = new Document();
        document.put("name", name);
        document.put("email", email);
        document.put("phno", phno);
        document.put("city", city);
        document.put("message", message);

        // Insert the document into the collection
        collection.insertOne(document);

        // Print success message
        out.println("Data saved successfully.");

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
