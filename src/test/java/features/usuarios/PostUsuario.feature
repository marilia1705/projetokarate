Feature: Metodo post para cadastrar usuários

  Background:
    * url 'https://serverest.dev/'

  Scenario: Cadastrar usuário com sucesso com body no corpo do teste

    * def body =
    """
  {
  "nome": "silvio santos",
  "email": "silvio@gmail.com",
  "password": "teste",
  "administrador": "true"
}
    """
    Given path '/usuarios'
    And request body
    When method Post
    Then status 201
    And match response.message == "Cadastro realizado com sucesso"

    Scenario: Cadastrar usuario com sucesso com body em arquivo
      * def now = function(){ return java.lang.System.currentTimeMillis() }

      * def body = read ('classpath:/jsons/usuario.json')
      * set body.nome = 'maria'
      * set body.email = 'maria'+now()+'@qa.com.br'
      * set body.password = '123456'
      * set body.administrador = 'false'

      Given path '/usuarios'
      And request body
      When method Post
      Then status 201
      And match response.message == "Cadastro realizado com sucesso"

