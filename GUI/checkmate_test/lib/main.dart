import 'package:flutter/material.dart';

void main() {
  runApp(ChessApp());
}

class ChessApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chessboard',
      home: ChessBoard(),
    );
  }
}

class ChessBoard extends StatefulWidget {
  @override
  _ChessBoardState createState() => _ChessBoardState();
}

class _ChessBoardState extends State<ChessBoard> {
  // GlobalKey to track the chessboard's position
  final GlobalKey _boardKey = GlobalKey();

  // Define the chess pieces positions in the format (row, column)
  Map<String, Offset> piecePositions = {
    'whiteRook': Offset(0, 0),
    'whiteKnight': Offset(1, 0),
    'whiteBishop': Offset(2, 0),
    'whiteQueen': Offset(3, 0),
    'whiteKing': Offset(4, 0),
    'whiteBishop2': Offset(5, 0),
    'whiteKnight2': Offset(6, 0),
    'whiteRook2': Offset(7, 0),
    'whitePawn1': Offset(0, 1),
    'whitePawn2': Offset(1, 1),
    'whitePawn3': Offset(2, 1),
    'whitePawn4': Offset(3, 1),
    'whitePawn5': Offset(4, 1),
    'whitePawn6': Offset(5, 1),
    'whitePawn7': Offset(6, 1),
    'whitePawn8': Offset(7, 1),
    'blackPawn1': Offset(0, 6),
    'blackPawn2': Offset(1, 6),
    'blackPawn3': Offset(2, 6),
    'blackPawn4': Offset(3, 6),
    'blackPawn5': Offset(4, 6),
    'blackPawn6': Offset(5, 6),
    'blackPawn7': Offset(6, 6),
    'blackPawn8': Offset(7, 6),
    'blackRook': Offset(0, 7),
    'blackKnight': Offset(1, 7),
    'blackBishop': Offset(2, 7),
    'blackQueen': Offset(3, 7),
    'blackKing': Offset(4, 7),
    'blackBishop2': Offset(5, 7),
    'blackKnight2': Offset(6, 7),
    'blackRook2': Offset(7, 7),
  };

  // Track the occupied squares
  Map<Offset, String> occupiedSquares = {};

  @override
  void initState() {
    super.initState();
    // Initialize the occupied squares
    piecePositions.forEach((key, position) {
      occupiedSquares[position] = key;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Check M.A.T.E Debugging Menu'),
      ),
      body: Center(
        child: AspectRatio(
          aspectRatio: 1.0,
          child: LayoutBuilder(
            builder: (context, constraints) {
              // Get the size of the chessboard
              double boardSize = constraints.maxWidth;

              return Stack(
                key: _boardKey, // Assign the GlobalKey here
                children: <Widget>[
                  buildChessBoard(boardSize),
                  ...buildPieces(boardSize),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  // Build the chessboard with an 8x8 grid
  Widget buildChessBoard(double boardSize) {
    return GridView.builder(
      itemCount: 64,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 8,
      ),
      itemBuilder: (context, index) {
        final row = index ~/ 8;
        final col = index % 8;
        final isBlack = (row + col) % 2 == 1;

        return Container(
          width: boardSize / 8,
          height: boardSize / 8,
          color: isBlack ? Colors.brown : Colors.white,
          child: Center(),
        );
      },
    );
  }

  // Build the draggable chess pieces
  List<Widget> buildPieces(double boardSize) {
    List<Widget> pieces = [];

    piecePositions.forEach((key, position) {
      pieces.add(Positioned(
        left: position.dx * boardSize / 8,
        top: position.dy * boardSize / 8,
        child: Draggable<String>(
          data: key,
          feedback: buildPiece(key, boardSize),
          child: buildPiece(key, boardSize),
          childWhenDragging: Opacity(
            opacity: 0.5,
            child: buildPiece(key, boardSize),
          ),
          onDragEnd: (details) {
            setState(() {
              double squareSize = boardSize / 8;

              // Get the board's position in global coordinates
              final RenderBox box = _boardKey.currentContext!.findRenderObject() as RenderBox;
              final boardPosition = box.localToGlobal(Offset.zero);

              // Adjust the drag-end position relative to the board's top-left corner
              double adjustedDx = details.offset.dx - boardPosition.dx;
              double adjustedDy = details.offset.dy - boardPosition.dy;

              // Calculate the new grid position based on the adjusted coordinates
              int newX = (adjustedDx / squareSize).round();
              int newY = (adjustedDy / squareSize).round();

              // Clamp the values to ensure pieces stay within the board
              newX = newX.clamp(0, 7);
              newY = newY.clamp(0, 7);

              Offset newPosition = Offset(newX.toDouble(), newY.toDouble());

              // Check if the new square is already occupied
              if (occupiedSquares[newPosition] == null) {
                // Free the old square
                occupiedSquares.remove(piecePositions[key]);

                // Move the piece to the new square
                piecePositions[key] = newPosition;

                // Mark the new square as occupied
                occupiedSquares[newPosition] = key;
              }
            });
          },
        ),
      ));
    });

    return pieces;
  }

  // Function to build a chess piece widget based on its key
  Widget buildPiece(String piece, double boardSize) {
    String imageName;
    switch (piece) {
      case 'whiteRook':
        imageName = 'assets/white_rook.png';
        break;
      case 'whiteRook2':
        imageName = 'assets/white_rook.png';
        break;
      case 'whiteKnight':
        imageName = 'assets/white_knight.png';
        break;
      case 'whiteKnight2':
        imageName = 'assets/white_knight.png';
        break;
      case 'whiteBishop':
        imageName = 'assets/white_bishop.png';
        break;
      case 'whiteBishop2':
        imageName = 'assets/white_bishop.png';
        break;
      case 'whiteQueen':
        imageName = 'assets/white_queen.png';
        break;
      case 'whiteKing':
        imageName = 'assets/white_king.png';
        break;
      case 'whitePawn1':
      case 'whitePawn2':
      case 'whitePawn3':
      case 'whitePawn4':
      case 'whitePawn5':
      case 'whitePawn6':
      case 'whitePawn7':
      case 'whitePawn8':
        imageName = 'assets/white_pawn.png';
        break;

      case 'blackRook':
      case 'blackRook2':
        imageName = 'assets/black_rook.png';
        break;
      case 'blackKnight':
      case 'blackKnight2':
        imageName = 'assets/black_knight.png';
        break;
      case 'blackBishop':
      case 'blackBishop2':
        imageName = 'assets/black_bishop.png';
        break;
      case 'blackQueen':
        imageName = 'assets/black_queen.png';
        break;
      case 'blackKing':
        imageName = 'assets/black_king.png';
        break;
      case 'blackPawn1':
      case 'blackPawn2':
      case 'blackPawn3':
      case 'blackPawn4':
      case 'blackPawn5':
      case 'blackPawn6':
      case 'blackPawn7':
      case 'blackPawn8':
        imageName = 'assets/black_pawn.png';
        break;

      default:
        imageName = 'assets/white_pawn.png';
    }

    return Image.asset(
      imageName,
      width: boardSize / 8,
      height: boardSize / 8,
    );
  }
}