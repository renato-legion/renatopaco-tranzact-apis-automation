## TRANZACT - COUNTRY LAYER API REST AUTOMATION - KARATE
#By Renato Paco Huerta

### Archetype
````text 
gir-automation-web/
├── src/
├── test/
├── CountryLayerTranzact/
│   ├── Data
│   │ 
│   ├── Flows/
│        ├──GetCountry
│        ├──PostCountry
│        ├──PutCountry
├── README.md
````

### Compile code Maven
Each API has its own @runner, additionally, a module.feature and a "Unit+modulo.feature" have been created with the following structure:
````
Add.Feature
Add.runner
UnitAdd.Feature
````
The "Unit+.feature" are used to carry out the validations, while the .features are without validations, due to the importance of the execution time of each test.

- API Access Key with usage_limit_reached = ff0b51d56c3605720d2f456672eff3ee
- API Access Key ok =  8911f49c41f9c592d3cc6ef7953203cd

//Remenber to update the access key in "background" on the feature
e.g. : def authorization = '?access_key=ff0b51d56c3605720d2f456672eff3ee'


###Author: Renato Francisco Paco Huerta
###Linkedin: https://www.linkedin.com/in/renatopaco98/