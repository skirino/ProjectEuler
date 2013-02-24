-module(main).
-export([main/0]).

main() ->
    L   = [X || X <- lists:seq(1, 999), (X rem 3 == 0) or (X rem 5 == 0)],
    SUM = lists:foldl(fun (A, B) -> A + B end, 0, L),
    io:format("~p~n", [SUM]).
