#! /bin/bash
# Bash Todolist
# By @HadiDotSh

TODO_FOLDER="${HOME}/.todo"

trap ctrl_c INT
function ctrl_c() {
  tput cnorm
  tput rc
  tput ed
  printf "\r\e[0;91mx \e[0m\e[1;77mGood Bye!                                                               \e[0m"
  echo
  exit
}

while [[ ! -z "$*" ]];do

    if [[ "$1" == "help" ]];then
        printf "\e[0;92m✓ \e[0m\e[1;77mBash ToDoList\e[0;96m [By @HadiDotSh]\e[0m"
        printf "\n"
        printf "\n\e[1;77mArguments :\e[0m"
        printf "\n\e[1;92mhelp            \e[0m\e[1;77mShow brief help\e[0m"
        printf "\n\e[1;92madd             \e[0m\e[1;77mNew ToDoList\e[0m"
        printf "\n\e[1;92mremove          \e[0m\e[1;77mDelete a ToDoList\e[0m"
        printf "\n\e[1;92mlist            \e[0m\e[1;77mList all your todolist\e[0m"
        printf "\n"
        printf "\n\e[1;77mShortcuts  :\e[1;96 [When you are on a ToDoList]m\e[0m"
        printf "\n\e[1;92mUse the arrows to move\e[0m"
        printf "\n\e[1;92mn                     \e[0m\e[1;77mAdd a new ToDo\e[0m"
        printf "\n\e[1;92mr                     \e[0m\e[1;77mRemove a ToDoe[0m"
        printf "\n\e[1;92mi                     \e[0m\e[1;77mShow as important\e[0m"
        printf "\n\e[1;92mc                     \e[0m\e[1;77mShow as completed\e[0m"
        printf "\n\e[1;92me                     \e[0m\e[1;77mExit\e[0m"
        printf "\n"
        printf "\n\e[0;92m? \e[0m\e[1;77mMore information\e[0;96m on the github page.\e[0m"
        echo
        exit
        
    elif [[ "$1" == "add" ]];then
        shift
        if [ -f "$1" ]; then
          printf "\r\e[0;91mx \e[0m\e[1;77m${1} Already Exist ! \e[0m\n"
        else
          touch "${TODO_FOLDER}/${1}"
          printf "\n\e[0;92m✓ \e[0m\e[1;77m\"${1}\" added \e[0m"
          printf "\n\e[0;92m✓ \e[0m\e[1;77mType \"todolist ${1}\" \e[0m\n"
        fi
        exit

    elif [[ "$1" == "list" ]];then
        shift
        printf "\e[0;92m? \e[0;90mHere is your todos :\n\e[0m"
        ls "${TODO_FOLDER}"
        exit

    elif [[ "$1" == "remove" ]];then
        shift
        if [ -f "$1" ]; then
          rm "${TODO_FOLDER}/${1}"
          printf "\n\e[0;92m✓ \e[0m\e[1;77m\"${1}\" removed \e[0m\n"
        else
          printf "\r\e[0;91mx \e[0m\e[1;77m${1} Not Found! \e[0m\n"
        fi
        exit

    else
      if [ -f "$todoname" ]; then
        printf "\r\e[0;91mx \e[0m\e[1;77m${1} Not Found!\e[0m\n"
        exit
      else
        break
      fi
    fi
    
done

tput civis

selected=1
todoname="$1"
display() {
  printf "\r\e[0;92m✓ \e[0m\e[1;77m%s                                \e[0m" "$todoname"
  i=1;
  testtodo=$(cat "$TODO_FOLDER/$todoname")
  for todoitem in $testtodo
  do

    todoitem=$( sed -n "$i"p "$TODO_FOLDER/$todoname" )
    if [ -z "$todoitem" ]; then
      break
    fi

    if [[ $selected == "$i" ]] && [[ $todoitem == *"#"* ]]; then
      printf "\n\r\e[1;96m>\e[1;90m %s                             \e[0m" "$todoitem"
    elif [[ $selected == "$i" ]] && [[ $todoitem == *"!"* ]]; then
      printf "\n\r\e[1;96m>\e[1;91m %s                             \e[0m" "$todoitem"
    elif [[ $todoitem == *"#"* ]]; then
      printf "\n\r\e[1;90m  %s                             \e[0m" "$todoitem"
    elif [[ $todoitem == *"!"* ]]; then
      printf "\n\r\e[1;91m  %s                             \e[0m" "$todoitem"
    elif [[ $selected == "$i" ]]; then
      printf "\n\r\e[1;96m> \e[0m%s                             \e[0m" "$todoitem"
    else
      printf "\n\r  %s                                   " "$todoitem"
    fi

  i=$((i + 1));
  done

  tempi=$i
  if [[ $selected == "$tempi" ]] || [[ $selected == 0 ]]; then 
    selected=1
    tput sc
    for (( testi=1; testi<i; ++testi)); do
      tput cuu1
      tput sc
    done
  else
    tput sc
    for (( testi=1; testi<i; ++testi)); do
      tput cuu1
      tput sc
    done
  fi

}

pressenter () {
  printf "\r                                                                            "
  for (( clearenter=1; clearenter<i; ++clearenter)); do
  printf "\n\r                                                                             "
  done
  tput rc
  tput sc
  tput ed
  return
}

importance () {
    if [[ $addex == *"!"* ]]; then
    newaddex=$( echo "$addex" | sed 's/! //' )
    sed "s/^$addex/$newaddex/g" "$TODO_FOLDER/$todoname" > temp.txt
    mv temp.txt "$TODO_FOLDER/$todoname"
    else
    sed "/$addex/ s/^/! /" "$TODO_FOLDER/$todoname" > temp.txt
    mv temp.txt "$TODO_FOLDER/$todoname"
    fi
}

completer () {
    if [[ $addex == *"#"* ]]; then
    newaddex=$( echo "$addex" | sed 's/# //' )
    sed "s/^$addex/$newaddex/g" "$TODO_FOLDER/$todoname" > temp.txt
    mv temp.txt "$TODO_FOLDER/$todoname"
    else
    sed "/$addex/ s/^/# /" "$TODO_FOLDER/$todoname" > temp.txt
    mv temp.txt "$TODO_FOLDER/$todoname"
    fi
}

keyboardinput () {
while true
  do

  read -r -sn1 t
  if [[ $t == A ]]; then #GO UP
    selected=$((selected - 1))
    display

  elif [[ $t == B ]]; then #GO DOWN
    selected=$((selected + 1))
    display

  elif [[ $t == "n" ]]; then #ADD A TODO
  pressenter
  read -r -p $'\r\e[0;92m+\e[0m\e[1;77m Todo\'s Name : \e[0;96m' newtodo
  if [ -z "$newtodo" ]; then
      tput rc
  else
  tput rc
    echo "$newtodo" >> "$TODO_FOLDER/$todoname"
    selected=1
  fi

  elif [[ $t == "r" ]]; then #REMOVE A TODO
  pressenter
  sed "$selected"d "$TODO_FOLDER/$todoname" > temp.txt
  mv temp.txt "$TODO_FOLDER/$todoname"
    selected=$(( $selected -1 ))

  elif [[ $t == "i" ]]; then #ADD/REMOVE IMPORTANCE
  pressenter
  addex=$( sed -n "$selected"p "$TODO_FOLDER/$todoname" )
  importance

  elif [[ $t == "c" ]]; then #ADD/REMOVE COMPLETED
  pressenter
  addex=$( sed -n "$selected"p "$TODO_FOLDER/$todoname" )
  completer

  elif [[ $t == "e" ]]; then #EXIT
  tput cnorm
  tput rc
  tput ed
  printf "\r\e[0;91mx \e[0m\e[1;77mGood Bye!                                                               \e[0m"
  echo
  exit
  fi

display
done
}

display
keyboardinput
