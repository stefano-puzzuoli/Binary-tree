% Binary Tree 

% Facts for testing

bTree(t(14, t(9, t(6, nil, nil), t(11, nil, nil)), t(18, t(16, nil, nil), nil))). 
bTree2(t(4,t(2,t(2,nil,nil),nil),nil)).

emptyBT(nil).  % fact to represent the empty binary tree

/* If using queries involving above facts, it is best that queries have the
following format: name_of_tree(T), name_of_predicate(T, …). 
*/

% New predicates

% Insert

insert(X, nil, t(X, nil, nil)).          % Base case: add item when tree is empty 

insert(X, t(Y, L, R), t(Y, L1, R)) :-    % If tree not empty
	X =< Y,                              % and item being inserted is less than or equal to the item of root being checked
	!,
	insert(X, L, L1).                    % call insert on left subtree of node

insert(X, t(Y, L, R), t(Y, L, R1)) :-    % Else call insert on right subtree of node
	insert(X, R, R1). 


% Preorder

preorder(nil, []).                       % Base case: if tree is empty, output is empty list

preorder(t(X,L,R), LI) :-                % Else
	preorder(L,LL),                      % process left subtree
	preorder(R, LR),                     % process right subtree 
	append([X|LL], LR, LI).	             % use append to get correct order of items with root item first, then left subtree and then right subtree
	
	
% Inorder

inorder(nil, []).                        % Base case: if tree is empty, output is empty list

inorder(t(X,L,R), LI) :-                 % Else
	inorder(L,LL),                       % process left subtree
	inorder(R, LR),                      % process right subtree
	append(LL, [X|LR],LI).	             % use append to get correct order of items with left subtree first, then root item and then right subtree
	  

% Postorder

postorder(nil, []).                      % Base case: if tree is empty, output is empty list

postorder(t(X,L,R), LI):-                % Else
	postorder(L,LL),                     % process left subtree
	postorder(R, LR),                    % process right subtree
	append(LL, LR,R1),	                 % use two appends to get correct order of items with left subtree first, then right subtree and then root item
	append(R1, [X], LI). 
	

% Search

search(t(X, _, _), X) :- !.              % Base case: if root item is equal to item being searched for, output is True

search(t(Y, L, _), X) :-                 % Else
	X < Y,                               % if root item greater than item we are searching for then
	!,
	search(L, X).                        % search left subtree
	
search(t(_, _, R), X) :-                 % else
	search(R, X).                        % search right subtree
	

% max is a predicate which finds the maximum given two numbers

max(X, Y, X):- X > Y, !.
 
max(_, Y, Y). 


% Height

height(nil, 0).               % Base case: if tree is empty, the height is 0
 
height(t(_, L, R), H) :-      % Else
	height(L, H1),            % get height of left subtree
	height(R, H2),            % get height of right subtree
	max(H1, H2, H3),          % get maximum of the two heights
	H is H3 + 1. 		      % increment the maximum by 1
