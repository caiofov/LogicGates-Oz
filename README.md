# Circuitos Lógicos em Oz

No arquivo *main.oz*, temos um exemplo de utilização dos circuitos abaixo.

- **Circuito 1:** Display de números, com o de elevador. Ele recebe um número em decimal e o converte cada dígito para binário para ser passado pelo circuito, mostrando um dígito de cada vez, sendo '#' o led aceso. Exibe dígitos de 0 a 9 </br>
Ex: 1 ->   
[_ _ '#']</br>
[_ _ '#']</br>
[_ _ '#']</br>
[_ _ '#']</br>
[_ _ '#']</br>

> Observação: Como a saída não foi formatada, alguns números podem ficar um pouco desconexos. Por exemplo, o número 9:</br>
['#' '#' '#']</br>
['#' _ '#']</br>
['#' '#' '#']</br>
[_ _ '#']</br>
[_ _ '#']</br>

- **Circuito 2:** Soma de binários (*Half adder*). Recebe dois binários de um dígito cada (0 ou 1) e os soma.

- **Circuito 3:** Subtração de binários (*Full subtractor*). Assim como o circuito 2, recebe dois binários de um dígito cada e os subtrai.
