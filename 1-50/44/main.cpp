#include <iostream>
#include <cmath>

long long p_num(long long i){
  return (i*(3*i-1))/2;
}

bool check_if_p(long long x){
  const double root = (1 + pow((1.0+24*x), 0.5))/6;
  return p_num((long long) root) == x ||
    p_num((long long) (root+1)) == x;
}

int main()
{
  int i = 1;
  for(;;++i){
    const long long pntarget = p_num(i);
    int ismall = 1;
    int ilarge = i+1;
    
    std::cout << "calculating ... " << i << ' ' << pntarget << std::endl;
    
    for(;;){
      const long long pnlarge = p_num(ilarge);
      const long long pnsmall = p_num(ismall);
      const long long diff = pnlarge - pnsmall;
      
      if(diff == pntarget){
        if(check_if_p(pnlarge + pnsmall)){
          std::cout << "answer is " << diff << std::endl;
          return 0;
        }
        else{
          ismall++;
          ilarge++;
        }
      }
      else if(diff < pntarget){
        ilarge++;
      }
      else{
        ismall++;
      }
      
      if(ismall == ilarge){
        break;
      }
    }
  }
  
  return 0;
}
