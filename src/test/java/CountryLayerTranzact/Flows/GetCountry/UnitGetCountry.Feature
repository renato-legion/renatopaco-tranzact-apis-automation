
Feature: UnitGet Country Validator
  Background:
#    * url 'https://countrylayer.com/'
#    * headers Accept = 'application/json'
    * def schemavalidator = read('classpath:CountryLayerTranzact/Flows/GetCountry/GetCountryValidator.json')
    * def schemavalidator2 = read('classpath:CountryLayerTranzact/Flows/GetCountry/GetAllCountryValidator.json')
    * def schemavalidator3 = read('classpath:CountryLayerTranzact/Flows/GetCountry/GetAllCountryValidator2.json')
    * def authorization = '?access_key=8911f49c41f9c592d3cc6ef7953203cd'
    * def errorResponse_AccessKey = read('classpath:CountryLayerTranzact/Flows/GetCountry/ErrorResponse_AccessKey_CountryValidator.json')
    * def errorResponse_404 = read('classpath:CountryLayerTranzact/Flows/GetCountry/ErrorResponse_CountryNotFound_CountryValidator.json')
    * def data_getCountry = read('classpath:CountryLayerTranzact/Data/getCountryData.csv')
    * def errorGeneral = read('classpath:CountryLayerTranzact/Flows/GetCountry/ErrorResponse_General_CountryValidator.json')

  @GetCountry1
  Scenario Outline: Bring Countries with Explicit Examples and validate the schema response - Validate the response with Country not found or Error case with hson
    Given url host
    And path '/v2/alpha/' + idCountry + authorization
#    And retry until responseStatus == 404 || responseStatus == 200
    When method get
    And print response
    And match response !contains errorResponse_AccessKey
    And match response !contains errorResponse_404
    And match response !contains errorGeneral
    And assert response.alpha2Code==idCountry
    And match response == schemavalidator
    Examples:
      | idCountry |
      | US       |
#      | DE        |
#      | GB        |

  @GetCountry2
  Scenario Outline: Get Countries with CSV data and validate the schema response - Validate country not found with status 200 with "THEN status 200"
    Given url host
    And path '/v2/alpha/' + idCountry + authorization
    When method get
    Then status 200
    And print response
    And match response !contains errorResponse_AccessKey
    And assert response.alpha2Code==idCountry
    And match response == schemavalidator
    Examples:
    |data_getCountry|

  @GetAllCountry1
  Scenario: Get Countries with response values constains json schema3
    Given url host
    And path '/v2/all'+ authorization
    When method get
    Then status 200
    And print response
    And match response !contains errorResponse_AccessKey
    And match response[*] contains schemavalidator3

  @GetAllCountry2
  Scenario: Get Countries with response values constains json schema2 that has all the same structure in the general response
    Given url host
    And path '/v2/all'+ authorization
    When method get
    Then status 200
    And print response
    And match response !contains errorResponse_AccessKey
    And match response == schemavalidator2


