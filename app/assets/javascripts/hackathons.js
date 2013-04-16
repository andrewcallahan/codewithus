$('document').ready(function(){
  $('#skills_needed').click(function(e){
    var content = $('#content')
    content.children().remove();
    $.get('/skills_needed', function(data){
      content.append(data);
    })
  });

  $('#add_teammate').click(function(){
    event.preventDefault();
    $('.teammate:last').after($('.teammate:first').clone());
    // $('.teammate:last').remove();

    // $('.teammate').after()
  })

});

