$(document).ready(function() {

  var mapOptions = {
    zoom: 7,
    center: new google.maps.LatLng(39, -105.5),
    mapTypeId: google.maps.MapTypeId.TERRAIN
  };

  map = new google.maps.Map(
    document.querySelector('.show-map'), mapOptions
  );

  var marker = new google.maps.Marker({
    position: new google.maps.LatLng(39.463347, -105.02496),
    map: map
  });

});
