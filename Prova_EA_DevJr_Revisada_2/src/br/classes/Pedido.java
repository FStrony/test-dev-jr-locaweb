package br.classes;

/**
 * CLASSE PEDIDO
 * 
 * @author Fernando Augusto Santos
 * @since 04/05/2013
 */

public class Pedido {

	private TipoProduto tipo;
	private Integer quantidade;
	private Double valor;

	public TipoProduto getTipo() {
		return tipo;
	}

	public void setTipo(TipoProduto tipo) {
		this.tipo = tipo;
	}

	public Integer getQuantidade() {
		return quantidade;
	}

	public void setQuantidade(Integer quantidade) {
		this.quantidade = quantidade;
	}

	public double getValor() {
		return valor;
	}

	public void setValor(double valor) {
		this.valor = valor;
	}

	public Pedido(TipoProduto tipo, Integer quantidade, Double valor) {
		super();
		this.tipo = tipo;
		this.quantidade = quantidade;
		this.valor = valor;
	}

}
