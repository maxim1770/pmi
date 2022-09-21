#!/bin/bash
# Пункт 1

get_num_recent_files() {
  # Функция возвращает кол. недавно (за последний день) созданных/измененных файлов

  path=../../../../../../../../../                         # путь к папке ../Users/User_Name
  recent_files=$(find $path -maxdepth 1 -type f -mtime -1) # подробнее тут: https://translated.turbopages.org/proxy_u/en-ru.ru.b441ad4c-6322398d-209b430b-74722d776562/https/stackoverflow.com/questions/16085958/find-the-files-that-have-been-changed-in%20-last-24-hours%20

  # Подсчитываем кол. файлов и записываем это значение в переменную num_recent_files
  num_recent_files=0
  for file_data in $recent_files; do

    ((num_recent_files++))
  done

  #  echo $recent_files # Если нужно показать какие файлы/папки были недавно созданы/изменены
  echo $num_recent_files
}

echo $(get_num_recent_files)

echo "fsdf"

# Пункт 2

#touch file1
#touch .lib
#touch .doc
