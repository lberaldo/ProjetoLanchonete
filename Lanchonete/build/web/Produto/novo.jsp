<%-- 
    Document   : novo
    Created on : 26/04/2016, 00:22:50
    Author     : Thiago
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Produtos</title>
        
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
        <h1>Cadastro de Produto</h1>
        <form action="../novoProduto">
        
            Tipo de Produto: <input type="radio" name="txtTipo" value="lanche" required />Lanche <input type="radio" name="txtTipo" value="bebida" />Bebida <br/><br/>
            Nome: <input type="text" name="txtNome" value="" required /><br/> <br/>
            Descricao: <input type="text" name="txtDescricao" value="" required /><br/><br/>
            Unidade: <input type="text" name="txtUnidade" value="" required /><br/><br/>
            Valor:<input type="text" name="txtValor" value="" required id="valor" onblur="validar(this)" /> <br/> <br/>
            <input type="submit" value="Cadastrar Produto" />
        </form>    <br/>
        <a href="../index.html">Voltar para a página inicial </a>
    </body>
</html>
