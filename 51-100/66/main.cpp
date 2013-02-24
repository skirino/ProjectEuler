#include <iostream>
#include <cmath>


// largest x for D<=156: D=109, x=25910770249


typedef long long i64;

bool is_square(i64 x){
  i64 a = (i64)(sqrt((double)1.0*x) + 0.001);
  return (a*a == x);
}

int main()
{
  i64 largest_x = 0;
  int optimal_d = 0;
  
  for(int d=2; d<=1000; ++d){
    if(is_square(d)){
      continue;
    }
    
    i64 x = (i64) sqrt(1.0*(d+1) - 0.001);
    for(;;++x){
      i64 x2_1 = x*x - 1;
      if(x2_1 % d == 0){
        i64 y2 = x2_1 / d;
        if(is_square(y2)){
          if(largest_x < x){
            largest_x = x;
            optimal_d = d;
          }
          std::cout << "found --- " << x << ", " << d << std::endl;
          break;
        }
      }
    }
  }
  
  std::cout << "optimal D=" << optimal_d << std::endl;
  return 0;
}
