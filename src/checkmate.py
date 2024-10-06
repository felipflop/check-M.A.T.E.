from lichess_api_client import LichessClient
import time

class CheckMATE:
    def __init__(self, api_token_path):
        self.client = LichessClient(api_token_path)

    def begin(self):
        self.client.connect()

    def menu(self):
        while True:
            option = input("Enter an option:\n1: Get account information\n2: Start Game\n3: Exit\n")

            if option == '1':
                self.client.get_info()
            elif option == '2':
                print("Starting game ...")
            elif option == '3':
                break
            else:
                print("Invalid!")

            time.sleep(1)



        