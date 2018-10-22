
(
SynthDef(\bass, {

	arg sig, freq;

	sig = SinOsc.ar(50, mul:0.5);

	Out.ar(0, sig!2);

}).add;
)

Synth(\bass)



s.record

s.stopRecording