
# Linux Process

Os processos linux podem ser vistos com o uso de varios comandos, entre eles estão os comandos: ps, top e htop, sendo o ultimo um comando
que pode não estar disponivel em todas as distribuições linux, mas é possível instala-lo.

Top:

O comando top é dividido em 2 sessões e tem como objetivo mostrar em "tempo real" todos os processos que estão acontecendo no computador, na verdade o seu padrão é atualizar a cada 3 segundos.

A primeira sessão sendo mais uma parte de estatistica do computador e a segunda sessão sendo uma tabela de processos que estão rodando.

Explicação das nomenclaturas:

Up - Quanto tempo o seu servidor está online.
User - Quantidade de usuários logados no sistema
Load Average - Uso de CPU que vai de 0 a 1 sendo o 1 indicando 100% de uso, isso conta para cada CPU.
Tasks: Mostra o total das tasks, quantas estão rodando atualmente, quantas estão paradas ou inativas e quantas são zumbis
    - Zombie: Se o parent process fecha e o child process ainda está rodando e não recebeu instruções para fechar ele vira um zombie. (pouco impacto nos processos do linux)
CPU: Informações sobre o uso da CPU.
    - US: User Space, onde os programas rodam, tudo oque não está amarrado ao kernel do sistema operacional é rodado no US.
    - SY: Kernel Space, tudo oque está ligado no kernel.
    - NI: Niceness, processos que precisam de atenção especial e podem ser configurado o quanto de atenção esse processo vai ser ficam marcados no niceness.
    - ID: Mostra o quanto de ocupado está a CPU, ou o quanto de uso ela ainda tem, quanto maior menos o sistema está ocupado.
    - WA: Quanto tempo alguma taks esta esperando por input/output, quanto maior pior.
    - HI & SI: Hardware e Software, quanto tempo a CPU esta gastando com processamento de hardware ou software.
    - ST: Quanto tempo uma CPU virtual está esperando por interação de uma CPU Fisica.
MiB Mem: Mostra o total de memoria, quanto se tem livre, quanto foi usado e quanto de cache esta usando a memoria;
Mib Swap: Memoria armazenada em disco (hard drive), uma memoria mais lenta, se estiver sendo muito usado significa que a memoria RAM está acabando.

Segunda metade das informações:

Mostra uma lista de todas as tarefas que estão usando os recursos.

ID do processo (PID), prioridade do processo (PR), niceness value (atenção especial) (NI), total de memoria virtual sendo utilizada (VIRT), quanto de memoria fisica esta sendo usada (RES), quanto de memoria compartilhada esta sendo usada por uma tarefa (SHR), Porcentagem de memoria e CPU sendo usados para cada Task (CPU e MEM), quanto tempo a CPU gastou em cada task em particular (TIME+), o comando que está sendo usado naquele processo (COMMAND).

Comandos:
    Shift P: ordena por uso de CPU.
    Shift B: mostra o parent process e seus child process.
    Shift M: ordena por uso de memoria.
    K: Prompt de comando do TOP que espera um PID para matar o processo (sempre tentar fechar o processo antes de dar kill).
    D: Muda o delay de atualização do comando TOP (default é 3.0 segundos).

Os mesmos conceitos de TOP podem ser usados em HTOP.

# Load Average

Mostra o quao ocupado seu servidor está.

O Load Average é uma informação que pode ser acessada em diferentes locais e comandos como os comandos "uptime" e "top" ou "htop".

Load Average: 0.04, 0.05, 0.0

O primeiro numero em Load Average mostra o tamanho de "load" ou carga que se teve no servidor durante o ultimo minuto.
O segundo numero em Load Average mostra o tamanho da carga dos ultimos 5 minutos.
E por fim os ultimos 15 minutos de uso do servidor como o ultimo numero.

Importante saber quanto de CPU se tem no servidor, isso pode ser visto usando o comando HTOP e contando quantas cpu's aparecem, geralmente as
CPU's são numeros "1", "3" e por ai vai.

Outra forma de ver isso é com "/cat /proc/cpuinfo" e contar os numeros dos processos, no caso da minha maquina são 8 processos que vão de 0 até 7.

Quanto mais cpus e cores maior deve ser o numero do Load Average para se estar com "100%" de uso, se voce tiver 2 cores para ficar com 100% de uso
precisaria ter um load average de 2.0.