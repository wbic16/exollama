# Agent Loop

1. During each time step, we evaluate a state change for each agent's brain (they have 3, like dolphins).
2. Once all brains have been updated, we proceed to the next time step.
3. This process operates on a pod-level, allowing each pod to experience time divergence.

## Initialization

During this phase, agents choose their pod, based upon their initial agent configuration.
