import Foundation

final class ChessBoard {
    
    var chessBoard: [[ChessPiece]] = []
    
    init() {
        self.initializeBoard()
    }
    
    func initializeBoard() {
//        초기화할 때 1,2-rank는 흑백 체스말이, 7,8-rank는 백색 체스말이 위치한다.
//
//        체스말 초기 위치가 아니면 생성하지 않는다.
//
//        이미 해당 위치에 다른 말이 있으면 생성하지 않는다.
//
//        체스말 종류별로 최대 개수보다 많이 생성할 수는 없다.
//
//        Pawn는 색상별로 8개. Bishop, Luke는 색상별로 2개, Queen는 색상별로 1개만 가능하다.
    }
    
    func currentScore() -> (Int, Int) {
        // TODO: 현재 있는 말을 확인해서 흑과 백의 점수를 리턴
        return (0,0)
    }
    
    func display() -> [[String]] {
        return self.chessBoard.compactMap { rank in
            rank.map { $0.chessPieceString }
        }
    }
    
    func moveChessPiece(from: String, to: String) -> Bool {
        // TODO: 특정 말을 옮기는 메서드는 Borad에서 제공한다.
//        같은 색상의 말이 to 위치에 다른 말이 이미 있으면 옮길 수 없다.
//
//        말을 옮길 수 있으면 true, 옮길 수 없으면 false를 리턴한다.
//
//        만약, 다른 색상의 말이 to 위치에 있는 경우는 기존에 있던 말을 제거하고 이동한다.
        return true
    }
    
    func moveablePositionCandidates(at: ChessPieceLocation) -> [String] {
        // TODO: 체스말은 현재 위치를 기준으로 이동할 수 있는 모든 위치를 제공한다. (다른 말이 있는지 여부는 판단하지 않는다.)
        return []
    }
    
    private func validateChessLocationString(string: String) -> Bool {
        //TODO: 체스말은 위치 값은 가로 file은 A부터 H까지, 세로 rank는 1부터 8까지 입력이 가능하다.
        return true
    }
    
    private func canMoveTo(location: ,)
}
