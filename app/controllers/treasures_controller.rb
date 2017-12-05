class TreasuresController < ApplicationController
  def look
    # allow the user to guess
    my_message = "pick a location"
    if params['guess']
      user_guess = params['guess'].to_i
    else
      user_guess = nil
    end
    # if the user guesses right tell them congrats
    board1 = Board.first
    if user_guess == board1.treasure_location
      my_message = "You won"
      # reset the board
      board1.update(position_one: '-', position_two: '-', position_three: '-')
    else
      # if you get it wrong, update the board so the user can see where they guessed
      if user_guess == 0
        # update my db to show that the user looked there
        board1.update(position_one: 'X')
      elsif user_guess == 1
        board1.update(position_two: 'X')
      elsif user_guess == 2
        board1.update(position_three: 'X')
      end
    end
    # if they don't show them where they guessed and let them guess again
    # get info from my db
    # show that info to the user in an array
    board_array = [board1.position_one, board1.position_two, board1.position_three]
    render json: {message: my_message, board: board_array}
  end
end
