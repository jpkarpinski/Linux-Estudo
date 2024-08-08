
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

# Text Editors

Os dois editores de texto utilizados por padrão no linux são Nano ou Vim, geralmente em servidores não se tem acesso a editores como o vscode, então
o ideal é usar um dos dois lstados acima.

Nano geralmente é minimo e pequeno sendo bem mais rapido de aprender, ja o Vim é mais robusto e demora bem mais para aprender a usa-lo.

Caso va para o vim existe o comando "vimtutor" para dar uma visão geral de como se usa o vim.

Para usar o nano basta digitar "nano <nome_arquivo>", se o arquivo já existir ele vai abrir o arquivo para edição e se não existir ele vai abrir um tela de interação que após salvar ele vai criar o arquivo.
(Em caso de editor de código a melhor forma e usar um terminal comum ao invez do integrado do vscode, alguns comandos rodam apenas nele)

Principais Comandos Nano dentro do editor:

CTRL + S ou CTR + O para save, sendo o CTRL + O para salvar o arquivo com um nome especifico
CTRL + X para sair do Terminal
CTRL + W para pesquisar por alguma palavra ou termo no arquivo, após digitar qual é a palavra dar Enter

Para copiar um texto:
CTRL + 6 para definir uma marca no local do cursos, depois deve andar com o cursor usando as setinhas do teclado, apos selecionar oque quer copiar
basta dar ALT + 6 para copiar o texto, e por fim o comando CTRL + U para colar o texto

ALT + U para voltar apos algum erro (Igual CTRL + Z)

Para abrir o manual do Nano basta usar o comando CTRL + G

Mias informação:
 - https://www.nano-editor.org/dist/latest/cheatsheet.html

# Grep && Sed

Grep: Global Regular Expression Print, usado para achar padrões de texto em arquivos unicos ou multiplos arquivos.

Exemplo basico: grep "teste" arquivo.txt (Retorna todas as linhas que resultam no termo pesquisado)
"grep -n" para tambem saber o numero da linha em que o termo aparece
"grep -r <diretorio>" para pesquisar o termino por um diretório, também é possível juntar ele com o -n para saber a linha

Exemplo: "grep -rn "teste" ."

É possível usar o grep com regEx ficando desta forma: grep "^app" arquivo.txt

Outra função util para o grep é achar erros em arquivos de log, por exemplo para contar os erros em um arquivo de log:
grep -c NullPointerException SomeErrorLog.txt

Ao contra ponto do Grep pode ser util também ter que modificar os textos encontrados dentro de um arquivo, que nem substituir todas as palavras "mãe"
de um texto para as de "pai".

Sed também pode ser usado com regEx igual: sed "s/app/pap/" arquivo.txt

o "s" que aparece de inicio é usado como "substitution", para substituir um texto pelo outro, logo apos vem o termo que deve-se buscar e o termo que vai substituir o termo buscado

por fim para substituir é so falar em qual local esse texto vai ser inserido, ficando assim: sed "s/app/pap/ arquivo.txt > arquivo.txt"

Sed pode pesquisar qualquer Stream Text, até mesmo as do comando echo:
(Pipes servem para executar um comando junto a outro)
echo "jeff" | sed "s/j/m/g"

O comando acima pega os dados de retorno de echo e usa o sed para transformar a palavra "jeff" em "meff"

Outro exemplo de substituição de texto é após a leitura de um arquivo com o comando "cat", por exemplo:
cat arquivo.txt | sed 's/teste/TESTE/g'

Também é possível até mesmo combinar um output do sed para outro sed, ficando dessa forma o exemplo acima: 
cat arquivo.txt | sed 's/teste/TESTE/g' | sed 's/app/APP/g'

E por fim para o sed de fato reescrever um arquivo basta usar a flag "-i" da seguinte forma:
sed -i 's/APAGAR//' arquivo2.txt (para rodar o exemplo novamente insira a palavra APAGAR no arquivo2.txt)

Outras coisas a se levar em consideração sobre o sed é que ele só aplica o filtro configurado apenas no primeiro termo de cada linha, caso
houver mais casos da palavra a ser substituida na mesma linha ele não vai substituir, para isso é necessário passar a subflag g(global) ficando
assim em um exemplo:

Mais informação:
 - https://www.hostgator.com.br/blog/como-usar-o-comando-sed-do-linux/
 - https://www.hostinger.com.br/tutoriais/comando-grep-linux
 - https://www.cyberciti.biz/faq/searching-multiple-words-string-using-grep/

# Process Management 

No linux para ver os processos acontecendo no computador basta usar o comando "ps", porem o ps entrega poucas informações de processos no computador,
geralmente vão ser processos rodando no terminal especifico, para ver todos os processos basta rodar "ps -ef", entregando ainda mais informação como
por exemplo quem foi o usuário que startou o processo que está rodando, quanto de cpu está usando e etc.

Para matar um processo a primeira coisa que se deve fazer é pegar o ID do processo em que se quer finalizar, após pegar o PID (Process ID) basta
rodar o comando "kill <ID>", porem ele vai tentar matar o processo de uma maneira nao muito evasiva oque muitas vezes pode dar errado pois ele envia um sinal para o processo conhecido como "SIGTERM", porem para resolver isso basta usar a flag "-9" ficando "kill -9 205841" onde via enviar um sinal de "SIGKILL"

Outra forma de ver informação sobre os processos é usando o comando "top" onde mostra as informações em tempo real, como uso de memoria, processos sendo criados e etc.

E existe por fim a melhor forma de se gerenciar e verificar processos rodando no linux conhecido como o comando "htop" onde possui muitas funcionalidades como filtros, mecanismos de busca, possibilidade de ver o processo e seus PPID(Parent Process ID) e muitas coisas a mais e tudo em
tempo real.

# Cron Jobs

Cron é um time-based job schedular (agendador de trabalho baseado em tempo) para fazer trabalhos no background em uma data especifica (data e hora);

Ex: Dar backup da database todo dia em um horario especifico como 2 da manha

*OBS: Cron pode funcionar com diferentes tipos de script, por exemplo com bash ou nodejs*

Um agendamento CRON possui uma sintaxe de 5 caracteres iguais como =  * * * * * e serve como minutos, horas, dia do mes, mes, dia da semana.

Não é necessário calcular isso a mão pois existem ferramentas gratuitas online que ja te entrega o CRON, como por exemplo:
https://crontab.guru/

Script de exemplo para ser rodado dentro de um CRON está em cron-bash.sh

Comando: usando o comando realpath <nome_arquivo> é possivel adquirir o caminho ate o encontro do arquivo, oque se torna util para registrar uma
nova tarefa dentro do CRON tasks.

A primeira coisa a se fazer é rodar o servico do CRON, para isso basta usar o comando "sudo service cron start" e precisa ser com sudo.

Para adicionar uma tarefa ao cron basta editar o arquivo "crontab" para isso use o comando crontab -e onde vai abrir um editor de código para poder
adicionar uma nova tarefa.

Deve-se ser adicionado os caracteres especiais como "20 * * * *", depois o caminho de execução do arquivo e por fim o arquivo, ficando algo parecido
com o exemplo a seguir:
* * * * * /mnt/d/apps/linux-playground/hello.sh

Tambem é possivel adicionar o caminho do elemento em que vai executar o arquivo, por exemplo se fosse em node:
0 * * * * /usr/bin/node /home/usuario/scripts/meu_script.js >> /home/usuario/scripts/cron_output.log 2>&1

No exemplo acima também contem o caminho de qual elemento vai executar o script com "/usr/bin/node" e apos o ">>" tem em qual caminho vai o log de
erros do script adicionado dentro do crontab.

Para saber se um projeto dentro do crontab está rodando basta usar o comando sudo grep CRON /var/log/syslog ou sudo grep CRON /var/log/cron e
procurar pelo nome do script que está rodando.

Outra boa coisa a se fazer são usar ferramentas de HealthCheck para saber se os cron jobs estão sendo executados.

Mais informações:
 -- https://www.hostinger.com.br/tutoriais/cron-job-guia
 -- https://diolinux.com.br/tutoriais/entenda-o-que-e-cron-job.html

# Tag & Gzip

LZ77 é um tipo de algoritmo para compressão de arquivos que serve como base para o Gzip.

Gzip é usado para fazer com que os arquivos fiquem menores sem perder nenhum tipo de informação, esse processo é conhecido como "Lossless"

A primeira coisa a fazer é verificar o tamanho do arquivo original, é possivel ver isso com o comando "ls -lh".

No exemplo dentro de "gzip" com o arquivo "arquivo.txt" o seu tamanho original é de 1.1kb

para comprimir o arquivo basta rodar o comando "gzip <nome_arquivo>", dessa forma o arquivo de 1.1kb vira um arquivo de 48 bytes.

Para fazer com que o arquivo volte ao estado normal basta rodar o comando "gzip -d <nome_arquivo>".

Porem o Gzip não funciona para diretorios inteiros ou multiplos arquivos ao mesmo tempo, para isso se usa o comando "Tar", este comando possui a
utilizade principal de arquivar diretorios, fazendo com que eles ajam como se fossem um unico arquivo

"tar <flags> <nome-diretorio_pos_arquivar> <diretorio_para_arquivar>"
O comando basico para isso é "tar -cvf arquive.tar ./gzip/"

as flags -cvf:
- c: Create (Cria um novo arquivo do arquivamento)
- v: Verbose (lista exatamente oque esta arquivando, um log dos arquivos)
- f: usado para representar o nome do arquivo que vamos nomear após o diretorio ser transformado

Porem este comando por sí só não vai comprimir os arquivos, para fazer isso deve-se adicionar uma nova flag ao comando já mostrado anteriormente:
"tar -czvf archive.tar ./gzip/"

Mais informação:
 - https://www.hostinger.com.br/tutoriais/comando-tar-linux

# Package Management

Existem algumas maneiras de instalar pacotes no linux, entre elas estão a "FROM SOURCE" e "PACKAGE MANAGER".

A from source basicamente é puxar os arquivos da dependencia que quer instalar por exemplo com um git clone, e apos puxar os arquivos basta acessar
a pasta do arquivo e verificar se existe um arquivo chamado "Makefile", caso contenha basta abrir o terminal na mesma pasta/diretorio e rodar o
comando "make" para compilar para binario o comando ou pacote que queira instalar, após isso é possível executar este binario por exemplo como 
"/sl" (nome do binario).

Conteudo mesmo fazendo dessa forma ainda vai restar um problema que é o fato de que este binario não esta mapeado em $PATH, por isso não é possível 
acessa-lo em todos os lugares do terminal ou apenas rodar o comando "sl", para isso basta mover o arquivo binario que foi compilado para dentro da
pasta onde fica o binario dos usuários que seria "mv /.sl /usr/local/bin"

Existem outras formas de se instalar um pacote de maneira mais facil, a outra maneira seria o "Package manager", existem varios gerenciadores de
pacote:

based: distro linux baseado em algo

APT - Debian based
YUM/RPM - Redhat based
Pacman - Arch

Como o ubuntu é um sistema baseado em Debian ele vai rodar com o Package Manager de APT (Advanced Package Tool), alem disso um gerenciador de pacotes
possui um repositorio para os autores de software, para que o usuario final nao precise compilar o codigo fonte e instalar tudo manualmente.

Geralmente quando se roda um comando apt a primeira coisa é rodar o comando "sudo apt update" .

Esse comando vai geralmente dar fetch nos metadados mais recentes sobre os pacotes espalhados na internet (meio que atualizar a memoria do gerenciador de pacotes)

Para instalar o mesmo pacote via apt basta rodar o comando "sudo apt install sl" juntamente e anteriormente com o comando de update do apt, e vai dar
unpacking nos locais apropriados, podendo assim rodar o comandl "sl" em qualquer lugar do terminal.

*Entender por que utilizar o comando sudo apt update antes de instalar qualquer pacote*

Mais informação:
 - https://oktopus.cloud/blog/gerenciamento-de-pacotes-no-linux-rpm-yum-apt-get-dpkg
 - https://diolinux.com.br/video/lidar-gerenciadores-de-pacotes-no-linux.html

# Virtual Private Server

Categoria especial apenas para anotações de VPS

Linux File System:
    - https://www.youtube.com/watch?v=A3G-3hp88mo
    - https://www.linuxfoundation.org/blog/blog/classic-sysadmin-the-linux-filesystem-explained

Linux Permissions:
    - https://www.youtube.com/watch?v=4e669hSjaX8
    - https://www.youtube.com/watch?v=19WOD84JFxA
    - https://www.youtube.com/watch?v=07JOqKOBRnU (Sudo)
    - https://www.youtube.com/watch?v=FGRtNvKdtbk&t=506s (Sudo)
    - https://www.youtube.com/watch?v=jwnvKOjmtEA (Sudo)

Linux User Management:
    - https://www.youtube.com/watch?v=19WOD84JFxA&t=1300s
    - https://www.youtube.com/watch?v=GnlgAD8-GhE

$PATH:
    - https://www.youtube.com/watch?v=hk0RwVC6uts
    - https://medium.com/@linuxschooltech/what-is-the-path-variable-in-linux-and-unix-98267b7432b8

BASH:
    - https://www.youtube.com/watch?v=2733cRPudvI&list=PLT98CRl2KxKGj-VKtApD8-zCqSaN2mD4w

CronJob;
    - https://www.youtube.com/watch?v=7cbP7fzn0D8
    - https://www.hostinger.com.br/tutoriais/cron-job-guia

Code Transfer:
    - Via git com SSH para download de código
    - Dando build no código e puxando apenas o build com ferramentas de FTP ou via SCP

SSH:
    - https://www.cloudflare.com/pt-br/learning/access-management/what-is-ssh/

NGINX: 
    - https://www.youtube.com/watch?v=7VAI73roXaY
    - https://nginx.org/en/docs/beginners_guide.html 
    - É possível separar multiplos arquivos de configuração de aplicação no NGINX usando o caminho "/etc/nginx/sites-available" para
      salvar os arquivos de config, apos isso basta entar em "sites-enabled" e excluir o arquivo defaultm e depois o comando "ln -s /etc/nginx/sites-available/example /etc/nginx/sites-enabled/"

UFW (Firewall): 
    - https://serverspace.io/support/help/basic-commands-ufw/#:~:text=If%20you%20get%20a%20Status,all%20ports%20on%20the%20server.
    - https://www.hostinger.com.br/tutoriais/firewall-ubuntu-ufw
    - Sempre bom verificar as portas 443 e 80 para saber se o NGINX está livre para fazer seu trabalho
    - https://www.youtube.com/watch?v=-CzvPjZ9hp8

System CTL:
    - https://www.digitalocean.com/community/tutorials/how-to-use-systemctl-to-manage-systemd-services-and-units

SystemD: 
    - https://earthly.dev/blog/systemd/
    - https://www.digitalocean.com/community/tutorials/understanding-systemd-units-and-unit-files
    - "systemctl --type=service --state=running" para ver todos os servicos rodando

Env Variables:
    - https://www.freecodecamp.org/news/how-to-set-an-environment-variable-in-linux/
    - https://www.youtube.com/watch?v=ysUwmjrXG2M (com subshell)
    - https://www.youtube.com/watch?v=9ZpL8iDU7LY
    - Variaveis de ambiente também podem ser definidas de maneira global dentro do arquivo /etc/environment

Mount Volume:
    - https://www.youtube.com/watch?v=2Z6ouBYfZr8

Extras para servidor:
    - https://www.youtube.com/watch?v=DdoncfOdru8 (Docker)
    - https://www.youtube.com/watch?v=Os1AJhS2qvk (DNS)
    - https://www.youtube.com/watch?v=rIrNIzy6U_g (Docker)
    - https://www.youtube.com/watch?v=5hycyr-8EKs (Ansible)

R-Linux:
    - https://diolinux.com.br/sistemas-operacionais/r-linux-ferramenta-para-recuperar-dados-linux.html

Deploy:
    - https://www.youtube.com/watch?v=KFwFDZpEzXY
    - https://www.youtube.com/watch?v=GCznXfbfMq0

Load Balancer:
    - https://www.youtube.com/watch?v=v81CzSeiQjo
    - https://www.youtube.com/watch?v=bFZurhL14LA

SSH:
    - https://www.youtube.com/watch?v=YS5Zh7KExvE

Linux Process:
    - https://www.youtube.com/watch?v=WsR11EGF9PA
    - https://codeahoy.com/2017/01/20/hhtop-explained-visually/
    - https://www.youtube.com/watch?v=1R-uWs3bTYQ