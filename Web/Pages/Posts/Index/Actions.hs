{-# LANGUAGE NoMonomorphismRestriction #-}
module Web.Pages.Posts.Index.Actions where

import Web.Controller.Prelude
import Web.Pages.Posts.Index.View

actionPostsAction = do
    posts <- query @Post
        |> orderByDesc #createdAt
        |> fetch
    render IndexView { .. }