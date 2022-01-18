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

fun {TransformItem N}
   if N == 1 then
      '#'
   else
      _
   end
end

% fun {OutputLists A B C D}
% end

fun {LedsT A B C D}
   T1 T2 T3 in
      % T1 = ¬A B + ¬A C + ¬A ¬D + ¬B ¬C ¬D
      T1 = {Gates.orG {Gates.andG {Gates.notG A} B} 
                        {Gates.andG {Gates.notG A} C} 
                        | {Gates.andG {Gates.notG A} {Gates.notG D} } 
                        | {Gates.andG {Gates.notG A} {Gates.notG B}
                                                   |{Gates.notG D}
                                                   }
      }
      % T2 = ¬A C + + ¬B ¬C ¬D + ¬A B D
      T2 = {Gates.orG {Gates.andG {Gates.notG A} C} {Gates.andG {Gates.notG B}  
                                                                  {Gates.notG C}
                                                                  | {Gates.notG D} 
                                                                  }
                                                   | {Gates.andG {Gates.notG A} B|D}
      }
      %T3 = 1
      T3 = 1
      {List.map [T1 T2 T3] TransformItem}
end

fun {LedsU A B C D}
   U1 U3 in
      % U1 = A + ¬C ¬D + B ¬C + B ¬D
      U1 = {Gates.orG A {Gates.andG 
      {Gates.notG C} 
      {Gates.notG D}}
      | {Gates.andG B {Gates.notG C}}
      | {Gates.andG B {Gates.notG D}}
      }
      % U3 = A + ¬B + ¬C ¬D + C D
      U3 = {Gates.orG A {Gates.notG B} 
      |{Gates.andG {Gates.notG C} {Gates.notG D}}
      |{Gates.andG C D}
      }
end



%preparing variables
Bin = {DectoBin 4 1}
A = Bin div 1000
B = (Bin mod 1000) div 100
C = (Bin mod 100) div 10
D = (Bin mod 10)

% Site utilizado para fazer o circuito de cada "led" https://www.profelectro.info/mapa-de-karnaugh-onlie-para-simplificacao-de-funcoes-booleanas-a-partir-da-tabela-da-verdade/

% Variáveis para cada "led"
% T1 T2 T3
% U1    U3
% V1 V2 V3
% W1    W3
% X1 X2 X3

%V1 = C + ¬D + B
V1 = {Gates.orG C {Gates.notG D}
                  | B
}
%V2 = C + B + A ¬D
V2 = {Gates.orG C B
                  | {Gates.andG {Gates.notG D} A}
}
%V3 = 1
V3 = 1

% W1 = A B + C ¬D + A C + A ¬D + ¬B ¬D
W1 = {Gates.orG {Gates.andG A B}
               {Gates.andG C {Gates.notG D}}
               |{Gates.andG A C}
               |{Gates.andG A {Gates.notG D}}
               |{Gates.andG {Gates.notG B} {Gates.notG D}}
}
% W3 = ¬C + D + B + A
W3 = {Gates.orG {Gates.notG C} D|B|A}
% X1 =  C ¬D + A C + A ¬D + ¬B C + ¬B ¬D + B ¬C D
X1 = {Gates.orG {Gates.andG C {Gates.notG D}}
                  {Gates.andG A C}
                  |{Gates.andG A {Gates.notG D}}
                  |{Gates.andG C {Gates.notG B}}
                  |{Gates.andG {Gates.notG D} {Gates.notG B}}
                  |{Gates.andG B C|{Gates.notG C}}
}
% X2 = C ¬D + A C + A ¬D + ¬B C + ¬B ¬D + B ¬C D
X2 = X1
% X3
X3 = 1

% T = [T1 T2 T3]
% U = [U1 _ U3]
% V = [V1 V2 V3]
% W = [W1 _ W3]
% X = [X1 X2 X3]

T = {LedsT A B C D}
U = {List.map [U1 _ U3] TransformItem}
V = {List.map [V1 V2 V3] TransformItem}
W = {List.map [W1 _ W3] TransformItem}
X = {List.map [X1 X2 X3] TransformItem}

{Browse '------------'}
{Browse T}
{Browse U}
{Browse V}
{Browse W}
{Browse X}
{Browse '------------'}
