var a, b = 1
var sum = 0

while(a < 4000000){
  if(a % 2 == 0)
    sum += a
  val temp = a
  a = b
  b += temp
}

println(sum)
