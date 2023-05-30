data SplayTree a = EmptyTree 
  | Node a (SplayTree a) (SplayTree a)
  deriving (Show)

-- Use in-order travels to put the tree data into a list
flatten :: SplayTree a -> [a]
flatten EmptyTree = []
flatten (Node rootValue leftSubtree rightSubtree) = (flatten leftSubtree) ++ [rootValue] ++ (flatten rightSubtree)

-- Calculate the number of elements of a tree
size :: SplayTree a -> Int
size EmptyTree = 0
size (Node rootValue leftSubtree rightSubtree) = 1 + (size leftSubtree) + (size rightSubtree)

-- Calculate the height of a tree
height :: SplayTree a -> Int
height EmptyTree = 0
height (Node rootValue leftSubtree rightSubtree) = 1 + (max (height leftSubtree) (height rightSubtree))
  
-- Return the depth of a value without splaying, requires the value to be present
depth :: (Ord a) => a -> SplayTree a -> Int
depth value EmptyTree = error "Cannot find depth of an element not in the tree"
depth value (Node rootValue leftSubtree rightSubtree) 
    | value < rootValue = 1 + (depth value leftSubtree)
    | value == rootValue = 0
    | value > rootValue = 1 + (depth value rightSubtree)
  
-- Insert an element into the tree if it is not present and move that element to the root.
-- The process guarentees not other elemet's depth is changed by more than one.
insert :: (Ord a) => a -> SplayTree a -> SplayTree a
insert value EmptyTree = Node value EmptyTree EmptyTree
insert value (Node rootValue leftSubtree rightSubtree)
    | value < rootValue =
        let insertResult = insert value leftSubtree
        in case insertResult of EmptyTree -> error "EmptyTree cannot be result of insert"
                                Node resultRootValue resultLeftSubtree resultRightSubtree ->
                                    Node value resultLeftSubtree (Node rootValue resultRightSubtree rightSubtree)
    | value == rootValue = Node rootValue leftSubtree rightSubtree
    | value > rootValue =
        let insertResult = insert value rightSubtree
        in case insertResult of EmptyTree -> error "EmptyTree cannot be result of insert"
                                Node resultRootValue resultLeftSubtree resultRightSubtree ->
                                    Node value (Node rootValue leftSubtree resultLeftSubtree) resultRightSubtree

-- Determine is an element occurs in the tree.  If so move that element to the root.
-- The process guarentees not other elemet's depth is changed by more than one.
-- occurs :: (Ord a) => a -> SplayTree a -> (Bool, SplayTree a)
