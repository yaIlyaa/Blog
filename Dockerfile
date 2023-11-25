# Используем официальный образ Ruby
FROM ruby:3.0.2

# Устанавливаем необходимые зависимости
RUN apt-get update -qq && apt-get install -y nodejs

# Создаем директорию для приложения
RUN mkdir /myapp
WORKDIR /myapp

# Устанавливаем гемы
COPY Gemfile Gemfile.lock /myapp/
RUN bundle install

# Копируем код приложения в контейнер
COPY . /myapp/

# Создаем пользователя app и устанавливаем права
RUN useradd -ms /bin/bash app

# Переключаемся на пользователя app
USER app

# Запускаем приложение
CMD ["rails", "server", "-b", "0.0.0.0"]
