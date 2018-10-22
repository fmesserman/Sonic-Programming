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


s.record

s.stopRecording
