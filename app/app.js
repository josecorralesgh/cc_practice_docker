const express = require('express');
const bodyParser = require('body-parser');
const path = require('path');

const app = express();
const port = 3000;

// Configurar middleware para parsear datos del formulario
app.use(bodyParser.urlencoded({ extended: true }));

// Establecer la carpeta de plantillas
app.set('views', path.join(__dirname, 'templates'));
app.set('view engine', 'html'); // Configuración para manejar archivos HTML con EJS

// Middleware para manejar archivos HTML
app.engine('html', require('ejs').renderFile);

// Ruta para la página de inicio
app.get('/', (req, res) => {
  res.send('¡Bienvenido a mi servidor Node.js!');
});

// Ruta para el formulario (GET y POST)
app.route('/formulario2')
  .get((req, res) => {
    res.render('formulario2.html'); // Renderizar el formulario.html usando el motor de plantillas
  })
  .post((req, res) => {
    const nombre = req.body.nombre;
    const mensaje = `Hola, ${nombre}! Bienvenido a mi server Node.js.`;
    res.send(mensaje);
  });

// Iniciar el servidor
app.listen(port, () => {
  console.log(`La aplicación está escuchando en http://localhost:${port}`);
});
