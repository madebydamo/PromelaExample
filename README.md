# PromelaExample
Example Programs using promela and Spin Verification Tool

## Chicken Grain Fox Riddle
A man has to get a fox, a chicken, and a sack of corn across a river.
He has a rowboat, and it can only carry him and one other thing.
If the fox and the chicken are left together, the fox will eat the chicken.
If the chicken and the corn are left together, the chicken will eat the corn.

The [chickengrainfox.pml file](./chickengrainfox.pml) contains a verification model that checks if there is a solution to this riddle.
To run it with the [spin verification tool](https://spinroot.com/spin/whatispin.html) execute the following commands
```
spin -a chickengrainfox.pml
gcc -o pan.out pan.c
./pan.out
```
As you should see, we get an error indicating the riddle is solvable. (We crash on success an skip on failure)

## Dining Philosopher Problem
The [Dining Philosopher Problem](https://en.wikipedia.org/wiki/Dining_philosophers_problem) is a problem, where we could run in a deadlock by concurrently access shared resources with bad policies.

The [diningphilosopher.pml file](./diningphilosopher.pml) contains a verification model that checks if there can occur a deadlock.
To run it with the [spin verification tool](https://spinroot.com/spin/whatispin.html) execute the following commands
```
spin -a diningphilosopher.pml
gcc -o pan.out pan.c
./pan.out
```
To see in which end state the deadlock occurs, run `spin -t diningphilosopher.pml`
To alter the amount of philosopher at the table change in [diningphilosopher.pml file](./diningphilosopher.pml) the first line.
