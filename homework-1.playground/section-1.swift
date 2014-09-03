/*
MU 101 Swift learning course

Homework 1 - fibonacci sequence

*/

func fibonacci(n:Int) -> (Int,Int) {
  
  switch n {
    
  case let x where x < 0: // For negative N: F(-n) = (-1)pow(n+1) * (Fn)
    let fn = fibonacci(-n).1
    return (n, n%2==0 ? -fn : fn)
    
  case 0,1:
    return (n,n)
    
  default:
    var prev = 0
    var val = 1
    
    for i in 2...n {
      let tmp = val
      val += prev
      prev = tmp
    }
    return (n, val)
  }
}

let testValue = 10
println("fibonacci(\(testValue))=\(fibonacci(testValue))")

//let testValue2 = -10 //Works as well
//println("fibonacci(\(testValue2))=\(fibonacci(testValue2))")

//let testValue3 = 42 //Works as well
//println("fibonacci(\(testValue3))=\(fibonacci(testValue3))")
