const DOMNodeCollection = require("./dom_node_collection.js")

window.$l = (arg) => {
    this.arg = arg

    if (arg instanceof HTMLElement) {
        const node = new DOMNodeCollection([arg]);
        return node;
    } else if (typeof arg === "string") {
        // return newNodeCollection = new DOMNodeCollection([arg]);
        const nodeList = document.querySelectorAll(arg); // Node list
        const nodesArray = new DOMNodeCollection(Array.from(nodeList));
        return nodesArray;
    }

}