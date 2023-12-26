from flask import Flask, request, render_template
#En esta línea 
app = Flask(__name__, template_folder='templates')

@app.route('/')
def index():
    # Esta funcion se asocia a la ruta raiz "/"
    return "Bienvenido a mi aplicacion web!"

@app.route('/formulario', methods=['GET', 'POST'])
def formulario():
    # Esta funcion se asocia a la ruta "/formulario"
    if request.method == 'POST':
        # Si se envia el formulario, procesamos los datos
        nombre = request.form['nombre']
        mensaje = f"Hola, {nombre}! Bienvenido a mi app web."
        return mensaje
    # Si se accede por GET, mostramos el formulario
    return render_template('formulario.html')

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)