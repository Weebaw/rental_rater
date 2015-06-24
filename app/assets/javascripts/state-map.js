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

    // var marker = new google.maps.Marker({
    //   position: new google.maps.LatLng(40.015901, -105.273280),
    //   map: map
    // });
    //
    // var marker = new google.maps.Marker({
    //   position: new google.maps.LatLng(39.738471, -104.990381),
    //   map: map
    // });
    //
    // var marker = new google.maps.Marker({
    //   position: new google.maps.LatLng(40.586649, -105.090655),
    //   map: map
    // });

    var markers = [];

    marker = new google.maps.Marker({
      position: new google.maps.LatLng(40.015901, -105.273280),
      map: map
    });
    markers.push(marker)

    marker = new google.maps.Marker({
      position: new google.maps.LatLng(39.738471, -104.990381),
      map: map
    });
    markers.push(marker)

    marker = new google.maps.Marker({
      position: new google.maps.LatLng(40.586649, -105.090655),
      map: map
    });
    markers.push(marker)

  }
    // google.maps.event.addListener(marker, 'mouseover');
    $('.btn').on('mouseover', bounce)

    function bounce() {
      console.log("this:", this);
      console.log("markers", markers);
      if (marker.getAnimation()) {
        marker.setAnimation(null);
      } else {
        marker.setAnimation(google.maps.Animation.BOUNCE);
      }
    }

});
