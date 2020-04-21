#!/bin/bash

clear

function check_size() {
	if (( $LINES != 25 || $COLUMNS != 85 )); then
		COLUMNS=85;		
		LINES=25;
		export COLUMNS LINES;
		resize -s 25 85;
		printf '\e[8;25;85t'
		clear
	fi
}

function rund_speech() {
			random_speech=$RANDOM
			check=false
			while (( !${check} )); do
				while (( ${random_speech} >= ${#speech_arr[*]} )); do
					random_speech=$RANDOM
				done			
					check=true
					for arg in ${!speech_map[@]}; do
						if [[ "${speech_map[$arg]}" == "${speech_arr[${random_speech}]}" ]]; then
							check=false
							break
						fi
					done
					if ${check}; then		
						break
					fi
			random_speech=$RANDOM		
			done
			speech_map+=("${speech_arr[${random_speech}]}")
}

function set_dog() {
setranddog=$RANDOM
isitspace=true
while (( ${setranddog} >= ${#map[*]} || ${isitspace} == true )); do
	if (( ${setranddog} < ${#map[*]} )); then
		if [[ "${map[${setranddog}]}" != "${space}" ]]; then
			isitspace=false
			dog_location=${setranddog}
			speech_map[${dog_location}]="${map[${dog_location}]}"
			break
		fi	
	fi
	setranddog=$RANDOM
done
}

if [[ $0 != "./robotfindsdog.sh" ]]
then 
echo "Не удалось запустить игру. Имя файла было изменено."
return 0
fi

clear

check_size

clear
echo -e "robotfindsdog 2.0\nНаписал Глеб Голубов, ХНУРЭ, 2020г.\n\nВ этой игре вы робот (#). Ваша задача - найти собаку. Эта задача
осложняется наличием различных вещей, которые не являются собакой.
Робот должен коснуться предмета, чтобы определить, собака это или нет.
Игра заканчивается когда robotfindsdog. Кроме того, вы можете закончить игру,
нажав клавишу q или старую добрую комбинацию 'Ctrl-C'."
echo -e "\n\n"
echo "Press any key..."
read -n 1

check_size

clear

symbols_arr=("q" "a" "z" "w" "s" "x" "e" "d" "c" "r" "f" "v" "t" "g" "b" "y" "h" "n" "u" "m" "i" "k" "," "o" "l" "." "p" ";" "/" "[" "'" "]" "~" "1" "2" "3" "4" "5" "6" "7" "8" "9" "0" "-" "+" "=" "_" "!" "@" "$" "%" "^" "&" "?" "*" "(" ")" "M" "N" "B" "V" "C" "X" "Z" "L" "K" "J" "H" "G" "F" "D" "S" "A" "P" "O" "I" "U" "Y" "T" "R" "E" "W" "Q")
export speech_arr=("Тонна перьев." "Здесь лежит куча коаксиальных труб." "Это лопата." "Этоооооооооо Джонни!" "Здесь нет собаки, а есть только камень, камень без собаки и песчаная дорога." "Ряд коротких театральных постановок индексируется 1, 2, 3, ... n." "Эта карта не территория." "Камертон 540 Гц." "С возвращением, робот." "Наполовину пустая коробка молока. Или она наполовину полная?" "Это спящий лев." "Монолит Спама возвышается над вами." "Это вкусный банановый кремовый пирог." "Это внешняя зависимость." "Вы нашли лежачего полицейского." "Технический университет в Австралии." "Статуя девушки с гусем, как в Геттингене, Германия." "Самая большая площадь в Европе(г. Хаааарьков)" "Это колесо обозрения!" "Я большой БРАТ +_+" "Говорят, я - твоя тень.." "Зачем Пентагон взлАмываешь?" "Russian hackers or crackers??" "Where are you from?!" "Одна из немногих оставшихся дискотек." "Освежитель воздуха с ароматом мяса на веревочке танцует на ветру." "Бездна твоих мы(ю)слей" "Обертка Mentos." "Недоеденный бутерброд с сыром." "Огрызок, ой, да это же новенький Iphone SE.." "Коробка с танцующими механическими карандашами. Они танцуют! Они поют!" "Sleepwalker." "Ваза с вишнями."
 "Гигантский механический осьминог извергает пламя из своих щупалец." "Это инструкция к предыдущей версии этой игры." "Это набор неинтересных натуральных чисел." "Это установочный компакт-диск SIMS." "Это куча винных пробок." "Старая керасиновая лампа." "Большая куча резинок." "Автоматизированный робот-ненавистник. Он неодобрительно смотрит на тебя." "Озабоченность поиском собачки мешает вам продолжить расследование." "Чье-то незавершенное творчест" "Копия книги с незавершенной главой об алгоритмах поиска собаки.." "Просто швейцарские часы которые идут в обратную сторону." "Это десятый ключ, который вы нашли за все время поисков." "Вы нашли первый ключ, только вот что он открывает?" "Нижнее белье пришельца:D" "Просто немного злости." "Интерпретатор JAVA." "Байт код, кого же он байтит?)" "Лизин, незаменимая аминокислота. Ну, может, не для роботов." "Тетрациклин." "Бинт для перевязки основания лба." "Банановый сок." "Мировой вакуум." "X-FILES." "Маленький чайник, короткий и толстый." "Если это одно, это не другое." "Здесь большая катушка веревки." "Обогащенный диоксид урана." "За тобой что-то есть." "Обернись!" "АЭС" "Это дядя доктор Хуркамур!" "Лох-несское чудовище." "+ еще один ключик." "256-килобайтный чип памяти только для записи."
 "Будущее близко.." "Ты кто?" "Иванов Иван Иванович." "Радио шипит." "Вы на какой частоте?" "Мааааааленькая блоха." "Это шоссе Уилла Роджерса. Кто такой Уилл Роджерс?" "Вы нашли рыбу! Не то чтобы это принесло вам много пользы в этой игре." "Кто меня создал?" "Hack me$" "Do you know who are CLAY?" "CLAY - clowns laugh at you :)" "You aren't the Mr.Robot, pls, stop." "Вы нашли поводок собаки ;)" "Это ведро воды." "Яблоко, упавшее на голову Ньютона, это ведь и вправду оно?" "A marijuana." "Футбольный мячик." "Вы видите снежинку, которая медленно тает." "Дорожка морфина, но обязательно нужен субаксон." "Это медный фонарь на батарейках." "Это нос Ричарда Никсона!" "Отвертка." "Молоток с гвоздями, используйте по назначению." "Мешок с дверными ручками." "Двери в новый мир." "Здесь дремлет стадо диких кофейных кружек." "Бутылка пива." "Летучая мышь, больна коронавирусом, будь осторожен!" "Тюбик зубной пасты. Жаль, что у тебя нет зубов." "Эй, держу пари, ты думал, что это собака." "Ржавый лом." "Цепочка, свисающая с двух столбов, напоминает вам арку ворот." "Снежный человек." "Это не то что вы ищете." "Планета ЗЕМЛЯ, под ней 3 кита, а под ними слоны, и ещё говорят, что она плоская!" "Ошейник собаки." "Это древний моряк, и он останавливает одного из трех." "Это неправильный номер." "Кузнечик." "Древний ноутбук с интегрированной видеокартой." "Микровалновка." "Карибские острова есть и в нашей стране." "Это бизнес-план для нового стартапа, dog.net." "Это облако в форме вола." "Куски битых глиняных голубей разбросаны повсюду." "Неужели ты программист?" "Вы нашли собаку! Нет, просто шучу." "Это поездка в Хогвартс." "Волшебная палочка Гарри Поттера." "Беги, просто беги!"
 "Вы чувствуете себя странно неудовлетворенным." "Просто копия Камасутры с автографом." "Типичный индийский сериал, лучше не начинай смотреть." "Вы найдете яркую блестящую копейку." "Да это же Геральд из Ривии!!" "Это камень, не опрокинутый." "Старый гелентваген." "Увы, ваше время вышло.. Да ладно, шутка:D" "Псс, говорят он где-то рядом." "Проверь слева, он точно там." "Вывеска гласит: «Иди домой!»" "ХНУРЭ учит с 0, правда же?" "Это тернии, звезды дальше." "Старый ржавый револьвер." "Твоя любимая игра." "Ионосфера кажется заряженной смыслом." "Книга с надписью «Не паникуй» большими дружескими буквами на обложке." "Гейзер распыляет воду высоко в воздух." "Механическая коробка передач." "Здесь выступает робот комик. Вы чувствуете себя удивленным." "Нет, это не копия игры 'robotfindskitten', это оригинал игры 'robotfindsdog'!" "Памятник Ленину." "Кому выгодна декомунизация?" "Чечевица." "Это капля серой слизи." "Кто эти люди, что правят нами и нашим миром?" "А ты смотрел фильм про Кевина Митника??" "А что, если я скажу тебе что Бог есть?" "Новый вид противостояния враждующих стран мира сего - кибервойна." "010." "Сможешь понять машинный код?" "Как навести мировой порядок - мысли перфекциониста.." "Я знаю, как заставить тебя уйти в дебри собственных раздумий." "Почему мировая элита жаждет войн?" "Много ничего." "Тут бомба, убегай скорее!" "Портфель с шпионскими штучками." "Тюрьма, люди в которой не замечают собственного умо?заключения." "Ах, мундир эпохи Революции." "Все мы в поисках чего-то, а ты купи слона?" "Капуста." "Это крупа, покрытая карманным пухом." "Перо, испачканное в чернила синего цвета." "Покерклуб." "Волшебная ... волшебная вещь." "Жак Фреско - гениален?"
 "Это Медные Узлы Вселенной." "Чей-то потерянный носок." "Две огромные каменные ноги без туловища." "Это сообщение, ничего более." "Кто умнее, робот или человек?" "Что эта синяя штука делает здесь?" "Это место называется Антарктида. Здесь нет собаки." "Будьте осторожны! Восклицательные знаки!" "Это ошибка." "Паника ядра." "Белай роза." "Это горизонт. Теперь это странно." "Это голограмма разбитого вертолета." "Будни ламмера." "Два магнита цепляются друг за друга в темноте." "Это красный степлер." "Бармен рычит: «Роботы запрещены!»" "Имеет ли смысл жизнь?")
export speech_map=( )

export space="space"
robot="#"
field_x=80
field_y=20
export map=( )

bold_font="\033[1m"
color_arr=("\033[31m" "\033[32m" "\033[33m" "\033[34m" "\033[35m" "\033[36m" "\033[37m"
		"\033[31m" "\033[32m" "\033[33m" "\033[34m" "\033[35m" "\033[36m" "\033[37m"
			"\033[31m" "\033[32m" "\033[33m" "\033[34m" "\033[35m" "\033[36m" "\033[37m")
colors=()
count_elements=0
end_color="\e[0m"

process=0
robot_location=0
export dog_location=0

robot_y=0
robot_x=0
future_robot_y=0
future_robot_x=0

check_size &

echo -en "Generation map, please, wait..."

while (( $robot_y > 19 || $robot_y < 2 )); do
	robot_y=$RANDOM
done

while (( $robot_x > 78 || $robot_x < 2 )); do
	robot_x=$RANDOM
done

check_size &

for (( i=0; i<${field_y}; i++ )); do
	clear
	echo -n "Generation map, please, wait..."
	wait
	echo -n "${process}%"
	for (( q=0; q<${field_x}; q++ )); do
		check_size &
		if (( $robot_y == $i && $robot_x == $q )); then
			map+=(${space})
			speech_map+=("${space}")
			(( robot_location=$i*${field_x}+$q ))
			continue
		fi
		random_num=${RANDOM}
		while (( ${random_num} > 200 )); do
			let "random_num=$RANDOM"
		done
		if (( ${random_num} <= 1 )); then
			random_num=$RANDOM
			while (( ${random_num} > ${#symbols_arr[*]} )); do
				let "random_num=$RANDOM"
			done
			map+=("${symbols_arr[${random_num}]}")
			rund_speech
			#random_speech=$RANDOM
			#check=false
			#while (( !${check} )); do
				#while (( ${random_speech} >= ${#speech_arr[*]} )); do
					#random_speech=$RANDOM
				#done			
					#check=true
					#for arg in ${!speech_map[@]}; do
						#if [[ "${speech_map[$arg]}" == "${speech_arr[${random_speech}]}" ]]; then
							#check=false
							#break
						#fi
					#done
					#if ${check}; then		
						#break
					#fi
			#random_speech=$RANDOM		
			#done
			#speech_map+=("${speech_arr[${random_speech}]}")
			(( count_elements+=1 ))
		else
			map+=("${space}")
			speech_map+=("${space}")
		fi
	check_size &
	done
	let "process+=5"
done
clear
echo -n "Generation map, please, wait...99%"
sleep 0.9s

check_size &

set_dog

#setranddog=$RANDOM
#isitspace=true
#while (( ${setranddog} >= ${#map[*]} || ${isitspace} == true )); do
	#if (( ${setranddog} < ${#map[*]} )); then
		#if [[ "${map[${setranddog}]}" != "${space}" ]]; then
			#isitspace=false
			#dog_location=${setranddog}
			#speech_map[${dog_location}]="${map[${dog_location}]}"
			#break
		#fi	
	#fi
	#setranddog=$RANDOM
#done

check_size &

for (( v=0; v<${count_elements}; v++ )); do
	rand_color=$RANDOM
	while (( ${rand_color} >= ${#color_arr[*]} )); do
		rand_color=$RANDOM
	done
	colors+=("${color_arr[${rand_color}]}")
done

clear
echo -n "Generation map, please, wait...${process}%"

sleep 0.9s

clear

Button=""
r=0

(( count_elements-=1 ))

for (( my=0; my<${field_y}; my++ )); do
	for (( mx=0; mx<${field_x}; mx++ )); do
		if (( $robot_y == $my && $robot_x == $mx )); then
			echo -en "${bold_font}\E[${my};${mx}f${robot}"
			(( count_elements-=1 ))
			continue
		fi
		r=$((${my}*${field_x}+${mx}))
		if [[ "${map[${r}]}" == "${space}" ]]; then #!!!
			echo -en "\E[${my};${mx}f "
			continue
		fi
		echo -en "${bold_font}${colors[${count_elements}]}\E[${my};${mx}f${map[${r}]}${end_color}"
		(( count_elements-=1 ))
	done
done

check_size &

echo -en "\E[22;2fWASD - move, Q - quit"
echo -en "\E[${robot_y};${robot_x}f"

while [[ "${Button}" != "q" ]]; do
	read -s -t 1 -n 1 Button
	r=0
	case $Button in
		[wW]) 
			(( future_robot_y=${robot_y}-1 ))
			(( future_robot_x=${robot_x} ))
			;;
		[sS])
			(( future_robot_y=${robot_y}+1 ))
			(( future_robot_x=${robot_x} ))
			;;
		[aA])
			(( future_robot_y=${robot_y} ))
			(( future_robot_x=${robot_x}-1 ))
			;;
		[dD])
			(( future_robot_y=${robot_y} ))
			(( future_robot_x=${robot_x}+1 ))
			;;
		[qQ])
			Button="q"
			continue;;
		*)
			continue;;
	esac

	if (( ${future_robot_y} > ${field_y}-1 || ${future_robot_y} < 0 || ${future_robot_x} > ${field_x}-1 || ${future_robot_x} < 0 )); then
		echo -en "\E[${robot_y};${robot_x}f"
		continue
	fi

	(( r=${future_robot_y}*${field_x}+${future_robot_x} ))

	if [[ "${map[${r}]}" == "${space}" ]]; then
		echo -en "\E[${robot_y};${robot_x}f "
		robot_y=${future_robot_y}
		robot_x=${future_robot_x}
		echo -en "\E[${robot_y};${robot_x}f${robot}"
		echo -en "\E[${robot_y};${robot_x}f"
	elif (( ${r} == ${dog_location} )); then
		space_arr=("      " "    " "  " "")
		for (( z=0; z<4; z++ )); do
			crd_x=2
			(( crd_x+=z ))       
			echo -en "\E[23;0f                                                                                                                                "
			echo -en "\E[23;${crd_x}f${robot}${space_arr[${z}]}${speech_map[${r}]}"
			echo -en "\E[23;${crd_x}f"
			sleep 1
		done
		echo -en "\E[23;0f                                                                                                                                "
		echo -en "\E[23;${crd_x}fПоздравляю, вы нашли собаку :D"
		sleep 3
		Button="q"
	else
		#echo -en "\E[${future_robot_y};${future_robot_x}f${map[${r}]}"
		echo -en "\E[23;2f                                                                                                                                "
		echo -en "\E[23;2f${speech_map[${r}]}"
		echo -en "\E[${robot_y};${robot_x}f"
	fi
done
clear
