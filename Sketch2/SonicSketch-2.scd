(
SynthDef(\ping, {
	arg freq, len = 1, amp = 1;

	var sig, env;

	freq = LFNoise0.ar(1).poll;

	freq = freq.range(275, 625).poll;

	env = Env.new([0,1, 0.3, 0.3, 0], [0.1, 0.05, 0.75, 0.1]);
	env = EnvGen.kr( env, timeScale: len, doneAction: 2);

	sig = SinOsc.ar( [freq, freq*1.01], mul:amp) * env;
	sig = Mix(sig);

	Out.ar(0, sig!2);
}).add;
)


(
t = Task({

	inf.do({
		var freq, len, amp, pos;
		freq = rrand(200.0, 800.0).postln;
		len = rrand(0.2, 4.0).postln;
		amp = rrand(-24.0, -3.0).postln;

		Synth(\ping, [\freq, freq, \len, len, \amp, amp.dbamp]);

		1.0.wait;
	})
})
)




(
SynthDef(\simpleSine, {
	arg freq = 440;
	var sig;

	sig = SinOsc.ar(freq, mul: 0.2);

	Out.ar(0, sig!1);
}).add;
)

a = Synth(\simpleSine)

(
r= Routine({
	a = Synth(\simpleSine);
	0.1.wait;

	5.do({ arg i;
		a.set(\freq, (i + 60).midicps);
		1.wait;

	});
 a.free;
})
)



( {
	var env;
1.wait;
Synth(\ping);
2.wait;
t.start * env;
	3.wait;
r.play;

	env = XLine.kr( start: 2, end: 1, dur: 25) -1;

}.fork;
)



