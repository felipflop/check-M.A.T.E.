import berserk
import time

# client = berserk.Client()

class CheckMATE:
    def __init__(self, api_token_path):
        with open(api_token_path, 'r') as file:  
            self.token = file.read()

    def client_connect(self):
        global client
        session = berserk.TokenSession(self.token)
        client = berserk.Client(session)
        # print("[S] Client connected")

    def get_info(self):
        print(client.account.get())
    
    def menu(self):
        self.client_connect()

        while True:
            option = input("Enter an option:\n1: Get account information\n2: Start Game\n3: Exit\n")

            if option == '1':
                print(client.account.get())
            elif option == '2':
                print(client.account.get())
            elif option == '3':
                break
            else:
                print("Invalid!")

            time.sleep(1)

        

        