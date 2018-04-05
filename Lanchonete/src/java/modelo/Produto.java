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
 * @author Thiago
 */

@Entity
@Table (name="produto")
@SequenceGenerator(allocationSize = 1,initialValue = 1,
                   name = "id_produto", sequenceName = "gen_produto" )
public class Produto implements Serializable {
    private static final long serialVersionUID = 1L;
    @GeneratedValue(generator = "id_produto",strategy = GenerationType.SEQUENCE)
    @Id
    private int cod_produto;
    @Column(name="tipo_produto", length=18, nullable=false)
    private String tipo_produto;
    @Column(name="nome_produto", length=30, nullable=false)
    private String nome_produto;
    @Column(name="valor_produto",nullable=false)
    private double valor_produto;
    @Column(name="unidade_medida", length=10, nullable=false)
    private String unidade_medida;
    @Column(name="descricao", length=80, nullable=false)
    private String descricao;
    @OneToMany(cascade = CascadeType.ALL,mappedBy = "produto")
    private Collection <Item> itens;

    public Produto() {
    }

    public int getCod_produto() {
        return cod_produto;
    }

    public void setCod_produto(int cod_produto) {
        this.cod_produto = cod_produto;
    }

    public String getTipo_produto() {
        return tipo_produto;
    }

    public void setTipo_produto(String tipo_produto) {
        this.tipo_produto = tipo_produto;
    }

    public String getNome_produto() {
        return nome_produto;
    }

    public void setNome_produto(String nome_produto) {
        this.nome_produto = nome_produto;
    }

    public double getValor_produto() {
        return valor_produto;
    }

    public void setValor_produto(double valor_produto) {
        this.valor_produto = valor_produto;
    }

    public String getUnidade_medida() {
        return unidade_medida;
    }

    public void setUnidade_medida(String unidade_medida) {
        this.unidade_medida = unidade_medida;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    @Override
    public int hashCode() {
        int hash = 3;
        hash = 89 * hash + this.cod_produto;
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
        final Produto other = (Produto) obj;
        if (this.cod_produto != other.cod_produto) {
            return false;
        }
        return true;
    }

   
    
    
    
}
