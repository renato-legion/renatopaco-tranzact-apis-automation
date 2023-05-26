Feature: PostCountry
  Background:
    * def authorization = '?access_key=7f0737c6b66c1fdba1096d05818c2483'
    * def requestsend = read('classpath:CountryLayerTranzact/Flows/PostCountry/RequestPostCountry.json')

  @PostCountry1
  Scenario Outline: Post Countries with Explicit Examples
    Given url host
    And path '/v2/addCountry'+ authorization
    And request requestsend.PostCountryGeneral
    When method post
    Then print response
    Examples:
      | NameCountry  | idAlpha2 | idAlpha3 |
      | Test Country | TC       | TCY      |
      | Country Test | CT       | CTY      |
      | New Country  | NC       | NCP      |


