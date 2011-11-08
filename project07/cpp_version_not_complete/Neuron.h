//Neuron 
#include <iostream.h>
#include <stdlib.h>
#include <time.h>
#include <math.h> //For tanh
#include "Dendrite.h"

#ifndef NEURON_H
#define NEURON_H

class Neuron  {
      public:
         unsigned long n_ID; //ID of a particular neuron in a layer
                               //Used to find a particular neuron in an array
	     double n_value; //Value which Neuron currently is holding
	     double n_bias;  //Bias of the neuron
         double n_delta; //Used in back  prop. Note it is backprop specific
         Dendrite *Dendrites; //Dendrites
      //Constructor assigning initial values
	     Neuron(unsigned long ID=0,double value=0.0,double bias=0.0){
                      n_ID=ID;
                      n_value=value;
                      n_bias=bias;
                      n_delta=0.0;

                 }
         void SetDendrites(unsigned long dendrite){ //Set the dendrites from the neuron to given dendrite
              Dendrites=new Dendrite[dendrite];
              for(int i=0;i<dendrite;i++){
                      Dendrites[i].d_points_to=i; // Initialize the dendrite to attach to next layer
                      }
         }
};

 #endif