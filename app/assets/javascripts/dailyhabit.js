$(document).ready(function(){

  $('.table2').hide()

  $('.goal-mind').on("click", function(e){
    $('.table2').hide()
    $('.table2').show('.goal-type-mind');
  })

  $('.goal-body').on("click", function(e){
    // alert("body")
    $('.table2').hide()
    $('.table2').show('.goal-type-body');
  })

  $('.goal-social').on("click", function(e){
    // alert("social")
    $('.table2').hide()
    $('.table2').show('.goal-type-social');
  })

  $('.goal-personal-growth').on("click", function(e){
    // alert("personal")
    $('.table2').hide()
    $('.table2').show('.goal-type-growth');
  })

  $('.goal-world-takeover').on("click", function(e){
    // alert("world")
    $('.table2').hide()
    $('.table2').show('.goal-type-world');
  })
    // var goals = $(this);
    //   goals.show('.table2');
//     e.preventDefault();
//     var btn = $(this);
//     $.ajax(btn.attr('href'),{
//       type:'put',
//       dataType:'json'
//     }).done(function(data){
//       btn.before("DONE!");
//       btn.remove();
//     });

//   $('.ajax-goal-add-remove').on("click", function(e){
//     e.preventDefault();
       // e.stopPropagation();
//     var btn = $(this);
//     $.ajax(btn.attr('href'),{
//       type:'put',
//       dataType:'json'
//     }).done(function(data){
//      var = btn.closest('tr').hide();
//       btn.remove();
//     });
//   });

// $('.ajax-goal-custom-remove').on("click", function(e){
//     e.preventDefault();
//     var btn = $(this);
//     $.ajax(btn.attr('href'),{
//       type:'put',
//       dataType:'json'
//     }).done(function(data){
//       btn.hide();
//       btn.closest('tr').hide();
//     });
//   });
  // $(".ajax-goal-form").on("submit", function(e){
  //   e.preventDefault();

  // });

$('.goal-type'+buttonText).show()

}); // end document ready





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

