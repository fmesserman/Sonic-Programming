(
{
	var  freq, sig;

	freq = LFNoise0.ar(1).poll;

	freq = freq.range(100, 150);

	sig = SinOsc.ar(freq, mul: 0.9);

	Out.ar(0, sig!2);

}.play;)

s.record

s.stopRecording
