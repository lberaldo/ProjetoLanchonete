<%-- 
    Document   : editar
    Created on : 25/05/2016, 18:23:46
    Author     : Thiago
--%>

<%@page import="modelo.Funcionario"%>
<%@page import="util.JPAutil"%>
<%@page import="javax.persistence.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Funcionários</title>
    <script>
            function validar(obj){
            if ( isNaN(obj.value) || (parseFloat(obj.value) < 0) ||(obj.value == "")){
            alert ("O Campo salário deve ser um número maior que zero.");
            obj.focus();
            obj.value = "";
            }
        }
        </script>    
    </head>
    <body>
        <h1>Recadastramento de Funcionários</h1>
         <%
            EntityManager c1 = JPAutil.getEntityManager();
            Funcionario fu = (Funcionario) c1.find(Funcionario.class, 
                    Integer.parseInt(request.getParameter("id")));
            
        %>
        <form action="../alterarFuncionario">
            ID: <input type="text" name="txtId" value="<%= fu.getNum_funcionario() %>" readonly/><br/>
            Nome:<input type="text" name="txtNome" value="<%=fu.getNome()%>" required /><br/>
            CPF:<input type="text" name="txtCPF" value="<%=fu.getCpf()%>" required /><br/>
            Salário:<input type="text" name="txtSalario" value="<%=fu.getSalário()%>" required onblur="validar(this)" /><br/>
            <input type="submit" value="Recadastrar Funcionário" /><br/> <br/>
            <a href="../index.html">Voltar para página incial </a>
        </form>  <br/>  
    </body>
</html>
