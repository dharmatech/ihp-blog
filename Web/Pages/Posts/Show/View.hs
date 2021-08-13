module Web.Pages.Posts.Show.View where
import Web.View.Prelude

import qualified Text.MMark as MMark

-- data ShowView = ShowView { post :: Post }

data ShowView = ShowView { post :: Include "comments" Post }

instance View ShowView where
    html ShowView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={PostsAction}>Posts</a></li>
                <li class="breadcrumb-item active">Show Post</li>
            </ol>
        </nav>
        <h1> {get #title post}</h1>
        <p>{get #createdAt post |> dateTime} - {get #createdAt post |> timeAgo}</p>
        <div>{get #body post |> renderMarkdown}</div>

        <!-- <a href={NewCommentAction (get #id post)}>Add Comment</a> -->

        <a href={get #id post |> NewCommentAction}>Add Comment</a>

        <!-- <div>{get #comments post}</div> -->

        <div>{forEach (get #comments post) renderComment}</div>
    |]

renderMarkdown text =
    case text |> MMark.parse "" of
        Left error -> "Something went wrong"
        Right markdown -> MMark.render markdown |> tshow |> preEscapedToHtml

renderComment comment = [hsx|

        <div class="mt-4">
            <h5>{get #author comment}</h5>
            <p>{get #body comment}</p>
        </div>

    |]