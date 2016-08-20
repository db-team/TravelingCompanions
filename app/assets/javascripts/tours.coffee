$(document).on 'turbolinks:load', ->
	$('#tour_transport').addClass('form-control')

	$('body').scrollspy({ target: '#myScrollspy' })

	$('[data-spy="scroll"]').each ->
		$spy = $(this).scrollspy('refresh')
		return

	$('#myScrollspy').on 'activate.bs.scrollspy', ->
		console.log('new nav-link reached !!!')
		return

	$('.nav-item .nav-link').on 'click', (event) ->
		navParent = $(this).parents('nav')
		navParent.find('a.nav-link').removeClass('active')
		$(this).addClass 'active'
		event.preventDefault();
		return
return