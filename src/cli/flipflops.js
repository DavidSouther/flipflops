#!/usr/bin/env node

require('coffee-script');
require('coffee-script/register');

function help(){
    console.log("FlipFlops Static Asset Server");
    console.log("");
    console.log("Usage:");
    console.log('\tflipflops serve [configpath]');
    console.log('\tflipflops render [configpath] <outdir>');
    console.log('\tflipflops init [configpath]');
    console.log('\tflipflops create post [configpath]');
}

if(process.argv.length < 3){
    help();
    process.exit(1);
}

var command = process.argv[2] || 'serve';

console.log('Command is', command);

var config_arg = 3
if(command == 'create'){
    config_arg = 4;
} else if(command == 'render' && process.argv.length == 4){
    config_arg = -1;
}

process.env.CONFIG_FILE = process.env.CONFIG_FILE ||
    process.argv[config_arg] ||
    process.cwd() + '/config';

if(process.env.CONFIG_FILE.indexOf('/config') == -1){
    process.env.CONFIG_FILE += '/config';
}

console.log('Config file is', process.env.CONFIG_FILE);

switch(command){
    case 'serve':
        console.log('Starting server...')
        require('../server/server').start();
        break;
    default:
        throw new Error("Invalid command: " + command)
}
