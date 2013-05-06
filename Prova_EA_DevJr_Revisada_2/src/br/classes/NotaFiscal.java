package br.classes;

import java.text.SimpleDateFormat;
import java.util.Calendar;

/**
 * CLASSE NOTA FISCAL
 * 
 * @author Fernando Augusto Santos
 * @since 04/05/2013
 */
public class NotaFiscal {

	private Calendar dtEmissao;
	private Double vlBruto = 0.00;
	private Double vlImpostos = 0.00;
	private Cliente cliente;

	public Cliente getCliente() {
		return cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}

	public Calendar getDtEmissao() {
		return dtEmissao;
	}

	public void setDtEmissao(Calendar dtEmissao) {
		this.dtEmissao = dtEmissao;
	}

	public Double getVlBruto() {
		return vlBruto;
	}

	public void setVlBruto(Double vlBruto) {
		this.vlBruto = vlBruto;
	}

	public Double getVlImpostos() {
		return vlImpostos;
	}

	public void setVlImpostos(Double vlImpostos) {
		this.vlImpostos = vlImpostos;
	}

	public NotaFiscal(Cliente cliente) {
		super();
		this.cliente = cliente;
		Double valor = 0.00;
		Double imp = 0.00;
		for (Pedido pedido : cliente.getPedidos()) {
			if (pedido.getTipo().equals(TipoProduto.Servidor)
					|| pedido.getTipo().equals(TipoProduto.Loja)) {
				this.setDtEmissao(Calendar.getInstance());
				valor += (pedido.getValor() * pedido.getQuantidade());
				imp += ((pedido.getValor() * 0.05) * pedido.getQuantidade());
			}
		}
		this.setVlBruto(valor);
		this.setVlImpostos(imp);
	}

	public void imprimeDetalhes() {
		SimpleDateFormat formataData = new SimpleDateFormat("dd/MM/yyyy");
		System.out.println("Cliente: " + this.cliente.getNome());
		System.out.println("Data da Emissão: "
				+ formataData.format(this.getDtEmissao().getTime()));
		System.out.println("Valor Bruto: " + this.getVlBruto());
		System.out.println("Valor dos Impostos: " + this.getVlImpostos());

	}

}
