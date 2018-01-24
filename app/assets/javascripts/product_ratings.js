$(document).ready(function(){
  $(function () {
    var $rateYo = $("#rateYo").rateYo();
    $(".getRating").click(function () {
      /* get rating */
      var rating = $rateYo.rateYo("rating");
      window.alert("Its " + rating + " Yo!");
      var comment = $("#comment").val()
      var prod_id = $(this).attr('id').split('_')[1]

      $.ajax({
        method: 'post',
        beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
        url: "/product_ratings",
        data:{
          rating: rating,
          comment: comment,
          product_id: prod_id,
        }
      })
    });
    $rateYo.rateYo("option", "halfStar", true);
  });
});