*** Settings ***
Resource   ../Resources/ResourceAPI.robot
Resource   ../Resources/ResourceBDD.robot

*** Test Case ***

Verifico os valores referentes a "Turma dos millenials"
    Dado que estou autenticado na API
    Quando informo o email "paulo@email.com"
    E informo a senha "paulo"
    E quero executar a ação "login"
    Então status retornado é "200"
    E seleciono o item "token" que retornou
    Quando quero recuperar os dados de "turmas" de código "1"
    Então status retornado é "200"
    E o valor do item "id" é "1"
    E o valor do item "descricao" é "Turma dos millenials"
    E o valor do item "idHorario" é "2"
    E a quantidade de itens referentes a "alunos" é "3"

Verifico os valores referentes a "Turma 90's"
    Dado que estou autenticado na API
    Quando informo o email "paulo@email.com"
    E informo a senha "paulo"
    E quero executar a ação "login"
    Então status retornado é "200"
    E seleciono o item "token" que retornou
    Quando quero recuperar os dados de "turmas" de código "2"
    Então status retornado é "200"
    E o valor do item "id" é "2"
    E o valor do item "descricao" é "Turma 90's"
    E o valor do item "idHorario" é "1"
    E a quantidade de itens referentes a "alunos" é "1"
