data Your Library;
 infile '/home/u62410891/Your Library.csv' dsd;
 input Name$ Artist$ Album$;
run;

proc sql;
 select Artist, count(Artist) as total_count
 from Your Library
 group by Artist
 order by total_count DESC;
quit;

data Streaming History;
 infile '/home/u62410891/Streaming History.csv' dsd;
 input End_Time$ Artist$ Track$ Miliseconds_Played;
run;

proc sql;
 select Artist, count(Artist) as count_Artist, sum(Miliseconds_Played) as sum_MP
 from Streaming History
 group by Artist
 order by sum_MP DESC;
quit;


data Streaming History;
 infile '/home/u62410891/Streaming History.csv' dsd;
 input End_Time$ Artist$ Track$ Miliseconds_Played Playlist$;
run;

proc sql;
 select Track, count(Track) as count_Track, sum(Miliseconds_Played) as sum_MP
 from Streaming History
 group by Track
 order by sum_MP DESC;
quit;

data Playlist;
 infile '/home/u62410891/Playlist.csv' dsd;
 input Playlist_ID$ Playlist$ Artist$ Track$;
run;

proc sort data=Playlist;
 by Playlist_ID;
run;
title "Overview of my playlist";
proc print data=Playlist;
by Playlist_ID;
var Playlist_ID Playlist Artist Track;
run;

proc sql;
 select Playlist_ID, count(Playlist_ID) as total_count
 from Playlist
 group by Playlist_ID
 order by total_count DESC;
quit;



proc sql;
 select Playlist, count(Miliseconds_Played) as total_MP
 from Streaming History
 group by Playlist
 order by total_MP;
quit;

data Streaming History;
 infile '/home/u62410891/Streaming History.csv' dsd;
 input End_Time$ Artist$ Track$ Miliseconds_Played;
run;

proc sql;
 select Playlist, count(Miliseconds_Played) as total_MP
 from Streaming History
 group by Playlist
 order by total_MP;
quit;


data Streaming History;
 infile '/home/u62410891/Streaming History.csv' dsd;
 input End_Time$ Artist$ Track$ Miliseconds_Played;
run;

proc sql;
 create table Streaming
 as select distinct End_Time, sum(Miliseconds_Played) as sum_MP
 from Streaming History
 group by End_Time
 order by sum_MP DESC;
quit;

ods graphics / reset;
proc sgplot data=Streaming(obs=5);
  title1 "My Streaming Time";
  hbar End_Time / response=sum_MP
      datalabel datalabelattrs=(weight=bold) categoryorder=respdesc ;
      xaxis grid label = "Total Streaming Time per day";
      yaxis grid label = 'Date';
run;

proc means data=YourLibrary;
 vars danceability energy key loudness mode speechiness acousticness instrumentalness liveness valence tempo Miliseconds_Played;
run;


data YourLibrary;
  infile datalines delimiter=',';
  input Artist$ Track$ danceability energy key loudness mode speechiness acousticness instrumentalness liveness valence tempo Miliseconds_Played;
  datalines;
Troye Sivan,	Angel Baby,	0.559,	0.559,	11,	-6.425,	1,	0.0358,	0.0145,	0,	0.138,	0.338,	72.498,	480424
Rain,	난,	0.776,	0.64,	10,	-4.547,	1,	0.151,	0.397,	0,	0.12,	0.844,	132.025,	559305
Martin Garrix,	Animals,	0.676,	0.865,	1,	-6.381,	1,	0.0389,	0.00105,	0.648,	0.382,	0.0372,	128.006,	15026690
高隆華LEON,	鮮奶茶 MILK TEA,	0.846,	0.426,	11,	-7.425,	1,	0.0873,	0.298,	0,	0.104,	0.549,	120.019,	13866948
Vincent Blue,	It's Raining,	0.656,	0.369,	10,	-6.348,	1,	0.0354,	0.565,	0,	0.197,	0.787,	77.987,	295502
Anyma,	Consciousness,	0.596,	0.837,	7,	-5.983,	0,	0.0488,	0.0775,	0.806,	0.297,	0.0954,	125.93,	866182
Narysal,	Fade Away,	0.676,	0.729,	0,	-4.177,	1,	0.0497,	0.224,	0,	0.14,	0.508,	123.979,	1009414
Ra.D,	I'm in Love (Piano Remix),	0.462,	0.285,	0,	-10.352,	1,	0.0574,	0.915,	0.000000656,	0.144,	0.411,	74.136,	192140
Norwegian Wood,	First Confession (Vocal Who R U?),	0.828,	0.243,	4,	-8.088,	1,	0.0333,	0.886,	0.00000295,	0.0923,	0.78,	98.944,	3354411
Johnny Stimson,	Flower,	0.486,	0.361,	0,	-7.682,	0,	0.21,	0.135,	0,	0.0989,	0.5,	196.78,	7407
DJ Snake,	U Are My High (with Future),	0.602,	0.824,	0,	-4.087,	0,	0.0547,	0.0867,	0,	0.0947,	0.442,	125.147,	6591961
TWICE,	Ice Cream,	0.651,	0.572,	5,	-6.452,	0,	0.0375,	0.451,	0,	0.113,	0.234,	123.866,	628846
Dane Amar,	Green Tea & Honey,	0.845,	0.241,	2,	-10.948,	0,	0.0395,	0.513,	0,	0.0722,	0.799,	94.869,	1179091
BILL STAX,	뜨겁지가 않아,	0.61,	0.573,	2,	-5.276,	1,	0.081,	0.717,	0,	0.197,	0.541,	87.936,	1435504
Ellis G,	Red Sippy Cup,	0.651,	0.509,	2,	-8.384,	0,	0.342,	0.652,	0,	0.476,	0.717,	185.846,	994294
Wocean Wang,	唯一 - Wocean Remix,	0.454,	0.317,	5,	-9.512,	1,	0.0346,	0.614,	0,	0.0938,	0.646,	92.908,	1184043
AKMU,	Officially Missing You,	0.817,	0.485,	7,	-7.312,	1,	0.043,	0.547,	0,	0.173,	0.488,	105.052,	2145415
GroovyRoom,	This Night (feat. Blue.D, Jhnovr),	0.405,	0.651,	1,	-5.613,	0,	0.199,	0.353,	0,	0.0828,	0.466,	84.004,	1129097
Jaxx & Vega,	Rave Time (W&W Edit),	0.527,	0.96,	4,	-3.436,	0,	0.166,	0.00695,	0.436,	0.537,	0.103,	130.046,	7198009
Chancellor,	Walking In The Rain (feat. Younha),	0.584,	0.539,	11,	-8.1,	1,	0.0611,	0.432,	0.0000282,	0.108,	0.514,	85.782,	431160
YOOK SUNGJAE,	The Sweetest Love,	0.689,	0.582,	5,	-5.94,	0,	0.0364,	0.253,	0,	0.0724,	0.813,	140.037,	465628
JI JIN SEOK,	Good Night,	0.52,	0.314,	9,	-6.959,	1,	0.0384,	0.897,	0,	0.095,	0.321,	112.513,	1789978
RPG,	黑人問號.jpg,	0.792,	0.49,	6,	-6.794,	1,	0.0721,	0.0643,	0,	0.046,	0.929,	90.001,	21813697
Hyolyn,	Good bye 안녕,	0.582,	0.446,	10,	-8.412,	1,	0.0297,	0.766,	0,	0.168,	0.395,	79.975,	1678740
WONHO,	Ain't About You (feat. Kiiara),	0.781,	0.593,	7,	-7.65,	0,	0.18,	0.42,	0,	0.317,	0.926,	110.033,	1012687
小蓝背心,	目及皆是你,	0.696,	0.501,	9,	-8.177,	1,	0.0294,	0.827,	0.00000353,	0.245,	0.476,	109.979,	15672304
Rezz,	Someone Else,	0.644,	0.349,	2,	-5.315,	0,	0.0364,	0.206,	0.0000336,	0.125,	0.246,	94.971,	204726
Mau P,	Drugs From Amsterdam,	0.686,	0.928,	8,	-10.38,	1,	0.0527,	0.0316,	0.727,	0.0576,	0.631,	124.986,	7914821
Rangga Jones,	Other Half,	0.602,	0.483,	1,	-10.294,	0,	0.209,	0.705,	0.00000276,	0.0879,	0.237,	85.117,	86796
余佳运,	关于我和你,	0.551,	0.41,	4,	-9.642,	1,	0.0746,	0.619,	0.000508,	0.126,	0.385,	84.934,	6743486
BTS,	MIC Drop (Steve Aoki Remix) - Full Length Edition,	0.606,	0.85,	11,	-3.952,	1,	0.183,	0.0114,	0.00000101,	0.206,	0.542,	170.01,	3532217
Billie Eilish,	Therefore I Am,	0.889,	0.34,	11,	-7.773,	0,	0.0697,	0.218,	0.13,	0.055,	0.716,	94.009,	683521
BEN,	You,	0.506,	0.537,	5,	-5.736,	1,	0.0394,	0.678,	0,	0.161,	0.177,	139.603,	229760
蒋小呢,	For Ya,	0.602,	0.501,	8,	-8.697,	1,	0.0346,	0.578,	0,	0.11,	0.475,	91.032,	1153488
Kauai45,	Just The Two of Us,	0.592,	0.214,	1,	-13.468,	1,	0.115,	0.936,	0.0000162,	0.253,	0.422,	81.672,	851402
Lambert凌,	Tonight (with Demxntia),	0.703,	0.652,	0,	-5.361,	1,	0.193,	0.0621,	0.000363,	0.0939,	0.423,	170.09,	252340
En,	奉劝,	0.596,	0.562,	2,	-7.318,	1,	0.0324,	0.663,	0,	0.15,	0.373,	138.087,	11272695
Billie Eilish,	ocean eyes,	0.511,	0.363,	4,	-7.65,	0,	0.041,	0.816,	0.0317,	0.084,	0.169,	144.892,	10146
Alan Walker,	Faded - Tiesto's Deep House Remix,	0.601,	0.773,	6,	-7.365,	1,	0.0318,	0.000287,	0.481,	0.112,	0.38,	122.004,	4004554
Toyote,	Still I Love You,	0.599,	0.783,	9,	-6.192,	0,	0.324,	0.61,	0,	0.373,	0.559,	89.569,	9040963
David Guetta,	Satisfaction,	0.752,	0.935,	11,	-6.263,	1,	0.203,	0.0742,	0.0352,	0.081,	0.31,	126.022,	3826798
Chris James,	Not Angry,	0.859,	0.353,	5,	-10.888,	0,	0.0589,	0.633,	0.000399,	0.108,	0.625,	123.996,	199687
Armin van Buuren,	No Fun,	0.731,	0.904,	10,	-4.774,	0,	0.0349,	0.00861,	0.000164,	0.0916,	0.328,	121.03,	10240952
Billie Eilish,	WHEN I WAS OLDER - Music Inspired By The Film ROMA,	0.696,	0.332,	6,	-12.834,	1,	0.0425,	0.853,	0.433,	0.0848,	0.0628,	150.13,	4480
队长,	可能,	0.543,	0.547,	5,	-6.302,	1,	0.0267,	0.465,	0,	0.126,	0.431,	132.106,	4023471
Shawn Mendes,	Fallin' All In You,	0.853,	0.476,	8,	-6.696,	1,	0.0361,	0.405,	0,	0.111,	0.796,	92.038,	235746
Rich Brian,	Attention (feat. Offset),	0.884,	0.547,	11,	-7.492,	1,	0.387,	0.0438,	0,	0.124,	0.425,	158.019,	260036
Emily Sie,	Call Me,	0.651,	0.302,	6,	-10.388,	1,	0.0892,	0.857,	0,	0.292,	0.343,	75.509,	1462
Vanilla Acoustic,	The Time We Shared,	0.571,	0.569,	4,	-6.928,	1,	0.0423,	0.783,	0,	0.11,	0.229,	147.947,	707551
Martin Garrix,	Summer Days (feat. Macklemore & Patrick Stump of Fall Out Boy),	0.661,	0.723,	5,	-6.976,	0,	0.0566,	0.179,	0.0000123,	0.14,	0.316,	113.778,	43230203
Ren Ran,	无人之岛,	0.461,	0.454,	5,	-7.845,	1,	0.035,	0.391,	0.00000775,	0.147,	0.243,	139.866,	478817
H.E.R.,	Slide (Remix) (feat. Pop Smoke, A Boogie Wit da Hoodie & Chris Brown) (feat. Pop Smoke),	0.816,	0.513,	1,	-8.363,	1,	0.244,	0.0145,	0.000102,	0.14,	0.17,	96.981,	882
Afrojack presents NLW,	Party Girl,	0.599,	0.79,	3,	-6.45,	0,	0.0326,	0.0398,	0.000105,	0.274,	0.0927,	145.041,	3966848
周彥辰,	你的男友(影視劇《我才不要和你做朋友呢》戀愛主題曲),	0.605,	0.625,	1,	-9.011,	1,	0.157,	0.616,	0,	0.195,	0.679,	147.975,	142825
7Princess,	Happy Christmas,	0.67,	0.594,	1,	-4.399,	1,	0.0264,	0.428,	0.0012,	0.354,	0.285,	135.852,	229053
Chris Lake,	Turn off the Lights,	0.824,	0.745,	11,	-5.49,	0,	0.0755,	0.0467,	0.0000329,	0.198,	0.888,	125.013,	7296819
TWISTERZ,	Cook It Up,	0.761,	0.985,	1,	-2.926,	1,	0.056,	0.0137,	0.634,	0.314,	0.18,	127.979,	5494750
J_ust,	Because of You,	0.469,	0.577,	10,	-2.879,	1,	0.0356,	0.681,	0,	0.0777,	0.192,	133.149,	1776439
BIGBANG,	Fantastic Baby,	0.725,	0.841,	2,	-3.924,	1,	0.0545,	0.002,	0,	0.0652,	0.582,	130.013,	193561
FKJ,	Lying Together,	0.791,	0.729,	3,	-6.234,	0,	0.0646,	0.456,	0.291,	0.0957,	0.0782,	102.021,	10003083
Billie Eilish,	bury a friend,	0.905,	0.389,	8,	-14.505,	1,	0.332,	0.74,	0.162,	0.106,	0.196,	120.046,	1439
THE ADE,	10 Reasons For I Love You,	0.736,	0.367,	9,	-5.335,	1,	0.0278,	0.825,	0,	0.0961,	0.462,	97.941,	388434
SOYA,	Fade Away 늘어진 우리의 연애,	0.59,	0.55,	2,	-5.095,	0,	0.0841,	0.539,	0,	0.116,	0.638,	89.845,	448338
Jay Chou,	聽媽媽的話,	0.719,	0.64,	10,	-6.615,	1,	0.0287,	0.391,	0.0000652,	0.11,	0.595,	92.989,	906111
Justin Timberlake,	Like I Love You,	0.853,	0.811,	6,	-4.927,	0,	0.0646,	0.439,	0.000307,	0.0703,	0.9,	114.964,	1135698
Selena Gomez & The Scene,	Love You Like A Love Song,	0.858,	0.678,	1,	-3.87,	0,	0.0469,	0.0761,	0,	0.0741,	0.922,	117.009,	188453
Drake,	Emotionless,	0.414,	0.677,	1,	-5.12,	1,	0.254,	0.0248,	0,	0.0793,	0.0853,	172.521,	1655091
Kassy,	Like a dream,	0.559,	0.557,	6,	-3.915,	1,	0.034,	0.602,	0,	0.0994,	0.565,	178.049,	1237948
山K,	一步一步走进你的心,	0.776,	0.25,	7,	-10.858,	1,	0.0487,	0.631,	0,	0.344,	0.754,	114.981,	16978968
Chan,	Walkin' In The Park,	0.494,	0.542,	1,	-7.205,	0,	0.0454,	0.835,	0.000215,	0.109,	0.349,	139.128,	11472507
Suni Hạ Linh,	Cảm Nắng,	0.696,	0.412,	9,	-7.071,	1,	0.0523,	0.518,	0,	0.0657,	0.304,	80.015,	21546868
Tracy Wang,	不枉,	0.714,	0.313,	1,	-7.888,	1,	0.0775,	0.814,	0,	0.0917,	0.472,	80.988,	309836
队长,	NUNA - 和声伴奏,	0.483,	0.645,	6,	-6.475,	1,	0.0329,	0.00294,	0.418,	0.105,	0.305,	138.162,	17181018
PAUL,	Sleeping Beauty,	0.712,	0.664,	1,	-7.751,	0,	0.0355,	0.00182,	0.836,	0.167,	0.404,	94.984,	3784
Rich Brian,	Love In My Pocket,	0.832,	0.615,	0,	-7.948,	0,	0.0351,	0.02,	0,	0.11,	0.77,	113.017,	549568
沈以誠,	雨 (電視劇《以家人之名》插曲),	0.521,	0.335,	6,	-7.938,	1,	0.0308,	0.857,	0,	0.0952,	0.166,	125.929,	473497
Cosmic Boy,	Can I Love ? (feat. youra, Meego),	0.708,	0.441,	5,	-4.212,	0,	0.0623,	0.555,	0.00000452,	0.121,	0.275,	79.958,	1131779
Lee Seok Hoon,	10 reasons for I love you,	0.683,	0.684,	5,	-6.381,	0,	0.0302,	0.0503,	0,	0.242,	0.415,	117.963,	388434
Sarah Connor,	Christmas In My Heart,	0.648,	0.517,	9,	-5.227,	0,	0.0273,	0.536,	0,	0.0601,	0.184,	119.96,	1282785
BBYU,	The Sweetest Love,	0.689,	0.582,	5,	-5.94,	0,	0.0364,	0.253,	0,	0.0724,	0.813,	140.037,	465628
McKay,	Angel 2 Me,	0.636,	0.522,	3,	-5.687,	1,	0.127,	0.655,	0,	0.124,	0.654,	83.048,	14749
J.Sheon,	看起來不錯其實也還好,	0.559,	0.566,	8,	-6.018,	1,	0.0791,	0.204,	0,	0.102,	0.309,	141.757,	117023
Henry,	RADIO,	0.763,	0.764,	0,	-5.414,	1,	0.144,	0.123,	0,	0.111,	0.262,	146.863,	464936
NWYR,	S1R1,	0.669,	0.856,	0,	-6.673,	1,	-0.12,	0.0134,	0.199,	0.274,	0.335,	124.041,	34103427
Hello Ga-Young,	솜과 사탕,	0.744,	0.823,	0,	-4.635,	1,	0.0294,	0.328,	0,	0.221,	0.807,	118.981,	92322
MC MONG,	Sick enough to die (Feat. JAMIE),	0.621,	0.87,	6,	-4.17,	1,	0.064,	0.344,	0,	0.163,	0.611,	122.04,	11877197
陈一彤,	一整个爱住你,	0.572,	0.579,	3,	-8.845,	1,	0.0472,	0.599,	0.00000841,	0.351,	0.668,	109.952,	5415493
Darius,	Espoir,	0.6,	0.617,	3,	-7,	0,	0.0555,	0.0955,	0.913,	0.108,	0.037,	106.892,	414812
Lil Nas X,	INDUSTRY BABY (feat. Jack Harlow),	0.736,	0.704,	3,	-7.409,	0,	0.0615,	0.0203,	0,	0.0501,	0.894,	149.995,	812
Justin Bieber,	Peaches (feat. Daniel Caesar & Giveon),	0.677,	0.696,	0,	-6.181,	1,	0.119,	0.321,	0,	0.42,	0.464,	90.03,	118862
Audrey Mika,	Just Friends,	0.868,	0.656,	7,	-6.579,	1,	0.0351,	0.0879,	0.00316,	0.14,	0.793,	114.991,	15042
Hui,	Maybe,	0.467,	0.498,	1,	-5.518,	1,	0.0339,	0.761,	0,	0.121,	0.264,	175.791,	658295
twocolors,	Lovefool (feat. Pia Mia),	0.64,	0.796,	6,	-5.141,	1,	0.0606,	0.233,	0,	0.239,	0.164,	122.905,	1113977
Sasablue,	恋爱频率,	0.642,	0.487,	3,	-7.161,	1,	0.0878,	0.827,	0,	0.0797,	0.493,	142.034,	12077917
Skrillex,	Dirty Vibe - DJ Snake & Aazar Remix,	0.699,	0.964,	9,	-3.724,	1,	0.183,	0.000388,	0.00125,	0.13,	0.118,	151.999,	587889
G-DRAGON,	Without You,	0.6,	0.679,	11,	-6.894,	1,	0.0372,	0.0311,	0,	0.338,	0.327,	123.991,	112523
slchld,	best for you,	0.693,	0.513,	1,	-8.653,	1,	0.0637,	0.0973,	0,	0.114,	0.454,	95.004,	37337
Lara Liang,	再也沒有你,	0.548,	0.464,	4,	-7.877,	1,	0.0318,	0.602,	0,	0.106,	0.186,	137.932,	26214437
Little Mix,	Confetti (feat. Saweetie),	0.733,	0.643,	9,	-6.45,	0,	0.053,	0.178,	0,	0.0609,	0.485,	107.088,	3180693
Rain,	태양을 피하는 방법 How to Run From the Sun (Gtr.Remix),	0.829,	0.541,	10,	-7.602,	0,	0.0601,	0.389,	0,	0.0979,	0.41,	90,	2177719
Albert Posis,	Comeback,	0.588,	0.293,	7,	-9.567,	1,	0.0819,	0.712,	0,	0.0672,	0.659,	84.642,	680445
T-ARA,	Falling U,	0.763,	0.854,	11,	-4.248,	1,	0.03,	0.475,	0.00000119,	0.279,	0.939,	130.031,	8765280
Darius,	Hot Hands,	0.849,	0.558,	10,	-9.23,	0,	0.0437,	0.0498,	0.00634,	0.119,	0.35,	109.991,	11016608
Steve Aoki,	Pretender,	0.637,	0.778,	5,	-3.642,	0,	0.0706,	0.0248,	0,	0.228,	0.286,	103.093,	10367443
Noel,	Missing you,	0.563,	0.386,	8,	-7.089,	1,	0.0332,	0.66,	0,	0.127,	0.403,	65.037,	218708
CNBLUE,	Loner,	0.752,	0.75,	2,	-3.702,	0,	0.068,	0.243,	0,	0.296,	0.788,	105.001,	1740960
LEE SUHYUN,	Love And Pain,	0.348,	0.38,	8,	-7.558,	1,	0.0421,	0.91,	0.00000866,	0.107,	0.2,	207.508,	7807234
MIKA - INTERSECTION,	Tell Me,	0.696,	0.519,	5,	-5.852,	0,	0.0462,	0.255,	0,	0.0903,	0.518,	139.851,	1959893
Rothy,	HELLO,	0.478,	0.52,	6,	-6.401,	0,	0.0752,	0.715,	0,	0.216,	0.364,	73.454,	1715128
Gesaffelstein,	Blast Off (feat. Pharrell Williams),	0.627,	0.505,	6,	-12.659,	1,	0.0549,	0.197,	0.0149,	0.0583,	0.146,	100.005,	36018
任子墨,	那一刻心動,	0.749,	0.374,	6,	-10.826,	1,	0.0468,	0.715,	0.00000575,	0.103,	0.332,	95.997,	121161
Kanye West,	Mercy,	0.563,	0.496,	6,	-9.381,	0,	0.406,	0.0685,	0.000058,	0.173,	0.426,	139.993,	1612743
slchld,	she likes spring, I prefer winter,	0.326,	0.66,	9,	-6.68,	1,	0.0674,	0.552,	0,	0.264,	0.471,	78.29,	1369
Eurythmics,	Sweet Dreams (Are Made of This) - Remastered,	0.692,	0.711,	0,	-7.498,	0,	0.0317,	0.225,	0,	0.12,	0.875,	125.135,	68521
藤田織也,	ALL MINE,	0.848,	0.538,	10,	-6.396,	1,	0.0387,	0.388,	0,	0.16,	0.678,	114.008,	75859
Portugal. The Man,	Tidal Wave,	0.551,	0.741,	8,	-4.245,	1,	0.029,	0.00648,	0.00603,	0.0707,	0.399,	79.984,	4690
Christian Kuria,	Too Good,	0.69,	0.406,	5,	-9.41,	0,	0.106,	0.232,	0.00000188,	0.145,	0.507,	160.14,	1486
;
run;

proc glm data=YourLibaray;
 class prog;
 model Miliseconds_Played = danceability energy key loudness mode speechiness acousticness instrumentalness liveness valence tempo;
 manova h=_ALL_;
run;
quit;


data GlobalTop100;
  infile datalines delimiter=',';
  input Artist$ Track$ Predicted_Miliseconds_Played;
  datalines;
Sam Smith Kim Petras,	Unholy,	4845412.823
Taylor Swift,	Anti-Hero,	4273774.263
Drake 21 Savage,	Rich Flex,	3728856.206
Manuel Turizo,	La Bachata,	5034655.214
David Guetta Bebe Rexha,	I'm Good (Blue),	9520024.814
Harry Styles,	As It Was,	6421542.835
Bizarrap Quevedo,	Quevedo Bzrp Music Sessions Vol52,	6297524.191
Meghan Trainor,	Made You Look,	1237921.06
Chris Brown,	Under The Influence,	6036008.424
Bad Bunny Chencho Corleone,	Me Porto Bonito,	3777503.696
Oliver Tree Robin Schulz,	Miss You,	7481777.678
OneRepublic,	I Ain't Worried,	4655964.057
Bad Bunny,	Tití Me Preguntó,	784444.693
Ozuna Feid,	Hey Mor,	-1236251.905
Tom Odell,	Another Love,	5338891.305
Jung Kook BTS FIFA Sound,	Dreamers,	8581178.974
Bizarrap Duki,	Duki Bzrp Music Sessions Vol 50,	4003957.658
Mariah Carey,	All I Want for Christmas Is You,	5706250.24
Steve Lacy, Bad Habit,	5863443.509
ROSALÍA,	DESPECHÁ,	3527745.721
Taylor Swift,	Midnight Rain,	5066023.746
Taylor Swift,	Lavender Haze,	6462175.149
Stephen Sanchez,	Until I Found You,	5855016.207
Bad Bunny,	Efecto,	5196427.129
Rema Selena Gomez,	Calm Down (with Selena Gomez),	5802556.535
Eminem,	Mockingbird,	-1674687.312
Beyoncé,	CUFF IT,	2374346.9
The Weeknd,	Die For You,	3532429.948
d4vd,	Romantic Homicide,	9372900.407
JVKE,	golden hour,	4357876.589
Arctic Monkeys,	I Wanna Be Yours,	2941580.249
Bad Bunny Bomba Estéreo,	Ojitos Lindos,	8045846.963
Rihanna,	Lift Me Up,	2762679.239
The Neighbourhood,	Sweater Weather,	5397057.3
Rosa Linn,	SNAP,	8064248.291
Shakira Ozuna,	Monotonía,	3824355.77
Joji,	Glimpse of Us,	4436152.763
Taylor Swift,	You're On Your Own Kid,	4502024.247
Taylor Swift,	Maroon,	4736394.309
Taylor Swift Lana Del Rey,	Snow On The Beach (feat. Lana Del Rey),	7304403.12
Wham,	Last Christmas,	7501174.45
Taylor Swift,	Bejeweled,	6330409.489
Feid,	Feliz Cumpleaños Ferxxo,	4501364.739
Joji,	Die For You,	6413244.706
Taylor Swift,	Karma,	8549465.333
Glass Animals,	Heat Waves,	2768008.817
Imagine Dragons,	Bones,	3949021.989
The Kid LAROI Justin Bieber,	STAY (with Justin Bieber),	5814735.631
Bad Bunny,	Neverita,	5666291.342
Brenda Lee,	Rockin' Around The Christmas Tree,	6524530.638
Charlie Puth Jung Kook BTS,	Left and Right,	2663526.542
Lil Uzi Vert,	Just Wanna Rock,	7008171.087
Bad Bunny,	Moscow Mule,	5566162.44
Rauw Alejandro Lyanno Brray,	LOKERA,	4693269.122
Bobby Helms,	Jingle Bell Rock,	2583421.474
Rauw Alejandro Baby Rasta,	PUNTO 40,	3995048.824
Michael Bublé,	It's Beginning to Look a Lot like Christmas,	4625421.508
Grupo Frontera,	No Se Va En Vivo,	6347700.964
Drake 21 Savage Travis Scott,	Pussy & Millions,	5382982.41
Pharrell Williams Travis Scott,	Down In Atlanta,	392032.062
BLACKPINK,	Shut Down,	4347308.581
Taylor Swift,	Vigilante Shit,	-3512467.085
d4vd, Here With Me,	5292736.886
The Weeknd,	Blinding Lights,	5673996.492
Drake 21 Savage, Jimmy Cooks,	1321553.975
Fujii Kaze,	Shinunoga E Wa,	7016142.361
Wisin  Yandel ROSALÍA,	Besos Moja2,	3620284.139
Drake 21 Savage,	Major Distribution,	1489719.129
MC MENOR HR MC MENOR SG DJ ESCOBAR,	Evoque Prata,	-1008261.675
Elton John Dua Lipa PNAU, Cold Heart PNAU Remix,	5227960.046
Harry Styles,	Late Night Talking,	3874208.483
The Weeknd Daft Punk,	Starboy,	762871.2038
Ariana Grande,	Santa Tell Me,	5786688.711
KAROL G, PROVENZA,	4041539.195
SZA,	Shirt,	3464436.79
Quevedo,	Vista Al Mar,	307732.0753
Taylor Swift,	Question...?,	4931516.758
Ruth B,	Dandelions,	3186573.988
KAROL G Ovy On The Drums,	CAIRO,	-1944804.524
Lil Nas X,	STAR WALKIN,	5153869.116
BLACKPINK,	Pink Venom,	3112174.748
Nicki Minaj,	Super Freaky Girl,	1858637.743
Arctic Monkeys,	505,	6643779.755
LE SSERAFIM,	ANTIFRAGILE,	3494571.184
Drake 21 Savage,	On BS,	-5720855.921
Billie Eilish Khalid,	lovely (with Khalid),	3769656.815
The Weeknd Gesaffelstein,	I Was Never There,	5813178.564
Coldplay,	Yellow,	8668371.743
Taylor Swift,	Mastermind,	5007788.356
Post Malone Doja Cat,	I Like You,	4320217.786
Dean Lewis,	How Do I Say Goodbye,	3402626.46
Eminem,	Without Me,	3468379.884
Kordhell,	Murder In My Mind,	3690097.77
Quevedo,	Punto G,	2274587.484
Zach Bryan,	Something in the Orange,	4865921.08
JIN,	The Astronaut,	6813649.465
King,	Maan Meri Jaan,	4826005.667
Steve Lacy,	Dark Red,	4403892.93
Dean Martin,	Let It Snow,	4639374.336
Beach Weather,	Sex Drugs Etc,	9568631.509
;
run;

proc sql;
 select Track, Predicted_Miliseconds_Played 
 from GlobalTop100
 order by Predicted_Miliseconds_Played desc;
quit;

