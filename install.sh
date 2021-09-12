#! /bin/bash
# By @HadiDotSh
ALIAS="alias todo=\bash ~/.todo/bash-todolist.sh"
printf "\e[0;92m- \e[0m\e[1;77mBash TodoList\e[0;96m [By @HadiDotSh]\n\e[0m"
mkdir "${HOME}/.todo"
mv "todolist.sh" "${HOME}/.todo/bash-todolist.sh"
printf "\n\e[0;92m? \e[0m\e[1;77mInstallation Done.\n\e[0m"
if [ -n "`$SHELL -c 'echo $ZSH_VERSION'`" ]; then
   ${ALIAS} >> ~/.zshrc
elif [ -n "`$SHELL -c 'echo $BASH_VERSION'`" ]; then
   ${ALIAS} >> ~/.bashrc
else
   prinf "\e[0;92mDon't forget to add an alias to your bashrc or zshrc :\n\e[0;96malias todo=\"bash ~/.todo/bash-todolist.sh\"\n\n\e[0m"
fi
