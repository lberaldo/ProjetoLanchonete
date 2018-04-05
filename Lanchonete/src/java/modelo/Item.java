/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.io.Serializable;
import java.util.List;
import javax.persistence.*;

/**
 *
 * @author Thiago
 */

@Entity
@Table(name="item")
@SequenceGenerator(initialValue=1, allocationSize=1,name="id_item", sequenceName="gen_item" )
public class Item implements Serializable {
    private static final long SerialVersionUID=1L;
    
    @GeneratedValue(generator="id_item", strategy=GenerationType.SEQUENCE)
    @Id
    private int cod_item;
    @Column(name="valor", nullable=false)
    private double valor;
    @Column(name="quantidade", nullable=false)
    private int quantidade;
    @ManyToOne
    private Produto produto;
    @ManyToOne
    private Pedido pedido;

    public Pedido getPedido() {
        return pedido;
    }

    public void setPedido(Pedido pedido) {
        this.pedido = pedido;
    }
   
    
  
    public Item() {
    }

    public int getCod_item() {
        return cod_item;
    }

    public void setCod_item(int cod_item) {
        this.cod_item = cod_item;
    }

    public double getValor() {
        return valor;
    }

    public void setValor(double valor) {
        this.valor = valor;
    }

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }

    public Produto getProduto() {
        return produto;
    }

    public void setProduto(Produto produto) {
        this.produto = produto;
    }
    
    

   

    @Override
    public int hashCode() {
        int hash = 3;
        hash = 97 * hash + this.cod_item;
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
        final Item other = (Item) obj;
        if (this.cod_item != other.cod_item) {
            return false;
        }
        return true;
    }
    
}

