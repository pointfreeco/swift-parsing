import Parsing

enum Expr: Equatable {
  case int(Int)
  indirect case add(Expr, Expr)
  indirect case mul(Expr, Expr)
  case identifier(String)
  indirect case bind(String, to: Expr, then: Expr)
}



/*
 1
 2 + 3
 4 * 5
 x
 let x = 1




 */
