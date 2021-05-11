"use strict";
const { exec } = require('child_process')

var std = function (err, stdout, stderr) {
  return (err) ?
    console.log(`stderr: ${stderr}`) :
    console.log(`stdout: ${stdout}`);
};


var cmds = [
  'mkdir boilerplate',
  'git clone -b develop https://github.com/Minoryu/boilerplate.git ./boilerplate',
];

cmds.forEach(command => exec('sudo ' + command, (err, stdout, stderr) => std(err, stdout, stderr)));
