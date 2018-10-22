({
	var sig;

	sig = PinkNoise.ar(MouseY.kr(0, 0.707));
	sig = LPF.ar( sig, freq: MouseX.kr( 100, 20000) );

	Out.ar(0, sig!2);

}.play)
