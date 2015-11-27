# class Session

    deck = []
    burns = []
    community = []
    flop_number = 1

    def number_display(strength)
        return ["Ace", "2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King"][strength - 1]
    end

    def suit_display(strength)
        return ["diamonds", "clubs", "hearts", "spades"][strength - 1]
    end

    def create_deck
        (1..13).each do |number|
            (1..4).each do |suit|
                deck << {
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
            transferred_card = deck.sample
            destination_array << transferred_card
            deck.delete(transferred_card)
        }
    end

    def flop(num_of_times)
        num_of_times.times { transfer_card(burns) }
    end

    def burn(num_of_times)
        transfer_card(burns)
    end

    def deal
        burn
        flop(flop_number == 1 ? 3 : 1)
        flop_number ++
    end

    def start_game
        create_deck
    end

# end