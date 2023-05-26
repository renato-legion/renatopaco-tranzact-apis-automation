
Feature: GetCountryCall

Background:
  * def json123 = __arg
  * def idAlpha2 = json123.idAlpha2
  * def authorization = '?access_key=7f0737c6b66c1fdba1096d05818c2483'


  Scenario: GetCountry with Call
    Given url host
    And path '/v2/alpha/' + idAlpha2 + authorization
    When method get
    Then print response
    And def nameBack = response.name
    And def topLevelDomainBack = response.topLevelDomain
    And def alpha2CodeBack = response.alpha2Code
    And def alpha3CodeBack = response.alpha3Code
    And def callingCodesBack = response.callingCodes
    And def capitalBack = response.capital
    And def altSpellingsBack = response.altSpellings
    And def regionBack = response.region
    And print nameBack
    And print topLevelDomainBack
    And print alpha2CodeBack
    And print alpha3CodeBack
    And print callingCodesBack
    And print capitalBack
    And print altSpellingsBack
    And print regionBack






