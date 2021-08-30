#! /bin/bash
# By @HadiDotSh
printf "\e[0;92m- \e[0m\e[1;77mBash TodoList\e[0;96m [By @HadiDotSh]\n\e[0m"
mkdir "${HOME}/.todo"
mv "bash-todolist.sh" "${HOME}/.todo/bash-todolist.sh"
printf "\n\e[0;92m? \e[0m\e[1;77mInstallation Done. \e[0;92mDon't forget to add an alias to your bashrc or zshrc :\n\e[0;96malias todo=\"bash ~/.todo/bash-todolist.sh\"\n\n\e[0m"
