%{
int installID(void);
int installNum(void);


enum tags {
	LT, LE, GT, GE, EQ, NE,
	IF, THEN, ELSE, WHILE, ID, STRING, CHARA, NUM, RELOP,
	INICIO, FIN, LEER, ESCRIBIR, O, Y, SI, ENTONCES, FINSI,
	SINO, SELECCION, FINSELECCION, ACCION, FINACCION,
	FUNCION, RETORNAR, FINFUNCION, REPETIR, HASTA, MIENTRAS, HACER,
	FINMIENTRAS, ITERAR, PARADA, FINITERAR,
	SUMA, RESTA, MULTIPLICACION, DIVISION, POTENCIA,
	MODULO, DE, AND, OR, NOT, ENTERO, REAL,
	LOGICO, CARACTER, RETORNO, ASIGNACION, COMMI, COMMF,
	PARI, PARF
};

int idCount = 0;
int numCount = 0;
int yylval;
%}

delim		[ \t\n]
ws			{delim}+
letter		[A-Za-z_]
digit		[0-9]
id			{letter}({letter}|{digit})*
number		{digit}+(\.{digit}+)?([Ee][+-]?{digit}+)?
string		\"([^"\\]|\\\"|\\\\)*\"
chara		\'(.)?\'
comm		\{(.)*\}

%%

{ws}		{ /* NADA */ }
if			{ return(IF); }
then		{ return(THEN); }
else		{ return(ELSE); }
while		{ return(WHILE); }
INICIO		{ return(INICIO); }
FIN			{ return(FIN); }
LEER		{ return(LEER); }
ESCRIBIR	{ return(ESCRIBIR); }
O			{ return(O); }
Y			{ return(Y); }
SI			{ return(SI); }
ENTONCES	{ return(ENTONCES); }
FINSI		{ return(FINSI); }
SINO		{ return(SINO); }
SELECCION	{ return(SELECCION); }
FINSELECCION	{ return(FINSELECCION); }
ACCION		{ return(ACCION); }
FINACCION	{ return(FINACCION); }
FUNCION		{ return(FUNCION); }
RETORNAR	{ return(RETORNAR); }
FINFUNCION	{ return(FINFUNCION); }
REPETIR		{ return(REPETIR); }
HASTA		{ return(HASTA); }
MIENTRAS	{ return(MIENTRAS); }
HACER		{ return(HACER); }
FINMIENTRAS	{ return(FINMIENTRAS); }
ITERAR		{ return(ITERAR); }
PARADA		{ return(PARADA); }
FINITERAR	{ return(FINITERAR); }
MOD		{return(MODULO);}
DIV		{return(DE);}
AND		{return(AND);}
OR		{return(OR);}
NOT		{return(NOT);}
ENTERO	{return(ENTERO);}
REAL	{return(REAL);}
LOGICO		{return(LOGICO);}
CARACTER	{return(CARACTER);}

{id}		{ yylval = (int) installID(); return(ID); }
{number}	{ yylval = (int) installNum(); return(NUM); }
{chara}		{ return(CHARA); }
{string}	{ return(STRING); }
{comm}		{	}
"<"			{ return(LT); }
"<="		{ return(LE); }
">"			{ return(GT); }
">="		{ return(GE); }
"=="		{ return(EQ); }
"!="		{ return(NE); }
"+"		{return(SUMA);}
"-"		{return(RESTA);}
"*"		{return(MULTIPLICACION);}
"/"		{return(DIVISION);}
"**"		{return(POTENCIA);}
"<-"	{return(ASIGNACION);}
"="		{return(EQ);}
"->"	{return(RETORNO); }
"{"		{return(COMMI);}
"}"		{return(COMMF);}
"("		{return(PARI);}
")"		{return(PARF);}

%%

const char *get_tag_str(int tag) {
	switch(tag) {
		case LT:
			return "LT";
		case LE:
			return "LE";
		case GT:
			return "GT";
		case GE:
			return "GE";
		case EQ:
			return "EQ";
		case NE:
			return "NE";
		case IF:
			return "IF";
		case THEN:
			return "THEN";
		case ELSE:
			return "ELSE";
		case ID:
			return "ID";
		case NUM:
			return "NUM";
		case STRING:
			return "STRING";
		case CHARA:
			return "CHARA";
		case RELOP:
			return "RELOP";
			
		case INICIO:
			return "INICIO";
		case FIN:
			return "FIN";
		case LEER:
			return "LEER";
		case ESCRIBIR:
			return "ESCRIBIR";
		case SI:
			return "SI";
		case O:
			return "O";
		case Y:
			return "Y";
		case ENTONCES:
			return "ENTONCES";
		case FINSI:
			return "FINSI";
		case SINO:
			return "SINO";
		case SELECCION:
			return "SELECCION";
		case FINSELECCION:
			return "FINSELECCION";
		case ACCION:
			return "ACCION";
		case FINACCION:
			return "FINACCION";
		case FUNCION:
			return "FUNCION";
		case RETORNAR:
			return "RETORNAR";
		case FINFUNCION:
			return "FINFUNCION";
		case REPETIR:
			return "REPETIR";
		case HASTA:
			return "HASTA";
		case MIENTRAS:
			return "MIENTRAS";
		case HACER:
			return "HACER";
		case FINMIENTRAS:
			return "FINMIENTRAS";
		case ITERAR:
			return "ITERAR";
		case PARADA:
			return "PARADA";
		case FINITERAR:
			return "FINITERAR";
			
		case SUMA:
			return "SUMA";
		case RESTA:
			return "RESTA";
		case MULTIPLICACION:
			return "MULTIPLICACION";
		case DIVISION:
			return "DIVISION";
		case POTENCIA:
			return "POTENCIA";
		case MODULO:
			return "MODULO";
		case DE:
			return "DE";
		case AND:
			return "AND";
		case OR:
			return "OR";
		case NOT:
			return "NOT";
		case ENTERO:
			return "ENTERO";
		case REAL:
			return "REAL";
		case LOGICO:
			return "LOGICO";
		case CARACTER:
			return "CARACTER";
		case RETORNO:
			return "RETORNO";
		case ASIGNACION:
			return "ASIGNACION";
		case COMMI:
			return "COMMI";
		case COMMF:
			return "COMMF";
		case PARI:
			return "PARI";
		case PARF:
			return "PARF";
		

			
		default:
			return "INVALIDO";
	}
}

int main() {
	int yyret = yylex();
	while (yyret != YY_NULL) {
		if(get_tag_str(yyret)=="ID"){
			printf("<token %s , %d>\n", get_tag_str(yyret), idCount);
		}else if(get_tag_str(yyret)=="NUM"){
			printf("<token %s, %d>\n", get_tag_str(yyret), numCount);
		}else{
			printf("<token %s>\n", get_tag_str(yyret));
		}
		yyret = yylex();
	}
}

int installID() {
	return idCount++;
}

int installNum() {
	return numCount++;
}
