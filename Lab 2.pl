s(A, []) :- valid(A, []), 
			getpal(A, [], B),
			validlist(B, []),
			pal(B, []),

			hasthree(A, [3]),

			count_z(B, X), 
			Q is X *2,
			has_z(A, Q),
			
			count_o(B, Y),
			P is Y *2,
			has_o(A, P),

			count_t(B, R),
			Z is X * Y,
			V is Z + R,
			has_t(A, V).

s(A, []) :- validlist(A, []), 
			pal(A, []).

getpal([3|_],L,L).
getpal([H|T], X, [H|B]) :- getpal(T, X, B).

hasN([], X, 0).
hasN([X|T], X, N):- NewN is N-1, hasN(T, X, NewN).
hasN([H|T], X, N):- hasN(T, X, N).

hasthree([3|_], [3]).
hasthree([H|T], X) :- hasthree(T, X).

count_z([], 0).
count_z([H|T], N):- count_z(T, X), num([H], [0]), N is X+1; count_z(T, N).

count_o([], 0).
count_o([H|T], N):- count_o(T, X), num([H], [1]), N is X+1; count_o(T, N).

count_t([], 0).
count_t([H|T], N):- count_t(T, X), num([H], [2]), N is X+1; count_t(T, N).


has_z([ X | _ ] , 0).
has_z([H|T], N):- num([H], [0]), X is N-1, has_z(T, X) ; has_z(T, N).

has_o([ X | _ ], 0).
has_o([H|T], N):- num([H], [1]), X is N-1, has_o(T, X) ; has_o(T, N).

has_t([ ], 0).
has_t([H|T], N):- num([H], [2]), X is N-1, has_t(T, X) ; has_t(T, N).

valid([3|_], []).
valid([H|T], []):- num([H], []), valid(T, []).

validlist([], []).
validlist([H|T], []):- num_NT([H], []), validlist(T, []).

num([0], []).
num([1], []).
num([2], []).
num([3], []).

num([0], [0]).
num([1], [1]).
num([2], [2]).

num_NT([0], []).
num_NT([1], []).
num_NT([2], []).


pal(A, []):- accRev(A, [], A).

accRev([H|T],A,R) :- accRev(T,[H|A],R).
accRev([],A,A).