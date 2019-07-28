# Rective Routing Protocols

_Examples:_
- AODV (Adhoc on demand distance vector)
  - modification of DSDV minimizes broadcasts
  - Nodes not in the selected path do not maintain routing information in routing table excahnges
  - Route discovery and exchanges

In AODV the route is discovered only when the data needs to be send.
The route request is sent to the neighbours with source, destination id and max hops.
The nodes that recieve the request push it further in the network.
The route length is set by the forwarding node.
The destination node selectes the shortest possible route and unicasts along the path of shortest length.

Routes are discovered on demand.

Now that the network is dynamic when a node moves out a route maintenance procedure is invoked. This updates the route table.

- DSR

Each node maintains a route cache.

If the source node does not have a route in the cache it will broadcast a route request.

A route reply is generated when either the destination or a node with a route to the destination in found.

DSR works best when the network is symmetric.

