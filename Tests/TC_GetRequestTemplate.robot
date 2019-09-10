*** Settings ***
Resource   ../Resources/ResourceTemplatesAPI.robot

*** Test Case ***

Validando retornos dos dados válidos dos detalhes das turmas
    [Template]   Get Request dos dados da turma na API
    #EMAIL            #SENHA   #ID_TURMA   #DESC_TURMA            #ID_HORARIO   #STUDENTS_QUANTITY
    paulo@email.com   paulo    1           Turma dos millenials   2             3
    paulo@email.com   paulo    2           Turma 90's             1             1

Verificando os nomes dos professores de cada turma
    [Template]   Get Request para verificar se professor dá aula pra turma
    #EMAIL            #SENHA   #ID_TURMA   #WEEK_DAY
    paulo@email.com   paulo    1           quarta
