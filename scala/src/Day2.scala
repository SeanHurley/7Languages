object Day2 {
  def main(args: Array[String]) {
    println(totalSize(List("Hey", "What's", "Up")))
    println(totalSize(List()))

    val message1 = new Message("darn Stuff darN and things shoot")

    println(message1)
  }

  private def totalSize(strings : List[String]) : Int = {
    strings.foldLeft(0)( (total,string) => {
      total + string.size
    })
  }

  class Message(message : String) extends Censor {
    override  def toString : String = {
      censor(message)
    }
  }
}
