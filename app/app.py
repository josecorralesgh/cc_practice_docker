from flask import Flask, request, render_template, send_from_directory
import os

app = Flask(__name__, template_folder='templates')
app = Flask(__name__, static_url_path='/app/data/static')

# Tu función para servir archivos estáticos
@app.route('/app/data/static/<path:filename>')
def serve_static(filename):
    root_dir = os.path.dirname(os.getcwd())
    return send_from_directory(os.path.join(root_dir, 'app', 'data', 'static'), filename)


@app.route('/')
def index():
    return "Bienvenido a mi aplicación web!"

@app.route('/formulario', methods=['GET', 'POST'])
def formulario():
    if request.method == 'POST':
        nombre = request.form['nombre']
        mensaje = f"Hola, {nombre}! Bienvenido a mi app web."
        return mensaje
    return render_template('formulario.html')

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
