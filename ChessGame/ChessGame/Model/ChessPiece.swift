import Foundation


struct ChessPiece {
    let chessPieceType: ChessPieceType
    let color: ChessPieceColor
    
    var chessPieceString: String {
        switch self.chessPieceType {
        case .pawn: return self.color == .black ? "♟" : "♙"
        case .bishop: return self.color == .black ? "♝" : "♗"
        case .knight: return self.color == .black ? "♞" : "♘"
        case .luke: return self.color == .black ? "♜" : "♖"
        case .queen: return self.color == .black ? "♛" : "♕"
        }
    }
}

enum ChessPieceType {
    case pawn
    case bishop
    case knight
    case luke
    case queen
    
    var score: Int {
        switch self {
        case .pawn: return 1
        case .bishop, .knight: return 3
        case .luke: return 5
        case .queen: return 9
        }
    }
}

struct ChessPieceLocation {
    var rank: Int
    var file: Int
}

enum ChessPieceColor {
    case black
    case white
}
