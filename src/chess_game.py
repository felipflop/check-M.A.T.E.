import chess

class ChessGame():
    def __init__(self):
        self.board = chess.Board()
    
    def print_board(self):
        print(self.board)
        
    def get_legal_moves(self):
        print(self.board.legal_moves)

    def move_piece(self, uci_move):
        self.board.push_uci(uci_move)
    
