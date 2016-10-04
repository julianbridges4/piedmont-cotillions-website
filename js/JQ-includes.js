$(function () {
	$('#Header').load('Nav-inc.htm', function() {

		$('.dropdown').each(function () {
			$(this).parent().eq(0).hoverIntent({
				timeout: 100,
				over: function () {
					var current = $('.dropdown:eq(0)', this);
					current.slideDown(100);
				},
				out: function () {
					var current = $('.dropdown:eq(0)', this);
					current.fadeOut(200);
				}
			});

		});

	});
	$('#Footer').load('Footer-inc.htm');

});
