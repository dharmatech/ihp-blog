{-# LANGUAGE NoMonomorphismRestriction #-}
module Web.Pages.Posts.Delete.Actions where

import Web.Controller.Prelude
import Web.Pages.Posts.Index.View

actionDeletePostAction postId = do
    post <- fetch postId
    deleteRecord post
    setSuccessMessage "Post deleted"
    redirectTo PostsAction