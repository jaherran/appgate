from flask import Flask

def flask_app(testing: bool = True): 
    app = Flask(__name__)

    @app.route("/")
    def index():
        return f"Hello, Flask!<br>Testing: {testing}"
    return app