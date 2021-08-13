-- {-# LANGUAGE NoMonomorphismRestriction #-}
module Web.Pages.Posts.Controller where

import Web.Controller.Prelude

import Web.Pages.Posts.Index.Actions
import Web.Pages.Posts.New.Actions
import Web.Pages.Posts.Show.Actions
import Web.Pages.Posts.Edit.Actions
import Web.Pages.Posts.Delete.Actions

import qualified Text.MMark as MMark

instance Controller PostsController where

    action PostsAction = actionPostsAction 

    action NewPostAction = actionNewPostAction

    action ShowPostAction { postId } = actionShowPostAction postId

    action EditPostAction { postId } = actionEditPostAction postId

    action UpdatePostAction { postId } = actionUpdatePostAction postId

    action CreatePostAction = actionCreatePostAction

    action DeletePostAction { postId } = actionDeletePostAction postId