min(M, [Head]) :- M is Head.
min(M, [Head|Tail]) :- min(TailMin, Tail), (TailMin > Head -> M is Head ; M is TailMin).

myreverse([], Z, Z).
myreverse([Head|Tail], Z, ListR) :- myreverse(Tail, [Head|Z], ListR).
myreverse(List, ListR) :- myreverse(List, [], ListR).

insert(Elem, [Head | Tail], [Head | NewTail]) :- Elem > Head, insert(Elem, Tail, NewTail).
insert(Elem, [Head | Tail], [Elem, Head | Tail]) :- Elem =< Head.
insert(Elem, [], [Elem]).

insertion_sort([], Temp, Temp).
insertion_sort([Head|Tail], Temp, Sorted) :- insert(Head, Temp, NewTemp), insertion_sort(Tail, NewTemp, Sorted).

mysort(List, Sorted) :- insertion_sort(List, [], Sorted).
