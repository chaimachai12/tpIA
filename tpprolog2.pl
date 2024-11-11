% Prolog predicate that is true if X is an element of the list L
element(X, [X|_]).
element(X, [_|T]) :- element(X, T).

% first(E, L) is true if E is the first element of L
first(E, [E|_]).

% Prolog predicate last that finds the last element of a list L
last(E, [E]).
last(E, [_|T]) :- last(E, T).

% A Prolog predicate penultimate that finds the penultimate (second-to-last) element of a list L
penultimate(E, [E, _]).
penultimate(E, [_|T]) :- penultimate(E, T).

% Prolog predicate that removes the Kth element from a list L1 and writes the result into a list L2
del_k(X, [X|T], 1, T).
del_k(X, [H|T], K, [H|R]) :-
    K > 1,
    K1 is K - 1,
    del_k(X, T, K1, R).

% Define the predicate list_length(L, N), which calculates the length N of list L
list_length([], 0).
list_length([_|T], N) :- list_length(T, N1), N is N1 + 1.

% Define the predicate even(L) that is true if L has an even number of elements
even(L) :- list_length(L, N), N mod 2 =:= 0.

% The predicate concat(L1, L2, L3) where L3 is the result of concatenating L1 and L2 (without using append)
concat([], L, L).
concat([H|T], L, [H|R]) :- concat(T, L, R).

% The predicate palindrome(L) that is true if the list L is its own reversed image
palindrome(L) :- reverse(L, L).
reverse([], []).
reverse([H|T], R) :- reverse(T, RevT), concat(RevT, [H], R).
