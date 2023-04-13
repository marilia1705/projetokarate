Feature: Metodo delete para deletar usuarios

  Background:
    * url 'https://serverest.dev/'
    
    Scenario: Deletar um usuario com sucesso
      * def id = call read('DeleteUsuario.feature@cadastrar')

      Given path '/usuarios/'+id.usuarioId
      When method Delete
      Then status 200
      And match response.massage == "Registro excluído com sucesso"

    @ignore
    @cadastrar

    Scenario:Cadastrar para deletar
      * def now = function(){ return java.lang.System.currentTimeMillis() }
      * def email = 'teste'+now()+'@qa.com.br'
      * def body =
    """
  {
  "nome": "silvio santos",
  "email": #(email),
  "password": "teste",
  "administrador": "true"
}
    """
      Given path '/usuarios'
      And request body
      When method Post
      Then status 201
       * def usuarioId = response._id

