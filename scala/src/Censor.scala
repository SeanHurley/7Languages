import scala.io.Source

trait Censor {
  val filter = loadFilter

  def censor(string : String) : String = {
    filter.foldLeft(string) ((total, next) => {
      total.replaceAll("(?i)" + next._1, next._2)
    })
  }

  private def loadFilter : Map[String, String] = {
    var words = Map[String,String]()
    for(line <- Source.fromFile("words.txt").getLines) {
      val split = line.split(',')
      words = words + (split(0) -> split(1))
    }
    words
  }
}
