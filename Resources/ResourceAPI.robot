*** Settings ***
Documentation   https://github.com/PauloGoncalvesBH/rest-server

Library   RequestsLibrary
Library   Collections

*** Variables ***
${URL_API}   http://localhost:3000/auth
${ALIAS_API}   fakeAPI

*** Keywords ***

informo o email "${EMAIL}"
    Set Test Variable   ${EMAIL}

informo a senha "${PASSWORD}"
    Set Test Variable   ${PASSWORD}

estou autenticado na API
    Connect API

registro o usuário
    Register API

Connect API
    Create Session   ${ALIAS_API}   ${URL_API}

Register API
    Log   ${EMAIL}
    Log   ${PASSWORD}
    ${RESPONSE} =   Post Request   alias=${ALIAS_API}   data=(email:${EMAIL},password:${PASSWORD})   uri=/registrar
    Log   ${RESPONSE}
