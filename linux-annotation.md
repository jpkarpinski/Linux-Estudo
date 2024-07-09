
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