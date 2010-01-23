$.fn.mask = function()
{
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

function create_comment_wrap(id)
{
  if(id == undefined) return false
  
  var html = '<ul id="thread-' + id + '" class="comments" style="display:none;"></ul>';
  return html;
}
function create_comment_item(id, data)
{
  if(id == undefined || data == undefined) return false;
    
  var html = [];
    
  html.push('<li id="comment-' + data.id + '" class="comment">');
  html.push('<span class="name">' + data.name + '</span>');
  html.push('<span class="text">' + data.text + '</span>');
  html.push('</li>');
  
  return html.join('');
}

function create_comment_form(id, token)
{
  if(id == undefined || token == undefined) return false;
  
  var html = [];
  
  html.push('<li class="comment-form">');
  html.push('<form id="new_comment" class="new_comment" method="post" action="/items/' + id + '/comments.json">');
  html.push('<input type="hidden" name="authenticity_token" value="' + token + '" />');
  html.push('<label for="comment_text">Comment</label><textarea id="comment_text" name="comment[text">Your Comment</textarea>');
  html.push('<label for="comment_name">Name</label><input type="text" id="comment_name" name="comment[name]" value="Your Name" />');
  html.push('<input type="submit" id="comment_submit" name="commit" value="Comment" />');
  html.push('<div class="clear"></div>');
  html.push('</form>');
  html.push('</li>');
  
  return html.join('');
}

function create_notice(message)
{
  if(message == undefined) return false;
  
  var html = [];
  
  html.push('<div class="notice"><span>');
  html.push(message);
  html.push('</span></div>');
  
  return html.join('');
}

function create_error_notice(message, data)
{
  if(data == undefined) return false;
  
  var html = [];
  
  html.push('<div class="notice"><span>');
  html.push(message + ' ');
  
  for(i = 0, length = data.length; i < length; ++i){
    var ii = i + 1;
    
    if(ii == data.length) html.push(' and');
    
    html.push(' ' + data[i][1]);
  }
  
  html.push('</span></div>');
  
  return html.join('');
}