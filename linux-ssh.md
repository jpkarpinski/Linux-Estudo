
# Oque é o SSH

SSH ou Secure Shell é um metodo para se conectar a um servidor e ser capaz de enviar comandos para este servidor de maneira segura
pois ele usa criptografia para autenticar e criptografar conexões entre os dispositivos.

SSH é usado para controlar servidores de maneira remota, gerenciar infraestrutura e transferir arquivos via scp.

Conexões criptografadas remotas: o SSH estabelece uma conexão entre o dispositivo de um usuário e uma máquina distante, geralmente um servidor. Ele usa criptografia para embaralhar os dados que atravessam a conexão. Uma parte interceptadora só encontraria algo como estática, dados aleatórios que não significam nada a menos que sejam descriptografados. (O SSH usa métodos de criptografia que tornam a descriptografia proibitivamente difícil para pessoas de fora).

O SSH é "seguro" porque incorpora criptografia e autenticação por meio de um processo chamado criptografia de chave pública. A criptografia de chave pública é uma maneira de criptografar dados ou assinar dados com duas chaves diferentes. Uma das chaves, a chave pública, está disponível para ser usada por qualquer pessoa. A outra chave, a chave privada, é mantida em segredo por seu proprietário. Como as duas chaves correspondem uma à outra, o estabelecimento da identidade do proprietário da chave exige a posse da chave privada que acompanha a chave pública.

Embora a criptografia de chave pública autentique os dispositivos conectados no SSH, um computador devidamente protegido ainda exigirá a autenticação da pessoa que estiver usando o SSH. Geralmente, isso é feito inserindo um nome de usuário e uma senha.

Depois que a autenticação é concluída, a pessoa pode executar comandos na máquina remota como se estivesse fazendo isso em sua própria máquina local.

SSH é um protocolo para acessar servidores de maneira remota com criptografia nos comandos e fazendo tudo isso de forma segura, e é possível configurar uma chave SSH para acessar o servidor de maneira remota e com uma segurança maior, trabalhando com o conceito ja dito de chave publica e privada.

A porta 22 é a porta padrão para SSH. Às vezes, os firewalls podem bloquear o acesso a determinadas portas em servidores atrás do firewall, mas deixam a porta 22 aberta. Portanto, o SSH é útil para acessar servidores do outro lado do firewall: o pacote direcionado à porta 22 não é bloqueado e pode ser encaminhado para qualquer outra porta.