$(document).on 'turbolinks:load', ->
	$('#tour_transport').addClass('form-control')

	$('body').scrollspy({ target: '#myScrollspy' })

	$('[data-spy="scroll"]').each ->
		$spy = $(this).scrollspy('refresh')
		return

	$('#myScrollspy').on 'activate.bs.scrollspy', ->
		return

	$('.nav-item .nav-link').on 'click', (event) ->
		event.preventDefault();
		navParent = $(this).parents('nav')
		navParent.find('a.nav-link').removeClass('active')
		$(this).addClass 'active'	
		section = $(this).attr('href')
		$(document).scrollTop($(section).offset().top );
		return
return