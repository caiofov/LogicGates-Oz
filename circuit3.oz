functor
import
    LogicGates

export
    sub:Sub

define
    fun {Sub A B}
        {Circuit A B 0}
    end

    fun {Circuit A B Bin}
        SubABAnd SubABXor SubBInAnd SubBInXor in
            SubABAnd#SubABXor = {FullSub A B}
            SubBInAnd#SubBInXor = {FullSub SubABXor Bin}
            10*SubBInXor + {LogicGates.orG SubABAnd SubBInAnd}

    end

    fun {FullSub X Y}
        Xor And in
        Xor = {LogicGates.xorG X Y}
        And = {LogicGates.andG {LogicGates.notG X} Y}
        Xor#And
    end
end
