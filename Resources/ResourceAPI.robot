*** Settings ***

Documentation   https://github.com/PauloGoncalvesBH/rest-server

Library   RequestsLibrary
Library   Collections

*** Variables ***

${URL_API}   http://localhost:3000
${ALIAS_API}   fakeAPI

*** Keywords ***

### Auth keywords ###

estou autenticado na API
    ${DATA}   Create Dictionary
    Set Test Variable    ${DATA}
    Connect API

### Setting up data for/from Post Request ###

informo o email "${email}"
    Set To Dictionary   ${DATA}   email   ${email}

informo a senha "${password}"
    Set To Dictionary   ${DATA}   password   ${password}

seleciono o item "${item}" que retornou
    Get Returned Value "${item}"

seleciono o "${INDEX}"º item de "${KEY}" na posição "${POSITION}" de "${DATA}"
    Log   ${RESPONSE.json()}
    ${INDEX} =   Evaluate   ${INDEX}-1
    Set Test Variable   ${ITEM}   ${RESPONSE.json()[1][0]['${KEY}']}

seleciono o token que retornou
    Get Returned Value "token"
    Set Test Variable   ${TOKEN}   ${ITEM}


### Calling requests keywords ###

quero executar a ação "${ACTION}"
    Set Test Variable   ${ACTION}
    Execute Post Request

quero recuperar os dados de "${ENDPOINT}" de código "${CODE}"
    Set Test Variable   ${ENDPOINT}
    Set Test Variable   ${CODE}
    Execute Get Request

### Checking values keywords ###

status retornado é "${status_code}"
    Should Be Equal As Strings   ${RESPONSE.status_code}   ${status_code}

o valor do item "${dic_item}" é "${item_value}"
    Run Keyword If   "${item_value}" is not "${Empty}"   Check if item "${dic_item}" has the value "${item_value}"

a quantidade de itens referentes a "${dic_item}" é "${item_quantity}"
    Check if item "${dic_item}" has "${item_quantity}" items

### API Actions ###

Connect API
    Create Session   ${ALIAS_API}   ${URL_API}

Execute Post Request
    Log Dictionary   ${DATA}
    ${RESPONSE} =   Post Request   alias=${ALIAS_API}   uri=/auth/${ACTION}   json=${DATA}
    Set Test Variable   ${RESPONSE}

Execute Get Request
    ${HEADERS}   Create Dictionary   Authorization=Bearer ${TOKEN}
    ${RESPONSE} =   Get Request   alias=${ALIAS_API}   uri=/${ENDPOINT}/${CODE}/   headers=${HEADERS}
    Set Test Variable   ${RESPONSE}
    Log   ${RESPONSE}
    Log   ${RESPONSE.json()}
    Log Dictionary   ${RESPONSE.json()}

### API Response values ###

Get Returned Value "${ITEM}"
    Set Test Variable    ${ITEM}   ${RESPONSE.json()['${ITEM}']}

Check if item "${ITEM}" has the value "${ITEM_VALUE}"
    Should Be Equal As Strings   ${RESPONSE.json()['${ITEM}']}   ${ITEM_VALUE}

Check if item "${ITEM}" has "${QUANTITY}" items
    ${item_quantity} =   Get Length   ${RESPONSE.json()['${ITEM}']}
    ${QUANTITY}   Convert To Integer   ${QUANTITY}
    Should Be Equal   ${item_quantity}   ${QUANTITY}
