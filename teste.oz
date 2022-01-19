declare
proc {Teste N}
    {Teste2 N 10}
end

proc {Teste2 N C}
    R in
        R = (N mod C) div (C div 10)
        {Browse R}
        if N >= C then {Teste2 N C*10} end
end

{Teste 10}