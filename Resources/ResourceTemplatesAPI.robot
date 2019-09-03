*** Settings ***
Resource   ../Resources/ResourceAPI.robot
Resource   ../Resources/ResourceBDD.robot

*** Keywords ***

Post Request de usuário na API
    [Arguments]   ${ACTION}   ${STATUS}   ${KEY_ITEM}   ${EMAIL}   ${SENHA}   ${MESSAGE}=${Empty}
    Dado que estou autenticado na API
    Quando informo o email "${EMAIL}"
    E informo a senha "${SENHA}"
    E quero executar a ação "${ACTION}"
    Então status retornado é "${STATUS}"
    E seleciono o item "${KEY_ITEM}" que retornou
    E o valor do item "${KEY_ITEM}" é "${MESSAGE}"
