# Establecemos la imagen base con Node.js
FROM node:latest

# Establecemos el directorio de trabajo en el contenedor
WORKDIR /app

# Copiamos el archivo package.json y el archivo package-lock.json
COPY package*.json ./

# Instalamos las dependencias
RUN npm install
#instalar EJS para los templates HTML y EJS
RUN npm install ejs

# Copiamos el código fuente de la aplicación al contenedor
COPY . /app

# Exponemos el puerto 3000 para la aplicación Node.js
EXPOSE 3000

# Comando por defecto al ejecutar el contenedor
CMD ["node", "app.js"]
