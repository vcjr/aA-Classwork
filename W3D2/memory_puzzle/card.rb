#
# Constant -> all of the different values that card can have. Letters
# take from the constant sample.. The result of sample will be the value of the card
# Eventually 
#



class Card

    # VALUES = (:A..:Z).to_a
    attr_reader :value

    def initialize(value)
        @value = value
        @hidden = " "
    end

    def ==(other_card)
        self.value == other_card.value
    end

    def to_s
        @value.to_s
    end

    def hide
        @hidden
    end

    def show
        self.to_s
    end

    
end