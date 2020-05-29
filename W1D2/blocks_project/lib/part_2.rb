def all_words_capitalized?(array)
    array.all? { |word| word[0] == word[0].upcase && word[1..-1] == word[1..-1].downcase }
end

def no_valid_url?(array)
    sites = ['.com', '.net', '.io', '.org']

    array.none? do |url| 
        parts = url.split(".")
        sites.include?(".#{parts[1]}")
    end
end

def any_passing_students?(students)
    students.any? do |student|
        grades = student[:grades]
        avg = grades.sum / (grades.length * 1.0)
        avg >= 75
    end
end