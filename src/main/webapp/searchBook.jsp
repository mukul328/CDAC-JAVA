<%@page import="org.hibernate.*"%>
<%@page import="com.library.entity.Book"%>
<%@page import="com.library.util.HibernateUtil"%>

<html>
<body>

<h2>Search Book</h2>

<form method="post">

Book Id:
<input type="text" name="bookId">

<input type="submit" value="Search">

</form>

<%
if(request.getMethod().equalsIgnoreCase("POST"))
{
    int id=Integer.parseInt(request.getParameter("bookId"));

    Session session1=
       HibernateUtil.getSessionFactory().openSession();

    Book b=session1.get(Book.class,id);

    if(b!=null)
    {
%>

<h3>Book Details</h3>

Book Id : <%=b.getBookId()%><br>
Book Name : <%=b.getBookName()%><br>
Author : <%=b.getAuthor()%><br>
Price : <%=b.getPrice()%><br>

<%
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