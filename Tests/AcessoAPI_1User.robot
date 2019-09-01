*** Settings ***
Resource   ../Resources/ResourceAPI.robot
Resource   ../Resources/ResourceBDD.robot

*** Test Case ***

Verificar acesso a API
    Dado que estou autenticado na API
    Quando informo o email "debora1@email.com"
    E informo a senha "debora"
    Então registro o usuário
