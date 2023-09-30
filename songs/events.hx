function onEvent(_)
	switch (_.event.name) {
		case "camZoomingInterval":
			camZoomingInterval = Std.parseInt(_.event.params[0]);
			gfSpeed = camZoomingInterval;
		case "camZoomingStrength": camZoomingStrength = Std.parseFloat(_.event.params[0]);
		case "defaultCamZoom": defaultCamZoom = Std.parseFloat(_.event.params[0]);
	}