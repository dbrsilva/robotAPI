*** Settings ***
Resource   ../Resources/ResourceTemplatesAPI.robot

*** Test Case ***

Validando retornos usando Post Request
    [Template]   Post Request cadastro novo usuário na API
    #ACTION     #STATUS   #ITEM     #EMAIL                        #SENHA     #MESSAGE
    registrar   201       token     deboradasilva102@email.com    debora
    login       200       token     deboradasilva102@email.com    debora
    registrar   400       message   deboradasilva102@email.com    debora     Email já cadastrado
    registrar   400       message   deboradasilva102email.com     debora     Email inválido
    registrar   400       message   ${Empty}                      debora     Email ou password em branco
    registrar   400       message   adeboradasilva100@email.com   ${Empty}   Email ou password em branco
    login       400       message   deboradasilva102@email.com    debora1    Email ou password incorreto
    login       400       message   ${Empty}                      debora     Email ou password incorreto
    login       400       message   ${Empty}                      ${Empty}   Email ou password incorreto
