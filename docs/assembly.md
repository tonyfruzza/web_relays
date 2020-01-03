# Home Power Automation on the Cheap
### Assembly

Remote disassembled and wired up to the relay board

![Remote](/docs/images/controller.png)

Leads soldered to each side of the intermittent switch buttons to connect to each of the relays

![Assembled](/docs/images/assembled.png)

The relays do have 3 legs each, so it's possible to use a single relay for both on and off. This would trigger a closed circuit for either on or off at all times, but the controller does not support sending multiple button signals simultaneously. The work around was to assign each button a relay and only signal it intermittently.

The power supply used was something laying around from a previously dead WiFi router that just happened to be the corrected 12 volt size. 12 volts is also what is needed to run the remote, we no longer need to worry about a battery!

[NEXT](/docs/assembly.md)
