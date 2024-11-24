// // docs/.vuepress/loadNews.js
// import fs from 'fs';
// import path from 'path';

// export default (options, app) => {
//     const newsDir = path.resolve(new URL(import.meta.url).pathname, '..', '..', 'news');
//     const news = [];

//     // 读取文件夹中的所有 Markdown 文件
//     const files = fs.readdirSync(newsDir);
//     files.forEach(file => {
//         if (file.endsWith('.md')) {
//             const filePath = path.join(newsDir, file);
//             const content = fs.readFileSync(filePath, 'utf-8');

//             // 使用正则表达式提取信息
//             const titleMatch = content.match(/title:\s*(.+)/);
//             const dateMatch = content.match(/date:\s*(.+)/);
//             const summaryMatch = content.match(/summary:\s*"(.*)"/);

//             if (titleMatch && dateMatch && summaryMatch) {
//                 news.push({
//                     title: titleMatch[1].trim(),
//                     date: dateMatch[1].trim(),
//                     summary: summaryMatch[1].trim(),
//                     url: `/files/${file}`,  // 生成对应的 URL
//                 });
//             }
//         }
//     });

//     // 输出调试信息
//     console.log('Loaded news:', news);

//     // 将新闻数据添加到 VuePress 的上下文
//     app.extendPageData((page) => {
//         page.news = news;
//     });

// };

// docs/.vuepress/loadMarkdownFiles.mjs
import fs from 'fs';
import path from 'path';

export default function loadMarkdownFiles() {
    const directoryPath = path.join(process.cwd(), '..', 'news');
    const markdownFiles = fs.readdirSync(directoryPath)
        .filter(file => file.endsWith('.md')) // 仅选择 .md 文件
        .map(file => {
            const content = fs.readFileSync(path.join(directoryPath, file), 'utf-8');
            return {
                name: file,
                content: content
            };
        });
    return markdownFiles;
}