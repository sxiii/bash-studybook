#!/bin/bash
#################################################################################################################
# # # Bash-скриптинг - полу-интерактивный учебник и справочник команд # # # # # # # # # # # # # # # # # # # # # #
# ВНИМАНИЕ ! Для запуска этого учебника установите зависимость - "toilet". Если у вас Ubuntu/Debian: 
# sudo apt-get install toilet /// если Fedora/SUSE: sudo yum install toilet /// если Arch: yaourt -S toilet     #
# После установки toilet сохрание этот код в файл .sh, сделайте из него исполняемый (chmod +x ./book_ru.sh)     #
# И можно запускать и пользоваться учебником. Ура!                                                              #
#################################################################################################################
# Необходимые минимальные навыки                                                                                #
# Понимание исполняемых файлов (программ) / команд "./shell.sh"                                                 #
# Понимание аргументов "argument=value", флагов "-f hello-world"                                                #
# Понимание системы ввода\вывода команд "> to file < from file | pipes"                                         #
# Понимание горячих клавиш Ctrl+C (stop), Ctrl+D (exit), Ctrl+O, Ctrl+X (nano: write, exit)                     #
#################################################################################################################
# Учебник написан в январе 2016 Security XIII [at] gmail [dot] com                                              #
#################################################################################################################
trap ctrl_c INT
while true; do
clear
# Настройка шрифтов и размеров вывода - флаг -t чтобы автоматически выводить изображение по размеру терминала
t="-t"; width="120"; largefont="mono12" ; smallfont="mono9" # Ширина терминала, кегель и шрифт для крупных и мелких надписей
# Функция паузы и подсказки по интерфейсу
function pause { read -rsp $'Ctrl+D/пробел/enter следующая команда, Ctrl+C выход из учебника.\n' -n1 key ; }
function ctrl_c() { echo " :) Спасибо за пользование учебником!"; exit ; }
# Команды запуска вывода команд :D на экран
toilet1="toilet $t --width $width -F border -f $largefont --metal"
toilet2="toilet $t --width $width -f $smallfont --gay"
# Перечень команд для разных "уровней"
level0=( "ls" "pwd" "cd" "mkdir/rmdir" "touch/rm" "cat" "cp" "mv" "echo" "clear" "sudo/su" "man" "date" "cal" "hostname" )
text0=( "List" "Print Working Directory" "Change Directory" "Make / Remove Directory" "Touch / Remove" "Concatenate" "Copy" "Move" "Echo" "Clear" "Switch User Do" "Manual" "Date" "Calendar" "Hostname" )
exec0=( "ls -lh" "pwd" "cd /home/\$(whoami)" "mkdir test && echo 123 > ./test/file && cat ./test/file && rm /test/file && rmdir test" "touch mini.file && rm mini.file" "cat /etc/X11/xorg.conf" "cp /etc/X11/xorg.conf /etc/X11/xorg.conf.bak" "touch file-1 && mv file-1 file-2 && rm file-2" "echo hello world" "clear" "su $(whoami)" "man man" "date +%H:%M" "cal" "hostname" )
level1=( "wget" "curl" "head/tail" "less/more" "ifconfig/iwconfig" ">, <, |, &&" "chmod/chown" "grep" "wc" "lsusb" "lspci" "sleep" "df" "du" "mount/umount" )
text1=( "Web Get" "Concatinate URL" "(read from) Head/Tail" "(show) Less / More" "InterFace Configuration / Interface Wireless Configuration" "Direct to/from file, pipe" "Change (file/directory) Mode/Change (file/directory) Owner" "Grep..." "Word Count" "List USB" "List PCI" "Sleep" "Disk Files (filesystem usage)" "Disk Usage" "Mount/Unmount" )
exec1=( "wget -O output.html http://ya.ru" "curl http://ifconfig.me/ip > myip.txt" "cat /etc/X11/xorg.conf | head" "cat /boot/grub/grub.cfg | less" "ifconfig -a" "cat /etc/X11/xorg.conf | grep driver" "ls && ls -lh" "chmod -R 777 ~" "cat /etc/grub/grub.cfg | wc -l" "sudo lsusb" "sudo lspci" "echo hello; sleep 5; echo world" "sudo df -lh" "du ." "sudo mount /dev/sdb1 /mnt" )
level2=( "make" "gcc/g++" "kill/killall" "bg/fg/&" "pidof" "service" "lshw" "time" "ps/ps aux/pstree" "top/htop" "sort/uniq" "ln" "awk" "dd/dcfldd" )
text2=( "Make" "Gnu C Compiler" "Kill" "BackGround / ForeGround" "Process ID Of" "Service" "List Hardware" "(execution) Time" "Process Snapshot/Process Snapshot Tree" "Top" "(file/dir Sorting / Unique)" "LiNk" "Awk" "Disk Dump" )
exec2=( "make" "gcc -O output program.c" "killall firefox" "\$(sudo nmap 192.168.1.1-254)&" "sudo kill \$(pidof firefox)" "sudo service apache2 restart" "sudo lshw" "time ping ya.ru -c4" "ps aux" "htop" "sudo lsusb | sort | uniq" "ln -s /etc/X11/xorg.conf ./xorg-link" "cat /etc/X11/xorg.conf | awk -F: '{ print \$2 }'" "sudo dd if=/dev/sdb of=/usbflash.dump" )
level3=( "ping" "ssh" "scp" "rsync" "ftp" "logout/exit/Ctrl+D/Ctrl+C" "tar" "zip/unzip" "export/env" "screen" "dig" "nmap" )
text3=( "Ping" "Secure Shell" "Secure Copy" "Remote Synchronization" "File Transfer Protocol" "Do I Need To Tell You What Does Logout Means?" "Tape ARchive" "Zip" "Export/Environment" "Screen..." "Dig (for some cool info...)" "Network Map" )
exec3=( "ping 2ip.ru" "ssh root@localhost" "scp root@localhost:/var/www/admin.html remote@server:/var/www/admin.html" "rsync -av /src/foo /dest" "ftp admin@myserver" "logout" "tar -xvzf ./archive.tar.gz" "zip stuff *" "env > env.list" "screen" "dig cloudflare.com" "nmap nigma.ru" )
level4=( "which" "whereis" "whoami" "whois" "whatis" "who/w" "history/!" "lsof" "locate" "find" "md5sum/sha256sum" )
text4=( "Which?!" "Where Is The ...!?" "Who Am I?!?!?!!!" "Who Is This Domain?" "What is this ...?!" "Who" "History..." "List of Open Files" "Locate" "Find" "message digest 5 summ/sha256summ" )
exec4=( "which which" "whereis which" "whoami" "whois 2gis.ru" "whatis firefox" "w" "history" "lsof -i -U" "locate firefox" "find . -perm 664" "md5sum /usr/bin/md5sum" )
level5=( "apt-get" "yum" "packer" "pacman" "yaourt" )
text5=( "Application Get" "Yum" "Packer" "Package Manager" "Yaourt" )
exec5=( "sudo apt-get install gedit" "sudo yum install nmap" "sudo packer -S nano" "sudo pacman -S yaourt" "yaourt -A aircrack-ng" )
level6=( "commandlinefu.com" "pastebin.com" "distrowatch.com" "alternativeto.net" "github.com" )
text6=( "Command Line Examples" "Paste Bin" "Distribution Watch" "Alternative To" "Git Hub..." )
exec6=( "firefox http://commandlinefu.com" "google-chrome http://pastebin.com" "midori http://distrowatch.com" "opera http://alternativeto.net" "iceweasel http://github.com" )
level7=( "if/then/fi" "exit" "while" "arrays" "(command results in arguments)" )
text7=( "Conditions" "EXIT!" "While something goes on.." "Arrays are cool!" "Inline results" )
exec7=( "firefox http://goo.gl/Yjazew" "Just type exit to exit :=)" "google-chrome http://goo.gl/972qLV" "firefox http://tldp.org/LDP/abs/html/arrays.html" "google-chrome http://goo.gl/LNNTWZ" )
if hash toilet; then echo "Toilet найден. Учебник может быть запущен."; else echo "Установите единственную зависимость - пакет toilet (sudo apt-get install toilet)"; exit; fi
# Главное меню учебника
echo "Добро пожаловать в интерактивный учебник Bash!"
options=("1) Базовые знания по командам (15)
2) Средний уровень (загрузка, отображение, pipelines, права доступа, устройства) (15)
3) Высший уровень (компиляция, управление процессами) (14)
4) Удаленная работа (12)
5) Поиск (11)
6) Дистрибутивы (5)
7) Полезные сайты (4)
8) Скрипты (5)
Выход: Ctrl+C
Выберите интересующий вас раздел: ")
printf "${options[@]}"; read n; ((n--)); z="text$n[@]"; x=0;
for i in "${!z}"; do p="level$n[$x]"; u="exec$n[$x]"; ((x++)); $toilet1 ${!p}; $toilet2 $i; echo "Пример команды: ${!u}"; pause; done
done
