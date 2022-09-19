mkdir lab0
cd lab0

# Заполнение drifloon3
mkdir drifloon3 drifloon3/chikorita drifloon3/scizor drifloon3/zweilous
cd drifloon3
touch goldeen camerupt duskull
cd ..

# Заполнение nidorino7
mkdir nidorino7 nidorino7/deerling nidorino7/luxio nidorino7/golbat

# Заполнение taillow9
mkdir taillow9 taillow9/azumarill taillow9/swampert
cd taillow9
touch crawdaunt
cd ..

# Создание файлов в lab0
touch meditite6 snover5 whismur5

# Заполнение файлов
echo "Живет Freshwater" > drifloon3/goldeen
echo "Способности Blaze Landslide" > drifloon3/camerupt
echo "Magma Armor Solid Rock" >> drifloon3/camerupt
echo "Тип диеты:" > drifloon3/duskull
echo "Nullivore" >> drifloon3/duskull
echo "Возможности Overland=6 Surface=6 Sky=1 Jump=4" > meditite6
echo "Power2=0 Intelligence=4 Aura=0" >> meditite6
echo -e 'satk=6 sdef=6\nspd=4' > snover5
echo "Способности Harden Vicegrip Leer Bubblebeam Protect" > taillow9/crawdaunt
echo -e 'Knock Off Swift Taunt Night Slash Crabhammer Swords Dance Crunch\nGuillotine' >> taillow9/crawdaunt
echo 'Способности Last Chance Soundproof Oblivious' > whismur5

# Задание прав
chmod u=rx,g=rwx,o=wx drifloon3/
chmod u-rwx,g=r,o=r drifloon3/goldeen
chmod u=rw,g-rwx,o-rwx drifloon3/camerupt
chmod u+rwx,g=rw,o=r drifloon3/chikorita/
chmod u=wx,g=wx,o=rx drifloon3/scizor/
chmod 666 drifloon3/duskull
chmod u=rx,g=wx,o+rwx drifloon3/zweilous/
chmod u-rwx,g-rwx,o=r meditite6
chmod u=rwx,g=rx,o=wx nidorino7/
chmod u=wx,g=x,o=w nidorino7/deerling/
chmod 751 nidorino7/luxio/
chmod u=rx,g=rwx,o=wx nidorino7/golbat/
chmod 664 snover5
chmod u+rwx,g=rx,o=wx taillow9/
chmod 330 taillow9/azumarill/
chmod u=wx,g=x,o=w taillow9/swampert/
chmod u=rw,g=w,o-rwx taillow9/crawdaunt
chmod ugo=r whismur5

# Объединение, копирование, создание ссылок
cat drifloon3/camerupt drifloon3/duskull > whismur5_60
cp -r taillow9/ drifloon3/zweilous/
# Возникла ошибка                                            cp: drifloon3/zweilous/azumarill: Permission denied
# Решение: добавление права на запись к директории zweilous
chmod u+w drifloon3/zweilous/
# Возникли ошибки                                            cp: taillow9/azumarill: Permission denied
#                                                            cp: taillow9/swampert: Permission denied
# Решение: добавление прав на чтение к azumarill, swampert
chmod u+r taillow9/azumarill/ taillow9/swampert/
cp -r taillow9/ drifloon3/zweilous/
# Убрать права (также в директории zweilous)
chmod u-w drifloon3/zweilous/
chmod u-r taillow9/azumarill/ taillow9/swampert/ drifloon3/zweilous/azumarill/ drifloon3/zweilous/swampert/
cp meditite6 taillow9/azumarill/
# Возникла ошибка                                            cp: meditite6: Permission denied
# Решение: добавление права на чтение пользователю к файлу meditite6
chmod u+r meditite6
cp meditite6 taillow9/azumarill/
# Убрать право на чтение (также в директории azumarill)
chmod u-r meditite6 taillow9/azumarill/meditite6
cp snover5 taillow9/crawdauntsnover
ln meditite6 drifloon3/duskullmeditite
# Возникла ошибка:                                           ln: drifloon3/duskullmeditite: Permission denied
# Решение: добавление директории drifloon 3 права на запись пользователю
chmod u+w drifloon3/
ln meditite6 drifloon3/duskullmeditite
# Убрать право на запись
chmod u-w drifloon3/
ln -s drifloon3/ Copy_13
ln -s whismur5 drifloon3/duskullwhismur
# Возникла ошибка:                                           ln: drifloon3/duskullwhismur: Permission denied
# Решение: добавление директории drifloon 3 права на запись пользователю
chmod u+w drifloon3/
ln -s whismur5 drifloon3/duskullwhismur
# Убрать право на запись
chmod u-w drifloon3/
ls -lR

# Поиск и фильтрация файлов
# Для выполнения создадим директорию tmp 
mkdir tmp
wc -l meditite6 1>>meditite6 2>>tmp/meditite6_err
# Возникла ошибка:                                            -bash: meditite6: Permission denied

ls -Rrt | head -n 2 2>&1
cat -n drifloon3/goldeen drifloon3/camerupt drifloon3/duskull 2>&1 | sort -k 2
# Произошла ошибка:                                           cat: drifloon3/goldeen: Permission denied

ls -R nidorino7/ 2>tmp/nidorino7_err | sort
cat *l */*l */*/*l | sort
ls taillow9/ 2>&1 | sort

rm snover5
rm taillow9/crawdaunt
rm Copy_*
rm -f drifloon3/duskullmediti*
# Произошла ошибка: rm: drifloon3/duskullmeditite: Permission denied
# Решение: выдать пользователю права на запись в drifloon3
chmod u+w drifloon3/
rm -f drifloon3/duskullmediti*
# Убрать права
chmod u-w drifloon3/
rm -rf taillow9
# Возникла ошибка: rm: taillow9/swampert: Permission denied
#                  rm: taillow9/azumarill: Permission denied
#                  rm: taillow9/: Directory not empty
# Решение: рекурсивно выдать права на чтение пользователю в директории taillow9
chmod -R u+r taillow9/
rm -rf taillow9
rm -rf taillow9/swampert
# Директория taillow9 уже удалена в предыдущем пункте
