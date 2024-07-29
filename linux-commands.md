# SSH

Usado para se conectar com os outros servidores de forma segura via usuario@ip

Ex: ssh root@80.22.197.0

# LS

Lista todos os arquivos dentro de um diretório

flags:
    - l: lista os arquivos em formato de lista mostrando também a permissão dos arquivos em formato rwxrwxrwx
    - a: ver pastas e arquivos "escondidos", tipo arquivos que começam com .; ".env"

# PWD

Print Working Directory, serve para mostrar o caminho do diretório atual

# CD

Muda o diretório em que se encontra, usando "cd path" ou "cd .." para voltar um diretório

# TOUCH

Cria um arquivo usando "touch nome_arquivo"

Ex: touch arquivo.txt

flags:
    - d: especifica o dia em que o arquivo vai ser "criado", ex: "touch -d tomorrow CreatedFileTomorrow.txt"

# ECHO

Comando usado para printar algo, podendo ser uma string, uma variavel de ambiente e etc

Ex: echo $PATH

# NANO

Editor de arquivos de text, usado geralmente como editor de código.

Ex: nano main.js

# CAT e LESS

Printa oque está dentro do arquivo, usado geralmente para leitura rapida do conteudo do arquivo

Ex: cat arquivo.txt

Outra forma de se ler arquivos de pagina por pagina é o "LESS", uma forma mais gentil de se ler os arquivos

Ex: less arquivo.txt

# SHRED

Embaralha o conteudo de um arquivo, meio que o criptografando, util para se livrar de arquivos.

Ex: shred arquivo.txt

# MKDIR

Cria um novo diretório

Ex: mkdir -p diretorio1/diretorio2/diretorio3

flags:
    - p: cria uma sequencia de parent directories

# CP

Copia um arquivo especificando qual arquivo e para onde ele vai

Ex: cp arquivo.txt ./mynewdirectory/arquivo.txt

# MV

Move o arquivo para um outro diretório ou local, especifica qual arquivo e para onde ele vai

Ex: mv arquivo.txt ./mynewdirectory/arquivo.txt

# RM

Remove arquivos ou diretórios

Ex: rm -rf ./meudiretorio

flags:
    -rf: Apaga diretórios

# RMDIR

Comando especifico para remover um diretório

Ex: rmdir ./meudiretorio

# LN

Cria um simlink, um tipo de arquivo que aponto para outros arquivos ou diretórios criando um link entre eles

Existem hard e soft link, soft link apenas apontam para o arquivo e podem ser usados para diferentes locais de arquivos
e diretórios

Hard links criam copias dos arquivos e não podem apontar para diferentes file systems.

Ex: ls -s arquivo.txt linked.txt

flags:
    - s: Soft linking 

ref:
    - https://www.freecodecamp.org/news/linux-ln-how-to-create-a-symbolic-link-in-linux-example-bash-command/

# WHOAMI

Mostra qual usuário você está conectado

Ex: whoami

# USERADD ou ADDUSER

Cria um novo usuário no sistema linux 

Ex: useradd nick

Usando o ADDUSER é possivel passar mais parametros, como por exemplo a senha do usuário

Ex: sudo adduser austin (pede senha apos o comando)

ref:
    - https://guialinux.uniriotec.br/adduser/

# SU

Troca de usuário logado para outro

Ex: su nick

Existe tambem o "exit" para deslogar ou sair de outros locais

# PASSWD

usado para trocar ou criar uma senha para um usuário

Ex: sudo passwd nick

# APT

Gerenciador de pacotes de distribuições debian

Primeira coisa é atualizar o repositorio de pacotes do linux sempre antes de instalar um novo pacote

sudo apt update

e depois se instala um pacote

sudo apt install "pacote"

# FINGER

Este comando precisa ser instalado no linux para ser usado e serve para verificar os dados de um usuário

Ex: finger nick

# MAN

Usado como um manual para os comandos, digitando "man" e o nome do comando ele da uma leve documentação
do que o comando faz

Existe outra versão deste comando onde da uma abreviada no conteudo usando o "WHATIS", mostrando em uma linha
oque ele faz e para oque serve

Ex: whatis finger

# WHICH

Mostra onde certos comandos estão instalados, mas mostra apenas um dos locais onde o comando esta.

"locate a command"

Outra forma é o comando "WHEREIS" onde mostra todos os caminhos definitivos de um comando em uma ordem igual o $PATH funciona.

"locate the binary, source, and manual page files for a command"

Ex: whereis finger

# WGET

Baixa arquivos da internet

outra forma de se fazer download de arquivos é usando o comando "curl"

Ex: curl https://raw.githubusercontent.com/ > arquivodesave.txt

# ZIP e UNZIP

Comandos usados para diminuir o tamanho de um arquivo, fazendo um zip igual o winrar

Existem outros comandos e outras formas de se fazer isso como o "GZIP" e o "TAR", mas o zip é a forma
mais facil de se fazer.

Ex: zip arquivo.zip arquivo.txt
    unzip arquivo.zip

# CMP e DIFF

CMP compara para ver se os arquivos são os mesmos ou não porem ele não diz a diferença exata, no maximo o numero de linhas e bytes
diferentes.

Para ver as linhas e de fato as diferenças de um arquivo para o outro se usa o comando DIFF

Ambos funcionam da mesma estrutura

Ex: diff arquivo1.txt arquivo2.txt
    cmp arquivo1.txt arquivo2.txt

# FIND

Usado para encontrar arquivos, faz varredura em todos os diretórios se precisar, primeiro com o caminho de onde vai ser olhado e segundo
uma expressão ou nome do arquivo com a flag --name

Ex: sudo find / -name "nomearquivo*"

ref:
    - https://www.hostinger.com.br/tutoriais/find-locate-comandos-linux