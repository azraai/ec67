$(document).ready(function() {
    
  $.fn.mask = function(){
    return this.focus(function(){
      if( this.value == this.defaultValue){
        this.value = "";
      }
    }).blur(function(){
      if( !this.value.length ){
        this.value = this.defaultValue;
      }
    });
  };
  
  $(".notice").fadeOut(5000);
  $(".new_item #item_name, .new_item #item_link_attributes_url, .new_item #item_note_attributes_text, .new_item #item_desc").mask();

  if ($.cookie("sc"))
  {
    var id = $.cookie("sc");
    
    $('li#item-' + id).append('<span class="close"><a href="#">Close</a></span');    
    $('li#item-' + id).append('<ul id="thread-' + id + '" class="comments"></ul>');
    
    $.getJSON('/items/' + id + '/comments.json', function(data) {        
      for(i = 0, length = data.length; i < length; ++i) {
        var d = data[i].comment;

        var name = '<span class="name">' + d.name + '</span>';
        var text = '<span class="text">' + d.text + '</span>';
        var html = '<li id="comment' + d.id + '" class="comment">' + name + text + '</li>';

        $('#thread-' + id).append(html);
      }
    });
    
    var form  = []
    form.push('<li class="comment-form">');
    form.push('<form id="new_comment" class="new_comment" method="post" action="/items/' + id + '/comments">');
    form.push('<input type="hidden" name="authenticity_token" value="' + AUTH_TOKEN + '" />');
    form.push('<label for="comment_text">Comment</label><textarea id="comment_text" name="comment[text">Your Comment</textarea>');
    form.push('<label for="comment_name">Name</label><input type="text" id="comment_name" name="comment[name]" value="Your Name" />');
    form.push('<input type="submit" id="comment_submit" name="commit" value="Comment" />');
    form.push('<div class="clear"></div>');
    form.push('</form>');
    form.push('</li>');
    $('#thread-' + id).append(form.join(''));
    
    $("#comment_name, #comment_text").mask();
    $.cookie("sc", null);
  }
  
  $('.comment a').live('click', function () {
    
    var div = $(this).parents('li').attr('id');
    var id = div.split('-')[1];
    
    if($('#thread-' + id).length != 0 ) {
      return false
    } else {
      $('li#' + div).append('<span class="close"><a href="#">Close</a></span');
      $('li#' + div).append('<ul id="thread-' + id + '" class="comments"></ul>');
      
      $.getJSON('/items/' + id + '/comments.json', function(data) {        
        for(i = 0, length = data.length; i < length; ++i) {
          var d = data[i].comment;

          var name = '<span class="name">' + d.name + '</span>';
          var text = '<span class="text">' + d.text + '</span>';
          var html = '<li id="comment' + d.id + '" class="comment">' + name + text + '</li>';

          $('#thread-' + id).append(html);
        }
      });
      
      var form  = []
      form.push('<li class="comment-form">');
      form.push('<form id="new_comment" class="new_comment" method="post" action="/items/' + id + '/comments">');
      form.push('<input type="hidden" name="authenticity_token" value="' + AUTH_TOKEN + '" />');
      form.push('<label for="comment_text">Comment</label><textarea id="comment_text" name="comment[text">Your Comment</textarea>');
      form.push('<label for="comment_name">Name</label><input type="text" id="comment_name" name="comment[name]" value="Your Name" />');
      form.push('<input type="submit" id="comment_submit" name="commit" value="Comment" />');
      form.push('<div class="clear"></div>');
      form.push('</form>');
      form.push('</li>');
      $('#thread-' + id).append(form.join(''));
      
      $("#comment_name, #comment_text").mask();
      
      return false;
    }
  });
  
  $('.close a').live('click', function(){
    if($(this).parents('li').attr('class').split(' ')[0] == 'item'){
      var div = $(this).parents('li').attr('id');
      var id = div.split('-')[1];
      
      $('#thread-' + id).remove();
      $(this).remove();
      return false;
    }else{
      return false;
    }
  });

});