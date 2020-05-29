class Dog

    def initialize(name, breed, age, bark, favorite_foods)
        @name, @breed, @age, @bark, @favorite_foods = name, breed, age, bark, favorite_foods
    end

    def bark
        @bark
    end

    def favorite_food?(string)
        @favorite_foods.include?(string.capitalize)
    end

    def favorite_foods
        @favorite_foods
    end

    def name
        @name
    end

    def age
        @age
    end

    def age=(num)
        @age = num
    end

    def breed
        @breed
    end

    def bark
        # if age > 3
        #     @bark.upcase
        # else
        #     @bark.downcase
        # end

        age > 3 ? @bark.upcase : @bark.downcase

    end


end