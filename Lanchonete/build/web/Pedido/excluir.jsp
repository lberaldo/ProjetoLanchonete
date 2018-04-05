<%-- 
    Document   : excluir
    Created on : 07/05/2016, 17:36:39
    Author     : Thiago
--%>

<%@page import="modelo.Produto"%>

<%@page import="modelo.Item"%>
<%@page import="java.util.*"%>
<%@page import="modelo.Pedido"%>
<%@page import="javax.persistence.*"%>
<%@page import="util.JPAutil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exclusão de pedido</title>
    </head>
    <body>
        <%
            EntityManager c= JPAutil.getEntityManager();
            Pedido pe= new Pedido();
            int id_pedido=Integer.parseInt(request.getParameter("id"));
            pe = (Pedido) c.find(Pedido.class, id_pedido);
           
            
        %>
        <form action="../excluirPedido">
       
        <h1>Dados do Pedido</h1>
        <input type="hidden" name="txtId" value="<%=pe.getNum_pedido()%>" />
        Valor Pedido: <%=pe.getValor_pedido()%> <br/>
        
        Valor Total: <%=pe.getValor_pedido()%> <br/>
        Tipo de Pagamento: <%=pe.getPagamento()%> <br/><br/>
        
        
        <b>Pizzas</b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>Quantidade</b><br/>       
        <%
          Produto pr= new Produto();  
          Item it= new Item();
          List lista;
          Query consulta=c.createQuery("from Item");
          lista=consulta.getResultList();
          Iterator itens = lista.iterator();
          while(itens.hasNext()){
               it=(Item) itens.next();
               pr=it.getProduto();
               if(it.getPedido().equals(pe)&& pr.getTipo_produto().equals("lanche")){%>
                    <%=pr.getNome_produto()%>&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp; <%=it.getQuantidade()%> <br/>
         <% }
          }
        %>
        <br/><b>Bebidas</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>Quantidade</b><br/>
        <%
          Produto pr1= new Produto();  
          Item it1= new Item();
          List lista1;
          Query consulta1=c.createQuery("from Item");
          lista1=consulta1.getResultList();
          Iterator itens1 = lista1.iterator();
          while(itens1.hasNext()){
               it1=(Item) itens1.next();
               pr1=it1.getProduto();
               if(it1.getPedido().equals(pe)&& pr1.getTipo_produto().equals("bebida")){%>
                    <%=pr1.getNome_produto()%>&nbsp;&nbsp;&nbsp;&nbsp; <%=it1.getQuantidade()%> <br/>
         <% }
          }
        %>
        <br/>
        <input type="submit" value="Excluir" />
         </form>
    </body>
</html>
