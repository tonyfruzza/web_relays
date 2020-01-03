# Home Power Automation on the Cheap
### Server

Leveraging what I already have I plugged the relay board into my [QNAP NAS](https://www.amazon.com/gp/product/B017YB9HCE/ref=ppx_yo_dt_b_search_asin_title?ie=UTF8&psc=1) server. It's a great little server for multimedia storage, backups and much more. If you don't currently have a dedicated machine then a basic [Raspberry Pi](https://www.amazon.com/Raspberry-Model-2019-Quad-Bluetooth/dp/B07TD42S27/ref=sxin_2_ac_d_pm?ac_md=3-0-VW5kZXIgJDUw-ac_d_pm&crid=13XH9CCSLZX14&cv_ct_cx=raspberry+pi+4&keywords=raspberry+pi+4&pd_rd_i=B07TD42S27&pd_rd_r=ab15954d-f42a-4ff3-bed3-6006edcf43f3&pd_rd_w=KKPWB&pd_rd_wg=Eh02w&pf_rd_p=709d2064-e546-4799-9e66-b352ea89951f&pf_rd_r=SNJ1H7YKFEKVZZB1TBEK&psc=1&qid=1578032825&sprefix=rasp%2Caps%2C204) will fill that void.
QNAP comes with a dedicated NAS [OS called QTS](https://www.qnap.com/en-us/qts4/con_show.php?op=showone&cid=1) which cannot run all Linux commands. In order to do this [Virtualization Station](https://www.qnap.com/solution/virtualization-station/en/) is used to [install Ubuntu](https://ubuntu.com/#download). This new guest OS is passed the control of the USB control board.

![vmstation](/docs/images/virtualizationStation.png)

[NEXT](/docs/assembly.md)
