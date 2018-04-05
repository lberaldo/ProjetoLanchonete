<%-- 
    Document   : excluir
    Created on : 28/04/2016, 15:01:02
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
        <title>Página de exclusão</title>
    </head>
    <body>
        <h1>Exclusão do Produto</h1>
         <%
            EntityManager c = JPAutil.getEntityManager();
            Produto pr = (Produto) c.find(Produto.class, 
                    Integer.parseInt(request.getParameter("id")));
            
        %>
        <form action="../excluirProduto">
            <input type="hidden" name="txtId" value="<%= pr.getCod_produto() %>">
            Tipo de Produto: <input type="radio" name="txtTipo" value="lanche"<% if(pr.getTipo_produto().equals("lanche")) out.println("checked");%> disabled="disabled" />Lanche <input type="radio" name="txtTipo" value="bebida" <% if(pr.getTipo_produto().equals("bebida")) out.println("checked");%> disabled="disabled" />Bebida <br/><br/>
            Nome: <input type="text" name="txtNome" value="<%=pr.getNome_produto()%>"readonly="readonly" /><br/> <br/>
            Descricao: <input type="text" name="txtDescricao" value="<%=pr.getDescricao()%>"readonly="readonly" /><br/><br/>
            Unidade: <input type="text" name="txtUnidade" value="<%=pr.getUnidade_medida()%>"readonly="readonly" /><br/><br/>
            Valor:<input type="text" name="txtValor" value="<%=pr.getValor_produto()%>"readonly="readonly" /> <br/> <br/>
            <input type="submit" value="Excluir Produto" />
        </form>    
    </body>
</html>
