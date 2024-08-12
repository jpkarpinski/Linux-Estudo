
# Oque é um firewall
 - https://www.kaspersky.com/resource-center/definitions/firewall
 - https://youtu.be/x1YLj06c3hM
 - https://www.youtube.com/watch?v=uGaERP4Npys (types of firewalls)
 - https://www.youtube.com/watch?v=2llWuivdS7w

# Linux UFW (Uncomplicated Firewall)

Documentações interessantes:
 - https://help.ubuntu.com/community/UFW
 - https://ubuntu.com/server/docs/firewalls

UFW é uma ferramenta utilizada com o proposito de facilitar a manipulação do firewall no linux com comandos mais simples e acessiveis, este
firewall serve apenas para liberar acesso a certas portas ou bloquear certos ips, não é uma ferramenta completa de monitoramento de pacotes, para
ser mais preciso o UFW é um firewall do tipo "packet-filtering firewall".

UFW é um service (.services), ou seja ele é um serviço gerenciado pelo SystemD (Ubuntu) que pode ser startado e reiniciado usando systemctl como
"systemctl start ufw".

UFW vem geralmente pre-instalado em distribuições debian, geralmente ubuntu, e para usa-lo é necessário habilita-lo com "systemctl enable ufw"
e logo depois starta-lo com "systemctl start ufw" para ai sim poder usufruir desse serviço.

Outra coisa é montar as regras do firewall via UFW com o serviço de UFW desabilitado e parado, para não ter conflitos ou problemas na hora
de ativar certas regras de firewall, o recomendado é montar as regras primeiro e depois habilitar o serviço.

"sudo ufw status" mostra quais portas estão permitidas no servidor e se o UFW está ativo ou não no servidor.

É possivel configurar as opções padrões do UFW indo em "/etc/default/ufw", por exemplo se é permitido IPV6.

Por padrão é uma boa pratica resetar as configurações padrão do UFW e apenas habilitar oque for necessário, "sudo ufw reset"
(Antes de fazer isso deixe o ufw desabilitado usando "sudo ufw disable" e "sudo systemctl stop ufw", caso contrario perdera a conexão com o servidor)

Configurações padrão:
 - sudo ufw default deny incoming 
    - nega todas as conexões no servidor a menos que explicitamente deixamos abrindo as portas do servidor com ufw allow
 - sudo ufw default allow outgoing
 - sudo ufw allow ssh
 - sudo ufw allow http
 - sudo ufw allow https

Geralmente para servidores web se deixa aberto para conexão as portas 80 e 443 (http e https) e a porta 22 para conexões vira SSH no servidor.

Caso queira permitir que apenas alguns ips tenham acesso ao servidor:
 - sudo ufw allow from 10.0.0.1
 - sudo ufw allow from 10.0.0.1/24 to any port 22

Esses Ip's de acesso precisam ser estaticos e não dinamicos, caso contrario pessoas aleatórias podem ter acesso ao seu servidor e as pessoas
que deveriam ter acesso podem perde-lo ao reiniciar o modem e trocar de ip.

Para colocar o UFW de volta nos trilhos:
 - sudo systemctl start ufw
 - sudo ufw enable

Para listar todas as regras e ainda por cima ver em qual linha cada regra esta:
 - sudo ufw status numbered

Para remover uma regra no firewall basta fazer:
 - sudo ufw delete numero_da_regra
 - sudo ufw delete 5

Para bloquear uma porta ou serviço:
 - sudo ufw deny servico
 - sudo ufw deny ftp

Para bloquear por um ip ou range de ips especifico:
 - sudo ufw deny from ip
 - sudo ufw deny from 192.168.0.1/24

Para remover todas as regras:
 - sudo ufw reset

Em consoles igual consoles de plataforma igual linode ou vultr voce pode acessar como root por la mesmo que tenha desabilitado o root ou que tenha
removido permissões de SSH do root ou de qualquer outra plataforma, esses consoles são especiais então mesmo que voce bloqueie a porta 22 do ssh
ainda é possível acessar o servidor via terminais no navegador browser.