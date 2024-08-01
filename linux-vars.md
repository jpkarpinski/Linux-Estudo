
# Variaveis Linux Env e $PATH

Para visualizar todas as variaveis globais ou variaveis de ambiente linux basta usar um dos comandos:
- printenv
- env

Para printar uma variavel de ambiente em especifico basta usar um dos comandos abaixo:
- echo $NOME_VARIAVEL
- printenv NOME_VARIAVEL

Ex: echo $PATH

Variaveis locais: Variaveis locais são um tipo especifico de variavel que possui as mesmas propriedades de uma variavel de ambiente
como poder armazenar outras variaveis, usar subshell com resultado de comandos e por ai vai, porem a diferença e que as variaveis locais
só vão existir de maneira temporaria e assim que se abre um novo terminal, seja ele com o comando "bash" ou abrindo uma nova instancia de terminal
manualmente, estas variaveis não vão estar criadas, por isso o nome variavel local já que elas somem a cada bash aberto ou apos reiniciar o sistema.

Para se criar uma variavel local:
Ex: 
    - $ myvar="minha variavel"  
    - $ myvar=$PATH:.
    - $ myvar=$(ls -l /etc) # subshell

Para printar uma variavel local é igual uma variavel de ambiente, a diferença é que geralmente variaveis locais são ou devem ser criadas usando
letras minusculas para não ter a possibilidade de sobrescrever uma variavel global importante e acabar quebrando algo no sistema.

Variaveis globais (env): As variaveis globais são variaveis criadas em maiusculo e que geralmente são permanentes no sistema, podendo serem acessadas
de qualquer terminal, a qualquer hora e não podem ser perdidas apos a reinicialização do sistema ou algo do genero.

Para se criar uma variavel local basta acessar o script .bashrc usando por exemplo "nano .bashrc", este script geralmente fica na pasta home do 
usuário (~), acessando este arquivo basta colocar em qualquer lugar a conotação "export NOME_VAR=VALOR", depois disto basta reiniciar o arquivo com
"source .bashrc" e pronto, a variavel global está criada para ser acessada em qualquer lugar até mesmo usando o comando "printenv"

É possível referenciar variaveis tanto em comandos como "ls -l $HOME" quanto em scripts BASH.

PATH: A variavel PATH é onde se guarda possíveis caminhos de arquivos binarios executaveis, por exemplo os comandos linux, todos eles são arquivos que
seus caminhos de executaveis são referenciados dentro de PATH como "/usr/bin" ou "/usr/local/bin", cada caminho dentro de PATH é separado por ":"
ficando "/usr/bin:/usr/local/bin", e eé por conta do PATH que é possível executar comandos como "ls" em qualquer local no terminal linux, se não ao
invez disso teriamos que referenciar o arquivo como por exemplo "/usr/bin/ls" (which ls printa o local de execução do comando).

É possível modificar a variavel $PATH para adicionar os seus proprios caminhos de binario, e isso é bem comum em administradores de sistemas linux
criarem uma pasta em seus diretorios home com o nome de "bin" e salvar os arquivos executaveis la dentro, e depois referenciar esse caminho de 
arquivos executaveis dentro de $PATH, para fazer isso e de forma permanente basta modificar o $PATH dentro do ".bashrc" ficando "export PATH=$PATH:/home/bin", modificando permanentemente a variavel para ser um dos caminhos de executaveis a serem olhados quando se roda um comando.

Também é possível fazer a modificação de $PATH de maneira local/temporaria porem geralmente quando se modifica essa variavel é para ser de forma
permanente.