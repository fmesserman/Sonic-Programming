({
	var freq, sig;

	freq = LFNoise0.ar(1).poll;

	freq = freq.range(391, 440).poll;

	sig = SinOsc.ar(freq, mul:0.5);

	sig = DelayC.ar(sig, 4, 4);

	Out.ar(0, sig!2);

}.play)

s.record

s.stopRecording
