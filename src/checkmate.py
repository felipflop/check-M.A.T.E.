from lichess_api_client import LichessClient
from chess_game import ChessGame
import time

class CheckMATE:
    def __init__(self, api_token_path):
        self.client = LichessClient(api_token_path)

    def begin(self):
        self.client.connect()

    def run(self):
        self.game = ChessGame()
        self.game.print_board()

        """ call client to request game -> return colour """
        # colour = client.start_game()
        colour = "black"
    
        if colour is "black":
            # move = client.get_first_move()
            move = "e2e4"
            # self.game.board.push_san(move)
            self.game.move_piece(move)
            self.game.print_board()

    def menu(self):
        while True:
            option = input("Enter an option:\n1: Start Game\n2: Account Information\n3: Exit\n")

            if option == '1':
                self.run()
            elif option == '2':
                self.client.get_info()
            elif option == '3':
                break
            else:
                print("Invalid!")

            time.sleep(1)



        