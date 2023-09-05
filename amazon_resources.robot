**Settings**
Library        SeleniumLibrary
*** Variables ***
${URL}                 http://www.amazon.com.br 
${MENU_LIVROS}         //a[@href='/Livros/b/?ie=UTF8&node=6740748011&ref_=nav_cs_books'][contains(.,'Livros')]
${HEADER_LIVROS}       //h2[contains(.,'Loja de Livros')]
#${TEXTO_HEADER_LIVROS}    Loja de Livros - (ROBOT VAI PROCURAR PELA FRASE NO TESTE E POSSO USAR EM OUTROS TESTES)

*** Keywords ***
Abrir o navegador
    Open Browser     browser=chrome
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser

Acessar a home page do site Amazon.com.br
    Go To     url=${URL}
    Wait Until Element Is Visible    locator=${MENU_lIVROS}
Entrar no menu "Livros"
    Click Element    locator=${MENU_LIVROS}


#Vefificar se aparece a frase "Loja de Livros"(ROBOT VAI PROCURAR PELA FRASE NO TESTE E POSSO USAR EM OUTROS TESTES)
Vefificar se aparece a frase "${FRASE}"
# Wait Until Page Contains   text=${TEXTO_HEADER_LIVROS} (ROBOT VAI PROCURAR PELA FRASE NO TESTE E POSSO USAR EM OUTROS TESTES)
    Wait Until Page Contains   text=${FRASE}
    Wait Until Element Is Visible    locator=${HEADER_LIVROS}

# Verificar se o título da página fica "Loja de Livros" / Amazon.com.br" (ROBOT VAI PROCURAR PELA FRASE NO TESTE E POSSO USAR EM OUTROS TESTES)
Verificar se o título da página fica "${TITULO}"
    Title Should Be    title=${TITULO}
Verificar se aparece a categoria "${NOME_CATEGORIA}"
    Element Should Be Visible    locator=//a[contains(.,'${NOME_CATEGORIA}')]

Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
    Input Text    locator=twotabsearchtextbox    text=${PRODUTO}

# CLICK NO BOTÃO DE PESQUISA
Clicar no botão de pesquisa   
    Click Element    locator=nav-search-submit-button
# TEVE UM CLICK E PRECISOU CARREGAR A PAGINA
Verificar o resultado da pesquisa se está listando o produto "${PRODUTO}"
    Wait Until Element Is Visible    locator=(//span[contains(.,'${PRODUTO}')])[2]