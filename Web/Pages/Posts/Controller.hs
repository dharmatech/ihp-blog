-- {-# LANGUAGE NoMonomorphismRestriction #-}
module Web.Pages.Posts.Controller where

import Web.Controller.Prelude

-- import Web.Pages.Posts.New.View
import Web.Pages.Posts.Edit
import Web.Pages.Posts.Show

import Web.Pages.Posts.Index.Actions
import Web.Pages.Posts.New.Actions

import qualified Text.MMark as MMark

instance Controller PostsController where

    action PostsAction = actionPostsAction 

    action NewPostAction = actionNewPostAction

    action ShowPostAction { postId } = do
        post <- fetch postId
            >>= pure . modify #comments (orderByDesc #createdAt)
            >>= fetchRelated #comments 
        render ShowView { .. }

    action EditPostAction { postId } = do
        post <- fetch postId
        render EditView { .. }

    action UpdatePostAction { postId } = do
        post <- fetch postId
        post
            |> buildPost
            |> ifValid \case
                Left post -> render EditView { .. }
                Right post -> do
                    post <- post |> updateRecord
                    setSuccessMessage "Post updated"
                    redirectTo EditPostAction { .. }

    action CreatePostAction = actionCreatePostAction

    action DeletePostAction { postId } = do
        post <- fetch postId
        deleteRecord post
        setSuccessMessage "Post deleted"
        redirectTo PostsAction

-- buildPost post = post
--     |> fill @["title","body"]
--     |> validateField #title nonEmpty
--     |> validateField #body nonEmpty
--     |> validateField #body isMarkdown

-- isMarkdown :: Text -> ValidatorResult
-- isMarkdown text =
--     case MMark.parse "" text of
--         Left _ -> Failure "Please provide valid Markdown"
--         Right _ -> Success