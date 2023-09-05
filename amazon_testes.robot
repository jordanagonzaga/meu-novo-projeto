*** Settings ***
Documentation     Essa suite testa o site da Amazon.com.br
Resource          amazon_resources.robot
Test Setup        Abrir o navegador
Test Teardown     Fechar o navegador

*** Test Cases ***
Caso de Teste 01 - Acesso ao menu "Livros"  
  [Documentation]   Esse teste verifica o menu Livros do site da Amazon.com
  ...               e verifica a categoria Livros
  [Tags]            menus categorias
  Acessar a home page do site Amazon.com.br
  Entrar no menu "Livros"
  Vefificar se aparece a frase "Loja de Livros"
  Verificar se o título da página fica "Livros | Amazon.com.br"
  Verificar se aparece a categoria "Loja de eBooks"
  Verificar se aparece a categoria "Livros Exclusivos"

 Caso de Teste 02 - Pesquisa de um Produto
  [Documentation]   Esse teste verifica a busca de um produto
  [Tags]            busca_produtos lista_busca
  Acessar a home page do site Amazon.com.br
  Digitar o nome de produto "Xbox Series X" no campo de pesquisa
  Clicar no botão de pesquisa 
  Verificar o resultado da pesquisa se está listando o produto "Console Xbox Series X"