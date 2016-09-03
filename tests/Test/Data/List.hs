module Test.Data.List
    ( generateListOfElement
    , generateListOfElementMaxN
    , RandomList(..)
    ) where

import Test.Tasty.QuickCheck
import Control.Monad

-- | convenient function to replicate thegiven Generator of `e` a randomly
-- choosen amount of time.
generateListOfElement :: Gen e -> Gen [e]
generateListOfElement = generateListOfElementMaxN 100

-- | convenient function to generate up to a certain amount of time the given
-- generator.
generateListOfElementMaxN :: Int -> Gen e -> Gen [e]
generateListOfElementMaxN n e = choose (0,n) >>= flip replicateM e

data RandomList = RandomList [Int]
    deriving (Show,Eq)

instance Arbitrary RandomList where
    arbitrary = RandomList <$> (choose (100,400) >>= flip replicateM (choose (0,8)))
