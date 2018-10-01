({
	{
	var freq, sig, env1, env2;

	freq = LFNoise0.ar(1).poll;

	freq = freq.range(275, 625).poll;

	env1 = Line.kr( start: 0, end: 1.0, dur: 4);

	env2 = XLine.kr( start: 2, end: 1, dur: 25) -1;


	sig = SinOsc.ar(freq, mul:0.9) * env1 * env2;

	Out.ar(0, sig!2);

}.play;



{
	var freq, sig, env1, env2;

	freq = LFNoise1.ar(1).poll;

	freq = freq.range(70, 150).poll;

	env1 = Line.kr( start: 0, end: 1.0, dur: 4);

	env2 = XLine.kr( start: 2, end: 1, dur: 20) -1;

	sig = SinOsc.ar(freq, mul:0.6) * env1 * env2;

	Out.ar(0, sig!2);

}.play;

	{

	var sig, freq1, freq2, env1, env2;

	freq1 = Line.kr( start: 600, end: 200, dur: 4);
	freq2 = XLine.kr( start: 200, end: 500, dur: 4);

	env1 = Line.kr( start: 0, end: 1.0, dur: 4);

	env2 = XLine.kr( start: 2, end: 1, dur: 10) -1;

	sig = Saw.ar([ freq1, freq2] ) * env1 * env2;

	Out.ar( 0, sig!2);

}.play;

	}.play;)


