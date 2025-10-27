module Main (main) where

import Test.Hspec (hspec)

import DomainSpec (spec)

main :: IO ()
main = hspec $ do
  DomainSpec.spec
  