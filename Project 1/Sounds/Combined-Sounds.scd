({
	var sig;

	sig = PinkNoise.ar(MouseY.kr(0, 0.707));
	sig = LPF.ar( sig, freq: MouseX.kr( 100, 20000) );

}.play)




({
	var freq, sig;

	freq = LFNoise0.ar(1).poll;

	freq = freq.range(391, 440).poll;

	sig = SinOsc.ar(freq, mul:0.5);

	sig = DelayC.ar(sig, 4, 4);

	Out.ar(0, sig!2);

}.play)


(
SynthDef(\bass, {

	arg sig, freq;

	sig = SinOsc.ar(50, mul:0.5);

	Out.ar(0, sig!2);

}).add;
)

Synth(\bass)


~fbBus = Bus.audio;


(
SynthDef(\feedbackDelay, {
	arg micIn = 0;
	var sig, inSig, fbSig;

	inSig = SoundIn.ar(micIn);

	fbSig = InFeedback.ar(~fbBus);

	sig = Mix([inSig, fbSig]);

	sig = Normalizer.ar(sig, -3.dbamp);

	sig = DelayL.ar(sig, 0.2, 0.2);

	Out.ar(~fbBus, sig);

	Out.ar(0, sig!2);
}).add;
)

Synth(\feedbackDelay)