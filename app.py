from flask import Flask, request

app = Flask("books")


@app.route("/books", methods=["GET", "POST"])
def books():
    if request.method == "GET":
        return get_books()
    elif request.method == "POST":
        title, author, genre = get_book_args(request.args)
        return post_book(title, author, genre)


@app.route("/books/<int:book_id>", methods=["GET", "PUT", "DELETE"])
def book(book_id):
    if request.method == "GET":
        return get_book(book_id)
    elif request.method == "PUT":
        title, author, genre = get_book_args(request.args)
        return update_book(book_id, title, author, genre)
    elif request.method == "DELETE":
        return delete_book(book_id)


def get_book_args(args):
    title = args.get("title", "")
    author = args.get("author", "")
    genre = args.get("genre", "")
    return title, author, genre


def get_book(book_id):
    return f"Get book wit id: {book_id}"


def update_book(book_id, title, author, genre):
    return f"Updated book with id: {book_id}, title: {title}, author: {author}, genre: {genre}"


def delete_book(book_id):
    return f"Deleted id: {book_id}"


def get_books():
    return f"Get books"


def post_book(title, author, genre):
    return f"New book with title: {title}, author: {author}, genre: {genre}"


if __name__ == '__main__':
    app.run(port=8080, debug=True)
