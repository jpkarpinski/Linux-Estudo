
# Essential Commands

Comandos:
ls -- Lista todos o conteudo do diretorio atual
cd -- Mudar de diretorio (aperte TAB para automaticamente completar o resto do nome do diretorio)
pwd -- ver qual o caminho atual (fica salvo em uma variavel de ambiente chamada $PWD)
echo -- Enviar texto como um output no terminal
mkdir -- Cria um novo diretorio
touch <nome_arquivo> -- cria um novo arquivo no diretorio atual
rm <nome_arquivo> -- remove um arquivo
code <nome_arquivo ou diretorio> -- inicializa o vscode para poder digitar código
cat <nome_arquivo> -- le o conteudo do arquivo
cp <nome_arquivo> <nome_novo_arquivo> -- serve para copiar um arquivo
mv <nome_arquivo[]> <caminho_arquivo> -- copia um arquivo igual ao cp mas deleta o arquivo original
nano <nome_arquivo> -- serve para abrir o editor de texto do linux

Flags:
"-- help" em qualquer comando para aprender mais sobre ele e sobre suas flags

Anotações:
flags com "-" são flags encurtadas como "-s" e flags com "--" são flags de nome inteiro como "--size"

É possivel juntar mais de uma flag no mesmo comando como "ls -sS ou ls -s -S"

o comando "cd .." faz voltar um diretorio
voltar para o diretorio anterior "cd -"
voltar para o diretorio principal "cd ~"

ao usar "-p" em mkdir é possivel criar uma sequencia de parent directories como "mkdir teste/usuario/todos -p"

ao usar "rm -i" na hora de deleter algo ele vai perguntar se você tem certeza disso ou não

para apagar o diretorio e todos os sub-diretorios basta usar "rm -rf <nome_diretorio>"

e usar cat com -n é possivel ver o numero de linhas ao lado "cat linux-annotation.md -n"

# The File System

Para ir para o diretorio root basta entrar com o comando "cd /"

/bin: contem binarios dos programas executaveis como por exemplo o "ls" para listar o conteudo de diretorios

Toda vez que rodar ls ele vai em uma das pastas de binario e roda o programa com o mesmo nome, a depender do $path em que você
se encontra pode mudar o tipo de pasta com binarios pode ser acessada para rodar o programa

/sbin (system binaries): Também contem executaveis binarios mas só devem ser executados pelo usuário root, geralmente usado para
manutenção de sistemas.

/usr (user system resources): dentro deste diretorio tem varios recursos de sistema do usuário (geralmente end-user), e também possui
um diretorio bin, porem esses binarios dentro deste bin são considerados não essenciais, o sistema operacional pode ser administrado sem
precisar deles. 

/etc (editable text config): Arquivos de texto que podem ser utilizados para configurar o comportamento de outros programas dentro do
sistema operacional.

/home: diretorios pertencentes e divididos por usuários especificos, apenas o dono do diretorio ou o administrador do sistema podem ter
permissão nos arquivos listados dentro destas pastas de usuario.

/boot: Arquivos relacionados a inicialização do sistema incluindo o kernel linux.

/opt: programas opcionais como coisas da nvidia e etc não essencial para a instalação do OS.

/var: guarda dados de variaveis do sistema, os arquivos se modificam conforme o sistema operacional funciona 
(dentro de var tambem fica uma pasta com os logs do sistema)

/tmp: local onde ficam os arquivos temporarios do sistema, toda vez que desligar aqueles arquivos serão perdidos.

# $PATH Env Variable

Quando se executa um binario ele vai ver o comando e saber qual programa executar, porem como exemplo temos os binarios onde estão
localizados em 4 partes diferentes, sendo elas:
bin/ ls
sbin/ ls
usr/bin ls
usr/local/bin ls

Para o linux saber qual binario ele deve rodar ele armazena o caminho para determinado binario dentro de $path (path environment variable)

Quando se da um echo $PATH é possível ler a variavel, onde nos da uma serie de caminhos separados por ":", e isso fala para o linux onde
os programas executaveis estão localizados. Quando se executa um comando no terminal o sistema vai pesquisar atraves dos diretorios listados
dentro desta variavel de ambiente e executar o primeiro programa que corresponder ao comando.

Para verificar qual path vai ser utilizado em cada programa/comando que voce executar basta rodar "which <binario/comando/programa>" e ele vai
dar um echo em qual será o caminho para executar o programa

Porem se em algum momento quisermos por exemplo rodar uma diferente versão do "ls", nos podemos modificar o $PATH e colocar qual versão do ls queremos
em primeiro sob as outras, como por exemplo:

ls é executado em: /usr/bin/ls ou /usr/bin, para alterar isso basta colocar outro path que execute o ls antes de /usr/bin dentro de path:
/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin;

como o $path funciona em ordem de encontro, basta alterar para outro caminho do ls estar mais proximo do que o caminho original e pronto, pode ser
executado outro ls de outra pasta binaria.

Algo que pode ser util junto com o comando "which" é se por exemplo voce estiver rodando linux em um WSL e querer rodar um programa que tambem pode
ser instalado no linux, por exemplo o docker. Se voce tem docker instalado no windows quando vai usar ele no linux pode acabar tendo conflito por conta do $path entregar primeiro o docker do windows do que do linux, por isso sempre verifique com o "which" caso esteja em duvida de qual programa
vai ser verdadeiramente executado.

isso acontece por que o linux tem o armazenamento dos discos rigidos do windows tambem dentro dele, mais especificamente na pasta /mnt, essa pasta serve como um ponto de montagem para sistemas de arquivos montados momentaneamente, então os discos do windows são montados junto, oque permite ter
acesso a todos os arquivos dele tambem, podendo gerar conflito entre algo instalado diretamente no linux e algo instalado no windows.
(https://www.certificacaolinux.com.br/comando-linux-mount/#:~:text=J%C3%A1%20o%20diret%C3%B3rio%20%2Fmnt%20%C3%A9,est%C3%A3o%20com%20algum%20sistema%20montado.)


Uma maneira de alterar ou atualizar de maneira temporaria o $PATH é usando o comando "export PATH=my-custom-dir/bin:$PATH", porem dessa maneira
toda vez que o terminal for restartado essa modificação ira se perder. A outra maneira de fazer isso depende muito de qual é o Shell utilizado, se for
um BASH voce vai abrir o seu arquivo de configuração bash com cat ~/.bashrc e alterar por la o export PATH

# File Permissions

Todo arquivo e diretorio linux está associado com o owner (dono) e um grupo de usuarios, owner geralmente é quem criou o arquivo e o grupo é um
conjunto de usuários que compartilham os mesmos tipos de permissão para o arquivo, e existe tambem a terceira categoria conhecida como others que
serve para classificar usuarios que não estão no grupo e nem são donos do arquivo.

Para ver as permissões de um arquivo basta usar o comando "ls -l" e os primeiros digitos vão ser algo parecido com isso "-rwxrwxrwx", parece complicad
no começo mas basicamente esse monte de letra é dividida em 3 grupos ficando rwx(owner)-rwx(group)-rwx(others), onde R é read, W é write e X é execute
dizendo assim como cada grupo, usuario ou outros devem ter acesso ao arquivo, caso tenha um traço entre os caracteres por exemplo "rw-" significa que
o usuário daquele grupo (owner, group ou others) não tem acesso a determinada funcionalidade.

Uma forma de alterar a permissão de um arquivo é usando o comando chamado "chmod", onde sua anotação fica: "chmod [u/g/o][+/-/=][r/w/x][nome_arquivo]"
em um exemplo ele ficaria desta forma: "chmod go-wx arquivo.txt", onde vai remover as permissões de leitura e execução de arquivo dos groups e dos others.

chmod só funcionara no linux wsl se ele estiver dentro do sistema de arquivo linux, se for arquivos criados no windows ele não funcionara.

# Sudo

Todo diretorio e arquivo linux tem um dono, porem é possível trocar ou transferir quem é o dono do arquivo, geralmente se faz isso com o comando
"chown <usuario> <arquivo.txt>" (changes file owner), também é possível dar permissão para o usuário root (id = 0), porem quando for fazer esta permissão geralmente recebera um erro dizendo que a operação não foi permitida, apenas o usuário root ou usuários com o tal do SUDO privilege podem
ter este tipo de permissão.

*Root é um usuário especial geralmente com o ID de 0 e possui privilegios elevados do sistema linux. Podendo modificar e acessar qualquer arquivo ou configuração*

Mesmo logado como um usuário comum ainda é possível (caso tenha permissão) rodar comandos conhecidos como SUDO (Super User Do), onde é igual rodar
como administrador de um sistema windows, dando mais privilegios para comandos antes inacessiveis. Quando se roda um comando com sudo por exemplo
"sudo chown root foo.txt" ele vai pedir uma senha (geralmente da conta do usuário que está tentando usar o SUDO) antes de rodar o comando com 
privilegio elevado.

Na vida real a melhor coisa é remover qualquer tipo de autenticação via senha e deixar todo e qualquer tipo de acesso via ssh para uma maior segurança
e também é possível permitir apenas alguns usuários terem acesso ao SUDO via arquivo de configuração na pasta "/etc/sudoers"

Mais informações: 
 - https://mateusmuller.me/2019/11/06/sudo-guia-completo-do-comando-sudo-no-linux/
 - https://www.digitalocean.com/community/tutorials/how-to-edit-the-sudoers-file

# Bash Shell

A interface de linha de comando é chamada de Shell, e é chamado shell por que providencia uma camada de abstração entre o usuário e o sistema 
operacional, possuindo varias versões de Shell, a mais comum sendo o Bash, que pode tanto ser um terminal quanto uma linguagem de programação do
sistema operacional, geralmente usada para automatizar processos, outras opções de terminal muito boas também são ZSH e FISH.

Geralmente um arquivo de script bash começa com uma anotação chamada shebang com a seguinte sintaxe "#!<path/to/binary>" que aponta para o binario que
queremos usar para rodar o script escrito, onde geralmente vai ser o #!/bin/bash ou #!/usr/bin/bash (pode acabar sendo alterado em um sistema com windows).

Exemplos de bash script em: script.sh e bash_example.sh

Mais informação:
 - https://www.freecodecamp.org/news/bash-scripting-tutorial-linux-shell-script-and-command-line-for-beginners/#:~:text=A%20bash%20script%20is%20a,process%20using%20the%20command%20line.

# Bash Config

Existem varios arquivos de configuração para o terminal Bash onde cada um serve para uma coisa em especifico ou carregam as configurações de uma forma diferente, como por exemplo em um que carrega por login e o outro que carrega por criação de terminal novo. Geralmente se encontra esses arquivos na home do diretorio linux e são arquivos escondidos como "~./bashrc" e "~./bash_profile", como existem muitos arquivos e podem ficar ainda
mais complexos a maneira mais simples de editar o terminal é usando o "bashrc".

Para abrir o arquivo basta ir na home do linux e digitar "code ~/.bashrc"

Dentro do arquivo é possível fazer coisas como definir variaveis de ambiente, geralmente as variaveis ja sao definidas por padrão porem pode acontecer
que para rodar algum comando ela possa dar problema, e então sendo necessário mapear esse comando via Env na Path Env Variable.

Outra coisa muito util dentro de um arquivo de configuração bash é definir aliases de comandos, para fazer isto basta digitar no arquivo de config
a linha "alias ll='ls -alF'" onde vai adicionar um alias para o comando ls poder ser chamado dentro de um script bash como "ll"

E por fim é possível alterar o visual do terminal para deixa-los mais elegante, para fazer isto basta modificar uma variavel conhecida como PS1 que
fica dentro do arquivo de configuração. PS1 = Prompt String 1 determina oque voce ira ver antes de rodar comandos no terminal