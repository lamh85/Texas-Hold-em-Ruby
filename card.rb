class Card

    attr_accessor :number_strength, :suit_strength, :number_display, :suit_display

    def initialize(number_strength, suit_strength)
        @number_strength    = number_strength
        @suit_strength      = suit_strength
        @number_display     = number_display(number_strength)
        @suit_display       = suit_display(suit_strength)
    end

    def number_display(strength)
        return ["Ace", "2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King"][strength - 1]
    end

    def suit_display(strength)
        return ["diamonds", "clubs", "hearts", "spades"][strength - 1]
    end

end