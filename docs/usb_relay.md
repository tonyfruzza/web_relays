# Home Power Automation on the Cheap
### USB RELAYS
![Relays](/docs/images/relays.png)

To allow a computer to switch electrical circuits it'll need an external piece of hardware. [These KNACRO USB Relay Module Control Boards](https://www.amazon.com/gp/product/B07CNKN1D5/ref=ppx_yo_dt_b_search_asin_title?ie=UTF8&psc=1) come in 1,2,4,8 channel board options. For my application I made use of the 8-Channel 12V board for $17.

For Ubuntu install the drivers/cli tool set for this with

``` sh
apt install usbrelay
```

Otherwise build it from source [darrylb123/usbrelay](https://github.com/darrylb123/usbrelay)

[NEXT](/docs/server.md)
