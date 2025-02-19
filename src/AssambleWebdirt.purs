module AssambleWebdirt (objectWithWhenSN) where

import Prelude
import Effect (Effect)
import Foreign

-- foreign
foreign import objectWithWhenSN :: Number -> String -> Int -> Effect Foreign
-- export objectWithWhenSN = when => s => n => () => { return { when: when, s: s, n: n }; }
