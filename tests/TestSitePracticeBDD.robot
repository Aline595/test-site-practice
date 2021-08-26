*** Settings ***
Library             Selenium

###suite Setup      
Test Setup          Abrir Navegador
###Suite Teardown 
Test Teardown       Abrir Navegador


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
    Então a página deve exibir a mensagem "No results were found for your search "ItemNãoExistente""

*** Keywords ***