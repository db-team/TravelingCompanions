//= require jquery
//= require jquery_ujs
//= require tether
//= require bootstrap
//= require bootsy
//= require turbolinks
//= require tourcomment
//= require tours
//// require browse_members

$(document).on("ajax:success", "#new_user_form", function(data, status, xhr) {
    var flash = xhr.getHeader('x-flash');
    if (flash) alert(flash);
});
