import time
import os
from lichess_api_client import LichessClient
from chess_game import ChessGame


class CheckMATE:
    def __init__(self, api_token_path):
        self.client = LichessClient(api_token_path)
        self.game = ChessGame()

    def begin(self):
        self.client.connect()

    def clear_screen(self):
        os.system('cls' if os.name == 'nt' else 'clear')
    
    def refresh_board(self):
        self.clear_screen()
        self.game.print_board()

    def play_player(self):  
        self.refresh_board()

        while True:
            move = input("Enter move or q to quit: ")
            if move == 'q':
                break

            elif not self.game.is_legal(move):
                print("Invalid!")
                continue

            else:
                self.game.move_piece(move)
                self.refresh_board()
    
        self.game.reset_board()
        self.clear_screen()

    def play_robot(self):
        self.refresh_board()
        self.clear_screen()

    def menu(self):
        self.clear_screen()

        while True:
            option = input("Enter an option:\n1: Play online\n2: Play robot\n3: Account Information\n4: Exit\n\nSelection: ")

            if option == '1':
                self.play_player()
            elif option == '2':
                self.play_robot()
            elif option == '3':
                self.client.get_info()
            elif option == '4':
                break
            else:
                print("Invalid!")
                time.sleep(1)
                self.clear_screen()

            



        