%add2(0,X,Y) :- eval(X,Y). 
%add2(X+A,Y,Z) :- add2(X,A,R), add2(R,Y,Z). 
%add2(s(X),Y,s(Z)) :- add2(X,Y,Z). 
 
%eval(0,0). 
%eval(s(X),s(Y)) :- eval(X,Y). 
%eval(X+A,Y) :- add2(X,A,Y). 

%add2(0,X,Y) :- eval(X,Y). 
%add2(s(X), Y, s(Z)) :- add2(X, Y, Z).
%add2(A+B, X, Y) :- add2(A, B, C), add2(C, X, Y).

%eval(0,0).
%eval(s(X), p(X)) :- eval(X, Y).

%add(0,X,X). 
%add(s(X),Y,s(Z)) :- add(X,Y,Z). 
%time(X,Y,Z) :- ti(X,Y,0,Z). 
%ti(0,_,Z,Z). 
%ti(s(X),Y,ACC,Z) :- add(Y, ACC, NAC), ti(X,Y,NAC,Z). 

add(0, X, X).
add(s(X), Y, s(Z)) :- add(X, Y, Z).

odd(s(0)).
odd(s(s(X))) :- odd(X).


s2010_2(N, M, NM, A, B) :- NM is N * M, gen_2010(N, a, A, X), gen_2010(M, b, X, Y), gen_2010(NM, c, Y, B).
gen_2010_2(0, _, A, A).
gen_2010_2(N, Char, [Char|A], B) :- NewN is N-1, gen_2010_2(NewN, Char, A, [Char|B]).