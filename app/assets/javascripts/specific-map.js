$(document).ready(function() {
  if ($(".specific-map").length > 0) {
    var city = $("#city")
  // trying to get lat/long for specific properties
    // function(properties) {
    //   properties.forEach(function(obj) {
    //     new google.maps.LatLng(obj.latitude, obj.longitude),
    //     }
    //   }
    //
    // var lat = obj.latitude
    // var long = obj.longitude

  // what values do I provide the map for long/lat


    $.ajax({
      url: "/cities/" + $("#city").attr("city-id") + "/properties/" + $("#property").attr("property-id") + ".json",
      typeFormat: "json",
      success: function(obj) {
        var mapOptions = {
          zoom: 15,
          center: new google.maps.LatLng(obj.latitude, obj.longitude),
          mapTypeId: google.maps.MapTypeId.ROADMAP
        };

        map = new google.maps.Map(
          document.querySelector('.specific-map'), mapOptions
        );
        var marker = new google.maps.Marker({
          position: new google.maps.LatLng(obj.latitude, obj.longitude),
          map: map
        });
      }
    })
  }
});
