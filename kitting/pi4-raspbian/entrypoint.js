"use strict";
const { exec } = require('child_process')

var std = function (err, stdout, stderr) {
  return (err) ?
    console.log(`stderr: ${stderr}`) :
    console.log(`stdout: ${stdout}`);
};


var cmds = [
  'echo "hello world! pi4"'
];

cmds.forEach(command => exec('sudo ' + command, (err, stdout, stderr) => std(err, stdout, stderr)));
