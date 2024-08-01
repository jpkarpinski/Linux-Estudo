
# Permissões de arquivos Linux (chown, chmod)

Comando geralmente usado para ver a permissão dos arquivos:
- ls -l

Permissões:

drwxrwxrw- usuario usuario arquivo.txt

A primeira letra da permissão indica se é um arquivo (-), um diretório (d) ou um link (l)

Após isso as letras rwx são divididas em 3 grupos, são eles em sequencia: Owner, Group e Others

r: Significa que é possível ler o conteudo deste arquivo por exemplo com o comando "Cat", isto em um diretório significa que é
possível ler os arquivos que estão dentro do diretório

w: Significa que é possível escrever ou reescrever os conteudos dos arquivos, isso em um diretório significa que é possível
colocar coisas dentro daquele diretório, como algum arquivo a mais e etc.

x: Significa que é possível executar aquele arquivo, igual um arquivo de script por exemplo, isso em um diretório significa que você
tem permissão para acessar o diretório, mudar meu diretório atual para dentro deste (ex: cd dir), porem ainda podera modificar ou ler
os arquivos de dentro do diretório, só não é possível acessa-lo diretamente.

É comum ver um usuário criar um arquivo e o nome do usuário ser o mesmo nome do grupo, geralmente quando se cria um usuário novo automaticamente
é criado um grupo de mesmo nome e o usuário é adicionado nele, ficando "usuario usuario"

Para alterar as permissões de um arquivo/diretório se usa o comando "chmod [u/g/o][+/-/=][r/w/x][nome_arquivo]"

As anotaçõs de chmod também podem ser feitas com numeros onde o r = 4, w = 2, x = 1.

"chmod 770 arquivo.txt" da permissão de rwx para usuarios e grupos e tira todas as permissões de others.

Alterar a permissão de tudo oque tem dentro de um diretório, apenas os arquivos, sem o diretório mudar:
- chmod 600 Downloads/* # Find command

Trocar o dono do arquivo:
- chown -R usuario Downloads/ # Root Level Access

Trocar o grupo do arquivo:
- sudo chown -R usuario:grupo Downloads/

# Sudo 

https://www.youtube.com/watch?v=07JOqKOBRnU

Sudo é usado para rodar comandos com privilegio aumentado, privilegio do usuário ROOT, como acessar certos tipos de arquivos ou executar
certas ações como ações que mexem com configurações do sistema, então geralmente se usa ou o usuário root ou o comando sudo para ter privilegios de root.

Para acessar o usuário root é possível fazer isso com o comando "su -", após isso deve-se digitar a senha do usuário root, se logando assim como o root e podendo rodar comandos com privilegio elevado.

Ex: apt update

Porem como ja dito antes o maior beneficio de se usar "sudo" e poder se livrar completamente do usuário root, transformando qualquer comando em uma
permissão:

Ex: sudo apt update 

O comando acima pode acabar pedindo senha da conta de usuário que está logado atualmente.

*Geralmente na maioria dos sistemas o usuário root é desabilitado para acesso via SSH por ser muito perigoso*

O Sudo é na verdade um pacote, e pode ser que a depender da distribuição linux ele não esteja instalado, tendo que usar um gerenciador de pacotes
para instalar, para verificar se o sudo esta instalado basta usar o comando "which sudo"

Sudo (ou wheel) é um tipo de grupo onde permite todos os usuários que estiverem dentro dele poderem rodar os comandos como se fossem o usuário root
e para verificar as configurações de permissão de grupos e usuários com relação aos tipos de comando basta ir no arquivo de configuração /etc/sudoers

Dentro do arquivo vai ter uma linha com as seguintes informações
%sudo ALL=(ALL:ALL) ALL

isso quer dizer que qualquer pessoa que faça parte do grupo sudo pode estar utilizando o comando sudo para ganhar permissão de root.

Para verificar o grupo de um usuário basta rodar "groups" ou "groups nome_usuario"

Para habilitar um usuário para dentro do grupo sudo basta rodar o comando como root "usermod -aG sudo nome_usuario" (Logar e deslogar apos definir grupos)

"sudo -l" mostra exatamente oque o usuário tem permissão ou não para fazer dentro do sistema.

Explicando anotação do sudoers:

root ALL=(ALL:ALL) ALL

Primeiro ALL é sobre as permissões de HOST, geralmente esta opção sempre fica em ALL e se trata de quem pode executar comandos dentro deste servidor.

Os ALL'S dentro do parenteses significam de qual usuário você quer ter acesso aos comandos, geralmente do usuário root. Por padrão sudo se passa
pelo usuário root, porem é possível se passar por outros usuários tambem, o primeiro ALL dentro do parenteses se referindo ao usuário que voce tem
permissão para se passar por ele, e o segundo ALL se refere ao grupo.

Por ser o usuario root no exemplo ele pode se passar por qualquer outro usuário ou grupo

E o ultimo ALL da lista se refere aos comandos em que o usuário tem permissão de executar, no caso do ROOT são todos os comandos, para modificar ou
adicionar apenas comandos especificos basta colocar o camnho completo do comando separado por virgula, ficando assim:

root ALL=(ALL:ALL) /usr/bin/ls,/usr/bin/cd

A forma correta de se editar o arquivo /etc/sudoers é atraves de um comando especifico, onde ele valida se o código dentro do sudoers pode acabar
quebrnado ou dando algum erro, pois a depender de como for modificado pode quebrar o servidor inteiro e se tornar irreparavel

Ex: sudo visudo

Caso na edição do arquivo sudoers aconteça algum erro usando o comando visudo ele vai fazer uma pergunta e esperar algumas opções, as opções mais
utilizadas são "e", "q" e "x"

e: Faz com que você volte ao editor de código para concertar o erro e dai poder salvar novamente.
q: Faz com que você salve mesmo com erro, oque não é nenhum pouco recomendado e não deve ser uma opção utilizada nem cogitada
x: Permite sair sem salvar as mudanças no arquivo, deixando ele de lado