$(document).on 'turbolinks:load', ->
	$('.pick-member').on 'click', (event) ->
		window.location.href $(this).attr('href')
		event.preventDefault();
		return
return