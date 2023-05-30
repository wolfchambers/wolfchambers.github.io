data Tree a = EmptyTree
    |Node a (Tree a) (Tree a)
		deriving (Show,Read,Eq)

instance Functor Tree where
	fmap f EmptyTree = EmptyTree
	fmap f (Node x leftsub rightsub) = Node (f x) (fmap f leftsub) (fmap f rightsub)

insertTree :: (Ord a) => a -> Tree a -> Tree a
insertTree x EmptyTree = (Node x EmptyTree EmptyTree)
insertTree x (Node y left right) 
    | x == y = (Node x left right)
    | x < y = Node y (insertTree x left) right
    | x > y = Node y left (insertTree x right)

findInTree :: (Ord a) => a -> Tree a -> Bool  
findInTree x EmptyTree = False  
findInTree x (Node y left right)  
    | x == y = True  
    | x < y  = findInTree x left  
    | x > y  = findInTree x right
