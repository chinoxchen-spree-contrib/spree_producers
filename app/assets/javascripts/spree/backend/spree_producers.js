document.addEventListener('DOMContentLoaded', function () {
  var actual_value = $("#producer_phone").val();
  var phone_code = '569';

  if(actual_value){
    phone_code = actual_value.substring(3, -1) || '569'
    actual_value = actual_value.substring(3) || ''
  } else {
    actual_value = ''
    phone_code = '569'
  }

  $('[data-mask-phone]').hide();
  $('<div class="row px-3">').append(
    $('<select id="phone_prefix" class="custom-select col-3"/>')
    .append($('<option value="569">').text('+569'))
    .append($('<option value="562">').text('+562')),
    $('<input id="phone_number" maxlength="8" minlength="8" class="col-9" placeholder="Número teléfono" value="' + actual_value + '"/>')
  ).appendTo('#producer_phone_field');
  $('#phone_prefix').change(function () {
    $('#producer_phone').val($('#phone_prefix').val() + $('#phone_number').val().replace(' ', ''))
  });
  $('#phone_number').keyup(function () {
    $('#producer_phone').val($('#phone_prefix').val() + $('#phone_number').val().replace(' ', ''))
  });

  $("#phone_prefix").val(phone_code)
});