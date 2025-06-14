# Базовый минимальный образ
FROM python:3.10-slim

# Установка необходимых системных библиотек
RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    curl \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Рабочая директория
WORKDIR /app

# Копируем requirements
COPY requirements.txt .

# Установка Python-зависимостей
RUN pip install --no-cache-dir -r requirements.txt

# Копируем всё остальное
COPY . .

# Команда запуска
CMD ["python", "app.py"]