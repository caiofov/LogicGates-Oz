functor
import
   Browser
   LogicGates
export
   display: Display

define
   proc {Display N}
      {UnmergeDigits N 10}
   end
   proc {UnmergeDigits N C}
      R in
         R = (N mod C) div (C div 10)
         {PrepareVariables R}
         if N >= C then {UnmergeDigits N C*10} end
   end

   proc {PrepareVariables N}
      Bin A B C D in
      Bin = {DectoBin N 1}
      A = Bin div 1000
      B = (Bin mod 1000) div 100
      C = (Bin mod 100) div 10
      D = (Bin mod 10)
      {DisplayDigit A B C D}
   end

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

   proc {DisplayDigit A B C D}
      T U V W X 
   in
      T = {Map {LedsT A B C D} TransformItem}
      U = {Map {LedsU A B C D} TransformItem}
      V = {Map {LedsV A B C D} TransformItem}
      W = {Map {LedsW A B C D} TransformItem}
      X = {Map {LedsX A B C D} TransformItem}

      {Browser.browse T}
      {Browser.browse U}
      {Browser.browse V}
      {Browser.browse W}
      {Browser.browse X}
      {Browser.browse '------------'}
   end

   fun {LedsT A B C D}
      T1 T2 T3 in
         % T1 = ¬D	+	C	+	B	+	A
         T1 = {LogicGates.orG {LogicGates.notG D} C|B|A}
         
         % T2 = C + A + B D  + ¬B¬D
         T2 = {LogicGates.orG C A
                        |{LogicGates.andG B D}
                        |{LogicGates.andG {LogicGates.notG B} {LogicGates.notG D}}
         }
         %T3 = 1
         T3 = 1

         [T1 T2 T3]
   end

   fun {LedsU A B C D}
      U1 U3 in
         % U1 = A + ¬C ¬D + B ¬C + B ¬D
         U1 = {LogicGates.orG A {LogicGates.andG {LogicGates.notG C} {LogicGates.notG D}}
                           | {LogicGates.andG B {LogicGates.notG C}}
                           | {LogicGates.andG B {LogicGates.notG D}}
         }
         % U3 = A + ¬B + ¬C ¬D + C D
         U3 = {LogicGates.orG A {LogicGates.notG B} 
                           |{LogicGates.andG {LogicGates.notG C} {LogicGates.notG D}}
                           |{LogicGates.andG C D}
         }
         [U1 '_' U3]
   end

   fun {LedsV A B C D}
      V1 V2 V3 in
         %V1 = ¬D + A + B ¬C + ¬B C
         V1 = {LogicGates.orG A {LogicGates.notG D}
                           | {LogicGates.andG B {LogicGates.notG C}}
                           | {LogicGates.andG C {LogicGates.notG B}}
         }
         %V2 = A + C ¬D + B ¬C + ¬B C
         V2 = {LogicGates.orG A {LogicGates.andG C {LogicGates.notG D}}
                           | {LogicGates.andG B {LogicGates.notG C}}
                           | {LogicGates.andG C {LogicGates.notG B}}
         }
         %V3 = 1
         V3 = 1
         [V1 V2 V3]
   end

   fun {LedsW A B C D}
      W1 W3 in
      % W1 = A B + C ¬D + A C + A ¬D + ¬B ¬D
      W1 = {LogicGates.orG {LogicGates.andG A B} {LogicGates.andG C {LogicGates.notG D}}
                                       |{LogicGates.andG A C}
                                       |{LogicGates.andG A {LogicGates.notG D}}
                                       |{LogicGates.andG {LogicGates.notG B} {LogicGates.notG D}}
      }
      % W3 = ¬C + D + B + A
      W3 = {LogicGates.orG {LogicGates.notG C} D|B|A}

      [W1 '_' W3]
   end

   fun {LedsX A B C D}
      X1 X2 X3 in
      % X1 =  C ¬D + A C + A ¬D + ¬B C + ¬B ¬D + B ¬C D
      X1 = {LogicGates.orG {LogicGates.andG C {LogicGates.notG D}} {LogicGates.andG A C}
                                                   |{LogicGates.andG A {LogicGates.notG D}}
                                                   |{LogicGates.andG C {LogicGates.notG B}}
                                                   |{LogicGates.andG {LogicGates.notG D} {LogicGates.notG B}}
                                                   |{LogicGates.andG B D|{LogicGates.notG C}}
      }
      % X2 = C ¬D + A C + A ¬D + ¬B C + ¬B ¬D + B ¬C D
      X2 = X1
      % X3
      X3 = 1
      [X1 X2 X3]
   end

   % Site utilizado para fazer o circuito de cada "led" https://www.profelectro.info/mapa-de-karnaugh-onlie-para-simplificacao-de-funcoes-booleanas-a-partir-da-tabela-da-verdade/

   % Variáveis para cada "led"
   % T1 T2 T3
   % U1    U3
   % V1 V2 V3
   % W1    W3
   % X1 X2 X3

end
