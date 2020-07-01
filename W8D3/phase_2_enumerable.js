Array.prototype.myMap = function(callback) { // use callback in function//
    let answer = [];
    for (let index = 0; index < this.length; index++) {
        answer.push(callback(this[index])  );
        
    }
    return answer;
}


// arr = ['miss', 'me']; 
// arr.myMap((ele)=> console.log(ele));


const timesTwo = function (ele) {
    console.log(ele * 2)
};

[1,2,3].myMap(timesTwo); // The param as callback does not 


