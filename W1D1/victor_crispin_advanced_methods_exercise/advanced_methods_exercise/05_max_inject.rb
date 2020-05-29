# Write a method, max_inject(arr), that accepts any amount of numbers arguments and returns
# the largest number. Solve this using the built-in inject.

def max_inject(*arr)
    arr.inject do |largest, ele|
        if largest < ele 
            largest = ele 
        else 
            largest
        end
    end
end

p max_inject(1, -4, 0, 7, 5)  # => 7
p max_inject(30, 28, 18)      # => 30

# Command + /
# Shift + Alt + DownKey
# CTRL + Alt + DOWN KEY or Up 