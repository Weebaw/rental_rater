$(document).ready(function() {
  if ($('.show-map').length > 0) {

  var city = $("#city")
  var lat = 39
  var long = -105.5
  var z = 7

  if (city.text() === "Boulder") {
    lat = 40.014850;
    long = -105.268473;
    z = 13
  }
  else if (city.text() === "Denver") {
    lat = 39.740583;
    long = -104.986261;
    z = 11
  }
  else if (city.text() === "Fort Collins") {
    lat = 40.507863;
    long = -105.008944;
    z = 12
  }

  var mapOptions = {
    zoom: z,
    center: new google.maps.LatLng(lat, long),
    mapTypeId: google.maps.MapTypeId.TERRAIN
  };

    map = new google.maps.Map(
      document.querySelector('.show-map'), mapOptions
    );

    $.ajax({
      url: "/cities/" + $("#city").attr("city-id") + "/properties"+ ".json",
      typeFormat: "json",
      success: function(data) {
        // data is going to be array of your properties which have lat/long methods
        data.forEach(function(obj) {
          // obj.long = -105.02496;
          // obj.lat = 39.463347;
          var marker = new google.maps.Marker({
            position: new google.maps.LatLng(obj.latitude, obj.longitude),
            map: map,
            address: obj.address,
            prop_link: "http://localhost:3000/cities/" + $("#city").attr("city-id") + "/properties" + obj.id
          });

          google.maps.event.addListener(marker, 'click', function() {
            console.log(marker.prop_link);
            alert(marker.address)
            // map.setCenter(marker.getPosition());
          });
        })
      }
    })
  }


});
