Feature: Metodo get para listar usuários cadastrados

  Background:
    * url 'https://serverest.dev/'

    @smoke
    Scenario: Listar todos os usuários cadastrados
      Given path '/usuarios'
      When method Get
      Then status 200

    Scenario: Listar usuário por nome
      Given path '/usuarios'
      And param nome = 'Priscila'
      When method Get
      Then status 200

    Scenario: Listar por nome e email
      Given path '/usuarios'
      And params {nome:'Priscila', email: 'priscila.troina@gmail.com'}
      When method Get
      Then status 200

  Scenario: Listar por nome e email, validar o nome do usuario retornado
    Given path '/usuarios'
    And params {nome:'Priscila', email: 'priscila.troina@gmail.com'}
    When method Get
    Then status 200
    And match response.usuario[0].nome == 'Priscila'

  Scenario: Listar usuários e verificar se algum usuario é Priscila
    Given path '/usuarios'
    When method Get
    Then status 200
    And match response.usuario[*].nome contains 'Priscila'

  Scenario: Verificar o conteúdo do response
    Given path '/usuarios'
    When method get
    Then status 200
    And match response.quantidade != '#null'
    And match response.quantidade == '#number'
