По результатам выполнения задания создается отчет со скриншотами, листингом скрипта и небольшим описанием хода работы.
Структура отчета: титульный лист, задание, ход работы, вывод.

---

## Задание

1. Настроить git. Создать git-репозиторий.
1. Добавить изменения (минимум 5 коммитов). В каждом коммите должен содержаться не только заголовок, но и тело комментария.
1. Посмотреть статус, какие изменения были внесены.
1. Посмотреть историю коммитов (с детализацией).
1. Загрузить репозиторий на GitHub (создать аккаунт, если нет).
1. Ответвиться от основной ветки проекта и сделать ещё 6 коммитов.
1. Переписать историю коммитов с помощью команды rebase. Один из новых коммитов только переименовать, два других объединить командой squash, ещё один полностью отредактировать командой edit.
1. Внести изменения. Сделать merge двух веток.

## Ход работы

1. В пустой директории был инициализирован git репозиторий.
2. Были добавлены 5 коммитов, каждый оформлен согласно best practices.
3. У екоторых коммитов был просмотрен статус с помощью комманды:
   > git status
4. Был просмотрен лог коммитов с помощью комманд

   > git log

   и

   > git log -p

5. Репозиторий был загружен на GitHub по адресу [https://github.com/TeoTeolog/isdm]
6. После пуша на remote-repo была создана отдельная ветка в которой были првоедены ещё 6 коммитов
7. История коммитов была переписана с помощью комманды _rebase_
   1. Были объединены коммиты **087c282** и **d1e77f5** с помощью комманды _squash_
   2. Был помечен на изменение коммит **b0066e4**
   3. Был удалён коммит **8e9c81b**
   4. Были внесены изменения в коммит **b0066e4**
   5. Было подтверждено изменение истории с помощью комманды
      - > git rebase --continue
8. Выполнен merge ветки _master_ и ветки _new-branch_

## Вывод

В ходе работы была изучена работа с системой контроля версий GIT был выполнен ряд праткических заданий, нацеленных на повышение навыков владений git-ом. Изучены особенности работы с коммандой _git rebase_
