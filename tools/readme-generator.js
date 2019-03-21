const fs = require('fs-extra');
const path = require('path');
const readChaters = require('./read-chaters');
const tpl = fs.readFileSync(
    path.join(__dirname, './README-tpl.md'), 'utf-8'
);

module.exports = function() {
    const chatersInfo = readChaters();

    const contents = chatersInfo.map(({ chapter, questionInfo }) => {
        const res = `# ${ chapter }`;
    
        const q = questionInfo.map(({ section, questions }) => {
            const link = `./src/${chapter}/${section}`;
            return [
                `[${ section }](${ encodeURI(link) })`, 
                questions.join(', ')
            ].join('\n');
        }).join('\n\n------\n\n');
    
        return [
            res, q
        ].join('\n\n')
    }).join('\n\n')
    
    const final = tpl.replace('{{contents}}', contents);
    
    return final;
}
