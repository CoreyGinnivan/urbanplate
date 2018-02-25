// This is where it all goes :)
//= require clipboard

$(document).ready(function(){  
  
    var clipboard = new Clipboard('.clipboard');
    console.log(clipboard);
      
});

$('.navbar-toggle').on('click', function(){
    //  $(this).toggleClass('active');
   });
  
$('.navbar-toggle').modaal({
    fullscreen: true
});
  