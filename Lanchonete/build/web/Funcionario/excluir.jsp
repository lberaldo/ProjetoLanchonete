<%-- 
    Document   : excluir
    Created on : 25/05/2016, 18:24:04
    Author     : Thiago
--%>

<%@page import="util.JPAutil"%>
<%@page import="modelo.Funcionario"%>
<%@page import="javax.persistence.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exclusão de Funcionário</title>
    </head>
    <body>
        <h1>Exclusão de Funcionários</h1>
         <%
            EntityManager c1 = JPAutil.getEntityManager();
            Funcionario fu = (Funcionario) c1.find(Funcionario.class, 
                    Integer.parseInt(request.getParameter("id")));
            
        %>
        <form action="../excluirFuncionario">
            ID:<input type="text" name="txtId" value="<%= fu.getNum_funcionario() %>" readonly /> <br/>
            Nome:<input type="text" name="txtNome" value="<%=fu.getNome()%>" readonly /><br/>
            CPF:<input type="text" name="txtCPF" value="<%=fu.getCpf()%>" readonly /><br/>
            Salário:<input type="text" name="txtSalario" value="<%=fu.getSalário()%>" readonly /><br/>
            <input type="submit" value="Excluir Funcionário" /><br/> <br/>
            <a href="../index.html">Voltar para página incial </a>
        </form>  <br/>  
    </body>
</html>
