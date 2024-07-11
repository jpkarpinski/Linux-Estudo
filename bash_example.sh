#!/bin/bash

# Variaveis
name="Thiago"

echo "Ola $name!"

echo "Digite com a sua idade:"
read age

# Conditional statement
if [ $age -ge 18 ]; then
    echo "Acesso garantido!"
else
    echo "Acesso negado!"
fi

# Loop do numero 1 ate o 5
for i in {1..5}; do 
    echo "Number: $i"
done

# Função
greet() {
    local greeting="Hello, $1"
    echo "$greeting"
}

# Chamada da função
greet "Alice"

echo "Enter your favorite color:"
read color
echo "Your favorite color is: $color"

# Checa o status de saida de um comando
ls /non/existent/directory
if [ $? -eq 0 ]; then
    echo "Command succeeded."
else
    echo "Command failed."
fi