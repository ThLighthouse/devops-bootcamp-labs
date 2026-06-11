### Lecture 2 - Introduction to Virtualization & Virtual Machines

### Что понял

Виртуализация — это технология, которая позволяет создавать виртуальные версии физических ресурсов: серверов, дисков, сетей и операционных систем.

Host machine — физическая машина, на которой запускаются виртуальные машины.

Guest machine — виртуальная машина, внутри которой установлена отдельная ОС.

Hypervisor — слой/программа, которая создаёт и управляет виртуальными машинами.

Type 1 hypervisor устанавливается прямо на железо. Используется в дата-центрах и компаниях. Примеры: VMware ESXi, Microsoft Hyper-V, Proxmox VE.

Type 2 hypervisor устанавливается поверх обычной ОС. Примеры: VirtualBox, VMware Workstation.

Type 1:
Hardware → Hypervisor → Virtual Machines

Type 2:
Hardware → Host OS → Hypervisor app → Virtual Machines

### Команды

В этой лекции команд не было, тема была теоретическая.

### Что было непонятно

Хочу позже наглядно посмотреть установку Type 1 hypervisor, например Proxmox VE или VMware ESXi, чтобы понять, как гипервизор ставится прямо на физический сервер.

--------------------------------------------------------------------------

### Lecture 4 - Linux File System

### Что понял

Файловая система в линукс является иерахической структурой файлов, где у каждого файла своя обязанность. На самом верху иерархии стоит корневой каталог или root /

/bin(binary)- содержит бинари базовых команд (cat, ls, pwd).
/sbin(system binary) - содержит системные команды, которые могут быть использованы суперюзером.
/lib(libraries) - содержит библиотеки для базовых и системных команд
/usr(user) - содержит большинство пользовательских программ, библиотек и документации, установленных в системе. Там часто находятся /usr/bin, /usr/sbin, /usr/lib.
/usr/local - используется для программ, которые администратор установил вручную локально для этой системы. Программы из package manager обычно устанавливаются в /usr/bin, /usr/lib и другие системные директории.
/opt - сюда также загружаются внешние программы, разница в том, что сюда устанавливаются программы которые не разделяют свою кода по нескольким директориям, а сразу все ставятится в одну директорию.
/boot - содержит файлы, необходимые для загрузки Linux: kernel, initramfs, файлы bootloader. 
/etc - конфигурационные файлы системы
/dev(devices) файлы внешних девайсов, которые подключаются к ПК.
/var - содержит изменяемые данные системы: логи, кэш, очереди, данные сервисов. Системные логи обычно находятся в /var/log.
/tmp - временное расположение для файлов
/media - точка монтирования для внешних девайсов
Файлы и директории, которые начинаются с точки, считаются скрытыми. Например: .bashrc, .profile, .ssh. Их можно увидеть через ls -a. 

### Команды

Команд тут не было

### Что не понял
Вроде все понятно было по лекции. Других вопросов пока нет

--------------------------------------------------------------------------

### Lecture 5-6 - Introduction to CLI and Basic Linux Commands

### Что понял

На серверах везде используется только CLI поэтому так важно уметь работать и ориентироваться здесь.

### Команды

pwd = рабочая директория
ls = (list) показать файлы внутри директории
cd = (change directory)перейти в директорию
mkdir = (make directory) создать директорию
touch = создать файл
rm = (remove) удаление файла
rm -r (remove directory recursively) удаление директории вместе с содержимым
mv = (move) переименовать файл
cp -r = (copy -recursively) - скопировать файл и все содержимое
ls -R = вывести директории и их содержимое
CTRL + r = search history
CTRL + c = stop proccess
ls -a = show all files include hidden
cat = show what is inside the files
uname -a = information about system and kernel
lscpu = info about cpu
lsmem = info about memory
su = switch user, перейти в другого пользователя
df -h = показать использование дисков
free -h = показать использование RAM и swap
lsblk = показать диски и разделы
which <command> = показать путь к исполняемому файлу команды
history = показать историю команд

### Что не понял
Также все вроде понятно

--------------------------------------------------------------------------

### Lecture 7-8 Package Manager and Vim

### Что понял
apt & apt-get - отличаются
apt = user friendly
apt-get = нет команды для поиска
Пакетный менеджер = управляет пакетами и также позволяет устанавливать необходимые пакеты на ПК.
Пакеты в линуксе хранятся в репозиториях.
Основные apt-репозитории находятся в /etc/apt/sources.list и /etc/apt/sources.list.d/
альтернатива для установки приложений в Ubuntu Software Application 
Другая альтернатива = snap
Snap = хранит зависимости в одном месте
apt = хранит пакеты раздельно
PPA = Personal Package Archive
На vim я уже более-менее работаю быстро и комфортно, даже комфортнее для меня чем nano
vim может открыть любые форматы файлов

### Команды
apt update = обновляет локальный список доступных пакетов из репозиториев
apt upgrade = обновляет установленные пакеты
apt search = поиск пакетов
apt install = устанавливает пакеты
apt search = удобный поиск пакетов через apt
apt-cache search = старый способ поиска пакетов
apt-get обычно используют для install/remove/update/upgrade, особенно в скриптах


### Что не понял
Нужно ли подробно узнавать про snap или в основном можно обойтись с apt?
Что еще нужно знать мне про пакетные менеджеры?

--------------------------------------------------------------------------

### Lecture 9 - Linux Accounts & Groups (User & Permissions Part 1)

### Что понял
Service Account - специальный пользователь для определенного сервиса, добавляется специальноЮ для того, чтобы сервис был изолирован от других юзеров.
Root User - Суперпользователь с неограниченными правами
User Account - a regular user  
2 levels of permissions: Give permissions to User directly & Group Users into Linux Groups and give permissions to the Group
UID(User ID) each user has a unique ID. 0 is reserved for root
GID(Group ID) The primary group ID
adduser & addgroup, deluser & delgroup = interactive, more user friendly. You can choose UID & GUID values
useradd & groupadd, userdel & groupdel - need to provide the infos yourself (use in scripts)


### Команды
adduser[username]
passwd[username]
su(switch user) [username] - сменить пользователя
groupadd <groupname> = create a new group
usermod = modify user account, usermod -aG = добавить пользователя в несколько групп не удаляя существующие 
groups [username] - показать группы пользователя
sudo gpasswd -d alisher devops - убрать пользователя из группы 

### Что не понял
Не совсем понятно как менеджить группы в линуксе, не понял также добавления пользователя в несколько групп.
впринципе понял зачем нужны группы, так как будто удобнее давать пользователю различные доступы

--------------------------------------------------------------------------

### Lecture 10 - File Ownership & Permissions (Users & Permissions Part 2)

### Что понял
Есть два концепта: Ownership (who owns the file/directory) & Permissions
- = regular file
d = directory
c = character device file
l = symbolic link
owner - creator of file/directory
group
other - everybody else


### Команды
chown - сменить владельца файла/директории
chgrp - сменить группу файла
chmod - выдать/забрать доступы к файлу

### Что не понял
Вроде все понял тут


--------------------------------------------------------------------------

### Lecture 11 - Basic Linux Commands - Pipes & Redirects (CLI - Part 3)


### Что я понял
Каждая команда в линуксе имеет ввод и вывод.
STDIN(0) = Standard Input
STDOUT(1) = Standard Output
STDERR(2) = Standard Error 
с помощью | можно перенаправлять вывод одних команд в другие

### Команды
| pipe передаёт STDOUT одной команды в STDIN другой команды
less - показывает большие выводы в более удобной форме
grep - фильтр по тексту 
> - redirect the results of the command execution to the file (overwrite the file) 
>> - append text to the end of file
; - использование команд по очереди, раздельно друг от друга
command > file.txt      # записать STDOUT в файл, перезаписать
command >> file.txt     # добавить STDOUT в конец файла
command 2> errors.txt   # записать STDERR в файл
command &> all.txt      # записать STDOUT и STDERR в файл

### Что не понял
Вроде все понятно тут

--------------------------------------------------------------------------


### Lecture 12,13,14 - Introduction to Shell Scripting Part 1, Shell Scripting Part 2,3 - Concepts & Syntax

### Что понял
Shell - программа-интерпретатор для выполнения различных команд, которые мы используем в терминале. Переводит наши команды так чтобы ядро линукса смогла понять их
sh (Bourne Shell) - /bin/sh - старая версия Bash
Bash (Bourne again shell) - /bin/bash - улучшенная версия sh и является программой по умолчанию для многих UNIX подобных систем.
Bash - также является полноценными языком программирования и позволяет писать скрипты для автоматизации повторяющися команд или действий.
Why is it called "shebang"?
 - Because of the first 2 characters: "#!"
 - # = in musical notation, also called "sharp"
 - ! = also called "bang"
VARIABLES - used to store data and can be referenced later
variable_name=$(command) - Store output of a command in a variable 
CONDITIONALS - allow you to alter the control flow of the program and execute a command only when a certain conditions is true

File Test Operators = Test various properties associated with a file
Relational Operators = Works only for numeric values
String operators
Loops - enables to execute a set of command repeatedly
There are different types of loops;
 - while loop
 - for loop
 - until loop
 - select loop

While Loop - execute as set of commands repeatedly until some sondition is matched

Functions - contain similar code inside it and could be used again and again in order to write a cleane code.
Apply the SIngle Responsibility Principle: a function should only do one thing.
Declare variables with a meaningful name for positional parameters within a function
return возвращает exit code функции, обычно число от 0 до 255.
0 = успех
не 0 = ошибка

### Команды
echo - высести текст
read -p = ожидание ввода 
$((+/-)) - для прибавления или вычитания используются двойные круглые скобки
[[ переменная без кавычек ]] - условие в баш
$? - captures value returned by last command
-mtime - stands for 'modification time(in days)
-1 means less than 1 day ago (e.g modified within the last 24 hour)
-lt = меньше чем 
-ge = больше или равно
-gt = больше чем
-le = меньше или равно
-eq = равно
-ne = не равно
grep "pattern" "file"

### Что не понял
Как учить операторы, типо -d, -f?
Что за BASH и POSIX?
Максимальное число параметров от $1 до $9?

for SERVICE_NAME in "$@"; do - означает:

возьми все аргументы из "$@"
и по очереди клади каждый аргумент в переменную SERVICE_NAME

[ ... ] используется для проверок значений:

[ "$#" -eq 0 ]
[ -z "$NAME" ]
[ -f "$FILE" ]
[ "$FAILED" -eq 1 ]


