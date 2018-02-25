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

function appointmentOnCalendar(){
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

function createAccount(){
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

$(document).ready(function() {
  createAccount();
  appointmentOnCalendar();
})
