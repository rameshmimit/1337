from flask import Blueprint

from burn.controllers.base import BaseController
# from burnlib.models.users import User

burn = Blueprint('burn', __name__,
                      template_folder='../views',
                      static_folder='../../resources')


@burn.route("/")
def home():
    return BaseController().view('home.html')
