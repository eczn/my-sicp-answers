const fs = require('fs-extra');
const path = require('path');
const readChaters = require('./read-chaters');
const tpl = fs.readFileSync(
    path.join(__dirname, './README-tpl.md'), 'utf-8'
);

module.exports = function() {
    const chatersInfo = readChaters();
    const contents = chatersInfo.map(({ chapter, questionInfo }) => {
        const n = questionInfo.reduce((acc, cur) => {
            return acc + cur.questions.length
        }, 0);
        const res = `## ${ chapter } (共 ${n} 题)`;
    
        const q = questionInfo.map(({ section, questions }) => {
            const link = `./src/${chapter}/${section}`;
            const questionsWithlink = questions.map(q => {
                const hash = q.replace(/ /, '-').replace(/\./g, '');
                const qLink = `${ link }#${ hash }`;

                return `[${q}](${ encodeURI(qLink) })`
            });

            return [
                `### [${ section }](${ encodeURI(link) }) \n`, 
                `> ${ questionsWithlink.join(', ') }`
            ].join('\n');
        }).join('\n\n');
    
        return [
            res, q
        ].join('\n\n')
    }).join('\n\n')
    
    const final = tpl.replace('{{contents}}', contents);
    
    return final;
}
