female(erin).
female(grace).
female(sue).
female(kara).
female(kristin).
female(genevieve).
female(clarice).

male(edwin).
male(jesse).
male(robert).
male(erik).
male(agapius).

parent(agapuis,sue).
parent(genevieve,sue).

parent(clarice,robert).

parent(robert,erin).
parent(robert,erik).
parent(robert,kara).
parent(robert,kristin).

parent(sue,erin).
parent(sue,erik).
parent(sue,kara).
parent(sue,kristin).

parent(erin,grace).
parent(erin,edwin).
parent(erin,jesse).

descend(X,Y)  :-  parent(Y,X). 
descend(X,Y)  :-  parent(Y,Z), descend(X,Z).

ancestor(A,D,[A]) :- parent(A,D).
ancestor(A,D,[X|Z]) :-
        parent(X,D),
        ancestor(A,X,Z).

