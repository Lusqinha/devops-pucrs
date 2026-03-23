from flask import Flask

app = Flask(__name__)

@app.route("/")
def home():
    return "<h1>Bem-vindo ao projeto DevOps na Prática!</h1><p>Fase 1 - Configuração e Automação Inicial</p>"

@app.route("/health")
def health():
    return {"status": "ok"}, 200

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
