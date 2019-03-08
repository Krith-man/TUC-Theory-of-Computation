#ifndef CGEN_H
#define CGEN_H

/*
	String streams are handy for using standard C-library
	functions to produce formatted strings.
*/
typedef struct sstream
{
	char *buffer;
	size_t bufsize;
	FILE* stream;
} sstream;

void ssopen(sstream* S);
char* ssvalue(sstream* S);
void ssclose(sstream* S);


/*
 	This function takes the same arguments as printf,
 	but returns a new string with the output value in it.
 */
char* template(const char* pat, ...);

/*
	This is the function used to report errors in the translation.
*/
void yyerror(char const* pat, ...);

/*
	This is set to the number of calls to yyerror
 */
extern int yyerror_count;


/* This is output at the head of a c program. */
extern const char* c_prologue;

/*
 Make a C string literal out of a PTUC string literal.
 Return the corrected string (maybe the same as P).
*/
char* string_ptuc2c(char* P);

// create array declarations in c using given identifiers' names and dimensions
char* getArrayDeclarationString(char* identifiers, char* dimensions);

// create array declarations in c using given identifiers' names, dimensions and type
char* getArrayDeclarationStringWithType(char* identifiers, char* dimensions, char* type);

// create array pointer declarations in c using given identifiers' names and type
char* getArrayPointerDeclarationString(char* identifiers, char* type);

// create parameter declarations in c using given identifiers' names and type
char* getParameterDeclarationString(char* identifiers, char* type);

// create function pointer declarations in c using given identifiers' names, type and parameters
char* getFunctionPointerDeclaration(char* identifiers, char* type, char* parameters);

// create function pointer type Parameters for subprograms in c using given identifiers' names, type and parameters
char* getFunctionPointerDeclarationAsParameters(char* identifiers, char* type, char* parameters);

#endif