module Main where

import Prelude

import Effect (Effect)
import Effect.Console (log)
import Effect.Ref
import Effect.Now
import Data.Identity
import Data.List (List(..),(:), fromFoldable)
import Data.Either
import Data.Maybe

import Parser

-- launch :: Effect TimekNot
-- launch = do
--   log "timekNot: launch"
--   ast <- new $ L.fromFoldable [TimeExpression  M.empty]
--   tempo <- newTempo (1 % 1) >>= new 
--   eval <- nowDateTime >>= new
--   vantageMap <- new $ (M.empty)
--   pure { ast, tempo, eval, vantageMap}  

launch :: Effect Lingua
launch = do
  log "lingua: launch"
  ast <- new $ fromFoldable []
  -- tempo <- newTempo (1 % 1) >>= new 
  eval <- nowDateTime >>= new
  pure {ast, eval} 

define:: Lingua -> Int -> Number -> String -> Effect { success :: Boolean, error :: String }
define li zone eval x = do
  y <- define' li zone eval x
  case y of
    Just error -> pure $ { success: false, error }
    Nothing -> pure $ { success: true, error: "" }

define':: Lingua -> Int -> Number -> String -> Effect (Maybe String)
define' li z evalFromEstuary x = do
  eval <- nowDateTime
  let x' = parseProgram eval x
  case x' of
    Left err -> pure $ Just err
    Right pr -> do
      write eval li.eval
      write pr li.ast
      pure Nothing
    

-- render:: 