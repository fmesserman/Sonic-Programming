~fbBus = Bus.audio;


(
SynthDef(\feedbackDelay, {
	arg micIn = 0;
	var sig, inSig, fbSig;

	inSig = SoundIn.ar(micIn);

	fbSig = InFeedback.ar(~fbBus);

	sig = Mix([inSig, fbSig]);

	sig = Normalizer.ar(sig, -3.dbamp);
	sig = Limiter.ar(sig, 1.0);

	sig = DelayL.ar(sig, 0.2, 0.2);

	Out.ar(~fbBus, sig);

	Out.ar(0, sig);
}).add;
)

Synth(\feedbackDelay)