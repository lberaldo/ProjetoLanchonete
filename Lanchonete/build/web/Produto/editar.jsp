<%-- 
    Document   : editar
    Created on : 28/04/2016, 14:41:43
    Author     : Thiago
--%>

<%@page import="modelo.Produto"%>
<%@page import="util.JPAutil"%>
<%@page import="javax.persistence.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alteração de Cadastro de Produtos</title>
        
        <script>
            function validar(obj){
            if ( isNaN(obj.value) || (parseFloat(obj.value) < 0) ||(obj.value == "")){
            alert ("O Campo valor deve ser um número maior que zero.");
            obj.focus();
            obj.value = "";
            }
        }
        </script>
    </head>
    <body>
        <h1>Modificação de Produto</h1>
         <%
            EntityManager c1 = JPAutil.getEntityManager();
            Produto pr = (Produto) c1.find(Produto.class, 
                    Integer.parseInt(request.getParameter("id")));
            
        %>
        <form action="../alterarProduto">
            <input type="hidden" name="txtId" value="<%= pr.getCod_produto() %>">
            Tipo de Produto: <input type="radio" name="txtTipo" value="lanche"<% if(pr.getTipo_produto().equals("lanche")) out.println("checked");%> required />Pizza <input type="radio" name="txtTipo" value="bebida" <% if(pr.getTipo_produto().equals("bebida")) out.println("checked");%> />Bebida <br/><br/>
            Nome: <input type="text" name="txtNome" value="<%=pr.getNome_produto()%>" required /><br/> <br/>
            Descricao: <input type="text" name="txtDescricao" value="<%=pr.getDescricao()%>" required /><br/><br/>
            Unidade: <input type="text" name="txtUnidade" value="<%=pr.getUnidade_medida()%>" required /><br/><br/>
            Valor:<input type="text" name="txtValor" value="<%=pr.getValor_produto()%>" required id="valor" onblur="validar(this)" /> <br/> <br/>
            <input type="submit" value="Recadastrar Produto" />
        </form>  <br/>  
        
    </body>
</html>
