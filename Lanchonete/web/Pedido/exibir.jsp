<%-- 
    Document   : exibir
    Created on : 07/05/2016, 14:19:56
    Author     : Thiago
--%>

<%@page import="modelo.Pedido"%>
<%@page import="java.util.*"%>

<%@page import="javax.persistence.*"%>
<%@page import="util.JPAutil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Pedidos</title>
    </head>
    <body>
           
    <h1>Lista de Pedidos</h1>
    
    <table>
        <b>Nº </b>&nbsp;&nbsp;  <b>Valor</b>&nbsp;&nbsp;&nbsp;  <b>Pagamento</b>&nbsp;&nbsp;&nbsp;  <b>Data</b>
        <%  
            EntityManager c= JPAutil.getEntityManager();
            Pedido pe= new Pedido();
            List lista;
            Query consulta = c.createQuery("from Pedido");
            lista=consulta.getResultList();
            Iterator pedidos = lista.iterator();
            while(pedidos.hasNext()){
                pe= (Pedido) pedidos.next();
                
            %>     
                <tr> 
            <td>
                <%= pe.getNum_pedido()  %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </td>
            
            <td>
                <%=pe.getValor_pedido()  %> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </td>
            <td>
                <%=pe.getPagamento()  %> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </td>
            <td>
                <%=pe.getData()  %> &nbsp;&nbsp;&nbsp;
            </td>
            <td>
                <a href="editar.jsp?id=<%=pe.getNum_pedido() %>">Editar</a>&nbsp;&nbsp; <a href="excluir.jsp?id=<%=pe.getNum_pedido() %>">Excluir</a>
            </td>
            
        </tr>
                <%}
            
            %>
         </table>  <br/>  
         <a href="../index.html">Voltar para página inicial </a> 
    </body>
</html>
