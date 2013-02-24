module main;

import std.stdio;
import std.range;

void main()
{
  int sum = 0;
  for(int i = 1; i < 1000; ++i){
    if(i % 3 == 0 || i % 5 == 0){
      sum += i;
    }
  }
  std.stdio.writeln(sum);
}
