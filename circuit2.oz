
functor
import
    LogicGates

export
add: Add
define 
    %SOMA DE BINÁRIOS
    fun {Add B1 B2} %funcao que sera chamada pelo usuário
        {Circuit B1 B2 0}
    end

    fun {Circuit B1 B2 Cin} %circuito de soma
        S Xor Cout in
            Xor = {LogicGates.xorG B1 B2}
            S = {LogicGates.xorG Xor Cin}
            Cout = {LogicGates.orG {LogicGates.andG Cin Xor}
                                    {LogicGates.andG B1 B2}
            }

            Cout*10+S
    end
end