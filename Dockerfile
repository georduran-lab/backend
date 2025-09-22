FROM python:3.11-slim

# Instalar dependencias del sistema (ffmpeg)
RUN apt-get update && apt-get install -y ffmpeg && apt-get clean

# Directorio de trabajo
WORKDIR /app

# Copiar requirements.txt e instalar dependencias
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copiar el resto del código
COPY . .

# Exponer puerto para Gunicorn
EXPOSE 8000

# Comando de inicio
CMD ["gunicorn", "app:app", "--bind", "0.0.0.0:8000", "--timeout", "120"]
