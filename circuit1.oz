declare 
[Gates] = {Module.link ['LogicalGates.ozf']} %loading logical gates

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
Bin = {DectoBin 3 1}
A = Bin div 1000
B = (Bin mod 1000) div 100
C = (Bin mod 100) div 10
D = (Bin mod 10)

{Browse [Bin | A B C D]}