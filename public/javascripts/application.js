$(document).ready(function(){
  
  $(".notice").fadeOut(5000);
  $(".new_item #item_name, .new_item #item_link_attributes_url, .new_item #item_note_attributes_text, .new_item #item_desc").mask();
  
  $(".comment a").live("click", function(){
    
    var item_id       = $(this).parents('li').attr('id').split('-')[1];
    var comments_url  = '/items/' + item_id + '/comments.json';
    
    if( $('#thread-' + item_id).length == 0 ){
      $('li#item-' + item_id).append(create_comment_wrap(item_id));
      $('#thread-' + item_id).append(create_comment_form(item_id, AUTH_TOKEN));
      $("#comment_name, #comment_text").mask();
    
    
      $.getJSON(comments_url, function(data){
        for(i = 0, length = data.length; i < length; ++i){
          $('#thread-' + item_id).append(create_comment_item(item_id, data[i].comment));
        }
      });
    
      $('#thread-' + item_id).fadeIn(1000);
    
    }
    
    return false;
    
  });
  
  $('#new_comment').live('submit', function(){
    
    var new_comment_url   = $(this).attr('action');
    var new_comment_data  = $(this).serialize();
    var item_id           = new_comment_url.split('/')[2];
    
    $.ajax({
      url: new_comment_url,
      type: "POST",
      data: new_comment_data,
      success: function(data, status, xhr){
        if(xhr.status == 201){
          $('#thread-' + item_id + ' .comment-form').after($(create_comment_item(item_id, data.comment)).fadeIn(5000));
          $('#thread-' + item_id + ' #new_comment')[0].reset();
          
          $('body').prepend(create_notice('Thank your for your comment!'));
        }
      },
      error: function(xhr, status, error){
        if(xhr.status == 422){
          $('body').prepend(create_error_notice('You have entered', JSON.parse(xhr.responseText)));
        }
      },
      complete: function()
      {
        $('.notice').fadeOut(5000);
      }
    });
    
    return false;
    
  });

});