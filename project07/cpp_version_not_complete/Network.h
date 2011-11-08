//Network 
#include <iostream.h>
#include <stdlib.h>
#include <time.h>
#include <math.h> //For tanh
#include "Layer.h"


#ifndef NETWORK_H
#define NETWORK_H
// returns a float in the range -1.0f -> - 1.0f
#define RANDOM_CLAMP    (((float)rand()-(float)rand())/RAND_MAX)

//returns a float between 0 & 1
#define RANDOM_NUM		((float)rand()/(RAND_MAX+1))

class Network { //The real neural network
      public:
             double net_learning_rate; //Learning rate of network
             Layer *Layers; //The total layers in network
             unsigned long net_tot_layers; //Number of layers
             double *net_inputs; //Input array
             double *net_outputs;//Output layers
             unsigned long *net_layers; //Array which tells no. of neurons in each layer
             //double GetRand(void);
             Network() {
             //Blank Constructor
             }

             int SetData(double learning_rate,unsigned long layers[],unsigned long tot_layers) { //Function to set various parameters of the net
                 if (tot_layers<2) return(-1); //Return error if total no. of layers < 2
                                               //Because input and output layers are necessary
                 net_learning_rate=learning_rate;
                 net_layers= new unsigned long [tot_layers]; //Initialize the layers array
                 Layers=new Layer[tot_layers];
                 for(int i=0;i<tot_layers;i++){
                         net_layers[i]=layers[i];
                         Layers[i].Initialize(layers[i]); //Initialize each layer with the specified size
                         }

                 net_inputs=new double[layers[0]];
                 net_outputs=new double[layers[tot_layers-1]];
                 net_tot_layers=tot_layers;
                 return 0;
                 }
             int SetInputs(double inputs[]){ //Function to set the inputs
                 for(int i=0;i<net_layers[0];i++){
                         Layers[0].Neurons[i].n_value=inputs[i];
                         }
                         return 0;}
             void RandomizeWB(void){ //Randomize weights and biases
                  int i,j,k;
                  for(i=0;i<net_tot_layers;i++){
                          for(j=0;j<net_layers[i];j++){
                                  if(i!=(net_tot_layers-1)){ //Last layer does not require weights
                                       Layers[i].Neurons[j].SetDendrites(net_layers[i+1]); //Initialize the dendites
                                       for(k=0;k<net_layers[i+1];k++){
                                            Layers[i].Neurons[j].Dendrites[k].d_weight=GetRand(); //Let weight be the random value
                                       }
                                   }
                                  // if(i!=0){ //First layer does not need biases
                                  // Layers[i].Neurons[j].n_bias=GetRand();
                                   //}
                                 }
                               }
                    }

           double * GetOutput(void){ //Gives the output of the net
                  double *outputs;
                  int i,j,k;

                  outputs=new double[net_layers[net_tot_layers-1]]; //Temp ouput array

                  for(i=1;i<net_tot_layers;i++){
                      for(j=0;j<net_layers[i];j++){
                      Layers[i].Neurons[j].n_value=0;
                          for(k=0;k<net_layers[i-1];k++){
                              Layers[i].Neurons[j].n_value=Layers[i].Neurons[j].n_value+Layers[i-1].Neurons[k].n_value*Layers[i-1].Neurons[k].Dendrites[j].d_weight; //Multiply and add all the inputs

                              }
                              Layers[i].Neurons[j].n_value=Layers[i].Neurons[j].n_value+Layers[i].Neurons[j].n_bias; //Add bias
                              Layers[i].Neurons[j].n_value=Limiter(Layers[i].Neurons[j].n_value);  //Squash that value
                             }
                            }

                           for(i=0;i<net_layers[net_tot_layers-1];i++){


                           outputs[i]=Layers[net_tot_layers-1].Neurons[i].n_value;

                           }
                           return outputs; //Return the outputs
                           }

           void Update(void){ //Just a dummy function
                //double *temp; //Temperory pointer
                //temp=GetOutput();
                GetOutput();
                //delete temp;
                }

         /*  void SetOutputs(double outputs[]){ //Set the values of the output layer
                for(int i=0;i<net_layers[net_tot_layers-1];i++){
                        Layers[net_tot_layers-1].Neurons[i].n_value=outputs[i]; //Set the value
                        }
                       }  
						*/

           double Limiter(double value){ //Limiet to limit value between 1 and -1
                  //return tanh(value);   //Currently using tanh
                  return (1.0/(1+exp(-value)));
                  }
           double GetRand(void){  //Return a random number between range -1 to 1 using time to seed the srand function
                    //time_t timer;
                    //struct tm *tblock;
                    //timer=time(NULL);
                    //tblock=localtime(&timer);
                    //int seed=int(tblock->tm_sec+100*RANDOM_CLAMP);
                    //srand(tblock->tm_sec);
                   // srand(seed);
                    return (RANDOM_CLAMP);
                    }

           double SigmaWeightDelta(unsigned long layer_no, unsigned long neuron_no){ //Calculate sum of weights * delta. Used in back prop. layer_no is layer number. Layer number and neuron number can be zero
                  double result=0.0;
                  for(int i=0;i<net_layers[layer_no+1];i++) { //Go through all the neurons in the next layer
                      result=result+Layers[layer_no].Neurons[neuron_no].Dendrites[i].d_weight*Layers[layer_no+1].Neurons[i].n_delta; //Comput the summation
                      }
                 return result;
                  }                                                        //neuron_no is neuron number. This function is used in back prop

           /*For output layer:

Delta = (TargetO - ActualO) * ActualO * (1 - ActualO)
Weight = Weight + LearningRate * Delta * Input

For hidden layers:

Delta =  ActualO * (1-ActualO) * Summation(Weight_from_current_to_next AND Delta_of_next)
Weight = Weight + LearningRate * Delta * Input
*/


           int Train(double inputs[],double outputs[]){ //The standard Backprop Learning algorithm
               int i,j,k;
               double Target, Actual, Delta;
               SetInputs(inputs); //Set the inputs
               Update(); //Update all the values
              // SetOutputs(outputs); //Set the outputs
               for(i=net_tot_layers-1;i>0;i--){ //Go from last layer to first layer
                   for(j=0;j<net_layers[i];j++) {//Go thru every neuron
                       if(i==net_tot_layers-1){ //Output layer, Needs special atential
                           Target=outputs[j]; //Target value
                           Actual=Layers[i].Neurons[j].n_value; //Actual value
                           Delta= (Target - Actual) * Actual * (1 - Actual); //Function to compute error
                           Layers[i].Neurons[j].n_delta=Delta; //Compute the delta
                           for(k=0;k<net_layers[i-1];k++) {
                               Layers[i-1].Neurons[k].Dendrites[j].d_weight += Delta*Layers[i-1].Neurons[k].n_value; //Calculate the new weights
                               }

                           Layers[i].Neurons[j].n_bias = Layers[i].Neurons[j].n_bias + Delta*1; //n_value is always 1 for bias
                       } else { //Here
                            //Target value
                           Actual=Layers[i].Neurons[j].n_value; //Actual value
                           Delta=  Actual * (1 - Actual)* SigmaWeightDelta(i,j); //Function to compute error
                           for(k=0;k<net_layers[i-1];k++){
                               Layers[i-1].Neurons[k].Dendrites[j].d_weight += Delta*Layers[i-1].Neurons[k].n_value; //Calculate the new weights
                           }
                          if(i!=0) //Input layer does not have a bias
                         Layers[i].Neurons[j].n_bias = Layers[i].Neurons[j].n_bias + Delta*1; //n_value is always 1 for bias
                       }
                      }
                     } return 0;
                  }
         ~Network(){ delete Layers; }
};

 #endif

