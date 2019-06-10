const fs = require('fs-extra');
const path = require('path');
const src = path.join(__dirname, '../src');

function readSectionDir(sectionDir) {
    const readmePath = path.join(sectionDir, './README.md');
    const readme = fs.readFileSync(readmePath, 'utf-8');

    const headers = readme.split('\n').filter(e => {
        return e.startsWith('# ');
    }).map(e => e.trim().slice(2));

    return headers;
}

module.exports = function() {
    const chapters = fs.readdirSync(src).filter(chapter => {
        const chapterDir = path.join(src, chapter);
        return fs.statSync(chapterDir).isDirectory();
    });

    return chapters.map(chapter => {
        const chapterDir = path.join(src, chapter);
        const sections = fs.readdirSync(chapterDir); 
        const sectionsDir = sections.map(section => path.join(chapterDir, section));
        
        const questionInfo = sectionsDir.map((sd, idx) => {
            const questions = readSectionDir(sd);
    
            return {
                section: sections[idx], questions
            }
        }); 
    
        return {
            chapter, questionInfo
        }
    });
}
