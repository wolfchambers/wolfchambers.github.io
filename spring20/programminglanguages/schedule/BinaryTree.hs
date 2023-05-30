data Tree a = EmptyTree 
	| Node a (Tree a) (Tree a) 
		deriving (Show,Read,Eq) 

-- add functor declaration here

singleton :: a -> Tree a
singleton x = Node x EmptyTree EmptyTree

findInTree :: (Ord a) => a -> Tree a -> Bool
findInTree x EmptyTree = False
findInTree x (Node y left right)
	| x == y = True
	| x < y = findInTree x left
	| x > y = findInTree x right

-- put treeInsert here
treeInsert :: (Ord a) => a -> Tree a -> Tree a
-- base case: tree was empty, so only a root now
treeInsert x EmptyTree = singleton x
-- inductive case: we have a root already
treeInsert x (Node y left right) 
	| x <= y = Node y (treeInsert x left) right
	| x > y = Node y left (treeInsert x right)

