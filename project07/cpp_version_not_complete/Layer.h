//Layer 
#include <iostream.h>
#include <stdlib.h>
#include <time.h>
#include <math.h> //For tanh
#include "Neuron.h"

#ifndef LAYER_H
#define LAYER_H
class Layer{
      public:
             Neuron *Neurons; //Pointer to array of neurons

             /*Layer(unsigned long size=1){    //size is no. of neurons in it
             Neurons = new Neuron [size];
                       }  */
              void Initialize(unsigned long size) {   //Initialize the layer
                    Neurons = new Neuron [size];

                    }
             ~Layer(){ //destructor deletes Neurons from the memory
                   delete Neurons;
               }
             Neuron GetNeuron(unsigned long index){  //Give the neuron at index
                    return Neurons[index];
                                            }
             void SetNeuron(Neuron neuron,unsigned long index){ //sets the neuron
                    Neurons[index]=neuron;
                    }
};

 #endif
