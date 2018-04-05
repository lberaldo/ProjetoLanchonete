<%-- 
    Document   : exibir
    Created on : 28/04/2016, 14:30:38
    Author     : Thiago
--%>

<%@page import="util.JPAutil"%>
<%@page import="modelo.Produto"%>
<%@page import="java.util.*"%>
<%@page import="javax.persistence.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Produtos</title>
    </head>
    <body>
        <table> <b>Lanches:</b>
        <% EntityManager c = JPAutil.getEntityManager();
           List lista ;
           Query consulta = c.createQuery("from Produto");
           lista = consulta.getResultList();
           Iterator controle = lista.iterator();
           Produto pr = new Produto();
           while (controle.hasNext()){
             pr =(Produto) controle.next();
             if(pr.getTipo_produto().equals("lanche")){
        %>
        <tr>
            <td>
                <%= pr.getCod_produto()%>
            </td>
            <td>
                <%=pr.getNome_produto()  %>
            </td>
            
            <td>
                <a href="editar.jsp?id=<%=pr.getCod_produto() %>">Editar</a>
            </td>
            <td>
                <a href="excluir.jsp?id=<%=pr.getCod_produto() %>">Excluir</a>
            </td>
        </tr>
        <%
           }}
        %>
        </table>
        <table><br/><b>Bebidas:</b>
         <% c = JPAutil.getEntityManager();
           
           consulta = c.createQuery("from Produto");
           lista = consulta.getResultList();
           controle = lista.iterator();
           pr = new Produto();
           while (controle.hasNext()){
             pr =(Produto) controle.next();
             if(pr.getTipo_produto().equals("bebida")){
        %>
        <tr>
            <td>
                <%= pr.getCod_produto()%>
            </td>
            <td>
                <%=pr.getNome_produto()  %>
            </td>
            
            <td>
                <a href="editar.jsp?id=<%=pr.getCod_produto() %>">Editar</a>
            </td>
            <td>
                <a href="excluir.jsp?id=<%=pr.getCod_produto() %>">Excluir</a>
            </td>
        </tr>
        <%
           }}
        %>
        </table> <br/>
        <a href="../index.html">Voltar para página incial </a>
    </body>
</html>
