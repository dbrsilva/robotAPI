*** Settings ***
Resource   ../Resources/ResourceAPI.robot
Resource   ../Resources/ResourceBDD.robot

*** Keywords ***

Post Request de usuário na API
    [Arguments]   ${ACTION}   ${STATUS}   ${ITEM}   ${EMAIL}=${Empty}   ${SENHA}=${Empty}   ${MESSAGE}=${Empty}
    Dado que estou autenticado na API
    Quando informo o email "${EMAIL}"
    E informo a senha "${SENHA}"
    E quero executar a ação "${ACTION}"
    Então status retornado é "${STATUS}"
    E seleciono o item "${ITEM}" que retornou
    E o valor do item "${ITEM}" é "${MESSAGE}"
