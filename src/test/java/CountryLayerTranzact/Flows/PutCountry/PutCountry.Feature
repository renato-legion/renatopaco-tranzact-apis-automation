Feature: PutCountry
  Background:
    * def authorization = '?access_key=7f0737c6b66c1fdba1096d05818c2483'
    * def requestsend = read('classpath:CountryLayerTranzact/Flows/PutCountry/RequestPutCountry.json')

  @PutCountryTotal
  Scenario Outline: Put Countries with Explicit Examples with all attributes
    Given url host
    And path '/v2/addCountry'+ authorization
    And request requestsend.PutCountryGeneral
    When method put
    Then print response
    Examples:
      | NameCountry  | idAlpha2 | idAlpha3 |
      | Test Country | TC       | TCY      |
      | Country Test | CT       | CTY      |
      | New Country  | NC       | NCP      |


  @PutCountryIdAlpha2AndNameCountry
  Scenario Outline: Modify Name and idAlpha2 that are alredy exist
    * def tramaGet = call read('classpath:CountryLayerTranzact/Flows/GetCountry/GetCountryCall.feature') { idCountry: <idAlpha2>}
    Given url host
    And path '/v2/addCountry'+ authorization
    * set requestsend.ModifyNameCountry.alpha3_code = tramaGet.alpha3CodeBack
    And request requestsend.ModifyNameCountry
    When method put
    Then print response
    Examples:
      | idAlpha2 | NameCountry |
      | TCCC      | Kira        |
      | CT     | SuperKira   |
      | NC      | UltraKIRA   |
