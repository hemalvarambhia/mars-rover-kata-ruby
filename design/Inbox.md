## Inbox

### Design Tension
**Current Design**: Upload the MarsRoverKata JSON doc to the [CRC card app](https://guidolx.github.io/simple-crc-app/).

1. ~~Parameterised creation method `mars_rover_facing_east` could be a 
named constructor on `MarsRover`. The method talks about facing east
but the test method talks about orienting.~~ :thinking:

2. ~~Orientation (N, E, S, W) are modelled as strings, risking primitive obsession.~~

3. ~~Coordinates is a WHOLE VALUE OBJECT~~

4. How should we treat null edges for a Planet?
5. `next_location_to` and `previous_location_to` are a bit long
6. `coordinates` and `direction` are beginning to clump
7. the Mars rover tests are getting a bit long

