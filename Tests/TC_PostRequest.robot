*** Settings ***
Resource   ../Resources/ResourceAPI.robot
Resource   ../Resources/ResourceBDD.robot

*** Test Case ***

Registro um novo usuário na API
    Dado que estou autenticado na API
    Quando informo o email "debora.silvahe20@email.com"
    E informo a senha "debora"
    E quero executar a ação "registrar"
    Então status retornado é "201"
    E seleciono o item "token" que retornou

Faço login do novo usuário na API
    Dado que estou autenticado na API
    Quando informo o email "debora.silvahe20@email.com"
    E informo a senha "debora"
    E quero executar a ação "login"
    Então status retornado é "200"
    E seleciono o item "token" que retornou

Valido o registro um usuário repetido na API
    Dado que estou autenticado na API
    Quando informo o email "debora.silvahe20@email.com"
    E informo a senha "debora"
    E quero executar a ação "registrar"
    Então status retornado é "400"
    E seleciono o item "message" que retornou
    E o valor do item "message" é "Email já cadastrado"

Valido o registro de um usuário com email inválido
    Dado que estou autenticado na API
    Quando informo o email "debora.silvahe10email.com"
    E informo a senha "debora"
    E quero executar a ação "registrar"
    Então status retornado é "400"
    E seleciono o item "message" que retornou
    E o valor do item "message" é "Email inválido"

Valido o registro de um usuário com email em branco
    Dado que estou autenticado na API
    E informo a senha "debora"
    E quero executar a ação "registrar"
    Então status retornado é "400"
    E seleciono o item "message" que retornou
    E o valor do item "message" é "Email ou password em branco"

Valido o registro de um usuário com senha em branco
    Dado que estou autenticado na API
    Quando informo o email "adebora.silvahe20@email.com"
    E quero executar a ação "registrar"
    Então status retornado é "400"
    E seleciono o item "message" que retornou
    E o valor do item "message" é "Email ou password em branco"

Faço login sem informar a senha do novo usuário
    Dado que estou autenticado na API
    Quando informo o email "debora.silvahe20@email.com"
    E quero executar a ação "login"
    Então status retornado é "400"
    E seleciono o item "message" que retornou
    E o valor do item "message" é "Email ou password incorreto"

Faço login sem informar o email do usuário
    Dado que estou autenticado na API
    E informo a senha "debora"
    E quero executar a ação "login"
    Então status retornado é "400"
    E seleciono o item "message" que retornou
    E o valor do item "message" é "Email ou password incorreto"

Faço login sem informar nenhum dado do usuário
    Dado que estou autenticado na API
    E quero executar a ação "login"
    Então status retornado é "400"
    E seleciono o item "message" que retornou
    E o valor do item "message" é "Email ou password incorreto"
