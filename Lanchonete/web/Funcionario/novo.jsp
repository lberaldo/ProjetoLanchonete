<%-- 
    Document   : novo
    Created on : 25/05/2016, 18:23:37
    Author     : Thiago
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Funcionário</title>
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
        <h1>Novo Funcionario</h1>
        <form action="../novoFuncionario">
        
        Nome:<input type="text" name="txtNome" value="" required /><br/>
        CPF:<input type="text" name="txtCPF" value="" required /><br/>
        Salário:<input type="text" name="txtSalario" value="" required onblur="validar(this)" /><br/>
        <input type="submit" value="Cadastrar Funcionario" />
        </form>
    </body>
</html>
