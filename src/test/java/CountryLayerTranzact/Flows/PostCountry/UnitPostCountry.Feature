Feature: UnitPostCountry
  Background:
    * def authorization = '?access_key=7f0737c6b66c1fdba1096d05818c2483'
    * def requestsend = read('classpath:CountryLayerTranzact/Flows/PostCountry/RequestPostCountry.json')
    * def errorResponse_AccessKey = read('classpath:CountryLayerTranzact/Flows/GetCountry/ErrorResponse_AccessKey_CountryValidator.json')
    * def errorResponse_MontlyUsage = read('classpath:CountryLayerTranzact/Flows/GetCountry/ErrorResponse_MontlyUsage_CountryValidator.json')
    * def schemavalidator = read('classpath:CountryLayerTranzact/Flows/PostCountry/PostCountryValidator.json')


  @PostCountry1
  Scenario Outline: Post Countries with Explicit Examples
    Given url host
    And path '/v2/addCountry'+ authorization
    And request requestsend.PostCountryGeneral
    When method post
    Then status 200
    And match response !contains errorResponse_AccessKey
    And match response != errorResponse_MontlyUsage
    And print response
    And match response == schemavalidator
    Examples:
      | NameCountry  | idAlpha2 | idAlpha3 |
      | Test Country | TC       | TCY      |
      | Country Test | CT       | CTY      |
      | New Country  | NC       | NCP      |


