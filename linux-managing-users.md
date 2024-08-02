
# Gerenciamento de usuários Linux

https://www.youtube.com/watch?v=19WOD84JFxA&t=1300s
https://www.youtube.com/watch?v=GnlgAD8-GhE

Para se criar um usuário convencional se precisa de privilegios de root ou sudo.

Ex: sudo useradd nome_usuario

Para saber quais usuários existem no sistema basta rodar o comando:
Ex: sudo cat /etc/passwd

Existem multiplos usuários no sistema linux, muitos desses usuários são os system users, usuarios que o proprio sistema cria
para rodar processos em background, o ID desses usuários geralmente é menor que 1000, pois o ID de usuarios comuns é 1000 e acima, sempre
criando os usuários em ordem, 1001, 1002 e etc.

Outra forma de se visualizar quais usuários existem mas essa forma nao é tão boa, ela é melhor para saber se os usuários possuem dados no servidor
é verificando o diretório home, usando "ls -l /home" onde cada pasta neste diretório e de um determinado usuário. Somente o usuário root não possui
uma pasta neste local em especifico.

Geralmente quando se cria um usuário não necessariamente se cria uma pasta no diretório home para ele poder usar, para fazer isso de maneira automatica basta rodar o mesmo comando de criação de usuário mas com uma flag a mais "sudo useradd -m foxmulder"

Para deletar um usuário se usa o comando "sudo userdel nome_usuario", junto com a flag "-r" para remvoer o usuário e o diretório em /home

Para adicionar um trocar a senha de um usuário se usa o comando "passwd", "sudo passwd usuario" para trocar a senha de um usuário em especifico e
"passwd" para trocar a senha do usuário em que você está logado

Para criar um usuário do sistema geralmente usado para adicionar scripts ou crobjobs com automações já que esses usuários não precisam de login basta
usar uma nova flag na criação do usuário, também é importante ressaltar que é uma boa praticar remover o login na conta de sistemas, tirando a senha
das contas ou trocando o bash em /etc/passwd

# Gerencimaneto de grupos Linux

Para listar todos os grupos de um usuário se usa o comando "groups nome_usuario" ou "groups" para caso queira saber todos os grupos do usuário atual
sendo utilizado.

Para ver uma lista de todos os grupos criados no sistema basta dar "cat /etc/group" com permissões sudo.

Dentro deste arquivo se lista alem de todos os grupos os seus ID's e na ultima coluna separada por ":" mostra todos os usuários que fazem parte de
determinado grupo.

O ID de um grupo se chamad GID ou Group ID e funciona da mesma forma que os ID's de usuário.

Para criar um grupo se usa o comando "sudo groupadd nome_grupo" e para deletar o grupo se usa "sudo groupdel nome_grupo"

Existe também o conceito de primary e secondary groups, porem este conceito não tem muito efeito pratico, basicamente o grupo primario e secundario
possuem o mesmo efeito, e geralmente quando se cria um usuário ele já cria um grupo de mesmo nome e ja associa esse usuário ao seu grupo como um primario.

Qualquer outro grupo adicionado a aquele usuário fica como um grupo secundario.

Para adicionar um usuário a um grupo basta rodar o comando "sudo usermod -aG nome_grupo nome_usuario"

Para remover o grupo de um usuário se usa o comando "sudo gpasswd -d nome_usuario nome_grupo"

Outra coisa interessante é que alem de grupos serem muito bons para gerenciamento de permissões de usuário também se tem um papel muito importante
na permissão SSH, todo servidor pode ser configurado a permissão de acesso via protocolo ssh que permite acessar o servidor de maneira remota e nao precisar estar local na mesma rede, esta configuração de que tipo de usuário pode acessar o servidor é colocada dentro do arquivo "/etc/ssh/ssh-config", e dentro desse arquivo é passado algumas regras, uma das regras é para permitir ssh apenas em alguns grupos especificos, como um grupo
chamado "ssh-permission", ai basta adicionar a regra "AllowGroups ssh-permission" e adicionar o grupo de mesmo nome em um usuário que deseja liberar
acesso via SSH.

# Anotação
Diferença entre user e system user;
Pesquisar mais sobre system user;
Pesquisar mais sobre grupos;
Pesquisar sobre os 2 tipos de grupos, primary e supplementary;