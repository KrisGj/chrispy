from flask import Blueprint, Response, jsonify

blueprint: Blueprint = Blueprint("health", __name__)


@blueprint.route("/health", methods=["GET"])
def get_health() -> tuple[Response, int]:
    return jsonify({"success": True}), 200
