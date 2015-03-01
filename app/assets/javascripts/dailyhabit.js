$(document).ready(function(){
  $(".ajax-done-btn").on("click", function(e){
    e.preventDefault();
    var btn = $(this);
    $.ajax(btn.attr('href'),{
      type:'put',
      dataType:'json'
    }).done(function(data){
      btn.before("DONE!");
      btn.remove();
    });
  })

var rows = $('.table2 tr');
  rows.hide()

  $('#goal-mind').on("click", function(e){
    e.preventDefault();
    rows.hide();
    $('.goal-type-mind').show();
  })

  $('#goal-body').on("click", function(e){
    e.preventDefault();
    rows.hide();
    $('.goal-type-body').show();
  })

  $('#goal-social').on("click", function(e){
    e.preventDefault();
    rows.hide();
    $('.goal-type-social').show();
  })

  $('#goal-personal-growth').on("click", function(e){
    e.preventDefault();
    rows.hide();
    $('.goal-type-personal-growth').show();
  })

  $('#goal-world-takeover').on("click", function(e){
    e.preventDefault();
    rows.hide();
    $('.goal-type-world-takeover').show();
  })
});

