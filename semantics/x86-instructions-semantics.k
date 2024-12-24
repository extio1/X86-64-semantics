requires "x86-configuration.k"
requires "x86-flag-checks-syntax.k"

module X86-INSTRUCTIONS-SEMANTICS
  imports X86-CONFIGURATION
  imports X86-FLAG-CHECKS-SYNTAX

// addq-r64-r64

  rule <k>
    execinstr (addq R1:R64, R2:R64,  .Operands) => .
  ...</k>
    <regstate>
RSMap:Map => updateMap(RSMap,
convToRegKeys(R2) |-> extractMInt( addMInt( concatenateMInt( mi(1, 0), getParentValue(R1, RSMap)), concatenateMInt( mi(1, 0), getParentValue(R2, RSMap))), 1, 65)

"CF" |-> extractMInt( addMInt( concatenateMInt( mi(1, 0), getParentValue(R1, RSMap)), concatenateMInt( mi(1, 0), getParentValue(R2, RSMap))), 0, 1)

"PF" |-> (#ifMInt (notBool (((((((eqMInt( extractMInt( addMInt( concatenateMInt( mi(1, 0), getParentValue(R1, RSMap)), concatenateMInt( mi(1, 0), getParentValue(R2, RSMap))), 64, 65), mi(1, 1)) xorBool eqMInt( extractMInt( addMInt( concatenateMInt( mi(1, 0), getParentValue(R1, RSMap)), concatenateMInt( mi(1, 0), getParentValue(R2, RSMap))), 63, 64), mi(1, 1))) xorBool eqMInt( extractMInt( addMInt( concatenateMInt( mi(1, 0), getParentValue(R1, RSMap)), concatenateMInt( mi(1, 0), getParentValue(R2, RSMap))), 62, 63), mi(1, 1))) xorBool eqMInt( extractMInt( addMInt( concatenateMInt( mi(1, 0), getParentValue(R1, RSMap)), concatenateMInt( mi(1, 0), getParentValue(R2, RSMap))), 61, 62), mi(1, 1))) xorBool eqMInt( extractMInt( addMInt( concatenateMInt( mi(1, 0), getParentValue(R1, RSMap)), concatenateMInt( mi(1, 0), getParentValue(R2, RSMap))), 60, 61), mi(1, 1))) xorBool eqMInt( extractMInt( addMInt( concatenateMInt( mi(1, 0), getParentValue(R1, RSMap)), concatenateMInt( mi(1, 0), getParentValue(R2, RSMap))), 59, 60), mi(1, 1))) xorBool eqMInt( extractMInt( addMInt( concatenateMInt( mi(1, 0), getParentValue(R1, RSMap)), concatenateMInt( mi(1, 0), getParentValue(R2, RSMap))), 58, 59), mi(1, 1))) xorBool eqMInt( extractMInt( addMInt( concatenateMInt( mi(1, 0), getParentValue(R1, RSMap)), concatenateMInt( mi(1, 0), getParentValue(R2, RSMap))), 57, 58), mi(1, 1)))) #then mi(1, 1) #else mi(1, 0) #fi)

"AF" |-> xorMInt( xorMInt( extractMInt( getParentValue(R1, RSMap), 59, 60), extractMInt( getParentValue(R2, RSMap), 59, 60)), extractMInt( addMInt( concatenateMInt( mi(1, 0), getParentValue(R1, RSMap)), concatenateMInt( mi(1, 0), getParentValue(R2, RSMap))), 60, 61))

"ZF" |-> (#ifMInt eqMInt( extractMInt( addMInt( concatenateMInt( mi(1, 0), getParentValue(R1, RSMap)), concatenateMInt( mi(1, 0), getParentValue(R2, RSMap))), 1, 65), mi(64, 0)) #then mi(1, 1) #else mi(1, 0) #fi)

"SF" |-> extractMInt( addMInt( concatenateMInt( mi(1, 0), getParentValue(R1, RSMap)), concatenateMInt( mi(1, 0), getParentValue(R2, RSMap))), 1, 2)

"OF" |-> (#ifMInt ((eqMInt( extractMInt( getParentValue(R1, RSMap), 0, 1), mi(1, 1)) ==Bool eqMInt( extractMInt( getParentValue(R2, RSMap), 0, 1), mi(1, 1))) andBool (notBool (eqMInt( extractMInt( getParentValue(R1, RSMap), 0, 1), mi(1, 1)) ==Bool eqMInt( extractMInt( addMInt( concatenateMInt( mi(1, 0), getParentValue(R1, RSMap)), concatenateMInt( mi(1, 0), getParentValue(R2, RSMap))), 1, 2), mi(1, 1))))) #then mi(1, 1) #else mi(1, 0) #fi)
)

    </regstate>
    

[klabel(ADDQ-R64-R64)]

// addq-r64-r64-semantics


// andq-m64-r64

  context execinstr(andq:Opcode R1:R64, HOLE:Mem,  .Operands) [result(MemOffset)]
  
  rule <k>
    execinstr (andq:Opcode R1:R64, memOffset( MemOff:MInt):MemOffset,  .Operands) =>
      loadFromMemory( MemOff, 64) ~>
      execinstr (andq R1, memOffset( MemOff),  .Operands)
  ...</k>
    <regstate> RSMap:Map </regstate>
          
  rule <k>
    memLoadValue(Mem64:MInt):MemLoadValue ~> execinstr (andq:Opcode R1:R64, memOffset( MemOff:MInt):MemOffset,  .Operands) =>
      
            storeToMemory(
              andMInt( Mem64, getParentValue(R1, RSMap)),
              MemOff,
              64
            )
          
  ...</k>
    <regstate>
      RSMap:Map => updateMap(RSMap,
"CF" |-> mi(1, 0)

"PF" |-> (#ifMInt (notBool (((((((eqMInt( andMInt( extractMInt( Mem64, 63, 64), extractMInt( getParentValue(R1, RSMap), 63, 64)), mi(1, 1)) xorBool eqMInt( andMInt( extractMInt( Mem64, 62, 63), extractMInt( getParentValue(R1, RSMap), 62, 63)), mi(1, 1))) xorBool eqMInt( andMInt( extractMInt( Mem64, 61, 62), extractMInt( getParentValue(R1, RSMap), 61, 62)), mi(1, 1))) xorBool eqMInt( andMInt( extractMInt( Mem64, 60, 61), extractMInt( getParentValue(R1, RSMap), 60, 61)), mi(1, 1))) xorBool eqMInt( andMInt( extractMInt( Mem64, 59, 60), extractMInt( getParentValue(R1, RSMap), 59, 60)), mi(1, 1))) xorBool eqMInt( andMInt( extractMInt( Mem64, 58, 59), extractMInt( getParentValue(R1, RSMap), 58, 59)), mi(1, 1))) xorBool eqMInt( andMInt( extractMInt( Mem64, 57, 58), extractMInt( getParentValue(R1, RSMap), 57, 58)), mi(1, 1))) xorBool eqMInt( andMInt( extractMInt( Mem64, 56, 57), extractMInt( getParentValue(R1, RSMap), 56, 57)), mi(1, 1)))) #then mi(1, 1) #else mi(1, 0) #fi)

"AF" |-> (undefMInt)

"ZF" |-> (#ifMInt eqMInt( andMInt( Mem64, getParentValue(R1, RSMap)), mi(64, 0)) #then mi(1, 1) #else mi(1, 0) #fi)

"SF" |-> andMInt( extractMInt( Mem64, 0, 1), extractMInt( getParentValue(R1, RSMap), 0, 1))

"OF" |-> mi(1, 0)
      )
    </regstate>

[klabel(ANDQ-M64-R64)]

// andq-r64-m64

  context execinstr(andq:Opcode HOLE:Mem, R2:R64,  .Operands) [result(MemOffset)]
  
  rule <k>
    execinstr (andq:Opcode memOffset( MemOff:MInt):MemOffset, R2:R64,  .Operands) =>
      loadFromMemory( MemOff, 64) ~>
      execinstr (andq memOffset( MemOff), R2,  .Operands)
  ...</k>
    <regstate> RSMap:Map </regstate>
          
  rule <k>
    memLoadValue(Mem64:MInt):MemLoadValue ~> execinstr (andq:Opcode memOffset( MemOff:MInt):MemOffset, R2:R64,  .Operands) =>
      .
  ...</k>
    <regstate>
      RSMap:Map => updateMap(RSMap,
convToRegKeys(R2) |-> andMInt( getParentValue(R2, RSMap), Mem64)

"CF" |-> mi(1, 0)

"PF" |-> (#ifMInt (notBool (((((((eqMInt( andMInt( extractMInt( getParentValue(R2, RSMap), 63, 64), extractMInt( Mem64, 63, 64)), mi(1, 1)) xorBool eqMInt( andMInt( extractMInt( getParentValue(R2, RSMap), 62, 63), extractMInt( Mem64, 62, 63)), mi(1, 1))) xorBool eqMInt( andMInt( extractMInt( getParentValue(R2, RSMap), 61, 62), extractMInt( Mem64, 61, 62)), mi(1, 1))) xorBool eqMInt( andMInt( extractMInt( getParentValue(R2, RSMap), 60, 61), extractMInt( Mem64, 60, 61)), mi(1, 1))) xorBool eqMInt( andMInt( extractMInt( getParentValue(R2, RSMap), 59, 60), extractMInt( Mem64, 59, 60)), mi(1, 1))) xorBool eqMInt( andMInt( extractMInt( getParentValue(R2, RSMap), 58, 59), extractMInt( Mem64, 58, 59)), mi(1, 1))) xorBool eqMInt( andMInt( extractMInt( getParentValue(R2, RSMap), 57, 58), extractMInt( Mem64, 57, 58)), mi(1, 1))) xorBool eqMInt( andMInt( extractMInt( getParentValue(R2, RSMap), 56, 57), extractMInt( Mem64, 56, 57)), mi(1, 1)))) #then mi(1, 1) #else mi(1, 0) #fi)

"AF" |-> (undefMInt)

"ZF" |-> (#ifMInt eqMInt( andMInt( getParentValue(R2, RSMap), Mem64), mi(64, 0)) #then mi(1, 1) #else mi(1, 0) #fi)

"SF" |-> andMInt( extractMInt( getParentValue(R2, RSMap), 0, 1), extractMInt( Mem64, 0, 1))

"OF" |-> mi(1, 0)
      )
    </regstate>

[klabel(ANDQ-R64-M64)]

// cvtsi2ssq-xmm-m64

  context execinstr(cvtsi2ssq:Opcode HOLE:Mem, R2:Xmm,  .Operands) [result(MemOffset)]
  
  rule <k>
    execinstr (cvtsi2ssq:Opcode memOffset( MemOff:MInt):MemOffset, R2:Xmm,  .Operands) =>
      loadFromMemory( MemOff, 64) ~>
      execinstr (cvtsi2ssq memOffset( MemOff), R2:Xmm,  .Operands)
  ...</k>
    <regstate> RSMap:Map </regstate>
          
  rule <k>
    memLoadValue(Mem64:MInt):MemLoadValue ~> execinstr (cvtsi2ssq:Opcode memOffset( MemOff:MInt):MemOffset, R2:Xmm,  .Operands) =>
      .
  ...</k>
    <regstate>
      RSMap:Map => updateMap(RSMap,
convToRegKeys(R2) |-> concatenateMInt( extractMInt( getParentValue(R2, RSMap), 0, 224), cvt_int64_to_single(Mem64))
      )
    </regstate>

[klabel(CVTSI2SSQ-XMM-M64)]

// movl-r32-r32

  rule <k>
    execinstr (movl R1:R32, R2:R32,  .Operands) => .
  ...</k>
    <regstate>
RSMap:Map => updateMap(RSMap,
convToRegKeys(R2) |-> concatenateMInt( mi(32, 0), extractMInt( getParentValue(R1, RSMap), 32, 64))
)

    </regstate>
    

[klabel(MOVL-R32-R32)]

// movl-r32-r32-semantics


// movq-r64-imm64

  rule <k>
    execinstr (movq Imm64:Imm, R2:R64,  .Operands) => .
  ...</k>
    <regstate>
RSMap:Map => updateMap(RSMap,
convToRegKeys(R2) |-> handleImmediateWithSignExtend(Imm64, 64, 64)
)

    </regstate>
    

[klabel(MOVQ-R64-IMM64)]

// movq-r64-imm64-semantics


// movq-r64-m64

  context execinstr(movq:Opcode HOLE:Mem, R2:R64,  .Operands) [result(MemOffset)]
  
  rule <k>
    execinstr (movq:Opcode memOffset( MemOff:MInt):MemOffset, R2:R64,  .Operands) =>
      loadFromMemory( MemOff, 64) ~>
      execinstr (movq memOffset( MemOff), R2,  .Operands)
  ...</k>
    <regstate> RSMap:Map </regstate>
          
  rule <k>
    memLoadValue(Mem64:MInt):MemLoadValue ~> execinstr (movq:Opcode memOffset( MemOff:MInt):MemOffset, R2:R64,  .Operands) =>
      .
  ...</k>
    <regstate>
      RSMap:Map => updateMap(RSMap,
convToRegKeys(R2) |-> Mem64
      )
    </regstate>

[klabel(MOVQ-R64-M64)]

// movq-r64-r64

  rule <k>
    execinstr (movq R1:R64, R2:R64,  .Operands) => .
  ...</k>
    <regstate>
RSMap:Map => updateMap(RSMap,
convToRegKeys(R2) |-> getParentValue(R1, RSMap)
)

    </regstate>
    

[klabel(MOVQ-R64-R64)]

// movq-r64-r64-semantics

endmodule