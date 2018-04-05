/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.io.Serializable;
import javax.persistence.*;

/**
 *
 * @author Thiago
 */

@Entity
@Table (name="funcionario")
@SequenceGenerator(initialValue=1, allocationSize=1,name="id_funcionario", sequenceName="gen_funcionario" )
public class Funcionario implements Serializable {
    private static final long serialVersionUID = 1L;
    @GeneratedValue(generator="id_funcionario", strategy=GenerationType.SEQUENCE)
    @Id
    private int num_funcionario;
    @Column(name="nome", length=30, nullable=false)
    private String nome;
    @Column(name="cpf", length=18, nullable=false)
    private String cpf;
    @Column(name="salario", nullable=false)
    private double salário;

    public int getNum_funcionario() {
        return num_funcionario;
    }

    public void setNum_funcionario(int num_funcionario) {
        this.num_funcionario = num_funcionario;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public double getSalário() {
        return salário;
    }

    public void setSalário(double salário) {
        this.salário = salário;
    }

    @Override
    public int hashCode() {
        int hash = 3;
        hash = 29 * hash + this.num_funcionario;
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
        final Funcionario other = (Funcionario) obj;
        if (this.num_funcionario != other.num_funcionario) {
            return false;
        }
        return true;
    }
    
    
    
   
    
}
