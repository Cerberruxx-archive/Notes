const style_sheet=document.querySelectorAll('style, link[rel="stylesheet"]');

style_sheet.forEach(element=>element.remove());

console.log(`Instances of 'stylesheet' found: ${style_sheet}`);

