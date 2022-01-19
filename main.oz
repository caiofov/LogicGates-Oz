declare
[Gates] = {Module.link ['C:/Users/cfovi_000/Desktop/repositorios/LogicGates-Oz/LogicGates.ozf']}
[Circuit1] = {Module.link ['C:/Users/cfovi_000/Desktop/repositorios/LogicGates-Oz/circuit1.ozf']}
[Circuit2] = {Module.link ['C:/Users/cfovi_000/Desktop/repositorios/LogicGates-Oz/circuit2.ozf']}
[Circuit3] = {Module.link ['C:/Users/cfovi_000/Desktop/repositorios/LogicGates-Oz/circuit3.ozf']}


%CIRCUITO 1 - DISPLAY DE NÚMERO
% o caractere "#" corresponde ao led aceso.
% mostrar o número 91
{Circuit1.display 91}

%CIRCUITO 2 - SOMA DE BINÁRIOS
%somar os binários 1 e 1
{Browse {Circuit2.add 1 1}}

%CIRCUITO 3 - SUBTRAÇÃO DE BINÁRIOS
%substrair os binários 1 e 0
{Browse {Circuit3.sub 1 0}}
