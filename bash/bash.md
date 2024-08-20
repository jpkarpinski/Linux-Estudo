
# BASH

Bash nada mais é do que um shell, toda vez que abrimos o terminal e usamos algum comando ou algo do tipo nós estamos interagindo com o shell,
o shell nos permite entrar com comandos e apresenta o resultado desses comandos.

A maioria das distros linux hoje em dia usam o BASH como o seu principal shell.

Bash script e um arquivo de texto usado para automação com mais de um comando dentro del, executando os comandos como se estivesse dentro do
terminal.

Algo importante de se colocar em cima de todo script bash é algo conhecido como shebang "#!/bin/bash", ele serve para "entrar" no terminal bash
para poder executar os comandos bash.

Shebang: primeira linha de qualquer script onde diz para o script qual interpretador deve ser usado, no nosso caso o bash, mas poderia ser outro
como até mesmo o proprio nodejs.

# Vars

Scripts bash para referenciar uma variavel dentro de uma string essa string precisa ser double quotes.
Ex: echo "My age is $myvar"

se o mesmo exemplo acima fosse feito com single quotes ('') ele teria printado "echo 'my age is $myvar'" ao invez do valor real da variavel $myvar.

Subshell faz com que seja possivel executar um comando no background, e com isso pegar o resultado do comando o salvando em uma variavel:
Ex: myvar=$(ls)