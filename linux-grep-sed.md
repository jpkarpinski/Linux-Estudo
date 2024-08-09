
# Comandos Grep e Sed

Comando GREP é usado para achar uma palavra em uma string ou arquivo, pode ser usado juntamente com o "|" (pipe) para poder
pegar o resultado de algum comando por exemplo "cat /etc/ssh/ssh_config | grep Port"

Ex: 
    "grep Port /etc/ssh/ssh_config"
    "grep gedit *" (procura em todos os arquivos do diretório)

Flags:
    - V: usado para mostrar todas as linhas que não contem a palavra pesquisada no grep.
    - n: mostra em qual linha do arquivo está localizado a palavra
    - c: conta quantas tinhas aparece aquele termo (não mostra as linhas só a contagem)
    - i: tira o case sensitivity da busca do termo
    - r: procura de maneira recursiva por arquivos e diretórios, vasculhando cada arqivo do diretório dado

Comando SED é usado para editar arquivos e printa-los na tela sem de fato modificar o arquivo em questão, gerando uma "stream".

Ex:
    "sed 's/Pineapple/Feta/' /to/path/file
    "sed 's/Feta//' /to/path/file
    "sed 's./etc..' paths.txt

Flags:
    - i: as alterações geradas pelo sed modificam o arquivo permanentemente