*** Settings ***
Documentation   https://github.com/PauloGoncalvesBH/rest-server

Library   RequestsLibrary
Library   Collections

*** Variables ***
${URL_API}   http://localhost:3000/auth
${ALIAS_API}   fakeAPI

*** Keywords ***

informo o email "${EMAIL}"
    Set To Dictionary   ${DATA}   email   ${EMAIL}

informo a senha "${PASSWORD}"
    Set To Dictionary   ${DATA}   password   ${PASSWORD}

estou autenticado na API
    ${DATA}   Create Dictionary
    Set Test Variable    ${DATA}
    Connect API

registro o usuário
    Register API

usuário é registrado com sucesso
    Get Token API

faço login
    Login API

status retornado é "${STATUS_CODE}"
    Should Be Equal As Strings   ${RESPONSE.status_code}   ${STATUS_CODE}

login do usuário é realizado com sucesso
    Get Token API

a mensagem retornada é "${MENSAGEM}"
    Check message "${MENSAGEM}"

### API Access ###

Connect API
    Create Session   ${ALIAS_API}   ${URL_API}

Register API
    Log Dictionary   ${DATA}
    ${RESPONSE} =   Post Request   alias=${ALIAS_API}   uri=/registrar   json=${DATA}
    Set Test Variable   ${RESPONSE}

Login API
    Log Dictionary   ${DATA}
    ${RESPONSE} =   Post Request   alias=${ALIAS_API}   uri=/login   json=${DATA}
    Set Test Variable   ${RESPONSE}

### API Response values ###

Get Token API
    Set Suite Variable    ${TOKEN}   ${RESPONSE.json()['token']}

Check message "${MESSAGE}"
    Should Be Equal As Strings   ${RESPONSE.json()['message']}   ${MESSAGE}
