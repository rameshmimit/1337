import sys
import os
from flask import Flask
sys.path.insert(0, os.path.abspath('../'))

from burn.flask.blueprints import burn


app = Flask('burn')
app.register_blueprint(burn)

if __name__ == "__main__":
    app.run(port=8000, debug=True)
