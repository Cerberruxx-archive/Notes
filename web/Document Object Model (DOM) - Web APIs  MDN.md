---
title: "Document Object Model (DOM) - Web APIs | MDN"
source: "https://developer.mozilla.org/en-US/docs/Web/API/Document_Object_Model"
author:
  - "[[MozDevNet]]"
published: 2025-10-13
created: 2025-10-15
description: "The Document Object Model (DOM) connects web pages to scripts or programming languages by representing the structure of a document—such as the HTML representing a web page—in memory. Usually it refers to JavaScript, even though modeling HTML, SVG, or XML documents as objects are not part of the core JavaScript language."
tags:
  - "clippings"
---
## Document Object Model (DOM)

The **Document Object Model** (**DOM**) connects web pages to scripts or programming languages by representing the structure of a document—such as the HTML representing a web page—in memory. Usually it refers to JavaScript, even though modeling HTML, SVG, or XML documents as objects are not part of the core JavaScript language.

The DOM represents a document with a logical tree. Each branch of the tree ends in a node, and each node contains objects. DOM methods allow programmatic access to the tree. With them, you can change the document's structure, style, or content.

Nodes can also have event handlers attached to them. Once an event is triggered, the event handlers get executed.

The Document Object Model (DOM) is a programming interface for web documents. It represents the page so that programs can change the document structure, style, and content. The DOM represents the document as nodes and objects; that way, programming languages can interact with the page.

A web page is a document that can be either displayed in the browser window or as the HTML source. In both cases, it is the same document but the Document Object Model (DOM) representation allows it to be manipulated. As an object-oriented representation of the web page, it can be modified with a scripting language such as JavaScript.

For example, the DOM specifies that the `querySelectorAll` method in this code snippet must return a list of all the [`<p>`](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/p) elements in the document:

All of the properties, methods, and events available for manipulating and creating web pages are organized into objects. For example, the `document` object that represents the document itself, any `table` objects that implement the [`HTMLTableElement`](https://developer.mozilla.org/en-US/docs/Web/API/HTMLTableElement) DOM interface for accessing HTML tables, and so forth, are all objects.

The DOM is built using multiple APIs that work together. The core DOM defines the entities describing any document and the objects within it. This is expanded upon as needed by other APIs that add new features and capabilities to the DOM. For example, the [HTML DOM API](https://developer.mozilla.org/en-US/docs/Web/API/HTML_DOM_API) adds support for representing HTML documents to the core DOM, and the SVG API adds support for representing SVG documents.

A **DOM tree** is a [tree structure](https://en.wikipedia.org/wiki/Tree_structure) whose nodes represent an HTML or XML document's contents. Each HTML or XML document has a DOM tree representation. For example, consider the following document:

It has a DOM tree that looks like this:

![The DOM as a tree-like representation of a document that has a root and node elements containing content](https://developer.mozilla.org/en-US/docs/Web/API/Document_Object_Model/using_the_w3c_dom_level_1_core-doctree.jpg)

Although the above tree is similar to the above document's DOM tree, they're not identical, as the actual DOM tree preserves [whitespace](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_text/Whitespace).

When a web browser parses an HTML document, it builds a DOM tree and then uses it to display the document.

The previous short example, like nearly all examples, is [JavaScript](https://developer.mozilla.org/en-US/docs/Glossary/JavaScript). That is to say, it is *written* in JavaScript, but *uses* the DOM to access the document and its elements. The DOM is not a programming language, but without it, the JavaScript language wouldn't have any model or notion of web pages, HTML documents, SVG documents, and their component parts. The document as a whole, the head, tables within the document, table headers, text within the table cells, and all other elements in a document are parts of the document object model for that document. They can all be accessed and manipulated using the DOM and a scripting language like JavaScript.

The DOM is not part of the JavaScript language, but is instead a Web API used to build websites. JavaScript can also be used in other contexts. For example, Node.js runs JavaScript programs on a computer, but provides a different set of APIs, and the DOM API is not a core part of the Node.js runtime.

The DOM was designed to be independent of any particular programming language, making the structural representation of the document available from a single, consistent API. Even if most web developers will only use the DOM through JavaScript, implementations of the DOM can be built for any language, as this Python example demonstrates:

For more information on what technologies are involved in writing JavaScript on the web, see [JavaScript technologies overview](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/JavaScript_technologies_overview).

You don't have to do anything special to begin using the DOM. You use the API directly in JavaScript from within what is called a *script*, a program run by a browser.

When you create a script, whether inline in a `<script>` element or included in the web page, you can immediately begin using the API for the [`document`](https://developer.mozilla.org/en-US/docs/Web/API/Document) or [`window`](https://developer.mozilla.org/en-US/docs/Web/API/Window "window") objects to manipulate the document itself, or any of the various elements in the web page (the descendant elements of the document). Your DOM programming may be something as simple as the following example, which displays a message on the console by using the [`console.log()`](https://developer.mozilla.org/en-US/docs/Web/API/console/log_static "console.log()") function:

As it is generally not recommended to mix the structure of the page (written in HTML) and manipulation of the DOM (written in JavaScript), the JavaScript parts will be grouped together here, and separated from the HTML.

For example, the following function creates a new [h1](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/Heading_Elements) element, adds text to that element, and then adds it to the tree for the document:

The following are all interfaces defined by the DOM specification:

- [`AbortController`](https://developer.mozilla.org/en-US/docs/Web/API/AbortController)
- [`AbortSignal`](https://developer.mozilla.org/en-US/docs/Web/API/AbortSignal)
- [`AbstractRange`](https://developer.mozilla.org/en-US/docs/Web/API/AbstractRange)
- [`Attr`](https://developer.mozilla.org/en-US/docs/Web/API/Attr)
- [`CDATASection`](https://developer.mozilla.org/en-US/docs/Web/API/CDATASection)
- [`CharacterData`](https://developer.mozilla.org/en-US/docs/Web/API/CharacterData)
- [`Comment`](https://developer.mozilla.org/en-US/docs/Web/API/Comment)
- [`CustomEvent`](https://developer.mozilla.org/en-US/docs/Web/API/CustomEvent)
- [`Document`](https://developer.mozilla.org/en-US/docs/Web/API/Document)
- [`DocumentFragment`](https://developer.mozilla.org/en-US/docs/Web/API/DocumentFragment)
- [`DocumentType`](https://developer.mozilla.org/en-US/docs/Web/API/DocumentType)
- [`DOMError`](https://developer.mozilla.org/en-US/docs/Web/API/DOMError)
- [`DOMException`](https://developer.mozilla.org/en-US/docs/Web/API/DOMException)
- [`DOMImplementation`](https://developer.mozilla.org/en-US/docs/Web/API/DOMImplementation)
- [`DOMParser`](https://developer.mozilla.org/en-US/docs/Web/API/DOMParser)
- [`DOMTokenList`](https://developer.mozilla.org/en-US/docs/Web/API/DOMTokenList)
- [`Element`](https://developer.mozilla.org/en-US/docs/Web/API/Element)
- [`Event`](https://developer.mozilla.org/en-US/docs/Web/API/Event)
- [`EventTarget`](https://developer.mozilla.org/en-US/docs/Web/API/EventTarget)
- [`HTMLCollection`](https://developer.mozilla.org/en-US/docs/Web/API/HTMLCollection)
- [`MutationObserver`](https://developer.mozilla.org/en-US/docs/Web/API/MutationObserver)
- [`MutationRecord`](https://developer.mozilla.org/en-US/docs/Web/API/MutationRecord)
- [`NamedNodeMap`](https://developer.mozilla.org/en-US/docs/Web/API/NamedNodeMap)
- [`Node`](https://developer.mozilla.org/en-US/docs/Web/API/Node)
- [`NodeIterator`](https://developer.mozilla.org/en-US/docs/Web/API/NodeIterator)
- [`NodeList`](https://developer.mozilla.org/en-US/docs/Web/API/NodeList)
- [`ProcessingInstruction`](https://developer.mozilla.org/en-US/docs/Web/API/ProcessingInstruction)
- [`QuotaExceededError`](https://developer.mozilla.org/en-US/docs/Web/API/QuotaExceededError)
- [`Range`](https://developer.mozilla.org/en-US/docs/Web/API/Range)
- [`ShadowRoot`](https://developer.mozilla.org/en-US/docs/Web/API/ShadowRoot)
- [`StaticRange`](https://developer.mozilla.org/en-US/docs/Web/API/StaticRange)
- [`Text`](https://developer.mozilla.org/en-US/docs/Web/API/Text)
- [`TreeWalker`](https://developer.mozilla.org/en-US/docs/Web/API/TreeWalker)
- [`XMLDocument`](https://developer.mozilla.org/en-US/docs/Web/API/XMLDocument)
- [`XPathEvaluator`](https://developer.mozilla.org/en-US/docs/Web/API/XPathEvaluator)
- [`XPathExpression`](https://developer.mozilla.org/en-US/docs/Web/API/XPathExpression)
- [`XPathResult`](https://developer.mozilla.org/en-US/docs/Web/API/XPathResult)
- [`XSLTProcessor`](https://developer.mozilla.org/en-US/docs/Web/API/XSLTProcessor)

This guide is about the objects and the actual *things* you can use to manipulate the DOM hierarchy. There are many points where understanding how these work can be confusing. For example, the object representing the HTML `form` element gets its `name` property from the `HTMLFormElement` interface but its `className` property from the `HTMLElement` interface. In both cases, the property you want is in that form object.

But the relationship between objects and the interfaces that they implement in the DOM can be confusing, and so this section attempts to say a little something about the actual interfaces in the DOM specification and how they are made available.

Many objects implement several different interfaces. The table object, for example, implements a specialized [`HTMLTableElement`](https://developer.mozilla.org/en-US/docs/Web/API/HTMLTableElement) interface, which includes such methods as `createCaption` and `insertRow`. But since it's also an HTML element, `table` implements the `Element` interface described in the DOM [`Element`](https://developer.mozilla.org/en-US/docs/Web/API/Element) Reference chapter. And finally, since an HTML element is also, as far as the DOM is concerned, a node in the tree of nodes that make up the object model for an HTML or XML page, the table object also implements the more basic `Node` interface, from which `Element` derives.

When you get a reference to a `table` object, as in the following example, you routinely use all three of these interfaces interchangeably on the object, perhaps without knowing it.

This page tries to describe the various objects and types in simple terms. But there are a number of different data types being passed around the API that you should be aware of.

**Note:**Because the vast majority of code that uses the DOM revolves around manipulating HTML documents, it's common to refer to the nodes in the DOM as **elements**, although strictly speaking not every node is an element.

The following table briefly describes these data types.

| Data type (Interface) | Description |
| --- | --- |
| [`Document`](https://developer.mozilla.org/en-US/docs/Web/API/Document) | When a member returns an object of type `document` (e.g., the `ownerDocument` property of an element returns the `document` to which it belongs), this object is the root `document` object itself. The [DOM `document` Reference](https://developer.mozilla.org/en-US/docs/Web/API/Document) chapter describes the `document` object. |
| [`Node`](https://developer.mozilla.org/en-US/docs/Web/API/Node) | Every object located within a document is a node of some kind. In an HTML document, an object can be an element node but also a text node or attribute node. |
| [`Element`](https://developer.mozilla.org/en-US/docs/Web/API/Element) | The `element` type is based on `node`. It refers to an element or a node of type `element` returned by a member of the DOM API. Rather than saying, for example, that the [`document.createElement()`](https://developer.mozilla.org/en-US/docs/Web/API/Document/createElement) method returns an object reference to a `node`, we just say that this method returns the `element` that has just been created in the DOM. `element` objects implement the DOM `Element` interface and also the more basic `Node` interface, both of which are included together in this reference. In an HTML document, elements are further enhanced by the HTML DOM API's [`HTMLElement`](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement) interface as well as other interfaces describing capabilities of specific kinds of elements (for instance, [`HTMLTableElement`](https://developer.mozilla.org/en-US/docs/Web/API/HTMLTableElement) for [`<table>`](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/table) elements). |
| [`Attr`](https://developer.mozilla.org/en-US/docs/Web/API/Attr) | When an `attribute` is returned by a member (e.g., by the `createAttribute()` method), it is an object reference that exposes a special (albeit small) interface for attributes. Attributes are nodes in the DOM just like elements are, though you may rarely use them as such. |

There are also some common terminology considerations to keep in mind. It's common to refer to any [`Attr`](https://developer.mozilla.org/en-US/docs/Web/API/Attr) node as an `attribute`, for example, and to refer to an array of DOM nodes as a `nodeList`. You'll find these terms and others to be introduced and used throughout the documentation.

The `document` and `window` objects are the objects whose interfaces you generally use most often in DOM programming. In simple terms, the `window` object represents something like the browser, and the `document` object is the root of the document itself. `Element` inherits from the generic `Node` interface, and together these two interfaces provide many of the methods and properties you use on individual elements. These elements may also have specific interfaces for dealing with the kind of data those elements hold, as in the `table` object example in the previous section.

The Document Object Model has been highly simplified. To achieve this, the following interfaces in the different DOM level 3 or earlier specifications have been removed. They are no longer available to web developers.

- `DOMConfiguration`
- `DOMErrorHandler`
- `DOMImplementationList`
- `DOMImplementationRegistry`
- `DOMImplementationSource`
- `DOMLocator`
- `DOMObject`
- `DOMSettableTokenList`
- `DOMUserData`
- `ElementTraversal`
- `Entity`
- `EntityReference`
- `NameList`
- `Notation`
- `TypeInfo`
- `UserDataHandler`

A document containing HTML is described using the [`Document`](https://developer.mozilla.org/en-US/docs/Web/API/Document) interface, which is extended by the HTML specification to include various HTML-specific features. In particular, the [`Element`](https://developer.mozilla.org/en-US/docs/Web/API/Element) interface is enhanced to become [`HTMLElement`](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement) and various subclasses, each representing one of (or a family of closely related) elements.

The HTML DOM API provides access to various browser features such as tabs and windows, CSS styles and stylesheets, browser history, etc. These interfaces are discussed further in the [HTML DOM API](https://developer.mozilla.org/en-US/docs/Web/API/HTML_DOM_API) documentation.

Similarly, a document containing SVG is also described using the [`Document`](https://developer.mozilla.org/en-US/docs/Web/API/Document) interface, which is extended by the SVG specification to include various SVG-specific features. In particular, the [`Element`](https://developer.mozilla.org/en-US/docs/Web/API/Element) interface is enhanced to become [`SVGElement`](https://developer.mozilla.org/en-US/docs/Web/API/SVGElement) and various subclasses, each representing an element or a family of closely related elements. These interfaces are discussed further in the [SVG API](https://developer.mozilla.org/en-US/docs/Web/API/SVG_API) documentation.

This example uses a [`<div>`](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/div) element containing a [`<textarea>`](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/textarea) and two [`<button>`](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/button) elements. When the user clicks the first button we set some text in the `<textarea>`. When the user clicks the second button we clear the text. We use:

- [`Document.querySelector()`](https://developer.mozilla.org/en-US/docs/Web/API/Document/querySelector) to access the `<textarea>` and the button
- [`EventTarget.addEventListener()`](https://developer.mozilla.org/en-US/docs/Web/API/EventTarget/addEventListener) to listen for button clicks
- [`Node.textContent`](https://developer.mozilla.org/en-US/docs/Web/API/Node/textContent) to set and clear the text.

#### HTML

#### CSS

#### JavaScript

#### Result

This example uses a [`<div>`](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/div) element containing a [`<div>`](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/div) and two [`<button>`](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/button) elements. When the user clicks the first button we create a new element and add it as a child of the `<div>`. When the user clicks the second button we remove the child element. We use:

- [`Document.querySelector()`](https://developer.mozilla.org/en-US/docs/Web/API/Document/querySelector) to access the `<div>` and the buttons
- [`EventTarget.addEventListener()`](https://developer.mozilla.org/en-US/docs/Web/API/EventTarget/addEventListener) to listen for button clicks
- [`Document.createElement`](https://developer.mozilla.org/en-US/docs/Web/API/Document/createElement) to create the element
- [`Node.appendChild()`](https://developer.mozilla.org/en-US/docs/Web/API/Node/appendChild) to add the child
- [`Node.removeChild()`](https://developer.mozilla.org/en-US/docs/Web/API/Node/removeChild) to remove the child.

#### HTML

#### CSS

#### JavaScript

#### Result

Suppose the author wants to change the header of the document in [What is a DOM tree?](https://developer.mozilla.org/en-US/docs/Web/API/#what_is_a_dom_tree) and write two paragraphs instead of one. The following script would do the job:

#### HTML

#### JavaScript

You can create the tree in [What is a DOM tree?](https://developer.mozilla.org/en-US/docs/Web/API/#what_is_a_dom_tree) entirely in JavaScript too.

This example demonstrates how events fire and are handled in the DOM in a very simple way. When the BODY of this HTML document loads, an event listener is registered with the top row of the TABLE. The event listener handles the event by executing the function stopEvent, which changes the value in the bottom cell of the table.

However, stopEvent also calls an event object method, [`event.stopPropagation`](https://developer.mozilla.org/en-US/docs/Web/API/Event/stopPropagation), which keeps the event from bubbling any further up into the DOM. Note that the table itself has an [`onclick`](https://developer.mozilla.org/en-US/docs/Web/API/Element/click_event "onclick") event handler that ought to display a message when the table is clicked. But the stopEvent method has stopped propagation, and so after the data in the table is updated, the event phase is effectively ended, and an alert box is displayed to confirm this.

This example uses DOM methods to display all the properties of the [`onload`](https://developer.mozilla.org/en-US/docs/Web/API/Window/load_event "onload") [`event`](https://developer.mozilla.org/en-US/docs/Web/API/Event) object and their values in a table. It also shows a useful technique of using a [`for...in`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/for...in) loop to iterate over the properties of an object to get their values.

The properties of event objects differs greatly between browsers, the [WHATWG DOM Standard](https://dom.spec.whatwg.org/) lists the standard properties, however many browsers have extended these greatly.

Put the following code into a blank text file and load it into a variety of browsers, you'll be surprised at the different number and names of properties. You might also like to add some elements in the page and call this function from different event handlers.

| Specification |
| --- |
| [DOM](https://dom.spec.whatwg.org/) |

- [CSS Object Model (CSSOM)](https://developer.mozilla.org/en-US/docs/Web/API/CSS_Object_Model)
- [HTML DOM API](https://developer.mozilla.org/en-US/docs/Web/API/HTML_DOM_API)
- [SVG API](https://developer.mozilla.org/en-US/docs/Web/API/SVG_API)