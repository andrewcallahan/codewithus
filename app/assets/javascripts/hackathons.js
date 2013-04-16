$('document').ready(function(){
  $('#skills_needed').click(function(e){
    var content = $('#content')
    content.children().remove();
    $.get('/skills_needed', function(data){
      content.append(data);
    })
  });



});

