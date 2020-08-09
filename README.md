# test-dev-jr-locaweb
<div align='center'>Teste para Desenvolvedor de Software Jr. da Locaweb - 2013</div>
<br/>

<div align='center'>Desenvolvedor JR. Prova de Conhecimentos Técnicos.</div>
<br>
<ol>
  <li>1. Dado o seguinte domínio de negócio:</li>
  <ul>
    <li>Na Locaweb, todo CLIENTE possui as seguintes características: nome, e-mail, telefone, data de cadastro e documento (CPF/CNPJ).</li>
    <li>Cada CLIENTE pode fazer diversos pedidos, sendo cada PEDIDO composto por: um tipo de produto (Hospedagem de Sites, Servidor Cloud ou uma Loja Virtual), quantidade e valor unitário.</li>
    <li>Como obrigação fiscal, a Locaweb deve emitir uma NOTA FISCAL para cada cliente contendo os produtos contratados. A NOTA FISCAL deve possuir uma data de emissão, o valor bruto e o valor dos impostos.</li>
  </ul>
  <li>Crie o código para as especificações CLIENTE, PEDIDO e NOTAFISCAL de acordo com o descrito acima. Utilize a linguagem de programação (orientada a objetos) de sua preferência. Gostaríamos de executar o seguinte programa usando seus artefatos de código:</li>
  
  <br>
  main(String ... args) {<br>
  &nbsp;&nbsp;Array<Cliente> clientes = getClientes();<br>
&nbsp;&nbsp;for (i = 0; i < clients.length(); i++) { Cliente cliente = clientes[i];<br>
&nbsp;&nbsp;&nbsp;&nbsp;print("Cliente:"); cliente.imprimeDetalhes();<br>
&nbsp;&nbsp;&nbsp;&nbsp;NotaFiscal nota = new NotaFiscal(cliente); print("Nota fiscal:"); nota.imprimeDetalhes();<br>
&nbsp;&nbsp;} <br>
}


  <li>Baseado no modelo criado acima, escreva um método/função que crie uma NOTAFISCAL para um CLIENTE considerando:</li>
  <ul>
    <li>O valor bruto de uma NOTAFISCAL é o somatório do valor dos PEDIDOS do CLIENTE - Produtos com alíquota de imposto 0% não devem entrar numa NOTA FISCAL</li>
    <li>O valor do imposto de cada produto é o produto do valor do produto, sua quantidade e a alíquota aplicada para o produto.</li>
    <li>Atualmente são aplicadas as alíquotas de 0% para Hospedagens e 5% para Clouds e Loja Virtual.</li>
  </ul>
  <li>Considerando o domínio descrito na questão 1, utilizando o SGDB de sua preferência, faça as próximas questões:</li>
  <ul>
    <li>Construa uma proposta de Modelo Entidade Relacionamento (MER) para o domínio.</li>
    <li>De acordo com o MER criado na questão 2.1, escreva o código para criação das tabelas e indexes (se for o caso).</li>
    <li>De acordo com o MER criado na questão 2.1, escreva o código SQL capaz de consultar todos PEDIDOS ordenados de forma decrescente pela quantidade.</li>
    <li>De acordo com o MER criado na questão 2.1, escreva o código SQL capaz de consultar as NOTA FISCAIS de um determinado cliente.</li>
    <li>De acordo com o MER criado na questão 2.1, escreva o código SQL capaz de buscar todos clientes que não possuem nenhuma NOTA FISCAL.</li>
  </ul>
</ol>
