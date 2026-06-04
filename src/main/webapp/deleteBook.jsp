<%@page import="org.hibernate.*"%>
<%@page import="com.library.entity.Book"%>
<%@page import="com.library.util.HibernateUtil"%>

<html>
<body>

<h2>Delete Book</h2>

<form method="post">

Book Id:
<input type="text" name="bookId">

<input type="submit" value="Delete">

</form>

<%
if(request.getMethod().equalsIgnoreCase("POST"))
{
    int id=Integer.parseInt(request.getParameter("bookId"));

    Session session1=
       HibernateUtil.getSessionFactory().openSession();

    Transaction tx=session1.beginTransaction();

    Book b=session1.get(Book.class,id);

    if(b!=null)
    {
        session1.delete(b);
        tx.commit();

        out.println("<h3>Book Deleted Successfully</h3>");
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