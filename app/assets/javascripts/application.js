// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require Chart.bundle
//= require chartkick
//= require jquery3
//= require rails-ujs
//= require_tree .

$(document).ready(function() {
  showDifferentCreateAccountForms();
  showAppointmentOwnersName();
  callFallRiskAPI();
  callBackPainAPI();
  autosuggestDoctorsInDatabase();
  showInsuranceInfo();
  showProviderTools();
})

function showProviderTools(){
  $('#fall-button').click(function(){
    event.preventDefault();
    $('.fall-risk-section').toggle()
    $('.back-pain-section').hide()
  })
  $('#back-pain-button').click(function(){
    event.preventDefault();
    $('.back-pain-section').toggle()
    $('.fall-risk-section').hide()
  })
}

function showInsuranceInfo(){
  $('.show-insurance').click(function(){
    $(this.firstElementChild).toggle()
  })
}

function showAppointmentOwnersName(){
  $('.appointment-on-calendar').hover(function(e){
    $(this.firstElementChild).show()
    .css('top', e.pageY + 10)
    .css('left', e.pageX + 10)
  }, function(){
    $('.appointment-info').hide();
  });
  $('.appointment-on-calendar').mousemove(function(e) {
    $('.appointment-info').css('top', e.pageY + 10).css('left', e.pageX + 10);
  });
}

function showDifferentCreateAccountForms(){
  $('.new-doctor-form').hide();
  $('.provider-dropdown').change(function(){
    if ($('.provider-dropdown').val() === "No") {
      $('.new-doctor-form').hide();
      $('.new-patient-form').show();
    }
    if ($('.provider-dropdown').val() === "Yes") {
      $('.new-doctor-form').show();
      $('.new-patient-form').hide();
    }
  })
}

function callBackPainAPI(){
  $(".predict-back-pain").click(function(){
    event.preventDefault();
    var lumbar = parseInt($("#lumbar-form").val());
    var pelvic = parseInt($("#pelvic-form").val());
    var thoracic = parseFloat($("#thoracic-form").val());
    var cervical = parseInt($("#cervical-form").val());
    var sacral = parseInt($("#sacral-form").val());
    var scoliosis = parseFloat($("#scoliosis-form").val());
    var endpoint = `https://fall-risk-api.herokuapp.com/v1/predictlowbackpain?lumbar=${lumbar}&thoracic=${thoracic}&cervical=${cervical}&pelvic=${pelvic}&sacral=${sacral}&scoliosis=${scoliosis}`

    fetch(endpoint)
      .then((response) => response.json())
      .then((data) => {
        var modelAccuracy = parseInt(data['model_accuracy'] * 100);
        $(".back-risk").html(`Low Back Pain: ${data["low_back_pain"]}`)
        $(".back-model-accuracy").html(`Model Accuracy: ${modelAccuracy}%`)
      })
      .catch(() => alert("Error occurred, please check for missing data?"))
    })

}

function callFallRiskAPI(){
  $(".predict-fall-risk").click(function(){
    event.preventDefault();
    var age = parseInt($("#age-form").val());
    var berg = parseInt($("#berg-form").val());
    var gait = parseFloat($("#gait-form").val());
    berg = berg / 56 * 100;

    var endpoint = `https://fall-risk-api.herokuapp.com/v1/predictfallrisk?age=${age}&berg=${berg}&gait=${gait}`
    fetch(endpoint)
      .then((response) => response.json())
      .then((data) => {
        var modelAccuracy = parseInt(data['model_accuracy'] * 100);
        $(".fall-risk").html(`Fall Risk: ${data["fall_risk"]}`)
        $(".model-accuracy").html(`Model Accuracy: ${modelAccuracy}%`)
      })
      .catch(() => alert("Error occurred, please check for missing data?"))
    })
}

function autosuggestDoctorsInDatabase(){
  $("#doctor-search-name").keyup(function(event){
    var name = $("#doctor-search-name").val();
    var domain = window.location.origin;
    var endpoint = domain + "/api/v1/doctors?name="+name;
      if (name === "") {
        $(".all-doctors").show();
        $(".doctor-db").hide();
      } else {
        $.getJSON(endpoint, function(data) {
          var doctors = data.map(function(doctor){
            return "<div class='doctor-search'>"+
              "<h3 class='doctor-db-name'>"+doctor["name"]+"</h3>" +
              "<div class='specialty'>SPECIALTY: "+doctor["specialty"]+"</div>" +
              "<div class='location'>ADDRESS: "+doctor["location"]+"</div>" +
              "<div class='phone'>PHONE: "+doctor["phone"]+"</div>"+
              "<a class='submit-link' href=add/"+doctor["id"]+">Add to My Care Team</a>"+
              "</div>"
          })
          $(".doctor-db").html(doctors);
          $(".all-doctors").hide();
          $(".doctor-db").show();
        })
      }
    event.preventDefault();
  })
}
