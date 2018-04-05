/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.*;

/**
 *
 * @author Thiago*
 */

@Entity
@Table (name="pedido")
@SequenceGenerator(initialValue=1, allocationSize=1,name="id_pedido", sequenceName="gen_pedido" )
public class Pedido implements Serializable {
    private static final long SerialVersionUID=1L;
    
    @GeneratedValue(generator="id_pedido", strategy=GenerationType.SEQUENCE)
    @Id
    private int num_pedido;
    @Column(name="valor_pedido", nullable=true)
    private double valor_pedido;
    @OneToMany(cascade = CascadeType.ALL,mappedBy = "pedido")
    private Collection <Item> itens;
    @Column(name="Pagamento", length=30, nullable=true)
    private String  Pagamento;
    @Column(name="data", nullable=false)
    private String data;
    @Column(name="quant_itens", nullable=true)
    private int quant_itens;
    @Column(name="informacoes", nullable=true)
    private String informacoes[]= new String [quant_itens];
   
    @Column(name="func", length=30, nullable=true)
    private String func;
    @Column(name="id_func", length=30, nullable=true)
    private String id_func;

    public int getQuant_itens() {
        return quant_itens;
    }

    public void setQuant_itens(int quant_itens) {
        this.quant_itens = quant_itens;
    }
    
    
    
    public String[] getInformacoes() {
        return informacoes;
    }

    public void setInformacoes(String[] informacoes) {
        this.informacoes = informacoes;
    }
    
    
    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public String getFunc() {
        return func;
    }

    public void setFunc(String func) {
        this.func = func;
    }

    public String getId_func() {
        return id_func;
    }

    public void setId_func(String id_func) {
        this.id_func = id_func;
    }

    
    
    
    public String getPagamento() {
        return Pagamento;
    }

    public void setPagamento(String Pagamento) {
        this.Pagamento = Pagamento;
    }
    
    
    public Pedido() {
    }

    public int getNum_pedido() {
        return num_pedido;
    }

    public void setNum_pedido(int num_pedido) {
        this.num_pedido = num_pedido;
    }

  

    public double getValor_pedido() {
        return valor_pedido;
    }

    public void setValor_pedido(double valor_pedido) {
        this.valor_pedido = valor_pedido;
    }

    public Collection<Item> getItens() {
        return itens;
    }

    public void setItens(Collection<Item> itens) {
        this.itens = itens;
    }

    

   

   

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 13 * hash + this.num_pedido;
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Pedido other = (Pedido) obj;
        if (this.num_pedido != other.num_pedido) {
            return false;
        }
        return true;
    }
    
    
    
}
