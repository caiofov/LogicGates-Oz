declare
[Gates] = {Module.link ['C:/Users/cfovi_000/Desktop/repositorios/LogicGates-Oz/LogicGates.ozf']}
[Circuit1] = {Module.link ['C:/Users/cfovi_000/Desktop/repositorios/LogicGates-Oz/circuit1.ozf']}
[Circuit2] = {Module.link ['C:/Users/cfovi_000/Desktop/repositorios/LogicGates-Oz/circuit2.ozf']}


%CIRCUITO 1 - DISPLAY DE NÚMERO
% o caractere "#" corresponde ao led aceso.
% mostrar o número 91
{Circuit1.display 91}

%CIRCUITO 2 - SOMA DE BINÁRIOS
%somar os binários 1 e 1
{Browse {Circuit2.add 1 0}}

%CIRCUITO 3