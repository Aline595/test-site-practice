***Settings***
Library        SeleniumLibrary

***Variables***
${URL}          http://automationpractice.com
${BROWSER}      chrome

**Keywords***

### SETUP e TEARDOWN
Abrir navegador
    Open Browser     about:blank     ${BROWSER}

Fechar navegador
    Close Browser

### Passo-a-Passo
Acessar a página home do site
    Go To  http://automationpractice.com
    Title Should Be    My Store

Digitar o nome do produto "${PRODUTO}" no campo de pesquisa
    Input Text  name=search_query    ${PRODUTO}

Clicar no botão Pesquisar
    Click Element   name:submit_search

Conferir se o produto "${PRODUTO}" foi listado no site
    Wait Until Element Is Visible   css:#center_column > h1
    Title Should Be                 Search - My Store
    Page Should Contain Image       xpath=//*[@id="center_column"]//*[@src="http://automationpractice.com/img/p/7/7-home_default.jpg"]                               
    Page Should Contain Link        xpath=//*[@id="center_column"]//a[@class="product-name"][contains(text(),"${PRODUTO}")]

Conferir mensagem ${MENSAGEM_ALERTA}
    Wait Until Element Is Visible   xpath=//*[@id="center_column"]/p[@class="alert alert-warning"]
    Title Should Be                 Search - My Store
    Element Text Should Be          xpath=//*[@id="center_column"]/p[@class="alert alert-warning"]      ${MENSAGEM_ALERTA}