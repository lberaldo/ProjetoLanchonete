<%-- 
    Document   : exibir
    Created on : 25/05/2016, 18:23:54
    Author     : Thiago
--%>

<%@page import="modelo.Funcionario"%>
<%@page import="util.JPAutil"%>
<%@page import="java.util.*"%>
<%@page import="javax.persistence.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Funcionários</title>
    </head>
    <body>
        <table> <b>Funcionários:</b>
        <% EntityManager c = JPAutil.getEntityManager();
           List lista ;
           Query consulta = c.createQuery("from Funcionario");
           lista = consulta.getResultList();
           Iterator controle = lista.iterator();
           Funcionario fu = new Funcionario();
           while (controle.hasNext()){
             fu =(Funcionario) controle.next();
             
        %>
        <tr>
            <td>
                <%= fu.getNum_funcionario()%>
            </td>
            <td>
                <%=fu.getNome()  %>
            </td>
            
            <td>
                <a href="editar.jsp?id=<%=fu.getNum_funcionario() %>">Editar</a>
            </td>
            <td>
                <a href="excluir.jsp?id=<%=fu.getNum_funcionario() %>">Excluir</a>
            </td>
        </tr>
        <%
           }
        %>
        </table>
        <br/>
        <a href="../index.html">Voltar para página incial </a>
    </body>
</html>

