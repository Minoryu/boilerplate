const { exec } = require('child_process')

var std = function (err, stdout, stderr) {
  return (err) ?
    console.log(`stderr: ${stderr}`) :
    console.log(`stdout: ${stdout}`);
};


var cmds = [
  'ls -la', //test
  '../bin/test.sh',
  '../bin/git.install.sh',
  '../bin/node.install.sh',
  'git clone -b develop https://github.com/Minoryu/boilerpalte.git',
  '../bin/docker-compose.install.sh',
];


cmds.forEach(command => exec('sudo ' + command, (err, stdout, stderr) => std(err, stdout, stderr)));

