#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stddef.h>
#include <math.h>

#ifdef _WIN32
#include <windows.h>

typedef __int32 int32_t;
typedef unsigned __int32 uint32_t;
#define usleep(x) Sleep(x/1000)
#endif

double randn (double mu, double sigma){
	double U1, U2, W, mult;
	static double X1, X2;
	static int call = 0;

	if (call == 1){
	  call = !call;
	  return (mu + sigma * (double) X2);
	}

	do{
	  U1 = -1 + ((double) rand () / RAND_MAX) * 2;
	  U2 = -1 + ((double) rand () / RAND_MAX) * 2;
	  W = U1*U1 + U2*U2;
	}while (W >= 1 || W == 0);

	mult = sqrt ((-2 * log (W)) / W);
	X1 = U1 * mult;
	X2 = U2 * mult;

	call = !call;

	return (mu + sigma * (double) X1);
}

int signum(double x) {
    return (0 < x) - (x < 0);
}

int main(int argc, char **argv) {
	// parameters
	double Tref = 1/(25e6);
	double Tfree = 1/(250.01e6);
	long int max = 1000000;
	int d = 0;
	int N = 10;
	double Kp = 0.1;
	double Ki = 0.01;
	double Kt = 1e6*Tfree*Tfree;
	double dco_noise = 16e-12;
	int i_max = 1000;
	int j_max = 40; //number of dco noise data
	double all_dco_noise[40] = {
			1.00000000000000e-15, 1.34339933259890e-15, 1.80472176682717e-15, 2.42446201708233e-15, 3.25702065565978e-15, 
			4.37547937507418e-15, 5.87801607227492e-15, 7.89652286849973e-15, 1.06081835513945e-14, 1.42510267030300e-14, 
			1.91448197616996e-14, 2.57191380905935e-14, 3.45510729459222e-14, 4.64158883361277e-14, 6.23550734127393e-14, 
			8.37677640068292e-14, 1.12533558260076e-13, 1.51177507061566e-13, 2.03091762090473e-13, 2.72833337648677e-13, 
			3.66524123707963e-13, 4.92388263170675e-13, 6.61474064123016e-13, 8.88623816274341e-13, 1.19377664171444e-12, 
			1.60371874375133e-12, 2.15443469003189e-12, 2.89426612471675e-12, 3.88815518030809e-12, 5.22334507426685e-12, 
			7.01703828670384e-12, 9.42668455117885e-12, 1.26638017346740e-11, 1.70125427985259e-11, 2.28546386413498e-11, 
			3.07029062975785e-11, 4.12462638290135e-11, 5.54102033000950e-11, 7.44380301325170e-11, 1.00000000000000e-10};
	
	//variable for calculation;
	double *dt = (double*) calloc (d+2,sizeof(double));
	int *pfd = (int*) calloc (d+2,sizeof(int));
	int *m = (int*) calloc (d+2,sizeof(int));
	double *dlf = (double*) calloc (d+2,sizeof(double));
	double noise = 0;
	//position pointer
	int ptr_dly,ptr_cur,ptr_prv;
	//output result
	long int rise_cntr;
	double rising;
	double jitter;
	//Create file
	FILE *fp_rise, *fp_jitter;
	//open the file for writing
	fp_rise = fopen ("rise.csv","w");
	fp_jitter = fopen ("jitter.csv","w");
	
	
	//write 10 lines of text into the file stream
	for(int i = 0; i < i_max; i++){
		printf("i=%d\n",i);
		Kp = (i + 1)/((double) i_max);
		for (int j = 0; j<j_max; j++){
			
			//zeroed the values
			for(int k=0; k<d+2; k++){
				dt[k] = 0;
				pfd[k] = 0;
				m[k] = 0;
				dlf[k] = 0;
			}
			ptr_cur = 1;
			ptr_prv = 0;
			ptr_dly = (1-d)%(d+2);
			rise_cntr = 0;
			jitter = 0;
			rising = 0;
			
			//Noise over N outptu cycle
			dco_noise = all_dco_noise[j]*sqrt((float) N);
			//Main calculation
			for(long int k=0; k<max; k++){
				//Calculation
				noise = randn(0,dco_noise);
				dt[ptr_cur] = dt[ptr_prv] + Tref -
								N*(Tfree+Kt*dlf[ptr_prv]) - noise;
				pfd[ptr_cur] = signum(dt[ptr_cur]);  
				m[ptr_cur] = m[ptr_prv] + pfd[ptr_cur];
				dlf[ptr_cur] = Kp*pfd[ptr_dly] + Ki*m[ptr_dly];
				//jitter and rising edge calculation
				rise_cntr += abs(pfd[ptr_cur]-pfd[ptr_prv])/2;
				jitter += dt[ptr_cur]*dt[ptr_cur];
				//update pointer
				ptr_prv = ptr_cur;
				ptr_cur = (ptr_cur + 1)%(d+2);
				ptr_dly = (ptr_dly + 1)%(d+2);
			}
			
			//calculate rising and jitter
			jitter = sqrt(jitter/max);
			rising = ((double) rise_cntr)/(2*max);
			//save rising and jitter
			if(j==j_max-1){
				fprintf(fp_jitter, "%0.15e",jitter);
				fprintf(fp_rise, "%0.15e",rising);
				printf("%d\n",j);
			}
			else {
				fprintf(fp_jitter, "%0.15e,",jitter);
				fprintf(fp_rise, "%0.15e,",rising);
				printf("%d,",j);
			}
		}
		fprintf (fp_jitter, "\n");
		fprintf (fp_rise, "\n");
	}

	/* close the file*/  
	fclose (fp_jitter);  
	fclose (fp_rise);
}

