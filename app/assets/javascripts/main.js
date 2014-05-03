jQuery(document).ready(function($) {

  /* ======= Scrollspy ======= */
  $('body').scrollspy({ target: '#carousel', offset: 400});
  
  /* ======= ScrollTo ======= */
  $('a.scrollto').on('click', function(e){

        //store hash
        var target = this.hash;
        
        e.preventDefault();
        
        $('body').scrollTo(target, 800, {offset: -80}, {easing:'easeOutQuad'});

        //Collapse mobile menu after clicking
        if ($('.navbar-collapse').hasClass('in')){
         $('.navbar-collapse').removeClass('in').addClass('collapse');
       }

     });
  $(function () {
    $('#myTab a:first').tab('show')
  });
  function renderCarousel(){
    var widths =$(document).width();
    var front=400;
    if (widths>992) {
      widths = 910;
      // front-= 40;
      $(".carousel").css("width", widths);
    }else if (widths<=992 && width>=767) {
      widths= 740;
      front-= 60;
      $(".carousel").css("width", widths);
    }else if (widths<767) {
      widths =$(document).width()-20;
      front-= 80;
      $(".carousel").css("width", widths);
    };
    $('.carousel').carousel(
      {carouselWidth:widths,carouselHeight:300,directionNav:false,shadow:true,buttonNav:'bullets',frontWidth:front,frontHeight:300
    });
  }
  renderCarousel();
  $( window ).resize(function() {
    // $("#mypie").empty();
    renderCarousel();
  });
  $(function() {
    $('#datetimepicker1').datetimepicker({
      pickTime: false
        // format: 'dd/MM/yyyy '
      });
  });
});
