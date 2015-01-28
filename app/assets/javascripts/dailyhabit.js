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

  $('.ajax-goal-add-remove').on("click", function(e){
    e.preventDefault();
    var btn = $(this);
    $.ajax(btn.attr('href'),{
      type:'put',
      dataType:'json'
    }).done(function(data){
      btn.hide();
      btn.siblings('a').show();
    });
  });
})

// $.ajax('http://localhost:3000/users/36/goalscomplete',{type:'put',dataType:'json'}).done(function(data){console.log(data);});

// glyphicon to change to something else
// completed today = true, save that
//
//deleting
//active=false

//user profile
//each loop, active false don't display,
//if complete = true

//for update
//for custom goals - always display active or not
//if goal type = user not active...find or create on user custom goals
//don't delete user goals, just inactive.

