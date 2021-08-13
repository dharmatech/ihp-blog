{-# LANGUAGE NoMonomorphismRestriction #-}
module Web.Pages.Posts.Show.Actions where

import Web.Controller.Prelude
import Web.Pages.Posts.Show.View

actionShowPostAction postId = do
    post <- fetch postId
        >>= pure . modify #comments (orderByDesc #createdAt)
        >>= fetchRelated #comments 
    render ShowView { .. }
