import Foundation


struct ChessPiece {
    let chessPieceType: ChessPieceType
    let color: ChessPieceColor
    let location: ChessPieceLocation
    
    var chessPieceString: String {
        switch self.chessPieceType {
        case .empty: return "."
        case .pawn: return self.color == .black ? "♟" : "♙"
        case .bishop: return self.color == .black ? "♝" : "♗"
        case .knight: return self.color == .black ? "♞" : "♘"
        case .luke: return self.color == .black ? "♜" : "♖"
        case .queen: return self.color == .black ? "♛" : "♕"
        }
    }
    
    func moveablePositionCandidates() -> [ChessPieceLocation] {
        var candidates: [ChessPieceLocation] = []
        let currentLocation = self.location
        switch self.chessPieceType {
        case .empty: break
        case .pawn:
            if self.color == .black && currentLocation.rank + 1 < ChessBoard.rankLength {
                candidates.append(
                    ChessPieceLocation.init(rank: currentLocation.rank + 1, file: currentLocation.file)
                )
            }
            
            if self.color == .white && currentLocation.rank - 1 >= 0 {
                candidates.append(
                    ChessPieceLocation.init(rank: currentLocation.rank - 1, file: currentLocation.file)
                )
            }
        case .bishop:
            let dx = [-1, -1, 1, 1]
            let dy = [-1, 1, -1, 1]
            for i in 0..<4 {
                while true {
                    let nx = currentLocation.rank + dx[i]
                    let ny = currentLocation.file + dy[i]
                    if nx >= 0 && nx < ChessBoard.rankLength && ny >= 0 && ny < ChessBoard.fileLength {
                        candidates.append(
                            ChessPieceLocation.init(rank: nx, file: ny)
                        )
                    } else {
                        break
                    }
                }
            }
        case .knight:
            let dx = [-1, -2, -2, -1, 1, 2, 2, 1]
            let dy = [-2, -1, 1, 2, -2, -1, 1, 2]
            for i in 0..<8 {
                let nx = currentLocation.rank + dx[i]
                let ny = currentLocation.file + dy[i]
                if nx >= 0 && nx < ChessBoard.rankLength && ny >= 0 && ny < ChessBoard.fileLength {
                    candidates.append(
                        ChessPieceLocation.init(rank: nx, file: ny)
                    )
                }
            }
        case .luke:
            let dx = [-1, 1, 0, 0]
            let dy = [0, 0, -1, 1]
            for i in 0..<4 {
                while true {
                    let nx = currentLocation.rank + dx[i]
                    let ny = currentLocation.file + dy[i]
                    if nx >= 0 && nx < ChessBoard.rankLength && ny >= 0 && ny < ChessBoard.fileLength {
                        candidates.append(
                            ChessPieceLocation.init(rank: nx, file: ny)
                        )
                    } else {
                        break
                    }
                }
            }
        case .queen:
            let dx = [-1, -1, 1, 1, -1, 1, 0, 0]
            let dy = [-1, 1, -1, 1, 0, 0, -1, 1]
            for i in 0..<8 {
                while true {
                    let nx = currentLocation.rank + dx[i]
                    let ny = currentLocation.file + dy[i]
                    if nx >= 0 && nx < ChessBoard.rankLength && ny >= 0 && ny < ChessBoard.fileLength {
                        candidates.append(
                            ChessPieceLocation.init(rank: nx, file: ny)
                        )
                    } else {
                        break
                    }
                }
            }
        }
        return candidates
    }
}

enum ChessPieceType {
    case empty
    case pawn
    case bishop
    case knight
    case luke
    case queen
    
    var score: Int {
        switch self {
        case .empty: return 0
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
