/* 
!   We are creating a function intance method that can be applied on any other 
!   function so that we can apply the surrogate and pass on the conteyt and in
!   inheratance to the baseclass we want to pass it to.  
*/
Function.prototype.inherits = function (BaseClass) {
    // Here we create the empty surrogate function
    function Surrogate() {} 

    // Here we are setting the prototype of the surrogate to the same one of the Baseclass
    Surrogate.prototype = BaseClass.prototype;
    
    // Remember there are two portions to this. The Object prototype and the constructor object
    // We still want to keep the constructor but we want to make sure we inherit the main prototype to the new surrogate
    this.prototype = new Surrogate();

    // Since the constructor got overriden when assigning the new prototype. We go and
    // reassign itself as the constructor.
    this.prototype.constructor = this;

};


function MovingObject (name) {
    this.name = name;
    
}

MovingObject.prototype.move = function() {
    console.log(`${this.name} moves to an unknown direction...`);
};

function Ship (name) {

    // This is the Super version in ES5 for inheriting parameters from Parent class
    MovingObject.call(this, name);
}

Ship.inherits(MovingObject);

Ship.prototype.shoot = function (target) {
    console.log(`${this.name} shoots ${target.properties.type} ${target.name}`);
};

function Asteroid (name) {
    this.properties = {
        type: "Asteroid"
    };
    MovingObject.call(this, name);
}
Asteroid.inherits(MovingObject);


