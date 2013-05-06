package br.classes;

/**
 * ENUM DE TIPO PRODUTO
 * 
 * @author Fernando Augusto Santos
 * @since 04/05/2013
 */

public enum TipoProduto {

	Hospedagem("Hospedagem de Sites"), Servidor("Servidor Cloud"), Loja(
			"Loja Virtual");

	private final String descricao;

	public String getDescricao() {
		return this.descricao;
	}

	private TipoProduto(String descricao) {

		this.descricao = descricao;
	}


}
