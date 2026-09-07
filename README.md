# Smart Elevator Controller (SystemVerilog)

An FSM-based multilevel elevator controller designed in SystemVerilog, supporting up to 8 floors with intelligent request scheduling. Built as a team project for the Scripting Languages and Verification course at VIT Vellore, under the guidance of Dr. Jyotishman Saikia.

## Overview

Traditional elevator systems often serve requests on a simple first-come-first-served basis, leading to inefficient movement. This project implements a modified priority algorithm: the elevator prioritizes requests in its current direction of travel and, among those, serves the nearest floor first — reducing unnecessary travel and wait times.

## Key Features

- **8-floor support**, extendable to more floors with minor code changes
- **Direction-persistent scheduling** — the elevator continues serving requests in its current direction before reversing
- **Emergency stop handling** — a controlled halt on emergency signal, resuming from the previous state once cleared
- **Automatic door control** — timed door-open signal on arrival at a requested floor
- **Bitwise request accumulation** — efficiently tracks and manages multiple simultaneous floor requests using `min_request`/`max_request` tracking

## FSM Design

The controller moves through the following core states:
`IDLE (Door Closed)` → `Moving Up` / `Moving Down` → `Door Open & Idle` → back to `IDLE`, with direction-setter states handling transitions between up/down movement based on pending requests.

State diagrams (generated with Python's `pydot`) are included in `/docs`.

## Simulation

Verified in ModelSim with a testbench driving continuous, overlapping floor requests. The waveform results (see `/docs`) confirm conflict-free multi-request handling with correct direction switching and door timing.

## Repository Structure
## My Contribution

I designed the core FSM (IDLE, MOVE, and door-operation states), implemented the bitwise request-accumulation logic for handling multiple simultaneous floor requests, and built the direction-wise movement logic (deciding when the elevator switches from up to down and vice versa based on `min_request`/`max_request`).

## Team

A. Ruthvik, D. Koushik, M. Bhanu Tej, M.D.S. Akhil, B. Shanvith, Sivacharan Reddy — VIT Vellore
