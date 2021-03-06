module Web.View.Comments.Index where
import Web.View.Prelude

data IndexView = IndexView { comments :: [Comment] }

instance View IndexView where
    html IndexView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item active"><a href={CommentsAction}>Comments</a></li>
            </ol>
        </nav>

        <!-- <h1>Index <a href={pathTo NewCommentAction} class="btn btn-primary ml-4">+ New</a></h1> -->

        <!-- <h1>Index <a href={NewCommentAction ""} class="btn btn-primary ml-4">+ New</a></h1> -->

        <!-- <h1>
            Index
            <a
                href={NewCommentAction "0f671934-0971-402e-ab70-f17e91b56a82"}
                class="btn btn-primary ml-4">
                + New bcd
            </a>
        </h1> -->

        <!-- <a href={NewCommentAction "0f671934-0971-402e-ab70-f17e91b56a82"}>abc</a> -->
        
        <h1>Comments</h1>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>Comment</th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>{forEach comments renderComment}</tbody>
            </table>
        </div>
    |]


renderComment comment = [hsx|
    <tr>
        <td>{comment}</td>
        <td><a href={ShowCommentAction (get #id comment)}>Show</a></td>
        <td><a href={EditCommentAction (get #id comment)} class="text-muted">Edit</a></td>
        <td><a href={DeleteCommentAction (get #id comment)} class="js-delete text-muted">Delete</a></td>
    </tr>
|]
