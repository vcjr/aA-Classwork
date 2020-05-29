require_relative "Flight"

class Passenger
    attr_reader :name

    def initialize(name)
        @name = name
        @flight_numbers = []
    end

    def has_flight?(flight_number)
        @flight_numbers.any? do |flight_num|
            if flight_number.downcase == flight_num.downcase
                return true
            end
        end
        false
    end

    def add_flight(flight_num)
        self.has_flight?(flight_num)
        if !self.has_flight?(flight_num)
            @flight_numbers << flight_num.upcase
        end
    end

end