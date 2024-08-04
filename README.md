## Your Task

You’re part of the team that explores Mars by sending remotely controlled vehicles to the surface of the planet. Develop an API that translates the commands sent from earth to instructions that are understood by the rover.

## Requirements

### 2D Model

- You are given the initial starting point (x,y) of a rover and the direction (N,S,E,W) it is facing.
- DEFINITIONS: when the rover moves E, this is defined as adding +1 step in the x-direction. When it moves W, this is defined as adding -1 step in the x-direction. When it moves N, this is defined as adding +1 in the y-direction. When it moves S, this is defined as adding -1 in the y-direction.
- You are given a maximum x value, minimum x value, maximum y value, and minimum y value, inclusive. The rover must remain within and include these maximum and minimum values in a Cartesian grid.
- You are given an array of obstacle coordinates where the rover cannot travel. This is an array of (x, y) coordinates that you can think of as "filled". This may be an empty array, in which case there are no obstacles.
- X and y coordinates must always be integral (negative, 0, or positive integers).
- The rover receives a character array of commands.
- Implement commands that move the rover forward/backward (f,b).
- A rover must take integral steps in any direction: 1 step at a time increments or decrements x OR y (but never both).
- Implement commands that turn the rover left/right (l,r).
- Implement wrapping at edges. If a rover encounters an edge, it magically teleports to the opposite side.
- Implement obstacle detection before each move to a new square. If a given sequence of commands leads to an encounter with an obstacle, the rover moves up to the last possible accessible point, aborts the sequence, and reports the obstacle.
- The rover should validate all inputs before proceeding. If any input is invalid, this probably means there was a transmission error, so the rover should raise an error and do nothing further until receiving new inputs. Note that this is not the same as obstacle detection; the rover does not know where an obstacle is until it is adjacent to one. For test purposes, we provide an array of obstacle coordinates that are used to check that the rover behaves correctly. (This implementation will need to be fleshed out further.)

Example: If the rover is facing N at (x, y) set to (0, 0), and gets the array of commands ['r', 'f', 'f', 'l'], then it turns right (facing E), takes one step forward to (1, 0), takes another step forward to (2, 0), and then turns left to face N again. Thus it winds up facing N at position (2, 0) after this array of commands has been executed.

Example: Suppose the maximum x value was 10, and the minimum x value was -10. And suppose the rover is at (10, 0) and is commanded to execute ['f']. Going forward would take the rover to x = 11. However, x = 11 is outside the range of allowed values. Therefore, the rover should magically be teleported to x = -10, at the opposite side of the coordinate grid ("wrapping").

Example: Suppose the array of obstacles consists of [(0, 1)], the rover is at (0, 0) facing N, and the rover receives a command to execute ['f']. The rover cannot do this because there is an obstacle directly in its path. The rover should raise an error so that the controller can decide what to do.

Example: If an array of commands is sent, the rover should execute each one in order. If the rover raises an error after attempting to execute a command, it should stop, and not execute any further commands.

### 3D Model

Treat planets as spheres.

TBD

## Rules

- Hardcore TDD. No Excuses!
- Change roles (driver, navigator) after each TDD cycle.
- No red phases while refactoring.
- Be careful about edge cases and exceptions. We can not afford to lose a mars rover, just because the developers overlooked a null pointer.

## Install

If needed `snap install --classic ruby`.

If you see the error `Your Ruby version is 3.3.2, but your Gemfile specified 3.3.1`, then try editing the Gemfile to use the appropriate version of ruby.

```
bundle install
```

## Running the Tests

```ruby
bundle exec rspec -cfd
```

## Code Linting

```ruby
bundle exec rubocop
```

To correct any style error from the command line, run

```ruby
bundle exec rubocop -a
```

and commit any changes in the usual way. In some cases the corrections 
have to be made manually. In this case, if you are new to ruby, 
please speak to your local rubyist.

## Code Smell Detection

I have added a gem called `rubycritic` as one tool we could use in our sessions together
to detect code smells. To use it in this problem, simply run the following

```ruby
bundle exec rubycritic lib
```

Your browser will pop up and a page will show with some feedback on code
quality.