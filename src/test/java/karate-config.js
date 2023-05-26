function fn() {
  var env = karate.env;
  karate.log('karate.env system property was:', env);
    karate.configure('retry',{ count:10, interval:2000});
  if (!env) {
    env = 'uat';
  }
  var config = {
    env: env,
        Entorno: 'UAT',
        host: 'http://api.countrylayer.com',


  }
  if (env == 'STG') {
    config.Entorno='STG';
    config.host='http://api.countrylayer.com';


  } else if (env == 'uat') {
        config.Entorno= 'UAT';
        config.host= 'http://api.countrylayer.com';

  }

  return config;
}