-module(main).
-export([main/0]).

main() ->
    ANSWER = calc(1, 1, 0),
    io:format("~p~n", [ANSWER]).

calc(A, B, SUM) ->
    if A >= 4000000 -> SUM;
       A rem 2 == 0 -> calc(B, A+B, SUM+A);
       true         -> calc(B, A+B, SUM)
    end.
