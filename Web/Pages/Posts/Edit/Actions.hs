{-# LANGUAGE NoMonomorphismRestriction #-}
module Web.Pages.Posts.Edit.Actions where

import Web.Controller.Prelude
import Web.Pages.Posts.New.Actions
import Web.Pages.Posts.Edit.View

actionEditPostAction postId = do
    post <- fetch postId
    render EditView { .. }

actionUpdatePostAction postId = do
    post <- fetch postId
    post
        |> buildPost
        |> ifValid \case
            Left post -> render EditView { .. }
            Right post -> do
                post <- post |> updateRecord
                setSuccessMessage "Post updated"
                redirectTo EditPostAction { .. }