# Elevator_simulator
Introduction:

Linux application that can simulate elevator system consist of 10 floors and 4 elevators.

The application has graphic indication about where the elevators and how they move between each floors. 

Each floor and elevator has a control panel that can be clicked.

Each elevator has a information section that shows the current floor the elevator is on, how many floor that been selected on the elevator panel and a task list that shows a task queue of the elevator.

Design:
The project has 7 classes. Most of things happends in Building and elevator class. Building contains all the elevator object and floor object. Building will arrange new task and terminate old task for each elevator by determain which button is pressed. For example, if floor 4 is pressed, Building will detect that and assign this task to the most suitable elevator. If elevator reach its target floor, Building will detect that and tell the floor to unpress its button.
