{-# LANGUAGE OverloadedStrings, DeriveGeneric, ScopedTypeVariables #-}
module Handler.UploadFile where

import Import

data SFileSuccess = SFileSuccess {
    fname :: String
  , usuc  :: Bool
} deriving (Show, Generic)


instance FromJSON SFileSuccess
instance ToJSON   SFileSuccess

fs_true  = SFileSuccess "" True
fs_false = SFileSuccess "" False

postUploadFileR :: Handler Value
postUploadFileR = do
  result <- runInputPost $ iopt fileField "myfile"
  let rval = case result of Just  fileInfo -> fs_true
                            Nothing -> fs_false
  returnJson $ rval
     
