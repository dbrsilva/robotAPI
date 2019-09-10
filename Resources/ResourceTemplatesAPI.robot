*** Settings ***
Resource   ../Resources/ResourceAPI.robot
Resource   ../Resources/ResourceBDD.robot

*** Keywords ***

Post Request cadastro novo usuário na API
    [Arguments]   ${ACTION}   ${STATUS}   ${KEY_ITEM}   ${EMAIL}   ${SENHA}   ${MESSAGE}=${Empty}
    Dado que estou autenticado na API
    Quando informo o email "${EMAIL}"
    E informo a senha "${SENHA}"
    E quero executar a ação "${ACTION}"
    Então status retornado é "${STATUS}"
    E seleciono o item "${KEY_ITEM}" que retornou
    E o valor do item "${KEY_ITEM}" é "${MESSAGE}"

Get Request dos dados da turma na API
    [Arguments]   ${EMAIL}   ${SENHA}   ${ID_TURMA}   ${DESC_TURMA}   ${ID_HORARIO}   ${STUDENTS_QUANTITY}
    Dado que estou autenticado na API
    Quando informo o email "${EMAIL}"
    E informo a senha "${SENHA}"
    E quero executar a ação "login"
    E seleciono o token que retornou
    Quando quero recuperar os dados de "turmas" de código "${ID_TURMA}"
    Então status retornado é "200"
    E o valor do item "id" é "${ID_TURMA}"
    E o valor do item "descricao" é "${DESC_TURMA}"
    E o valor do item "idHorario" é "${ID_HORARIO}"
    E a quantidade de itens referentes a "alunos" é "${STUDENTS_QUANTITY}"

Get Request para verificar se professor dá aula pra turma
    [Arguments]   ${EMAIL}   ${PASSWORD}   ${ID_TURMA}   ${WEEK_DAY}
    #${TEACHER_NAME}
    Dado que estou autenticado na API
    Quando informo o email "${EMAIL}"
    E informo a senha "${PASSWORD}"
    E quero executar a ação "login"
    E seleciono o token que retornou
    E quero recuperar os dados de "turmas" de código "${ID_TURMA}"
    Quando seleciono o item "idHorario" que retornou
    E quero recuperar os dados de "horarios" de código "${ITEM}"
    E seleciono o "1"º item de "idDisciplina" na posição "${WEEK_DAY}" de "${RESPONSE}"
    E quero recuperar os dados de "disciplinas" de código "${ITEM}"
    #not finished
