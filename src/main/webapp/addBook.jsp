<%@page import="org.hibernate.*"%>
<%@page import="com.library.entity.Book"%>
<%@page import="com.library.util.HibernateUtil"%>

<html>
<body>

<h2>Add Book</h2>

<form method="post">
    Book Id:
    <input type="text" name="bookId"><br><br>

    Book Name:
    <input type="text" name="bookName"><br><br>

    Author:
    <input type="text" name="author"><br><br>

    Price:
    <input type="text" name="price"><br><br>

    <input type="submit" value="Add Book">
</form>

<%
if(request.getMethod().equalsIgnoreCase("POST"))
{
    int id=Integer.parseInt(request.getParameter("bookId"));
    String name=request.getParameter("bookName");
    String author=request.getParameter("author");
    double price=Double.parseDouble(request.getParameter("price"));

    Book b=new Book();

    b.setBookId(id);
    b.setBookName(name);
    b.setAuthor(author);
    b.setPrice(price);

    Session session1=
        HibernateUtil.getSessionFactory().openSession();

    Transaction tx=session1.beginTransaction();

    session1.save(b);

    tx.commit();
    session1.close();

    out.println("<h3>Book Added Successfully</h3>");
}
%>

</body>
</html>