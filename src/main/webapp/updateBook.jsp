<%@page import="org.hibernate.*"%>
<%@page import="com.library.entity.Book"%>
<%@page import="com.library.util.HibernateUtil"%>

<html>
<body>

<h2>Update Book</h2>

<form method="post">

Book Id:
<input type="text" name="bookId"><br><br>

Book Name:
<input type="text" name="bookName"><br><br>

Author:
<input type="text" name="author"><br><br>

Price:
<input type="text" name="price"><br><br>

<input type="submit" value="Update">

</form>

<%
if(request.getMethod().equalsIgnoreCase("POST"))
{
    Session session1=
       HibernateUtil.getSessionFactory().openSession();

    Transaction tx=session1.beginTransaction();

    int id=Integer.parseInt(request.getParameter("bookId"));

    Book b=session1.get(Book.class,id);

    if(b!=null)
    {
        b.setBookName(request.getParameter("bookName"));
        b.setAuthor(request.getParameter("author"));
        b.setPrice(
             Double.parseDouble(request.getParameter("price"))
        );

        session1.update(b);

        tx.commit();

        out.println("<h3>Book Updated Successfully</h3>");
    }
    else
    {
        out.println("<h3>Book Not Found</h3>");
    }

    session1.close();
}
%>

</body>
</html>