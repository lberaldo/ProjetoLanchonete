<%-- 
    Document   : editar
    Created on : 07/05/2016, 19:09:07
    Author     : Thiago
--%>

<%@page import="modelo.Funcionario"%>
<%@page import="modelo.Item"%>
<%@page import="modelo.Pedido"%>

<%@page import="java.util.*"%>
<%@page import="util.JPAutil"%>
<%@page import="javax.persistence.*"%>
<%@page import="java.util.Collection"%>
<%@page import="java.util.Iterator"%>
<%@page import="modelo.Produto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >
        <title>Pedido</title>
        <script>
                
                function Data(){   
                var agora= new Date();
                var mes= agora.getMonth()+1;
                var dia=agora.getDate();
                var ano=agora.getFullYear();
                if(dia<10){
                    dia="0"+agora.getDate();
                }
                if(mes<10){
                    mes="0"+mes;
                }
                document.getElementById("Data").value=dia+"/"+mes+"/"+agora.getFullYear();
                }
                window.setTimeout("Data()",1);
        </script>
        
    </head>
    <body>
        <h1>Edição de Pedido</h1>
        
        <form action="../editarPedido">
            Data:<input type="text" name="txtData" value="" id="Data" readonly="readonly" /><br/><br/>
            <b>Itens do pedido:</b>
            <% EntityManager c = JPAutil.getEntityManager();
               Pedido pe= new Pedido();
               Item it=new Item();
               Item it1= new Item();
               int id_pedido= Integer.parseInt(request.getParameter("id"));
               pe = (Pedido) c.find(Pedido.class, id_pedido);
               String informacoes[]= new String[pe.getQuant_itens()];
               int i=0;
               for(i=0;i<pe.getQuant_itens();i++){
                informacoes[i]=pe.getInformacoes()[i];
               }%>
               <br/><br/>
               <%
               for(i=0;i<pe.getQuant_itens();i++){
                   
                  out.print(informacoes[i]);%>
                  <br/>
               <%}%> 
                <br/> <br/>
        <b>Pizzas:</b><br/> <br/>
        <%      
          
           List lista ;
           Query consulta = c.createQuery("from Produto");
           lista = consulta.getResultList();
           Iterator produtos = lista.iterator();
           Produto pr= new Produto();
           while(produtos.hasNext()){
                pr =(Produto) produtos.next();
                if(pr.getTipo_produto().equals("lanche")){
                %>
                    <%=pr.getNome_produto()%>&nbsp;&nbsp;Quantidade: &nbsp;<input type="number" name="<%=pr.getNome_produto()%>"  /> <br/>
           
                       
           <%   } %>
           <%} %>
        <br/>   
        <b>Bebidas:</b> <br/> <br/>
        <% 
           List lista1 ;
           Query consulta1 = c.createQuery("from Produto");
           lista1 = consulta.getResultList();
           Iterator produtos1 = lista.iterator(); 
           while(produtos1.hasNext()){
                pr =(Produto) produtos1.next();
                if(pr.getTipo_produto().equals("bebida")){
                %>
                    <%=pr.getNome_produto()%>&nbsp;&nbsp;Quantidade: &nbsp;<input type="number" name="<%=pr.getNome_produto()%>"  />  <br/>
                   
           <%   } %>
           <%} %>
         <br/>
         <input type="hidden" name="txtId1" value="<%=pe.getNum_pedido()%>" />
         
             
         <b>Funcionário responsável:</b> <br/>
         Nome:<%=pe.getFunc()%> <br/>
         Id: <%=pe.getId_func()%> <br/><br/>
         <b>ID do Funcionário<b>
         <input type="text" name="txtFuncionario" value="" /> <br/> 
        <input type="submit" value="Registrar Pagamento" /> 
        </form> 
         <br/><br/>
         <a href="../index.html">Voltar para página inicial </a> 
    </body>
</html>

