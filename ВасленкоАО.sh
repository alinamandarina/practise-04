#RIGHTS
#1
touch all.txt
#2
chmod 444 all.txt
#3
ls >> all.txt
#Permission denied
#4
sudo ls >> all.txt
#Permission denied
#5
sudo groupadd restricted
sudo chown :restricted restricted.txt
#6
chmod 660 restricted.txt
#7
mkdir rights
cd rights/
#bash
touch file{1..10}
touch .nofile
#8
sudo chmod 200 -R *
#9 не поменялись
#10
umask
0002
#11
umask 077
touch my.txt
# 12
touch 000.txt
chmod 000 000.txt
chmod 666 000.txt 
# Можно поменять права обратно
chmod 000 000.txt
rm 000.txt 
# Можно удалить с подтверждением. С sudo подтверждение не нужно

# Process
#1
sleep 100 &
#2 stopped mc 
#3 Смотрим запущенные задачи интерпретатора командой jobs, для возобновления работы используем  команду fg :fg %number
#4
sudo touch beeper.sh
echo '#!/bin/bash\nwhile true; do\necho -n "$@ " >> ~/outfile\n
sleep 5\ndone' > ~/beeper.sh
sudo chmod a+x beeper.sh
#5
 sudo sh beeper.sh test &
 sudo sh beeper.sh run &
 sudo sh beeper.sh stop &
#6 
tail -f outfile
# каждые 5 сек выводится test run stop
#7
jobs
#[1]   Running                 sudo sh beeper.sh test &
#[2]-  Running                 sudo sh beeper.sh run &
#[3]+  Running                 sudo sh beeper.sh stop &
#8
sudo kill -STOP 3039
#[2]+  Stopped                 sudo sh beeper.sh run
#9
sudo kill -CONT 3039
#10
sudo kill -KILL 3050
[3]+  Killed                  sudo sh beeper.sh stop
#11
top
#12
#SHIFT+M - сортировка по использованию памяти
#SHIFT+P - сортировка по использованию ресурсов
#SHIFT+L - подсветка процессов, в названии которых есть введенная строка
#T - показывает дополнительную информацию над таблицей
#SHIFT+B -выделяет жирным шрифтом  основные числовые показатели системы
#SHIFT+W - сохраняет текущую конфигурацию
#13
#процесс vim перейдет в состояние stopped
#14
pkill -u vargant
# Systemd
#1 
sudo touch /etc/systemd/system/student_vasilenko.service
sudo systemctl daemon-reload
#2
sudo systemctl enable student_vasilenko.service
#3
sudo systemctl start student_vasilenko.service
#4
sudo systemctl stop student_vasilenko.service
#5
sudo systemctl disable student_vasilenko.service
#6
sudo rm /etc/systemd/system/student_vasilenko.service







 2246 root      0:00 sh beeper.sh test
 2248 root      0:00 sh beeper.sh run
 2255 root      0:00 sh beeper.sh stop
