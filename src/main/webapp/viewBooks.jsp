<%@page import="java.util.List"%>
<%@page import="org.hibernate.*"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="com.library.entity.Book"%>
<%@page import="com.library.util.HibernateUtil"%>

<html>
<body>

<h2>All Books</h2>

<%
Session session1=
      HibernateUtil.getSessionFactory().openSession();

Query<Book> q=
      session1.createQuery("from Book",Book.class);

List<Book> books=q.list();
%>

<table border="1">

<tr>
<th>ID</th>
<th>Name</th>
<th>Author</th>
<th>Price</th>
</tr>

<%
for(Book b:books)
{
%>

<tr>
<td><%=b.getBookId()%></td>
<td><%=b.getBookName()%></td>
<td><%=b.getAuthor()%></td>
<td><%=b.getPrice()%></td>
</tr>

<%
}
session1.close();
%>

</table>

</body>
</html>