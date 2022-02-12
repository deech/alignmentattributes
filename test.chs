module Main where
#include "sodiumalignment.h"

import Foreign.C.Types(CInt)
import Test.HUnit

main :: IO ()
main = runTestTTAndExit $
  TestList [ TestLabel "test sodium" (TestCase testSodiumAlignment)
           ]

testSodiumAlignment :: Assertion
testSodiumAlignment = do
  fromc <- (,) <$> {#call sizeof_state#} <*> {#call alignof_state#}
  let fromc2hs :: (CInt,CInt)
      fromc2hs = ({#sizeof state#},{#alignof state#})
  assertEqual "C and C2HS should match" fromc2hs fromc
