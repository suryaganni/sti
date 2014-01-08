// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree ./bootstrap

$(document).ready(function() {

  $(document).on("click","a.remove_fields", function (event) {
    event.preventDefault();
    $(this).prev('input[type=hidden]').val('1');
    $(this).closest('fieldset').hide();
  });

  $(document).on("click","a.add_fields", function (event) {
    event.preventDefault();
    var time = new Date().getTime();
    var regexp = new RegExp($(this).data('id'), 'g');
    $(this).before($(this).data('fields').replace(regexp, time));
    // temp fix
    $('.filter_courses').multiselect({
      includeSelectAllOption: false,
    	enableCaseInsensitiveFiltering: true
    });
  });

  $(document).on("focus",".date-picker", function () {
    $('.date-picker').datepicker({
      format: 'yyyy-mm-dd'
    });
  });
  
  $(document).on("page:change", function () {
    $('.filter_courses').multiselect({
      includeSelectAllOption: false,
    	enableCaseInsensitiveFiltering: true
    });
  });

});

function between_dates() {
  var nowTemp = new Date();
  var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);

  var checkin = $('#dpd1').datepicker({
    format: 'yyyy-mm-dd',
    onRender: function(date) {
      return date.valueOf() < now.valueOf() ? 'disabled' : '';
    }
  }).on('changeDate', function(ev) {
    if (ev.date.valueOf() > checkout.date.valueOf()) {
      var newDate = new Date(ev.date)
      newDate.setDate(newDate.getDate() + 1);
      checkout.setValue(newDate);
    }
    checkin.hide();
    $('#dpd2')[0].focus();
  }).data('datepicker');

  var checkout = $('#dpd2').datepicker({
    format: 'yyyy-mm-dd',
    onRender: function(date) {
      return date.valueOf() <= checkin.date.valueOf() ? 'disabled' : '';
    }
  }).on('changeDate', function(ev) {
    checkout.hide();
  }).data('datepicker');
}
