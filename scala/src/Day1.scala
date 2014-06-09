import scala.util.control.Breaks._

object Day1 {
  def main(args: Array[String]) {
    val game = List("x","o","x",
                    "o","x","o",
                    "o","o","o")
    println(TicTacToe.getWinner(game))
  }
}

object TicTacToe {
  val winningMoves = List(
    (0,1,2),
    (0,3,6),
    (0,4,8),
    (1,4,7),
    (2,4,6),
    (2,5,8),
    (3,4,6),
    (6,7,8)
  )

  def getWinner(game: List[String]) : String = {
    winningMoves.foreach( move => {
      if(game(move._1) == game(move._2) && game(move._2) == game(move._3)) {
        return game(move._1)
      }
    })
    breakable {
      for(i <- 0 until 9) {
        if (game(i) == "" || game(i) == null) {
          break
        } else if(i == 8) {
          return "Cat!"
        }
      }
    }

    return "No winner yet"
  }
}
