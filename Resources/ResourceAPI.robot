*** Settings ***
Documentation   https://github.com/PauloGoncalvesBH/rest-server

Library   RequestsLibrary
Library   Collections

*** Variables ***
${URL_API}   http://localhost:3000/auth
${ALIAS_API}   fakeAPI

*** Keywords ***

estou autenticado na API
    ${DATA}   Create Dictionary
    Set Test Variable    ${DATA}
    Connect API

informo o email "${EMAIL}"
    Set To Dictionary   ${DATA}   email   ${EMAIL}

informo a senha "${PASSWORD}"
    Set To Dictionary   ${DATA}   password   ${PASSWORD}

quero executar a ação "${ACTION}"
    Set Test Variable   ${ACTION}
    Execute Post Request

seleciono o TOKEN gerado
    Get Token API

status retornado é "${STATUS_CODE}"
    Should Be Equal As Strings   ${RESPONSE.status_code}   ${STATUS_CODE}

a mensagem retornada é "${MENSAGEM}"
    Check message "${MENSAGEM}"

### API Actions ###

Connect API
    Create Session   ${ALIAS_API}   ${URL_API}

Execute Post Request
    Log Dictionary   ${DATA}
    ${RESPONSE} =   Post Request   alias=${ALIAS_API}   uri=/${ACTION}   json=${DATA}
    Set Test Variable   ${RESPONSE}

### API Response values ###

Get Token API
    Set Suite Variable    ${TOKEN}   ${RESPONSE.json()['token']}

Check message "${MESSAGE}"
    Should Be Equal As Strings   ${RESPONSE.json()['message']}   ${MESSAGE}
