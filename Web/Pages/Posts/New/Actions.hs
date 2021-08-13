{-# LANGUAGE NoMonomorphismRestriction #-}
module Web.Pages.Posts.New.Actions where

import Web.Controller.Prelude
import Web.Pages.Posts.New.View

import qualified Text.MMark as MMark

actionNewPostAction = do
    let post = newRecord
    render NewView { .. }

actionCreatePostAction = do
    let post = newRecord @Post
    post
        |> buildPost
        |> ifValid \case
            Left post -> render NewView { .. } 
            Right post -> do
                post <- post |> createRecord
                setSuccessMessage "Post created"
                redirectTo PostsAction

isMarkdown :: Text -> ValidatorResult
isMarkdown text =
    case MMark.parse "" text of
        Left _ -> Failure "Please provide valid Markdown"
        Right _ -> Success

buildPost post = post
    |> fill @["title","body"]
    |> validateField #title nonEmpty
    |> validateField #body nonEmpty
    |> validateField #body isMarkdown                