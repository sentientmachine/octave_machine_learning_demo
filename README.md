# Octave machine learning demo

![Imgur](http://i.imgur.com/noZtJKf.jpg)

## The program I used to make a bit of money in the stock market

It demonstrates a supervised machine learning algorithm. It is made of 
GNU Octave and takes two text files representing numeric observables and a 
the numeric outcomes, and creates a single layer neural network with a 
programmable number of hidden units and target signal.  The program uses
fmincg.m to do the heavy lifting and perform gradient descent on the model 
until convergence and stores the model in a summary theta file and does
post processing confirmation that the model works as well on unobserved data.


## Install GNU Octave on your computer.

Assuming linux or similar you can do something like:

<pre>yum install octave;
emerge -avNu octave;
sudo apt-get install octave;

Then you should get something like:

el@apollo:/workspace/octave_machine_learning_demo$ octave -v 
GNU Octave, version 3.8.1
</pre>

## Run it like this:

<pre>octave logisticTest.m
</pre>

<b>Or like this:</b>

<pre>./buildrun.sh
</pre>


## How it works, 10 thousand foot view:

It would take me 1200 words to describe, I'll do you one better and have Andrew NG describe what this is doing:

<a href="https://www.udacity.com/course/machine-learning--ud262">
https://www.udacity.com/course/machine-learning--ud262</a>



## Can this be used to time the stock market?

Sort of yes, and I did for a time, and it does quote work unquote, 
right up until the other AI's at the Citadel in Boston and other large 
hedge funds detect you and sets you up the collective yous for a fall. 

High stakes gambling against billionaires with access to the best and 
brightest minds this planet has on offer from the best universities 
and most expensive equipment, in tall office buildings on public 
securities is generally not a good idea™.   








