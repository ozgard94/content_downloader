FROM nginx:alpine

# Устанавливаем утилиту для создания htpasswd-файла
RUN apk add --no-cache apache2-utils

# Копируем наш конфиг
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Создаём htpasswd-файл при старте контейнера, используя переменные окружения
CMD htpasswd -bc /etc/nginx/.htpasswd "$BASIC_AUTH_USERNAME" "$BASIC_AUTH_PASSWORD" && \
    nginx -g 'daemon off;'