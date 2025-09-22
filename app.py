from flask import Flask, request, jsonify

app = Flask(__name__)

@app.route("/")
def home():
    return "✅ Backend corriendo en Koyeb"

@app.route("/info", methods=["POST"])
def info():
    data = request.get_json()
    url = data.get("url", "")
    return jsonify({"url": url, "status": "ok"})

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
