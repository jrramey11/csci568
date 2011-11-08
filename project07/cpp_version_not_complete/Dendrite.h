//Jerry Ramey 
//Class Dendrite
#include <iostream.h>
#include <stdlib.h>
#include <time.h>
#include <math.h> //For tanh


#ifndef DENDRITE_H
#define DENDRITE_H
class Dendrite {
public:
               double d_weight; //Weight of the neuron
               unsigned long d_points_to; //The index of the neuron of the next layer to which it points
               Dendrite(double weight=0.0, unsigned long points_to=0){ //Constructor
                           d_weight=weight;
                           d_points_to=points_to; //Give it a initial value
               }

      };

 #endif