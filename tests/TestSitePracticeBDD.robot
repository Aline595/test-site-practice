*** Settings ***
Resource            ../resources/Resource.robot    
Test Setup          Abrir Navegador
Test Teardown       Fechar Navegador

*** Variables ***

${URL}          http://automationpractice.com
${BROWSER}      chrome

*** Test Cases ***
Cenário 01: Pesquisar produto existente
    ###[Setup]  Fechar navegador chrome        ### Definir teardown especifico para esse cenario
    Dado que estou na página home do site
    Quando eu pesquisar pelo produto "Blouse"
    Então o produto "Blouse" deve ser listado na página da busca
    ###[Teardown]  Fechar chrome
Caso de Teste 02: Pesquisar produto não existente
   Dado que estou na página home do site
    Quando eu pesquisar pelo produto "ItemNãoExistente"
    Então a página deve exibir a mensagem No results were found for your search "ItemNãoExistente"

*** Keywords ***
Dado que estou na página home do site
    Acessar a página home do site

Quando eu pesquisar pelo produto "${PRODUTO}"
    Digitar o nome do produto "${PRODUTO}" no campo de pesquisa
    Clicar no botão Pesquisar

Então o produto "${PRODUTO}" deve ser listado na página da busca
    Conferir se o produto "${PRODUTO}" foi listado no site

Então a página deve exibir a mensagem  ${MENSAGEM_ALERTA}
    Conferir mensagem ${MENSAGEM_ALERTA}