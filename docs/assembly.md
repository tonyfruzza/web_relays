# Home Power Automation on the Cheap
### Assembly

Remote disassembled and wired up to the relay board. Leads soldered to each side of the intermittent switch buttons to connect to each of the relays

![Assembled](/docs/images/assembled.png)

Each relay have 3 legs, so it is possible to use a single relay for both on _and_ off. This would trigger a closed circuit for either on or off at all times, but the remote does not support sending multiple button signals simultaneously. The work around was to assign each remote button its own intermittently signaled relay.

The power supply used was something laying around from a previously dead WiFi router that just happened to be the corrected 12 volt size. Coincidentally 12 volts is needed to run the remote, so we no longer need to worry about a battery!

[NEXT](/docs/web_server.md)
