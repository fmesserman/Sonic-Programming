// bass sounds

(SynthDef(\bassNoise, {
	arg freq;
	var sig, mul;

	sig = Saw.ar(MouseY.kr(0.01, 100), 0.1);

	Out.ar(0, sig!2);
}).add;
)


(SynthDef(\bassNoiseTwo, {
	arg freq;
	var sig, mul;

	sig = SinOsc.ar(MouseY.kr(0.01, 100), 0, 0.3);

	Out.ar(0, sig!2);
}).add;
)


Synth(\bassNoise)
Synth(\bassNoiseTwo)


(b = Pbind(
	\instrument, \bassNoiseTwo,
	\note, Pseq([
	[7],
	[0],
	[1],
	[3],
], inf)).play;
)
b.stop
a.stop

s.record
s.stopRecording