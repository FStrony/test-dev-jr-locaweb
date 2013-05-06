package br.classes;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

/**
 * CLASSE CLIENTE
 * 
 * @author Fernando Augusto Santos
 * @since 04/05/2013
 */
public class Cliente {

	private String nome;
	private String email;
	private Integer telefone;
	private Calendar dtCadastro;
	private String documento;
	private List<Pedido> pedidos;

	public Cliente(String nome, String email, Integer telefone,
			Calendar dtCadastro, String documento) {
		super();
		this.nome = nome;
		this.email = email;
		this.telefone = telefone;
		this.dtCadastro = dtCadastro;
		this.documento = documento;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Integer getTelefone() {
		return telefone;
	}

	public void setTelefone(Integer telefone) {
		this.telefone = telefone;
	}

	public Calendar getDtCadastro() {
		return dtCadastro;
	}

	public void setDtCadastro(Calendar dtCadastro) {
		this.dtCadastro = dtCadastro;
	}

	public String getDocumento() {
		return documento;
	}

	public void setDocumento(String documento) {
		this.documento = documento;
	}

	public List<Pedido> getPedidos() {
		return pedidos;
	}

	public void setPedidos(List<Pedido> pedidos) {
		this.pedidos = pedidos;
	}

	public void imprimeDetalhes() {
		SimpleDateFormat formataData = new SimpleDateFormat("dd/MM/yyyy");
		System.out.println("Nome: " + this.getNome());
		System.out.println("Email: " + this.getEmail());
		System.out.println("Telefone: " + this.getTelefone());
		System.out.println("Data Cadastro: "
				+ formataData.format(this.getDtCadastro().getTime()));
		System.out.println("Documento: " + this.getDocumento());

		System.out.println("\nPedidos: \n");
		for (Pedido pedido : this.getPedidos()) {

			System.out.println("Tipo: " + pedido.getTipo().getDescricao());
			System.out.println("Quantidade: " + pedido.getQuantidade());
			System.out.println("Valor: " + pedido.getValor() + "\n");

		}

	}

}
