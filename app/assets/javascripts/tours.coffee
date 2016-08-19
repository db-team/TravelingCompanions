$(document).on 'turbolinks:load', ->
	$('body').scrollspy({ target: '#myScrollspy' })

	$('[data-spy="scroll"]').each ->
		$spy = $(this).scrollspy('refresh')
		return

	$('#myScrollspy').on 'activate.bs.scrollspy', ->
		console.log('new nav-link reached !!!')
		return

	$('.nav-item .nav-link').on 'click', (event) ->
		navParent = $(this).parent().parent()
		console.log navParent.children().children()
		navParent.children().children().removeClass('active')
		$(this).addClass 'active'
		event.preventDefault();
		return
return