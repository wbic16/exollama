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

## Agent Step

Agent processing happens on a logical time clock - one LLM pass per agent per pod per clock cycle. Since ollama distributes computation to available CPU and GPU resources automatically, we prefer to process agents in a sequential manner. This process is handled by invoking `agent-step.sh` once per agent step.

## Exo Step

The pod produces one result per agent per round. Actions are chained via a single call to `exo-step.sh`, which loops until output from `agent-step.sh` stops mutating the local environment.

## Hardware

The reference cluster runs on 6 machines, each one hosts a separate pod from this epoch. You can follow along with your own hardware, or order a pod from https://phext.io/.

* Laptop: 8-core Intel i9 with 32 GB RAM and an NVidia 4080M GPU
* Nodes: 8-core AMD R9 with 96 GB RAM and an AMD 780M GPU

## Initialization

During this phase, agents choose their pod, based upon their initial agent configuration.

## Round 1

Agents demonstrate the ability to edit a personalized scroll that is initialized with their own agent description generated during initialization.
This round is used primarily to ensure that your cluster is operational. Upon completing the agent step for every agent in the current pod, the process will complete.

## Agent Configuration

Each agent has 3 sub-brains and a unique design/history. Refer to each Agent's phext definition for details.
