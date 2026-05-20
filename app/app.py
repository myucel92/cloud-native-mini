from flask import Flask, jsonify, Response
from prometheus_client import Counter, generate_latest
from prometheus_client import CONTENT_TYPE_LATEST

app = Flask(__name__)

REQUEST_COUNT = Counter(
    "app_requests_total",
    "Total App HTTP Request Count"
)

@app.route("/")
def home():
    REQUEST_COUNT.inc()

    return jsonify({
        "message": "Cloud Native Mini Project is running!",
        "status": "success",
        "version": "v1"
    })

@app.route("/metrics")
def metrics():
    return Response(
        generate_latest(),
        mimetype=CONTENT_TYPE_LATEST
    )

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
