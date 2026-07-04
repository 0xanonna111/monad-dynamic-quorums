# MonadBFT Dynamic Quorum Modulator

In 2026, **Monad** ensures rapid sub-second block finality using **MonadBFT**, a highly optimized consensus mechanism derived from HotStuff. In large distributed validation clusters, temporary spikes in cross-border network latency or sudden node drops can increase the time required to aggregate threshold signatures, resulting in minor throughput dips.

This repository features an advanced architectural simulator demonstrating **Dynamic Quorum Modulation** for Monad infrastructure networks. It tracks validator response latency in real time and adjusts message aggregation paths dynamically, ensuring the network maintains stable, ultra-high TPS performance even during localized network drops.

## System Topology
* **Live Latency Profiling:** Continuously tracks round-trip voting speeds across global validating nodes.
* **BLS Group Reordering:** Optimizes signature aggregation paths to build quorum certificates ($QC$) efficiently, avoiding slow network paths.

## Quick Start
1. Install localized tracking utilities: `npm install`
2. Run the consensus latency simulation runner: `node runQuorumSimulation.js`
