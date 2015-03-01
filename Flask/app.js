/**
 * Send a GET request to the sever
 * 
 * Since it is similiar to the $axaj(),
 * This function is now useless...
 */
function createCORSRequest(method, url) {
  var xhr = new XMLHttpRequest();
  if ("withCredentials" in xhr) {

    // Check if the XMLHttpRequest object has a "withCredentials" property.
    // "withCredentials" only exists on XMLHTTPRequest2 objects.
    console.log(xhr)
    xhr.open(method, url, true);
    //xhr.onreadystatechange = handler;
    xhr.send();
    //console.log(xhr);
    //console.log("create 1");

  } else if (typeof XDomainRequest != "undefined") {

    // Otherwise, check if XDomainRequest.
    // XDomainRequest only exists in IE, and is IE's way of making CORS requests.
    xhr = new XDomainRequest();
    xhr.open(method, url);
    console.log("create 2")
  } else {

    // Otherwise, CORS is not supported by the browser.
    xhr = null;

  }
  return xhr;
}


/**
 * Set a listener on the inputBox
 * send data to the host and get data back
 */
$('#input').on('change', function() {
    console.log("someone called me!")
    var val;
    val = $('#input').val();
    
    var url = "http://www.example.com/"+val;
/*    var xhr = createCORSRequest('GET', url, true);
    if (!xhr) {
        throw new Error('CORS not supported');
    }
    console.log(xhr);
    var data = xhr["responseText"];
    console.log(data);
*/
    // process the response.
    $.ajax({url:url})
	.done(function(data){console.log(data)})
    //$('.articles').children().first().next().text(val);
});
