var marker;

function initMapLocations() {
  geocoder = new google.maps.Geocoder();
  map = new google.maps.Map(document.getElementById("map"),
  {
    zoom: 8,
    center: new google.maps.LatLng(22.7964,79.5410)
  });
}

function codeAddress() {
  var address = document.getElementById("address").value;
  var lat = document.getElementById("geo_lat").value;
  var lng = document.getElementById("geo_lng").value;

  geocoder.geocode( { 'address': address}, function(results, status){
    if (status == google.maps.GeocoderStatus.OK) {
      map.setCenter(results[0].geometry.location);
      lat = results[0].geometry.location.lat;
      lng = results[0].geometry.location.lng;
      content = results[0].formatted_address;

      $('#geo_lat').val(lat);
      $('#geo_lng').val(lng);
      $('#geo_content_en').val(content);

      marker = new google.maps.Marker({
        map: map,
        position: results[0].geometry.location,
        draggable: true
      });
      markerCoords(marker);
    } else {
      alert("Geocode was not successful for the following reason: " + status);
    }
  });
}


function markerCoords(markerobject){
  google.maps.event.addListener(markerobject, 'dragend', function(evt){
    $('#geo_lat').val(evt.latLng.lat());
    $('#geo_lng').val(evt.latLng.lng());
  });
}
