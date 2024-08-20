
Ref:
- https://fireship.io/courses/linux/
- https://www.youtube.com/watch?v=Kzpm-rGAXos&list=PLT98CRl2KxKFfumnJiR8FxBsbJepGgMoN&index=60
- https://www.youtube.com/watch?v=wOWhfNB_r-0&t=109s

# Systemd

SystemD é um "Init System", é o primeiro processo que inicia no sistema e faz a inicialização dos outros daemons utilizados para
rodar o sistema operacional. Podendo até ser configurado para inicializar processos customizados dentro do boot de uma distro linux
usando o arquivo de services. (PID 1)

Units ou unidades são recursos que são possiveis serem gerenciados a partir do systemd. (services, timers, mounts e etc)

Começando pelo gerenciamento de "services" a partir do systemctl:

Ex:
    - systemctl status ex-service (nome_da_unit) : Verifica o status de uma unit.
    - systemctl enable ex-service : 
        - Serviços desabilitados não vão inicializar assim que o sistema bootar mesmo que o serviço esteja rodando, para isso precisa habilitar no sistema para ele inicializar sozinho com o boot.
    - sudo systemctl start ex-service : Inicializa um serviço no systemD.
    - sudo systemctl stop ex-service : Para um serviço no systemd.
    - sudo systemctl restart ex-service: Bom para quando se muda uma configuração de um service e precisa reinicializar para aplicar.
    - sudo systemctl disable : Desabilita o service fazendo com que ele não inicialize automaticamente, isso por padrão não para o service de rodar.
    
A configuração "preset: disabled" que aparece ao rodar o comando "systemctl status service" significa que os serviços por padrão não vão estar habilitados, fazendo com que a habilitação dos serviços seja feita de forma manual, caso esteja habilitado assim que um novo serviçe for configurado
ele automaticamente já vai ser inicializado.

Também é possível ver onde estão os arquivos de log do service em questão no "systemctl status service".

Service Files são arquivos de texto que dizem para o systemD como ele vai gerenciar aquele service em particular, como vai inicializar, quando vai
iniializar, seus arquivos de log, seu comando de reload, se depende da inicialização de outro service antes disso e etc.

As units podem ficar dentro de diretórios como "/etc/systemd/system/", "/run/systemd/system/", "/lib/systemd/system/".

/lib/systemd/system : Quando se instala um pacote e esse pacote possui units, as units desse pacote vão parar dentro deste diretório.
/run/systemd/system : Armazena unidades systemd que são runtimes (em tempo de execução)
/etc/systemd/system : Geralmente usado para armazenar services importantes e com alta prioridade, por exemplo services customizados.

A prioridades dos diretórios é:
    - /etc/systemd/system (maior prioridade na hora de rodar um service, não esbarrando em alguns aspectos de permissão)
    - /run/systemd/system
    - /lib/systemd/system (menor prioridade, pode acabar não rodando um service custom se ele precisa de muitas permissões para tal)

Service Files:

Arquivos de serviço são case sensitive, cuidado na hora de escrever.

Geralmente arquivos de serviço são divididos em 3 partes, [Unit], [Service] e [Install].

Unit: informações gerais sobre a unidade, como descrição, quais services ele depende, como acessar documentação.
    - Description : Descrição da unit
    - Wants: Quais outros services essa unidade necessita para rodar de maneira correta.
    - After: Quais partes do sistema precisam estar inicializadas para esta unit rodar com sucesso.
    - Documentation: Como acessar a documentação daquela unidade.

Service: Opções de configuração especificas de arquivos de serviço.
    - Type: 
        - qual o tipo de inicialização, se for "simple" significa que vai inicializar o service assim que ele startar. Entra no pretexto de enable e disable.
    - Environment: configuração de variaveis de ambiente que são necessarias para inicializar aquele service.
    - ExecStart: 
        - Script usado para inicializar um service, esse script deve ter um caminho absoluto.
        - ex: /usr/sbin/httpd $OPTIONS -DFOREGROUND
    - ExecReload: 
        - Script usado para reinciar os arquivos de configuração de uma aplicação sem ela ser desconectada.
        - ex: 
    - ExecStop: Script usado para parar um service.

Install: Configura oque vai acontecer quando um unit file for habilitado/desabilitado
    - WantedBy: 
        - Relacionamento de dependencia parecido com o After/Before do Unit só que de uma maneira mais complexa, por nivel de unidade de inciailização do sistema, por exemplo o "multi-user.target" define que o sistema deve chegar a um estado onde multiplos usuários podem 
        usam o sistema ao mesmo tempo, fazendo com que o sistema não inicialize ate que esse estagio tenha chegado.

Edição de services:

Para isso se usa um comando conhecido como "sudo systemctl edit nome_service", isso vai criar uma especie de arquivo de "override" para sobrescrever
as configurações do arquivo de services, esse override geralmente vai ficar em /etc/systemd/system/nome_service.service.d/override.conf por conta do seu grau de prioridade.

Todas as linhas vão estar comentadas e vai ter um espaço entre "Anything between.." e "Edits below this comment", este espaço é usado para escrever quais as mudanças que devem ser feitas no service em questão, em qualquer outro lugar que for escrito pode acabar não surtindo efeito no service. Após alterar algo as mudanças feitas no arquivo de override vão dar um merge no arquivo existente de configuração. As configurações de override
são salvas em /etc/systemd/system/nome_service.service.d/override.conf. Para remover a alteração basta excluir o arquivo de override e as mudanças do
service voltaram ao padrão de fabrica.

Existe outra forma de editar com o mesmo comando que permite alterar diretamente o arquivo sem criar um arquivo de override, fazendo uma copia do arquivo inteiro de service e salvando em /etc/systemd/system com as novas configurações feitas. 
- sudo systemctl edit --full service.service

Após isso é uma boa reinicializar o systemD para fazer com que todas as alterações sejam aplicadas, para isso se usa o comando "sudo systemctl daemon-reload", quando se usa esse comando voce fala para o systemd dar uma olhada nos diretórios e ver se algo mudou, e se mudou ele reinicializa aquela unit.

Service file de exemplo para criar os proprios arquivos de serviço de maneira customizada:
- https://github.com/syncthing/syncthing/blob/main/etc/linux-systemd/user/syncthing.service

Para listar todos os daemons que o systemd tem salvo:
- sudo systemctl list-units --all, mostra todas as unidades que estão carregadas na memoria do systemd
- sudo systemctl list-units-files, mostra todos os arquivos de unidades existentes

Quando uma operação no SystemCTL falhar, por exemplo uma falha ao inicializar é importante verificar os arquivos de log no systemctl usando o journalctl (OBS: Se o comando para acessar o journalctl estiver dando resultado em branco favor reinicializar o journal com restart no proprio systemctl "sudo systemctl restart systemd-journald") com "sudo journalctl -xe"