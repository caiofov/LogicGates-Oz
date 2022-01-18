functor
export
    andG: And
    orG: Or
    notG: Not
    nandG: Nand
    norG: Nor
    xorG: Xor
define
    fun {GateMaker Fun A G}
    
        case G of H|T then
            if T == nil then {Fun A H}
            else
                {GateMaker Fun {Fun A H} T}
            end
        else
            {Fun A G}
        end
    end
    
    fun {And A G}
        {GateMaker fun {$ A G} A*G end A G}
    end
    
    fun {Or A G}
        {GateMaker fun {$ A G} if A+G >= 1 then 1 else 0 end end A G}
    end
    
    fun {Not A}
        1-A
    end
    
    fun {Nand A G}
        {Not {And A G}}
    end
    
    fun {Nor A G}
        {Not {Or A G}}
    end
    
    fun{Xor A G}
        {GateMaker fun{$ A G} A+G-2*A*G end A G}
    end
end

