import berserk

class LichessClient:
    def __init__(self, api_token_path):
        with open(api_token_path, 'r') as file:  
            self.token = file.read()
    
    def connect(self):
        global client
        session = berserk.TokenSession(self.token)
        client = berserk.Client(session)

    def get_info(self):
        print(client.account.get())
 


    