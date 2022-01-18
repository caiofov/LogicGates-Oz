declare 
[Gates] = {Module.link ['C:/Users/cfovi_000/Desktop/repositorios/LogicGates-Oz/LogicGates.ozf']} %loading logical gates

fun {DectoBin A C} %decimal to binary
   R in
   R = A mod 2
   if A > 1 then
      R*C + {DectoBin A div 2 C*10}
   else
      A*C
   end
end



%preparing variables
Bin = {DectoBin 1 1}
A = Bin div 1000
B = (Bin mod 1000) div 100
C = (Bin mod 100) div 10
D = (Bin mod 10)

% T1 = {Gates.orG {Gates.andG {Gates.notG A} B} {Gates.andG {Gates.notG A} C}|{Gates.andG {Gates.notG A} {Gates.notG D}}|{Gates.andG {Gates.notG A} {Gates.notG B}|{Gates.notG D}}}
T1 = {Gates.orG 
            {Gates.andG {Gates.notG A} B} 
            {Gates.andG {Gates.notG A} C} | {Gates.andG {Gates.notG A} {Gates.notG D} } | {Gates.andG 
                                                                                                {Gates.notG A} 
                                                                                                {Gates.notG B}|{Gates.notG D}}}

T2 = {Gates.orG 
            {Gates.andG {Gates.notG A} C}
            {Gates.andG {Gates.notG B}  
                  {Gates.notG C}
                  | {Gates.notG D} 
            }
            | {Gates.andG {Gates.notG A} B|D}
}
{Browse T2}
