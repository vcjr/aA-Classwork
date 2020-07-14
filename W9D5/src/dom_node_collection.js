class DOMNodeCollection {
    constructor(htmlElements) {
        this.htmlElements = htmlElements;
    }


    // html() {
    //     if (arguments.length == 1) {
    //         // debugger;
            
    //     } else {
    //         return this.htmlElements[0].innerHTML; 
    //     }
    // }

    html(arg) {
        if (typeof arg === "string") {
        this.htmlElements.forEach(
            (element) => {
                // debugger;
                element.innerHTML = arguments[0];
            });
        } else {
            return this.htmlElements[0].innerHTML;
        }
    }

    empty() {
        this.html("");
    }

    append(html) {
        // this.htmlElements
    }
}

module.exports = DOMNodeCollection;