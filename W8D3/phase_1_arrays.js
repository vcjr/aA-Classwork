
// Array.prototype.uniq = function () {
//     let new_arr = [];

//     this.forEach((ele) => {
//         if (new_arr.indexOf(ele) < 0){ // inter
//             new_arr.push(ele);
//         }
//     }); 

//     return new_arr;
// };

// console.log([1,2,2,3,3,3].uniq());

// function name() {

// } // Do we do one here?

// const somethign = () => {
    
// }; // Do we do one here?
// // => [1,2,3]
// [].indexOf(-1) -> not in array or string

// function (somethign, other_arguement) {
    
// }

// for (let index = 0; index < array.length; index++) {

// }
// def self.uniq 
//     new_arr = []

//     self.each do |ele|
//         new_arr << ele if !new_arr.include?(ele) # true 
//     end

//     new_arr
// end



Array.prototype.twoSum = function() {
    let answer = [];
    for (let i = 0; i < this.length; i++) {

        for (let j = 1; j < this.length; j++) {
            if (this[i] + this[j] === 0 && j > i) { 
                answer.push([i,j]);
            }
        }
        
    }

    return answer;
};  

// def twosum(arr)
//     answer = []
//     (0...arr.length).each do |i|
//         (0...arr.length).each do |j|
//             if j > i
//                 answer << [i,j] if arr[i] + arr[j] == 0
//             end
//         end
//     end

//     answer
// end

// console.log([1,4,2,-4,-2,-1].twoSum()); // [[0,5] , [1,3], [2,4]]
// [ [1, -1], ]

// Hello Programmers

Array.prototype.transpose = function () {
    let answer = [];


    for (let i = 0; i < this.length; i++) {
        that = this;
        let subarray = [];
        for (let j = 0; j < that.length; j++) {
            subarray.push(that[j][i]);
        }
        answer.push(subarray);
    }

    return answer;
}

// def transpose(array) 
//     answer = []

//     array.each_with_index do |subArr, i|                     
//         subarray = []
//         (0...subArr.length).each do |j| 
//             subarray << array[j][i]
//         end
//         answer << subarray
//     end

//     answer
// end

// arr = [   
//     [1,2,3,4],
//     [1,2,3,4],
//     [1,2,3,4],
//     [1,2,3,4],
// ]

// console.log(arr.transpose());

Array.prototype.myEach = function(callback) { // use callback in function//
    let answer = [];
    for (let index = 0; index < this.length; index++) {
        answer.push(callback(this[index])  );
        
    }
    return answer;
}


arr = ['miss', 'me'];
arr.myEach((ele)=> console.log(ele));