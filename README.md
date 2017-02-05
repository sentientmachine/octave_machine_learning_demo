# Octave machine learning demo


[ http://i.imgur.com/noZtJKf.jpg ]

**Program which demonstrates machine learning in Octave.**

You need to install Octave on your computer, here are<br>
some clues:<br>
<a href="http://ericleschinski.com/c/gnu_octave_install_and_intro/">http://ericleschinski.com/c/gnu_octave_install_and_intro/</a>

<b>I'm using:</b>
<pre>el@apollo:/workspace/octave_machine_learning_demo$ octave -v 
GNU Octave, version 3.8.1
</pre>


<b>Run it like this:<br></b>

<pre>
octave logisticTest.m
</pre>

<b>How it works, 10 thousand foot view:<br></b>

It runs the machine learning algorithm described by Sebastian Thrun,<br>
Andrew NG, and Michael Littman and uses those principles to <br>
take a set of feature data and create a neural network which itself<br>
is a map that can guide a user to take unknown inputs and use that<br>
to calculate the final answer.<br>
<br>
<b>Low level details on how/why it works:</b>
<br>
<a href="https://www.udacity.com/course/machine-learning--ud262">https://www.udacity.com/course/machine-learning--ud262</a>

<br>
<br>
<b>Why is this interesting:</b><br>
A similar version of this occurs in humans when babies first learn to <br>
tell the difference between dogs and cats.  Using examples and <br>
contrasting/comparing the differences between one and the other<br>
you can create a graph of nodes and weights to classify <br>
what in the data is signal, and what is noise.  These concepts were<br>
discovered in the 1950's, and used throughout the 1970's through today to <br>
knock over the stock market, make self driving cars, have speech recognition<br>
technology on your phone, and many other applications.<br>
<br>
These machine learning concepts are leaking out into the hoi polloi<br>
and are being used to eliminate jobs where humans do repetitive motion<br>
work requiring only a minimal version of intelligence.<br>
<br>
The next 50 years will be about using these computers to usher in a<br>
post-work civilization where the machines do the work, and the humans are<br>
there to only specify and define what work is to be done and when to do<br>
it.   Question is, do I get rich eliminating labor from the human race <br>
or do I get minimum wage just like the non one percenters.<br><br>

<b>If you're young and niave, and want to use this to knock over the <br>
stock market. Is this code battle tested and up for the task?</b><br>
<br>
Although it does work perfectly and absolutly will find the signal<br>
in the feature data if it exists, you need more than that to spot<br>
bottoms in the stock market.<br>
<br>
I took this basic example and scaled it up to work on 120 features<br>
on hundreds of thousands of rows from stocks, trying to find <br>
sustainably exploitable patterns in the securities markets in order<br>
to buy stocks low and sell them dear.  But alas as you can see, one <br>
should not go into a boxing ring with a prized fighter unless you <br>
are prepared to play poker with the best of them, to outwit the<br>
brightest minds on the planet making machine learning algorithms.<br>
To win at the stock market, you not only have to be smarter than <br>
people, your software has to be significantly better than your opponents<br>
software.  When you gamble in the stock market, you are playing your AI <br>
against AI built by companies with billions of dollars and all the<br>
best years of the brightest minds out of top 10 CS schools.<br>
<br>


<b>Can it be used to time the stock market?</b><br>
Yes, and I did, and it works, up until the other AI sets you up<br>
for a big fall. However, understand you're about 20 years late to <br>
this party.  This is already used by citadel and the hundreds of <br>
other hedge funds earning billions of dollars per year off the <br>
backs of the proletariat class who keep their claims on future<br>
human labor on receipts of paper in banks and the stock market.<br>
<br>
<br>
<br>






