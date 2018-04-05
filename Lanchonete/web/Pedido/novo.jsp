<%-- 
    Document   : novo
    Created on : 01/05/2016, 14:56:55
    Author     : Thiago
--%>


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
                
                function mascara(o,f){
                v_obj=o;
                v_fun=f;
                setTimeout("execmascara()",1);
                }
                function execmascara(){
                v_obj.value=v_fun(v_obj.value);
                }
                function mtel(v){
                v=v.replace(/\D/g,"");             
                v=v.replace(/^(\d{2})(\d)/g,"($1) $2"); 
                v=v.replace(/(\d)(\d{4})$/,"$1-$2");    
                return v;
}    
        </script>
        
    </head>
    <body>
        <h1>Registro de Pedido</h1>
        
        <form action="../novoPedido">
            Data:<input type="text" name="txtData" value="" id="Data" readonly="readonly" /><br/><br/>
        <b>Lanches:</b><br/> <br/>
        
        <%      
           EntityManager c = JPAutil.getEntityManager();
           List lista ;
           Query consulta = c.createQuery("from Produto");
           lista = consulta.getResultList();
           Iterator produtos = lista.iterator();
           Produto pr= new Produto();
           while(produtos.hasNext()){
           pr =(Produto) produtos.next();
           if(pr.getTipo_produto().equals("lanche")){
           %>
           <%=pr.getNome_produto()%>&nbsp;&nbsp;Quantidade: &nbsp;<input type="text" name="<%=pr.getNome_produto()%>"  /> <br/>
           <%} %>
           <%} %>
          
        <br/>   
        <b>Bebidas:</b> <br/> <br/>
        <% 
           List lista1 ;
           Query consulta1 = c.createQuery("from Produto");
           lista1 = consulta1.getResultList();
           Iterator produtos1 = lista.iterator(); 
           while(produtos1.hasNext()){
           pr =(Produto) produtos1.next();
           if(pr.getTipo_produto().equals("bebida")){
           %>
           <%=pr.getNome_produto()%>&nbsp;&nbsp;Quantidade: &nbsp;<input type="text" name="<%=pr.getNome_produto()%>"/> <br/>
           <%} %>
           <%} %>
         <br/>
         
         <b>ID do Funcionário<b>
         <input type="text" name="txtFuncionario" value="" /> <br/>       
            
         <br/><br/>
        <input type="submit" value="Registrar Pagamento" /> <br/>
        </form> 
        
         <a href="../index.html">Voltar para página inicial </a> 
    </body>
</html>
