По результатам выполнения задания создается отчет со скриншотами, листингом скрипта и небольшим описанием хода работы.
Структура отчета: титульный лист, задание, ход работы, вывод.

---

## Задание

1. Установить Docker на вашу операционную систему
2. Cоздать Dockerfile
3. Cобрать из него образ Docker Image и развернуть из образа Docker Image контейнер.
4. Внутри контейнера должно быть ваше приложение или скрипт с любым дополнительным компонентом (например, это может быть Python), который будет установлен внутри образа и требуется для запуска приложения.Для компонентов можно использовать готовые образы из DockerHub.
5. Запустить приложение.

## Ход работы

1. Был установлен **docker-desktop** согласно инструкции [https://docs.docker.com/desktop/install/ubuntu/]
2. В директории с лабораторной работой создан простой py-скрипт поднимающий сервер с использованием **redis** и **flask**
3. Создан Dockerfile который поднимает python3 окружение, устанавливает все необходимые зависимости, копирует файлы проекта и запускает py-скрипт с помощью **flask** в режиме _дебага_
4. Добавлен файл _compose.yaml_ в котором описаны сервисы используемые в контейнере.
5. Запущен докер контейнер командой:
   - > docer compose up
6. Просмотрен список всех имеющихся на машине _docer images_ с помощью команды:
   - > docker image ls
7. Приложение запущено и проверено - переход по адресу _http://localhost:8000/_ возвращает plain текст в который встроена информация о количестве обращений по адресу

Листинг dockerfile:

```dockerfile
# syntax=docker/dockerfile:1
FROM python:3.10-alpine
WORKDIR /code
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
RUN apk add --no-cache gcc musl-dev linux-headers
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
EXPOSE 5000
COPY . .
CMD ["flask", "run", "--debug"]
```

## Вывод

В ходе работы был изучен и опробован на практике инструмент контейнеризации **"docker"**, нацеленный на решение проблемы воспроизводимости. На практике была проверена возможность _docker_'a поднимать повторяемое(воспроизводимое) окружение.