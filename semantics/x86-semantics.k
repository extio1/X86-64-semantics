requires "x86-loader.k"
requires "x86-env-init.k"
requires "x86-fetch-execute.k"
requires "x86-abstract-semantics.k"
requires "x86-flag-checks.k"
requires "x86-verification-lemmas.k"
requires "x86-instructions-semantics.k"
requires "x86-memory.k"
requires "x86-mint-wrapper.k"
requires "common/common.k"
requires "x86-builtin.k"
requires "x86-c-library.k"

module X86-SEMANTICS
  imports X86-LOADER
  imports X86-INIT
  imports X86-FETCH-EXECUTE
  imports X86-ABSTRACT-SEMANTICS
  imports X86-FLAG-CHECKS
  imports X86-VERIFICATION-LEMMAS
  imports X86-INSTRUCTIONS-SEMANTICS
  imports X86-MEMORY
  imports MINT-WRAPPER
  imports COMMON
  imports X86-BUILTIN
  imports X86-C-LIBRARY
endmodule
