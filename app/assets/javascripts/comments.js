$(document).on('turbolinks:load', function() {
  $('form').on('submit', function(event) {
    event.preventDefault();
    var form = $(this);
    var url = form.attr('action');
    var formData = form.serialize();
    $.ajax({
      type: 'POST',
      url: url,
      data: formData,
      dataType: 'script',
      success: function(data) {
        form.trigger('reset');
      },
      error: function(xhr, status, error) {
        console.log(xhr.responseText);
      }
    });
  });
});
