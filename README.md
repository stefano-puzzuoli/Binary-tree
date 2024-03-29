Binary Tree design

Syntax: btname(nil).
This predicate fact represents the empty binary tree.

Syntax: btname(N, T1, T2).
This predicate fact is true if N is the root of a binary tree with left subtree T1 and right subtree T2, where all the items in T1 are less than or equal to N and all the items in T2 are greater than N.

The design which I have chosen to implement the binary tree in Prolog is based on a recursive structure that takes three arguments: the item of the root, the left subtree, and the right subtree, where all the items in the left subtree are less than or equal to the item of the root and all the items in the right subtree are greater than the root item. It is mandatory that all the three arguments are structures of the same type, meaning that they all must be binary trees. It is also important to understand that the empty binary tree is represented as the constant “nil”, which is the general approach used for this data structure in Prolog.
Example 1: The binary tree below can be declared in Prolog with the following predicate fact:
bTree(t(14, t(9, t(6, nil, nil), t(11, nil, nil)), t(18, t(16, nil, nil), nil))).  
It is also of great importance to know that when making queries for the newly written predicates, if the user desires to use an already declared predicate fact such as the example above, it is best if the queries used in Prolog have the following format:
name_of_tree(T), name_of_predicate(T, …).
This style of query allows the user to initiate the variable in the query and then use it as an argument of the following predicate.

Inserting an item

Syntax: insert(I, T1, T2).
This predicate is true if T2 is the binary tree resulting from I being inserted into the binary tree T1.

When adding a new item to a binary tree, this item will always be inserted as a leaf node in that tree. This concept makes it clear that, before executing the actual insert operation, the correct position of the new item must be found, and it must be a nil (empty binary tree). When searching for the suitable position of the item, if the item is less than or equal to the item of the root it is being compared to, the search will continue in the left subtree (which will contain nodes with items of equal or inferior value), while if the opposite occurs, the search will continue in the right subtree (which will contain nodes with items of greater value). When a nil is reached during the search process, the new node with the item that is being inserted is created.


Preorder traversal

Syntax: preorder(T, L).
This predicate is true if L is a list of nodes generated by a preorder traversal of the binary tree T.

A tree traversal of a binary tree is a form of graph traversal which refers to the process of visiting each node in the tree exactly once. The order in which these nodes are visited defines each traversal method uniquely. 
The preorder traversal processes the root node first, then the left subtree, and finally the right subtree.  When observing the implementation of this predicate, it is visible that the recursive call for the left subtree and right subtree occurs before processing the root node, but this is not a problem or an error as the correct order of the nodes is preserved when creating the output list, when calling the append predicate. This will allow the root node item to appear first in the list, then the items in the left subtree and then finally, the items in the right subtree.


Inorder traversal

Syntax: inorder(T, L).
This predicate is true if L is a list of nodes generated by an inorder traversal of the binary tree T.

The inorder traversal processes the left subtree first, then the root node and finally the right subtree.  When observing the implementation of this predicate, it is visible that the recursive call for the right subtree occurs before processing the root node, but as said for the preorder predicate, the correct order of the nodes is preserved when creating the output list, when calling the append predicate. In the case of the inorder traversal, this will allow the items in the left subtree to appear first in the list, then the root node item and then finally, the items in the right subtree.


Postorder traversal

Syntax: postorder(T, L).
This predicate is true if L is a list of nodes generated by a postorder traversal of the binary tree T.

The postorder traversal processes the left subtree first, then the right subtree and finally the root node.  In this case, unlike what was said for the previous two explained predicates, the nodes are processed in the order that the postorder traversal actually outputs them. When observing the implementation of this predicate, it is visible that the recursive call for the left subtree occurs first, then the call for the right subtree, and only once these are complete, the predicate uses two append predicates, the first one for the left and right subtree, and the second one for the root node item, creating the new desired list, just as required.


Searching for an item

Syntax: search(T, I).
This predicate is true if I is contained in the binary tree T.

Due to the ordering of the items in the binary tree, searching for a given item can be very efficient. The simplest case occurs when the item that is being searched for is equal to the item that it is being compared to and this is the base case of the search predicate. When this is not the situation, if the item is less than the item of the node that is being checked, the search continues in the left subtree, while if the item is greater than the item of that node, then the search continues in the right subtree. This process continues until the actual item is found (resulting in a successful query) or until a nil is reached (resulting in an unsuccessful query). This last case does not seem to appear in the specified predicate, but this is not necessary as it is dealt with implicitly, because, by not covering the case when a nil is reached, the query will fail when it encounters such a situation.


Height of a binary tree

Syntax: height(T, H).
This predicate is true if H is the height of the binary tree T. 

To calculate the height of a binary tree it is key to consider that the height of an empty tree (that is represented with nil) is 0 and that the height of a node that is not nil is the maximum between the height of its left subtree and the height of its right subtree, plus one which is the actual node that is being considered.
As a result, to define the height predicate, it is necessary to also define a max predicate which computes the maximum between two numbers, which in this case will be used for the heights of the left and right subtree. Once this maximum calculating predicate has been defined, the height predicate will have the base case that results in 0 when the tree is empty and it will have a second case resulting in the maximum height of the left and right subtrees when the tree is not empty, and this will be achieved through a counter variable and the max predicate predefined above.
