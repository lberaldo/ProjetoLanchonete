/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Funcionario;

import modelo.Item;
import modelo.Pedido;
import modelo.Produto;

import util.JPAutil;




/**
 *
 * @author Thiago
 */
public class Controle extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    EntityTransaction tr;
    EntityManager c;
    private int id;
    String id_usuario;
    int id_pedido;
    private int id_cliente;
    private RequestDispatcher np;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try{
        c=JPAutil.getEntityManager();
        Produto pr= new Produto();
        Funcionario fu= new Funcionario();
        
        Pedido pe= new Pedido();
        
        
        String acao=request.getServletPath();
        
        switch(acao){
            
            
            
            case "/novoProduto":
                
                pr.setTipo_produto(request.getParameter("txtTipo"));
                pr.setNome_produto(request.getParameter("txtNome"));
                pr.setDescricao(request.getParameter("txtDescricao"));
                pr.setUnidade_medida(request.getParameter("txtUnidade"));
                pr.setValor_produto(Double.parseDouble(request.getParameter("txtValor")));
                tr = c.getTransaction();
                tr.begin();
                c.persist(pr);
                tr.commit();
                c.close();
                response.sendRedirect("index.html");
                break;
                
            case "/alterarProduto":
                
                id = Integer.parseInt(request.getParameter("txtId"));
                pr = c.find(Produto.class, id);
                pr.setNome_produto(request.getParameter("txtNome"));
                pr.setDescricao(request.getParameter("txtDescricao"));
                pr.setTipo_produto(request.getParameter("txtTipo"));
                pr.setUnidade_medida(request.getParameter("txtUnidade"));
                pr.setValor_produto(Double.parseDouble(request.getParameter("txtValor")));
                tr = c.getTransaction();
                tr.begin();
                c.merge(pr);
                tr.commit();
                c.close();
                response.sendRedirect("index.html");
                break;
            
            case "/excluirProduto":
                tr = c.getTransaction();
                tr.begin();
                id = Integer.parseInt(request.getParameter("txtId"));
                pr = (Produto) c.find(Produto.class, id);
                c.remove(pr);
                tr.commit();
                c.close();
                response.sendRedirect("index.html");
      
                break;
            
            case "/novoFuncionario":
                
               fu.setNome(request.getParameter("txtNome"));
               fu.setCpf(request.getParameter("txtCPF"));
               fu.setSalário(Double.parseDouble(request.getParameter("txtSalario")));
               tr = c.getTransaction();
               tr.begin();
               c.persist(fu);
               tr.commit();
               c.close();
               response.sendRedirect("index.html");
               break;
               
            case "/alterarFuncionario":
                id = Integer.parseInt(request.getParameter("txtId"));
                fu = c.find(Funcionario.class, id);
                fu.setNome(request.getParameter("txtNome"));
                fu.setCpf(request.getParameter("txtCPF"));
                fu.setSalário(Double.parseDouble(request.getParameter("txtSalario")));
                tr = c.getTransaction();
                tr.begin();
                c.merge(fu);
                tr.commit();
                c.close();
                response.sendRedirect("index.html");
                break; 
            
            case "/excluirFuncionario":
                tr = c.getTransaction();
                tr.begin();
                id = Integer.parseInt(request.getParameter("txtId"));
                fu = (Funcionario) c.find(Funcionario.class, id);
                c.remove(fu);
                tr.commit();
                c.close();
                response.sendRedirect("index.html");
                break;
            
           
            
            
               
            
            
            
            
            
            
            case"/novoPedido":
                 List lista ;
                int id_func=0;
                double valorPedido=0;
                int i=-1;
                int a=0;
                id_func=Integer.parseInt(request.getParameter("txtFuncionario"));
                fu = (Funcionario) c.find(Funcionario.class, id_func);
                
                pe.setId_func(String.valueOf(fu.getNum_funcionario()));
                pe.setFunc(fu.getNome());
                pe.setPagamento("");
                pe.setData(request.getParameter("txtData"));
                tr = c.getTransaction();
                tr.begin();
                c.persist(pe);
                tr.commit();  
                Query consulta = c.createQuery("from Produto");
                lista = consulta.getResultList();
                Iterator produtos = lista.iterator();
                while(produtos.hasNext()){
                pr =(Produto) produtos.next();
                    if(request.getParameter(pr.getNome_produto()).equals("") || request.getParameter(pr.getNome_produto()).equals("0")){
                    }else{
                         a++;  
                        }
                }
                Item it[]=new Item[a];
                String nome[]= new String[a];
                String quantidade[]= new String[a];
                String valor[]= new String[a];
                String tipo[]= new String[a];
                Produto pr1= new Produto();
                Iterator produtos1=lista.iterator();
                while(produtos1.hasNext()){
                pr1 =(Produto) produtos1.next();
                    if(request.getParameter(pr1.getNome_produto()).equals("") || request.getParameter(pr1.getNome_produto()).equals("0")){
                    }else{
                        i++;
                        it[i]= new Item();
                        it[i].setProduto(pr1);
                        it[i].setQuantidade(Integer.parseInt(request.getParameter(pr1.getNome_produto())));
                        it[i].setValor(pr1.getValor_produto()*it[i].getQuantidade());
                        it[i].setPedido(pe);
                        nome[i]=pr1.getNome_produto();
                        quantidade[i]=request.getParameter(pr1.getNome_produto());
                        valor[i]=String.valueOf(String.valueOf(it[i].getValor()));
                        tipo[i]=pr1.getTipo_produto();
                        valorPedido=valorPedido+it[i].getValor();
                        tr = c.getTransaction();
                        tr.begin();
                        c.persist(it[i]);
                        tr.commit();   
                    }
                }
                String informacoes[]= new String[a];
                for(i=0;i<a;i++){
                    informacoes[i]="Produto: "+tipo[i]+" " +nome[i]+" // Quantidade: "+quantidade[i]+" // Valor: "+valor[i];
                }
                Pedido pe1=new Pedido();
                pe1 = c.find(Pedido.class, pe.getNum_pedido());
                pe1.setValor_pedido(valorPedido);
                pe1.setQuant_itens(a);
                pe1.setInformacoes(informacoes);
                int id_pedido=pe1.getNum_pedido();
                tr = c.getTransaction();
                tr.begin();
                c.merge(pe1);
                tr.commit();
                c.close();
                response.sendRedirect("Pedido/Pagamento.jsp?id="+id_pedido);
                break;
                
            case "/registrarPagamento":
                id_pedido=Integer.parseInt(request.getParameter("txtIdPedido"));
                pe = c.find(Pedido.class, id_pedido);
                pe.setPagamento(request.getParameter("txtPagamento"));
                tr = c.getTransaction();
                tr.begin();
                c.merge(pe);
                tr.commit();
                c.close();
                response.sendRedirect("index.html");
                break;
                
            
                
            
                
            case "/excluirPedido":
                id = Integer.parseInt(request.getParameter("txtId"));
                tr = c.getTransaction();
                tr.begin();
                pe = (Pedido) c.find(Pedido.class, id);
                c.remove(pe);
                tr.commit();
                Item it1= new Item();
                List lista2;
                Query consulta2 = c.createQuery("from Item");
                lista2=consulta2.getResultList();
                Iterator itens = lista2.iterator();
                while (itens.hasNext()){
                    it1=(Item)itens.next();
                    if(it1.getPedido().equals(pe)){
                        c.remove(it1);
                        tr.commit();
                    }
                }
                c.close();
                
                response.sendRedirect("index.html");
                break;
            
            case "/editarPedido":
                int id_pedido2=0;
                Pedido pe3= new Pedido();
                id_pedido2 = Integer.parseInt(request.getParameter("txtId1"));
                
                
                
                String pgt_antigo=pe3.getPagamento();
                int id_antigo=pe3.getNum_pedido();
                
                pe3 = (Pedido) c.find(Pedido.class, id_pedido2);
                List lista7 ;
                Item it2= new Item();
                Query consulta7 = c.createQuery("from Item");
                lista7 = consulta7.getResultList();
                Iterator itens2 = lista7.iterator();
                while(itens2.hasNext()){
                   it2=(Item) itens2.next();
                   if(it2.getPedido().equals(pe3)){
                       
                       tr = c.getTransaction();
                       tr.begin();
                       c.remove(it2);
                       tr.commit();
                   }
                }
                
                double valorPedido1=0;
                int y=-1;
                int x=0;
                
                Query consulte = c.createQuery("from Produto");
                List liste = consulte.getResultList();
                Iterator produtoss = liste.iterator();
                while(produtoss.hasNext()){
                pr =(Produto) produtoss.next();
                    if(request.getParameter(pr.getNome_produto()).equals("") || request.getParameter(pr.getNome_produto()).equals("0")){
                    }else{
                         x++;  
                        }
                }
                String nome1[]= new String[x];
                String quantidade1[]= new String[x];
                String valor1[]= new String[x];
                String tipo1[]= new String[x];
                Item it3[]=new Item[x];
                Produto prr= new Produto();
                Query consulto=c.createQuery("from Produto");
                List listi=consulto.getResultList();
                Iterator produta=listi.iterator();
                while(produta.hasNext()){
                prr =(Produto) produta.next();
                    if(request.getParameter(prr.getNome_produto()).equals("") || request.getParameter(prr.getNome_produto()).equals("0")){
                    }else{
                        y++;
                        it3[y]= new Item();
                        it3[y].setProduto(prr);
                        it3[y].setQuantidade(Integer.parseInt(request.getParameter(prr.getNome_produto())));
                        it3[y].setValor(prr.getValor_produto()*it3[y].getQuantidade());
                        it3[y].setPedido(pe3);
                        nome1[y]=prr.getNome_produto();
                        quantidade1[y]=request.getParameter(prr.getNome_produto());
                        valor1[y]=String.valueOf(String.valueOf(it3[y].getValor()));
                        tipo1[y]=prr.getTipo_produto();
                        valorPedido1=valorPedido1+it3[y].getValor();
                        tr = c.getTransaction();
                        tr.begin();
                        c.persist(it3[y]);
                        tr.commit();   
                    }
                }
                String informacoes1[]= new String[x];
                for(y=0;y<x;y++){
                    informacoes1[y]="Produto: "+tipo1[y]+" " +nome1[y]+" // Quantidade: "+quantidade1[y]+" // Valor: "+valor1[y];
                }
                int id_func_novo=Integer.parseInt(request.getParameter("txtFuncionario"));
                Funcionario fu1= new Funcionario();
                fu1 = (Funcionario) c.find(Funcionario.class, id_func_novo);
                pe3.setData(request.getParameter("txtData"));
                pe3.setFunc(fu1.getNome());
                pe3.setId_func(String.valueOf(fu1.getNum_funcionario()));
                pe3.setPagamento(pgt_antigo);
                pe3.setValor_pedido(valorPedido1);
                pe3.setQuant_itens(x);
                pe3.setInformacoes(informacoes1);
                int id_pedido1=pe3.getNum_pedido();
                tr = c.getTransaction();
                tr.begin();
                c.merge(pe3);
                tr.commit();
                c.close();
                response.sendRedirect("Pedido/Pagamento.jsp?id="+id_pedido1);
                break;
                
        }
        c.close();
        response.sendRedirect("index.html");
        
        }catch( Exception e){
            System.out.print("Erro: "+ e.getMessage());
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
