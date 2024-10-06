
from checkmate import CheckMATE

# Replace with absolute path to your own API token"
api_token_path = "/home/flop/api-token.txt"

checkmate = CheckMATE(api_token_path)

def main():
    checkmate.begin()
    checkmate.menu()

if __name__ == '__main__':
    main()