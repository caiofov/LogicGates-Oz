
functor
import
    LogicGates

export
add: Add
define 
    fun {Add B1 B2}
        {Circuit B1 B2 0}
    end

    fun {Circuit B1 B2 Cin}
        S Xor Cout in
            Xor = {LogicGates.xorG B1 B2}
            S = {LogicGates.xorG Xor Cin}
            Cout = {LogicGates.orG {LogicGates.andG Cin Xor}
                                    {LogicGates.andG B1 B2}
            }

            Cout*10+S
    end
end