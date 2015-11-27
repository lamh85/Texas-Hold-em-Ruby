class Session

    attr_accessor :deck, :burns, :community, :player_hand, :num_of_opponents, :flop_number

    @deck = []
    @burns = []
    @community = []
    @player_hand = []
    @num_of_opponents = []
    @flop_number = 1

    def print_status

    end

    def number_display(strength)
        return ["Ace", "2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King"][strength - 1]
    end

    def suit_display(strength)
        return ["diamonds", "clubs", "hearts", "spades"][strength - 1]
    end

    def create_deck
        (1..13).each do |number|
            (1..4).each do |suit|
                @deck << {
                    number:             number,
                    suit:               suit,
                    number_display:     number_display(number),
                    suit_display:       suit_display(suit),
                    display:            "#{number_display(number)} of #{suit_display(suit)}"
                }
            end
        end
    end

    def transfer_card(destination_array, num_of_times = 1)
        num_of_times.each {
            transferred_card = @deck.sample
            destination_array << transferred_card
            @deck.delete(transferred_card)
        }
    end

    def flop(num_of_times)
        transfer_card(@community, num_of_times)
    end

    def burn(num_of_times)
        transfer_card(@burns)
    end

    def deal
        burn
        flop(@flop_number == 1 ? 3 : 1)
        @flop_number ++
    end

    def set_num_of_players
        puts "How many opponents? (enter an integer, max 5)"
        @num_of_opponents = gets.chomp
    end

    def start_game
        create_deck
        set_num_of_players
    end

end