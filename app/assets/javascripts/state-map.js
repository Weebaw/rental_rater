$(document).ready(function() {
  if ($(".state-map").length > 0) {
    var mapOptions = {
      zoom: 7,
      center: new google.maps.LatLng(39.03555, -105.55555),
      mapTypeId: google.maps.MapTypeId.TERRAIN
    };

    map = new google.maps.Map(
      document.querySelector('.state-map'), mapOptions
    );

    var marker = new google.maps.Marker({
      position: new google.maps.LatLng(39.463347, -105.02496),
      map: map
    });
  }

});
