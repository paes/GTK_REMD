// public domain 2012, Michal jamroz@chem.uw.edu.pl
// gcc -Wall -o pick -O3 pick.cpp

#include <stdio.h>
#include <stdlib.h>
#include <regex.h>
//using namespace std;

int main ( int argc, char *argv[] )
{
	regex_t model;

	regcomp(&model, "^MODEL", REG_EXTENDED);
	
    if ( argc == 1 ) /* argc should be 2 for correct execution */
    {
        /* We print argv[0] assuming it is the program name */
        printf( "Pick models and save\nUsage: %s tra1.pdb model#\n", argv[0] );
    }
    else 
    {
		FILE * tra;
		
		int which = atoi(argv[argc-1]);
		
		printf ("Model #: %d\n\n",which);
		int err,model_iter=-1;
		char line[80];
		char * s = (char *)malloc(snprintf(NULL, 0, "%s%s.pdb", argv[1], argv[argc-1]) + 1);
	
		sprintf(s, "%s_%s", argv[1], argv[argc-1]);

		FILE * out = fopen(s,"w");
		
			printf("Processing %s ...\n",argv[1]);
			tra = fopen(argv[1],"r");
			while (fgets(line,80,tra)) {
				const char* b = line;
				if ((err = regexec(&model, b, 0, NULL, 0)) == 0) 
					model_iter++;
									
				if (model_iter==which) {
					fprintf(out,"%s",line);
				}
				if (model_iter>which)
					return 0;
				
	

			}
			  fclose(tra);
		
		

		

    fclose(out);
    }
	regfree(&model);
  
}
