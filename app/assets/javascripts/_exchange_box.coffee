$(document).ready ->
  $('select').change ->
    resultExchange();
  $('button').click ->
    currency = $('#currency').val();
    currency_destination = $('#currency_destination').val();
    $('#currency').val(currency_destination);
    $('#currency_destination').val(currency);
    resultExchange();
  $('input').focusout ->
    resultExchange();
  resultExchange = ->
    $('#result').val('Calculando...');
    if $('form').attr('action') == '/exchange'
      $.ajax '/exchange',
          type: 'POST'
          dataType: 'json'
          data: {
                  currency: $('#currency').val(),
                  currency_destination: $('#currency_destination').val(),
                  quantity: $('#quantity').val()
                }
          error: (jqXHR, textStatus, errorThrown) ->
            alert textStatus
          success: (data, text, jqXHR) ->
            $('#result').val(data.value)
        return false;
