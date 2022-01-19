functor
import
    LogicGates

export
    sub:Sub

define
    %SUBTRACAO DE BINARIOS
    fun {Sub A B} %funcao que sera chamada pelo usuario
        {Circuit A B 0}
    end

    fun {Circuit A B Bin} %circtuito da subtracao
        SubABAnd SubABXor SubBInAnd SubBInXor in
            SubABAnd # SubABXor = {FullSub A B}
            SubBInAnd # SubBInXor = {FullSub SubABXor Bin}
            10 * SubBInXor + {LogicGates.orG SubABAnd SubBInAnd}

    end

    fun {FullSub X Y} %full subtractor
        Xor And in
        Xor = {LogicGates.xorG X Y}
        And = {LogicGates.andG {LogicGates.notG X} Y}
        Xor#And
    end
end
