/* Add-ons */

const keyWord=prompt("Request element:");

const _keyword_=document.querySelectorAll(`${keyWord}`);

_keyword_.forEach(element=>element.remove()); 

console.log(`Removed requested element: ${keyWord}`);

/*

// Attempt change: 1

const keyWord=prompt("Request element:");

function retrieve() {
	const _doc_=document.documentElement.outerHTML;
	const _keyword_=document.querySelectorAll(`${keyWord}`);

	if (_doc_.includes(keyWord)) {
		_keyword_.forEach(element=>element.remove());
		console.log(`Removed requested element ${keyWord}`);
		} else {
		console.log(`Requested element ${keyWord} not found.`);
		}
	}

*/


/*
 
// Attempt change: 2


function keyword_exist() {
	const _doc_=document.documentElement.outerHTML;
	_doc_.includes(keyWord) !=0 || null;
	}

const keywordExist=keyword_exist()

if (keywordExist) {
	console.log("Test complete.");
	return;
	} else {
	console.log("Test incomplete.");
	setTimeout(keyword_exist, 1000);
	}

*/

