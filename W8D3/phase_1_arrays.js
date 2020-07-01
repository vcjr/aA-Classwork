
Array.prototype.uniq = function () {
    let new_arr = [];

    this.forEach((ele) => {
        if (new_arr.indexOf(ele) < 0){ // inter
            new_arr.push(ele);
        }
    }); 

    return new_arr;
}

[1,2,2,3,3,3].uniq(); // => [1,2,3]
// [].indexOf(-1) -> not in array or string

// function ((blah) => {}; other_arguement ){}

// for (let index = 0; index < array.length; index++) {

// }
// def self.uniq 
//     new_arr = []

//     self.each do |ele|
//         new_arr << ele if !new_arr.include?(ele) # true 
//     end

//     new_arr
// end