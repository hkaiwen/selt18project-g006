$(document).ready( function () {

  $('#select').change(function () {
    selectVal = $('#select').val();
    console.log(selectVal);
    $('#select_level').prop("disabled", false);
  })

});
