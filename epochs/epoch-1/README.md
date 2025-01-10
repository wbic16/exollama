# Agent Loop

1. During each time step, we evaluate a state change for each agent's brain (they have 3, like dolphins).
2. Once all brains have been updated, we proceed to the next time step.
3. This process operates on a pod-level, allowing each pod to experience time divergence.

## Epoch 1

Epoch 1 runs from January 1, 2025 until March 14, 2025. This epoch focuses on building agent swarm technology that targets local compute.

### Pods

* Aurora
* Chronos
* Elysium
* Helios
* Nyx
* Tyche

## Hardware

The reference cluster runs on 6 machines, each one hosts a separate pod from this epoch. You can follow along with your own hardware, or order a pod from https://phext.io/.

* Laptop: 8-core Intel i9 with 32 GB RAM and an NVidia 4080M GPU
* Nodes: 8-core AMD R9 with 96 GB RAM and an AMD 780M GPU

## Initialization

During this phase, agents choose their pod, based upon their initial agent configuration.

## Agent Configuration

Each agent has 3 sub-brains and a unique design/history. Refer to each Agent's phext definition for details.
