//Main
#include <iostream.h>
#include <stdlib.h>
#include <time.h>
#include <math.h> //For tanh
#include "Dendrite.h"
#include "Neuron.h"
#include "Layer.h"
#include "Network.h"

int main()
{     Network my;

      unsigned long inp=3;
      unsigned long hid=2;
      unsigned long outp=3;
      unsigned long layers[3];
      layers[0]=inp;
      layers[1]=hid;
      layers[2]=outp;
      int i=0,j=0;
      unsigned long iter=0;
      cout<<"Enter number of training Iterations : ";
      cin>>iter;
      my.SetData(0.0,layers,3);

      double input[]={1,0};
      double *outputs;
      my.RandomizeWB();

      double tr_inp[3][3]={{1.0,0.25,-0.5},{1.0,0.25,-0.5},{1.0,0.25,-0.5}};
      double tr_out[3][3]={{1.0,-1.0,0.0},{1.0,-1.0,0.0},{1.0,-1.0,0.0}};
      cout<<"\nStarting Training... ";
      for(i=0;i<iter;i++){
      //cout<<"\nTraining : "<<i+1;
      for(j=0;j<3;j++){
      my.Train(tr_inp[j],tr_out[j]);

      }}
      cout<<"\nEnding Training. ";
      cout<<"\n\nStarting Testing... \n";
      for(j=0;j<3;j++){}
      cout<<"\n\nCase number : "<<j+1;
      my.SetInputs(tr_inp[j]);
      outputs=my.GetOutput();
      for(i=0;i<inp;i++){
      cout<<"\nInput"<<i+1<<" : "<<tr_inp[j][i];
      }
      for(i=0;i<outp;i++){
              cout<<"\nOutput"<<i+1<<" : "<<outputs[i];
      }
      delete outputs;
	  double *outputs;
      }

      cout<<"\n\nEnd Testing.\n\n";
      //cin.get();

      return 0;
}