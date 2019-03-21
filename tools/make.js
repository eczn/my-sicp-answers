const readmePath = require('path').join(__dirname, '../README.md');
const readme = require('./readme-generator')();

// rm
require('rimraf').sync(readmePath);

// write 
require('fs-extra').writeFileSync(
    readmePath, readme, 
);
