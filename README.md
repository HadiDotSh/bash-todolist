# Bash ToDoList

#### A very useful script allowing you to create your own ToDoLists.
<p>Create modern and easy to-do lists in CLI, add importance to to-do's, simply indicate that they are completed and finalize as many lists as possible!</p>

### Install:

```bash
git clone https://github.com/HadiDotSh/bash-todolist && cd bash-todolist && bash install.sh

# Then, add an alias to your bashrc/zshrc file :

vim ~/.bashrc   # Or ~/.zshrc
# And add :
alias todo="bash ~/.todo/bash-todolist.sh"
# Save and exit the file, then reload your bashrc or zshrc :
source ~/.bashrc # Or ~/.zshrc
```

### Create Your Own ToDoList :

<p>Go on your shell then type :</p>

```bash
todo add ${NameOfTheToDoList}
```

<p>Then use the shortcuts to add some to-do, add importance, show as completed ... </p>

### Shortcuts:
<p>To use in your lists:</p>

```diff
Use the arrows to move
n                        Add a new to-do
r                        Remove a to-do
i                        Show as important
c                        Show as completed
e                        Exit
```

### Arguments:
<p>To be used in the shell:</p>

```diff
help               Show brief help
add                New ToDoList
remove             Delete a ToDoList
list               List all your todolist
```