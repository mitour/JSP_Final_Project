$(document).ready(function(){

$("#service").waypoint(function(direction){
	/* 如果滑鼠往下 (down) 移動才有作用 */
	if(direction === "down") {
		$(".circle1").circleProgress({
			value: 0.75,
			size: 200,
			startAngle: 1.5*Math.PI,
			fill: {
				color: "#fff"
			}
		}).on('circle-animation-progress', function(event, progress){
			$(this).find('strong').html(parseInt(75*progress) +'%');
		});
		$(".circle2").circleProgress({
			value: 0.75,
			size: 200,
			startAngle: 1.5*Math.PI,
			fill: {
					color: "#fff"
			}
		}).on('circle-animation-progress', function(event, progress){
			$(this).find('strong').html(parseInt(500*progress));
		});
		$(".circle3").circleProgress({
			value: 0.75,
			size: 200,
			startAngle: 1.5*Math.PI,
			fill: {
					color: "#fff"
			}
		}).on('circle-animation-progress', function(event, progress){
			$(this).find('strong').html(parseInt(75*progress) + '<i>%</i>');
		});
		$(".circle4").circleProgress({
			value: 0.75,
			size: 200,
			startAngle: 1.5*Math.PI,
			fill: {
					color: "#fff"
			}
		}).on('circle-animation-progress', function(event, progress){
			$(this).find('strong').html(parseInt(75*progress) + '<i>%</i>');
		});
	}}, {
		/* 如果 #service 要有作用，需設定 #service 距離視窗頂部的高度 */
		offset: '550'
	});
 
});