require_relative "room"

class Hotel

    def initialize(name, capacities) 
        @name = name

        @rooms = {}

        capacities.each do |room_name, capacity| 
            @rooms[room_name] = Room.new(capacity) 
        end
    end  

    def name
        @name.split.map { |word| word.capitalize }.join(" ")
    end

    def rooms
        @rooms
    end

    def room_exists?(room_name)
        @rooms.has_key?(room_name) ? true : false
    end

    def check_in(person, room_name)
        if room_exists?(room_name)
            success = @rooms[room_name].add_occupant(person)
            if success
                puts 'check in successful'
            else
                puts 'sorry, room is full'
            end
            # @rooms[room_name].add_occupant(person) ? puts "check in successful" : puts "sorry, room is full"
        else
            p 'sorry, room does not exist'
        end
    end

    def has_vacancy?
        @rooms.values.any? { |room| !room.full? }
    end

    def list_rooms
        @rooms.each { |name, room | puts "#{name} : #{room.available_space}"}
    end
end
