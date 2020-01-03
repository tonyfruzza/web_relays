# Home Power Automation on the Cheap
### Server

Leveraging what I already have I plugged the relay board into my [QNAP NAS](https://www.amazon.com/gp/product/B017YB9HCE/ref=ppx_yo_dt_b_search_asin_title?ie=UTF8&psc=1) server. It's a great little server for multimedia storage, backups and much more. If you don't currently have a dedicated machine then a basic Raspberry Pi will fill that void.
QNAP comes with a dedicated NAS OS which cannot run all Linux commands. In order to do this Virtualization Station is used to install Ubuntu. This new guest OS is passed the control of the USB control board.

![vmstation](/docs/images/virtualizationStation.png)

[NEXT](/docs/assembly.md)
