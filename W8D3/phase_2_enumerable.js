Array.prototype.myEach = function(callback) { // use callback in function//
    
    for (let index = 0; index < this.length; index++) {
        let ele = this[index];
        (callback(ele));
    }
    // return this;
};


// arr = ['miss', 'me']; 
// arr.myMap((ele)=> console.log(ele));


const timesTwo = function (ele) {
    return ele * 2;
};

console.log([1,2,3].myEach(timesTwo)); // The param as callback does not 

Array.prototype.myMap = function(callback) {
    let result = [];
    
    let mapped = this.myEach(callback);
    result.push(mapped);
    
    return result;
};

console.log([1,2,3].myMap(timesTwo)); // The param as callback does not 


