// Chord SynthDef

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

Synth(\ping)



// chords
(a = Pbind(
	\instrument, \ping,
	\note, Pseq([
	[0, 7, 9],
	[0, 9, 5],
	[1, 3, 5],
	[3, 5, 7],
], inf)).play;
)
a.stop;




// pre-recorded sounds
p ="/Users/forrestmesserman/Desktop/Classes-2018/Sonic-Programming/Project 2/Media/EchoesoftheDeep_01.aif"
// load the soundfile into memory
b = Buffer.read(s, p);

// play
(
SynthDef(\playbackBuffer, {
	arg out = 0, bufnum;
    var sig;

	sig = PlayBuf.ar(
		numChannels: 1,
		bufnum: bufnum,
		rate: BufRateScale.kr(bufnum) * MouseX.kr(0, 10).poll(trig: 1.0),
		trigger: 1.0,
		startPos: 0.0,
		loop: 1.0,
		doneAction: 0
	);

	Out.ar(out, sig!2);

}).add;
)
x = Synth(\playbackBuffer, args: [\bufnum, b]);
x.set(\bufnum, 1);



