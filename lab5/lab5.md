По результатам выполнения задания создается отчет со скриншотами, листингом скрипта и небольшим описанием хода работы.
Структура отчета: титульный лист, задание, ход работы, вывод.

---

## Задание

1. Познакомиться с соглашением PEP-8
2. Реализовать код на Python, решающий небольшую задачку (например, парсер или конвертер). Минимум 30 строк кода.
3. Установить инструмент **pycodestyle** и провести проверку с помощью данного инструмента вручную (через CLI). Какие ошибки были обнаружены? Ошибки исправлять не нужно.
4. Сгенерировать с помощью _*pip freeze*_ файл **requirements.txt**
5. Подключить **GitHub Actions** к проекту в GitHub. В файл _.github/workflows/check.yml_ прописать следующие сценарии:
   - Установка необходимых файлов из **requierements.txt**
   - Предварительная установка **pycodestyle** в конфигурационном файле
   - Реализовать внутренний скрипт для проверки на наличие ошибок. Если ошибки есть - скрипт завершается с ошибкой.
6. Загрузить написанный python-скрипт. Необходимо предоставить детализацию, почему именно возвращена ошибка (для проверки, правильно ли реализовано задание 4).
7. Внести исправления в .py-файл. Не должно остаться ни одной ошибки от **pycodestyle**. Снова сделать push. Workflow check должен быть завершен со статусом **success**: это также необходимо продемонстрировать.

## Ход работы

1. Прочитав соглашение PEP-8, установили в папку с проектом **pycodestyle**. Для обработки был взят код парсера списка поступающих в магистратуру написанный ранее.
2. В проекте были обнаружены ошибки нарушения допустимой длинны строки.
3. С помощью _pip freeze_ был сгенерирован файл **requirements.txt**
4. С помощью gitHub Actions вкладки практически в два клика сгенерирован файл _.github/workflows/lab5.yml_
5. В файл _lab5.yml_ прописан скрипт согласно заданию
6. Запушен python-скрипт с ошибками код стайла.
7. Получены ошибки.
8. Исправленн и запушен python-скрипт без ошибок.
9. Получен статус **success**.

Листинг yaml скрипта:

```yml
# .github/workflows/lab5.yml
name: lab5

on:
  push:
    branches: ["master"]
  pull_request:
    branches: ["master"]

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v4
      - name: Set up Python 3.10
        uses: actions/setup-python@v3
        with:
          python-version: "3.10"
      - name: Install dependencies
        run: |
          python -m pip install --upgrade pip
          pip install flake8 pytest
          if [ -f requirements.txt ]; then pip install -r requirements.txt; fi
      # install pycodestyle
      - name: install pycodestyle
        run: pip install pycodestyle
      # check .py files
      - name: pycodestyle check
        run: pycodestyle --max-line-length=83 ./
```

## Вывод

В ходе работы были изучены возможности инструмента **"GitHub Actions"** был написан и применён на практике срипт проверки код стайла проекта. В процессе работы возникли небольшие проблемы с тем, что я поторопился и запушил .py-код до того, как прописал GHActions-правила - это отразилось на истории проекта.
