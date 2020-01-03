# Home Power Automation on the Cheap
### Web Client
The [web client](https://power.mommycaniwatch.com/) allows any browser enabled device access to the button actions. This is a statically hosted in S3 making use [jquery](https://jquery.com/) for [AJAX](https://www.w3schools.com/xml/ajax_intro.asp) calls.

```javascript
function scanForResources(button_id){
  if(button_id == "1 ON"){
      hw_id = "6QMBS_5"
  } else if(button_id == "1 OFF"){
      hw_id = "6QMBS_6"
  } else if(button_id == "2 OFF"){
      hw_id = "6QMBS_7"
  }else if(button_id == "2 ON"){
      hw_id = "6QMBS_8"
  }else if(button_id == "3 OFF"){
      hw_id = "6QMBS_3"
  }else if(button_id == "3 ON"){
      hw_id = "6QMBS_4"
  }
  data = JSON.stringify({id: hw_id})
  $.ajax({
    type: 'POST',
    url: 'https://dc8pl6l9557au.cloudfront.net/v1/intermittent_on',
    data: data,
    crossDomain: true,
    dataType: 'json',
    success: function(data, status){
    },
    error: function(xhr,status,error){
      console.log(error)
    }
  });
}
```

Code for the web site can be found [here](/web_server/index.html)


[NEXT](/docs/ios_client.md)
