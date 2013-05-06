package br.classes;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.List;

public class Teste {

	/**
	 * CLASSE DE TESTE
	 * 
	 * @author Fernando Augusto Santos
	 * @since 04/05/2013
	 */
	public static void main(String[] args) {

		Teste t = new Teste();
		Collection<Cliente> clientes = t.getClientes();
		for (Cliente cliente : clientes) {
			System.out.println("\nCliente: ");
			cliente.imprimeDetalhes();
			NotaFiscal nota = new NotaFiscal(cliente);
			System.out.println("Nota Fiscal:");
			nota.imprimeDetalhes();
			System.out.println("------------------------------------");
		}

	}

	public Collection<Cliente> getClientes() {

		Collection<Cliente> clientes = new ArrayList<Cliente>();
		Cliente cli1 = new Cliente("Fernando", "fernando_aus@hotmail.com",
				991810345, Calendar.getInstance(), "424.156.038-56");

		Pedido ped1 = new Pedido(TipoProduto.Loja, 10, 13.00);
		Pedido ped2 = new Pedido(TipoProduto.Hospedagem, 2, 20.00);

		List<Pedido> ped = new ArrayList<Pedido>();
		ped.add(ped1);
		ped.add(ped2);
		cli1.setPedidos(ped);

		clientes.add(cli1);

		return clientes;

	}
}
