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

Connect API
    Create Session   ${ALIAS_API}   ${URL_API}

Register API
    Log Dictionary   ${DATA}
    ${RESPONSE} =   Post Request   alias=${ALIAS_API}   uri=/registrar   json=${DATA}
    ${RESPONSE_A}   Create Dictionary
    ${RESPONSE_A}   Convert To Dictionary   ${RESPONSE}
    Log Dictionary   ${RESPONSE_A}
    ${TOKEN} =   Get From Dictionary   ${RESPONSE_A}   token
    Set Suite Variable   ${TOKEN}
    Dictionary Should Contain Item   ${DATA}   status_code   200
    Log   ${RESPONSE}
