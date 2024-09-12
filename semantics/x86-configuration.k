requires "x86-syntax.k"
requires "x86-abstract-syntax.k"
// requires "common/common-memory.k"
// requires "x86-memory.k"
// requires "x86-env-init.k"
// requires "x86-mint-wrapper.k"

module X86-CONFIGURATION
  imports X86-SYNTAX
  imports MINT
  imports STRING
  imports MAP
  imports X86-ABSTRACT-SYNTAX
  imports LIST
  // imports COMMON-MEMORY-CONFIGURATION
  // imports X86-MEMORY-SYNTAX
  // imports X86-INIT-SYNTAX
  // imports MINT-WRAPPER-SYNTAX
  // imports X86-LOADER-SYNTAX
  // imports COMMON-C-LIBRARY-CONFIGURATION

  syntax MInt{64}
  syntax MInt{1}
  syntax MInt{256}
  // configuration <T>
  configuration
//initEnvironment(ListItem("a.out") ListItem("HelloWorld!") .List) ~> 
    <k> 
	//initRegisters($REGV:RegValPairList) ~> 
	//initEnvironment($ARGV:List) ~> 
	// initEnvironment(.List) ~> 
	    $PGM:Instructions
        // loadEntryPoint ~>
      // inforegisters ~> 
      // fetch 
    </k>

    // <functargets> .Map </functargets> 
    // <rotargets> .Map </rotargets> 
    // <datatargets> .Map </datatargets> 
    // <bsstargets> .Map </bsstargets> 
    // <entrypoint> .K </entrypoint>
    <nextLocPc> 0p64 </nextLocPc>
    // <lastseenlabel> .K </lastseenlabel>
    <currentsection> "text" </currentsection>

    <debug1> .K </debug1>
    <debug2> .K </debug2>

    <memstate>
      <text> code( .Map ) </text>
    //   <stack>
    //     <memory/>
    //     <stackbase> stackBaseInfo(.K, .K) </stackbase>
    //     <robase> roBaseInfo(.K /* Alocation id*/, .K /*Base Pointer*/, .K /*Next Location*/ ) </robase>
    //     <database> dataBaseInfo(.K , .K , .K ) </database>
    //     <bssbase>   bssBaseInfo(.K , .K , .K ) </bssbase>
    //   </stack>
    </memstate>

    // <environment>
    //   <argc> .K </argc>
    //   <argv> .K </argv>
    // </environment>

    <regstate>
      ("RIP"    |-> 0p64) 
      ("RAX"    |-> 0p64) 
      ("RBX"    |-> 0p64) 
      ("RCX"    |-> 0p64) 
      ("RDX"    |-> 0p64) 
      ("RSI"    |-> 0p64) 
      ("RDI"    |-> 0p64) 
      ("RSP"    |-> 0p64) 
      ("RBP"    |-> 0p64) 
      ("R8"     |-> 0p64) 
      ("R9"     |-> 0p64) 
      ("R10"    |-> 0p64) 
      ("R11"    |-> 0p64) 
      ("R12"    |-> 0p64) 
      ("R13"    |-> 0p64) 
      ("R14"    |-> 0p64) 
      ("R15"    |-> 0p64) 
      ("CF"     |-> 0p1) 
      ("DF"     |-> 0p1) 
      ("PF"     |-> 0p1) 
      ("AF"     |-> 0p1) 
      ("ZF"     |-> 0p1) 
      ("SF"     |-> 0p1) 
      ("OF"     |-> 0p1) 
      ("YMM0"   |-> 0p256) 
      ("YMM1"   |-> 0p256) 
      ("YMM2"   |-> 0p256) 
      ("YMM3"   |-> 0p256) 
      ("YMM4"   |-> 0p256) 
      ("YMM5"   |-> 0p256) 
      ("YMM6"   |-> 0p256) 
      ("YMM7"   |-> 0p256) 
      ("YMM8"   |-> 0p256) 
      ("YMM9"   |-> 0p256) 
      ("YMM10"  |-> 0p256) 
      ("YMM11"  |-> 0p256) 
      ("YMM12"  |-> 0p256) 
      ("YMM13"  |-> 0p256) 
      ("YMM14"  |-> 0p256) 
      ("YMM15"  |-> 0p256)
    </regstate>

    /*@
      The following configuration is used to store the intermediate
      regstate at instruction boundary. Used in debug/testing purposes.

      itracer: For debug purposes
      regstatequeue: For testing purposes
    */

    // <itracer> .List </itracer>
    <regstatequeue> .List </regstatequeue>

    <formatcountint> 0:Int </formatcountint>
    <formatcountfloat> 0:Int </formatcountfloat>
    // <c-library/>
    // <formatting/>
endmodule
