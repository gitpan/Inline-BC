#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "inlinebc.h"

/* parse and compile the bc code down to byte code */
SV* bc_parse(SV* code){

    return newSVpv(my_perl_bc_parse(SvPV(code, SvCUR(code))), 0);

}

/* execute bc byte code */
SV* bc_run(SV* code){

    return newSVpv(my_perl_bc_run(SvPV(code, SvCUR(code))), 0);

}

/* initialise the bc interpreter */
void bc_init(void){

    my_perl_bc_init();

}


MODULE = Inline::BC	PACKAGE = Inline::BC	

BOOT:
#ifdef CREATE_RUBY
do_rdinit();
#endif

PROTOTYPES: DISABLE


SV *
bc_parse (code)
	SV *	code

SV *
bc_run (code)
	SV *	code

void
bc_init ( )

