module DomainSpec where

import Data.Time.Calendar (fromGregorian, Day)
import Numeric.Natural (Natural)
import Test.Hspec (describe, it, shouldBe, Spec)

import Domain.ReservationDomain

day :: Day
day = fromGregorian 2020 1 29

res1, res2 :: Reservation
res1 = Reservation day "Andrew M. Jones" "amjones@example.com" 4
res2 = Reservation day "Thomas Miller" "tm@example.com" 3

reservations :: [Reservation]
reservations = [res1, res2]

totalCapacity :: Natural
totalCapacity = 20

spec :: Spec
spec =
  describe "Domain Logic" $ do
    it "computes the used capacity for an empty list of reservations" $
      usedCapacity [] `shouldBe` 0

    it "computes the used capacity for a list of reservations" $
      usedCapacity [res1, res2] `shouldBe` 7
      
    it "computes the available seats for a list of reservations" $
      availableSeats totalCapacity [res1, res2] `shouldBe` 13