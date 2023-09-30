public var noteMovementStrength:Float = 1;
public var noteCamAngleStrength:Float = 1;
var locked:Bool = false;
var campositions:Array<Float> = [0,0];
var targetAngle:Float = 0;
// var oldPos:FlxPoint;

function postCreate() {
	camFollowLerp = 0.06;
	FlxG.camera.followLerp = 0.06;
	// FlxG.camera.focusOn(camFollow.getPosition());
	// FlxG.camera.target = null;
	// FlxG.camera.followLerp = 1;

	// oldPos = FlxPoint.get(0, 0);
}

function postUpdate() {
	targetAngle = 0;

	if (!locked) {
		var stupid = (50*noteMovementStrength);
		switch(strumLines.members[curCameraTarget].characters[0].getAnimName()) {
			case "singLEFT": camFollow.x -= stupid;
			case "singDOWN": camFollow.y += stupid;
			case "singUP": camFollow.y -= stupid;
			case "singRIGHT": camFollow.x += stupid;
		}
	}

	if (locked) {
		camFollow.x = campositions[0];
		camFollow.y = campositions[1];
		targetAngle = 0;
	}

	if (noteCamAngleStrength != 0) camGame.angle = CoolUtil.fpsLerp(camGame.angle, targetAngle, 0.06);
}

function onEvent(_)
	switch(_.event.name) {
		case "Camera Focus":
			locked = _.event.params[2];
			campositions = [Std.parseFloat(_.event.params[0]), Std.parseFloat(_.event.params[1])];
	}

// function onCameraMove(pos) {
// 	if ((oldPos.x != camFollow.x) && (oldPos.y != camFollow.y)) {
// 		FlxTween.cancelTweensOf(FlxG.camera.scroll, ['x', 'y']);
// 		FlxTween.tween(FlxG.camera.scroll, {x: camFollow.x-(FlxG.width/2), y: camFollow.y-(FlxG.height/2)}, (Conductor.stepCrochet*8)/1000, {ease: FlxEase.quadInOut});
// 	}
// 	oldPos.set(camFollow.x, camFollow.y);
// }