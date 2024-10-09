import chess

board = chess.Board()

class ChessGame():
    def __init__(self):
        self.board = chess.Board()
    
    def print_board(self):
        print(self.board)
        
    def get_legal_moves(self):
        print(self.board.legal_moves)

    def move_piece(self, uci_move):
        # uci = chess.Move.from_uci(uci_move)
        # move = self.board.parse_uci(uci)
        # self.board.push_san(move)
    
        
if __name__ == "__main__":
    main()
