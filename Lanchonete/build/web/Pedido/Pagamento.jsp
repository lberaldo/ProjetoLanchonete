<%-- 
    Document   : Pagamento
    Created on : 02/05/2016, 10:52:45
    Author     : Thiago
--%>

<%@page import="modelo.Funcionario"%>
<%@page import="util.JPAutil"%>
<%@page import="javax.persistence.*"%>
<%@page import="modelo.Pedido"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pagamento</title>
        <script>
           
            function troco(){
                
                var entregue=document.getElementById("entregue").value;
                var pagamento=document.getElementById("pagamento").value;
                
             document.getElementById("troco").value= entregue-pagamento;
             if (document.getElementById("troco").value<0){
                 document.getElementById("troco").value=0;
             }
            }
            window.setInterval("troco()",200);
            
            function tipoPagamento() {
                var pa = document.getElementById("cartao").checked;
                if (pa) {
                document.getElementById("entregue").disabled=true;
                document.getElementById("troco").disabled=true;
                }else {
                document.getElementById("entregue").disabled=false;
                document.getElementById("troco").disabled=false;
                } 
                }

        </script>
    </head>
    <body>
        <%
             EntityManager c=JPAutil.getEntityManager();
             Pedido pe= new Pedido();
             pe = (Pedido) c.find(Pedido.class,Integer.parseInt(
                         request.getParameter("id")));
             
             
             
        %>
        
        <h1>Registrar Pagamento</h1>
        <form action="../registrarPagamento">
        <input type="hidden" name="pagamento" value="<%=pe.getValor_pedido()%>" id="pagamento" />
        <b>Funcionario:</b> <%=pe.getFunc() %> <br/><br/>
        Pedido Nº:<input type="text" name="txtIdPedido" value="<%=pe.getNum_pedido()%>" readonly="readolny"/>  <br/>
        Valor do Pedido:<%=pe.getValor_pedido()%> <br/>
        <br/><br/>
        
        <b>Pagamento:</b> <br/>
        
        <input type="radio" name="txtPagamento" value="Dinheiro" required onclick="tipoPagamento()" id="dinheiro"/>Dinheiro<input type="radio" name="txtPagamento" value="Cartão" id="cartao" onclick="tipoPagamento()" required   />Cartão <br/>
        
        Total: <%=pe.getValor_pedido()%> <br/>
        Valor entregue pelo cliente: <input type="number" name="txtValor" value="" id="entregue" required /> <br/>
        Troco: <input type="number" name="txtTroco" value="" id="troco" /> <br/> <br/>
        
        <input type="submit" value="Concluir" /> 
        
        </form>
    </body>
</html>
