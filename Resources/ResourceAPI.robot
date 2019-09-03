*** Settings ***
Documentation   https://github.com/PauloGoncalvesBH/rest-server

Library   RequestsLibrary
Library   Collections

*** Variables ***
${URL_API}   http://localhost:3000
${ALIAS_API}   fakeAPI

*** Keywords ***

estou autenticado na API
    ${DATA}   Create Dictionary
    Set Test Variable    ${DATA}
    Connect API

informo o email "${email}"
    Set To Dictionary   ${DATA}   email   ${email}

informo a senha "${password}"
    Set To Dictionary   ${DATA}   password   ${password}

quero executar a ação "${ACTION}"
    Set Test Variable   ${ACTION}
    Execute Post Request

quero recuperar os dados da API
    Execute Get Request

quero recuperar os dados de "${ENDPOINT}" de código "${CODE}"
    Set Test Variable   ${ENDPOINT}
    Set Test Variable   ${CODE}
    Execute Get Request

seleciono o item "${item}" que retornou
    Get Returned Value "${item}"

status retornado é "${status_code}"
    Should Be Equal As Strings   ${RESPONSE.status_code}   ${status_code}

o valor do item "${item}" é "${item_value}"
    Run Keyword If   '${item}' is not '${Empty}'   Check if item "${item}" has the value "${item_value}"

a quantidade de itens referentes a "${item}" é "${item_quantity}"
    Check if item "${item}" has "${item_quantity}" items

### API Actions ###

Connect API
    Create Session   ${ALIAS_API}   ${URL_API}

Execute Post Request
    Log Dictionary   ${DATA}
    ${RESPONSE} =   Post Request   alias=${ALIAS_API}   uri=/auth/${ACTION}   json=${DATA}
    Set Test Variable   ${RESPONSE}

Execute Get Request
    ${HEADERS}   Create Dictionary   Authorization=Bearer ${ITEM}
    ${RESPONSE} =   Get Request   alias=${ALIAS_API}   uri=/${ENDPOINT}/${CODE}/   headers=${HEADERS}
    Set Test Variable   ${RESPONSE}
    Log   ${RESPONSE}

### API Response values ###

Get Returned Value "${ITEM}"
    Set Test Variable    ${ITEM}   ${RESPONSE.json()['${ITEM}']}

Check if item "${ITEM}" has the value "${ITEM_VALUE}"
    Should Be Equal As Strings   ${RESPONSE.json()['${ITEM}']}   ${ITEM_VALUE}

Check if item "${ITEM}" has "${QUANTITY}" items
    ${item_quantity} =   Get Length   ${RESPONSE.json()['${ITEM}']}
    ${QUANTITY}   Convert To Integer   ${QUANTITY}
    Should Be Equal   ${item_quantity}   ${QUANTITY}
