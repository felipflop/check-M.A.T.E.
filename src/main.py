
from checkmate import CheckMATE

# Replace with absolute path to your own API token"
api_token_path = "/home/flop/api-token.txt"

board = CheckMATE(api_token_path)

def main():
    board.menu()

if __name__ == '__main__':
    main()