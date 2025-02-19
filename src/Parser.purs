module Parser (parseProgram, Lingua(..), AST(..)) where

import Prelude
import Effect
import Effect.Console (log)
import Effect.Ref
import Data.Identity
import Data.DateTime
import Data.List (List(..),(:), fromFoldable)
import Data.Either

import Parsing (Position(..),ParseError(..), ParserT(..),runParser)
import Parsing.String
import Parsing.String.Basic
import Parsing.Combinators
import Parsing.Combinators.Array (many)
import Parsing.Language (haskellStyle)
import Parsing.Token (makeTokenParser)


type P = ParserT String Identity

parseProgram :: DateTime -> String -> Either String AST
parseProgram eval x = do
    let pr = parseAST x
    case pr of
        Left error -> Left $ showParseError error
        Right ast -> Right ast 
-- if parses: get the eTime and AST to the foreign: (when: 1sec after eval, s: name, n: 1 or 0)

showParseError :: ParseError -> String
showParseError (ParseError e (Position p)) = show p.line <> ":" <> show p.column <> " " <> e

parseAST :: String -> Either ParseError AST
parseAST x = runParser x parseExpressions

parseExpressions:: P AST
parseExpressions = do
  _ <- pure 1
  xs <- many expression
  eof
  pure $ fromFoldable xs

expression:: P String
expression = do
    _ <- pure 1
    whitespace
    tx <- parens identifier
    pure $ tx


---- AST

type Lingua = {
  ast :: Ref AST,
  eval :: Ref DateTime
  }

type AST = List String

-- type Expression = String


tokenParser = makeTokenParser haskellStyle
parens      = tokenParser.parens
braces      = tokenParser.braces
identifier  = tokenParser.identifier
reserved    = tokenParser.reserved
naturalOrFloat = tokenParser.naturalOrFloat
natural = tokenParser.natural
float = tokenParser.float
whitespace = tokenParser.whiteSpace
colon = tokenParser.colon
brackets = tokenParser.brackets
comma = tokenParser.comma
semi = tokenParser.semi
integer = tokenParser.integer
stringLiteral = tokenParser.stringLiteral
reservedOp = tokenParser.reservedOp