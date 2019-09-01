*** Settings ***
Resource   ../Resources/ResourceAPI.robot
Resource   ../Resources/ResourceBDD.robot

*** Test Case ***

Registro um novo usuário na API
    Dado que estou autenticado na API
    Quando informo o email "debora.silvahe11@email.com"
    E informo a senha "debora"
    E registro o usuário
    Então status retornado é "201"
    E usuário é registrado com sucesso

Faço login do novo usuário na API
    Dado que estou autenticado na API
    Quando informo o email "debora.silvahe11@email.com"
    E informo a senha "debora"
    E faço login
    Então status retornado é "200"
    E login do usuário é realizado com sucesso

Valido o registro um usuário repetido na API
    Dado que estou autenticado na API
    Quando informo o email "debora.silvahe11@email.com"
    E informo a senha "debora"
    E registro o usuário
    Então status retornado é "400"
    E a mensagem retornada é "Email já cadastrado"

Valido o registro de um usuário com email inválido
    Dado que estou autenticado na API
    Quando informo o email "debora.silvahe10email.com"
    E informo a senha "debora"
    E registro o usuário
    Então status retornado é "400"
    E a mensagem retornada é "Email inválido"

Valido o registro de um usuário com email em branco
    Dado que estou autenticado na API
    E informo a senha "debora"
    E registro o usuário
    Então status retornado é "400"
    E a mensagem retornada é "Email ou password em branco"

Valido o registro de um usuário com senha em branco
    Dado que estou autenticado na API
    Quando informo o email "adebora.silvahe11@email.com"
    E registro o usuário
    Então status retornado é "400"
    E a mensagem retornada é "Email ou password em branco"

Faço login sem informar a senha do novo usuário
    Dado que estou autenticado na API
    Quando informo o email "debora.silvahe11@email.com"
    E faço login
    Então status retornado é "400"
    E a mensagem retornada é "Email ou password incorreto"

Faço login sem informar o email do usuário
    Dado que estou autenticado na API
    E informo a senha "debora"
    E faço login
    Então status retornado é "400"
    E a mensagem retornada é "Email ou password incorreto"

Faço login sem informar nenhum dado do usuário
    Dado que estou autenticado na API
    E faço login
    Então status retornado é "400"
    E a mensagem retornada é "Email ou password incorreto"
