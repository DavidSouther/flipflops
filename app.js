if(process.env.NEW_RELIC_LICENSE_KEY){
    require('newrelic');
}
require('coffee-script');
require('coffee-script/register');
require('./src/server/server').start();
