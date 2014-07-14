#!/usr/bin/env node

require('coffee-script');
require('coffee-script/register');

function help(){
    console.log('FlipFlops Static Asset Server');
    console.log('');
    console.log('Usage:');
    console.log('\tflipflops serve [configpath]');
    console.log('\tflipflops render [configpath] <outdir>');
    console.log('\tflipflops init [configpath]');
    console.log('\tflipflops create [post|page] [configpath]');
}

if(process.argv.length < 3){
    help();
    process.exit(1);
}

var command = process.argv[2] || 'serve';

console.log('Command is', command);

var configArg = 3;
if(command === 'create' || command === 'new'){
    configArg = 4;
} else if(command === 'render' && process.argv.length === 4){
    configArg = -1;
}

process.env.CONFIG_FILE =
    process.env.CONFIG_FILE ||
    process.argv[configArg] ||
    process.cwd() + '/config';

if(process.env.CONFIG_FILE.indexOf('/config') === -1){
    process.env.CONFIG_FILE += '/config';
}

console.log('Config file is', process.env.CONFIG_FILE);

switch(command){
    case 'serve':
        console.log('Starting server...');
        require('../server/server').start();
        break;
    case 'render':
        console.log('Rendering content...');
        require('./render')(process.argv.pop());
        break;
    case 'init':
        console.log('Initializing site...');
        require('./init')();
        break;
    case 'new':
        console.log('Creating new asset...');
        require('./create')(process.argv[3]);
        break;
    default:
        throw new Error('Invalid command: ' + command);
}
