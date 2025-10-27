{-# LANGUAGE DeriveGeneric #-}
module Domain.ReservationDomain where

import Data.Map.Strict (Map)
import Data.Time.Calendar (Day)
import GHC.Generics (Generic)
import Numeric.Natural (Natural)

-- | a data type representing a reservation
data Reservation = Reservation
  { date     :: Day
  , name     :: String
  , email    :: String
  , quantity :: Natural
  }
  deriving (Eq, Generic, Read, Show)

reservation :: Reservation
reservation = Reservation{name = "Mr. Miller", quantity = 2, date = read "2020-06-01", email = "manfred@miller.com"}

-- | a key value map holding a list of reservations for any given day
type ReservationMap = Map Day [Reservation]

-- | computes the number of reserved seats for a list of reservations
usedCapacity :: [Reservation] -> Natural
usedCapacity = sum . map quantity

-- | computes the number of available seats from a maximum capacity and a list of reservations.
availableSeats :: Natural -> [Reservation] -> Natural
availableSeats maxCapacity reservations = maxCapacity - usedCapacity reservations
