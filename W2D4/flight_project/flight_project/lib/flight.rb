require_relative "Passenger"

class Flight
    attr_reader :passengers

    def initialize(flight_number, capacity)
        @flight_number = flight_number
        @capacity = capacity
        @passengers = []
    end

    def full?
        @passengers.length >= @capacity 
    end

    def board_passenger(passenger)
        if !self.full? #flight1.full?
            if passenger.has_flight?(@flight_number) # John.has_flight?()
                @passengers << passenger
            end
        end
    end
    def list_passengers
        arr = []
        @passengers.each do |passenger|
            arr << passenger.name
        end
        arr
    end

    def [](idx) #  flight9[6] 
        @passengers[idx]
    end
    
    def <<(passenger) #self.asdsada << passenger
        self.board_passenger(passenger)
    end
end

    # rose = Passenger.new("Rose")
    # rose.add_flight("01")
    


    # jesse = Passenger.new("Jesse")
    # jesse.add_flight("02")
    



    # trevor = Passenger.new("Trevor")
    # trevor.add_flight("03")


    
    # flight01 = Flight.new("01", 3),
    # flight02 = Flight.new("02", 3),
    # flight03 = Flight.new("03", 3)

    # flight01.full?
    # flight01.list_passengers
    # flight01.board_passenger(rose)
    # flight01.board_passenger(jesse)
    # flight01.list_passengers
    # flight01.full?


