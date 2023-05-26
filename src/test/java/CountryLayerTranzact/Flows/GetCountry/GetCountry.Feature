Feature: GetCountry
  Background:
    * def data_getCountry = read('classpath:CountryLayerTranzact/Data/getCountryData.csv')
    * def authorization = '?access_key=8911f49c41f9c592d3cc6ef7953203cd'

  @GetCountry1
  Scenario Outline: Get Countries with Explicit Examples
    Given url host
    And path '/v2/alpha/' + idCountry + authorization
    When method get
    Then print response
    Examples:
      | idCountry |
      | US        |
#      | DE        |
#      | GB        |


  @GetCountry2
  Scenario Outline: Get Countries with CSV data
    Given url host
    And path '/v2/alpha/' + idCountry + authorization
    When method get
    Then print response
    Examples:
      | data_getCountry |

  @GetAllCountry1
  Scenario: Bring Countries with Explicit Examples
    Given url host
    And path '/v2/all'+ authorization
    When method get
    Then print response

