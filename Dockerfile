FROM python:3.13-slim

    #Установка системных зависимостей для GUI
RUN apt-get update && apt-get install -y \
    libgl1-mesa--glx \
    libxcb-xinerama0 \
    xvfb \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

#Запуск через виртуальный X-сервер для работы с GUI в контейнере

CMD ["xvfb-run", "-a", "python", "src/main.py"]
