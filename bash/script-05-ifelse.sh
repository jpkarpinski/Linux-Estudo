#!/bin/bash

mynum=2000

# -eq = equal "="
# -ne = not equal "!"
# -gt = greater then
# -lt = less then
# ! faz o papel de inverter o valor igual toda linguagem
if [ ! $mynum -eq 2000 ]
then
    echo "The condition is true"
else
    echo "The variable does not equal 2000"
fi

# Valida se um arquivo existe ou não
# -f = checagem por um arquivo (se existe ou não) (diretorio = -d)
if [ -f ~/myfile ]
then
    echo "The file exists."
else
    echo "The file does not exist."
fi

# Which
#command=$(which htop)
#command=/usr/bin/htop
# Quando não se executa um teste dentro dos brackets [], voce pode remove-los e deixar apenas uma validação de sim ou não
# man test (para ver todas as opções de teste, -gt, -lt)
command=htop

if command -v $command # -f pode ser removido e validado apenas a string desse novo formato
then
    echo "$command is available, let's run it..."
else
    echo "$command is not available, installing it"
    sudo apt update && sudo apt install -y $command
fi

# Por fim executa o comando
$command