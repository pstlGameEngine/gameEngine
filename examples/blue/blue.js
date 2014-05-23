// This program was compiled from OCaml by js_of_ocaml 2.00
(function(Q){"use strict";var
eK=104,cA="mediumspringgreen",aq=123,dK="black",dL="teal",e6=254,aU=108,eT='"',y=16777215,bV="darkgreen",c6="saddlebrown",cz=65599,es="jsError",eJ=119,Z=115,dJ="lightgrey",bU="mediumseagreen",c5="palegreen",ap=120,c4="deeppink",dI="limegreen",er=144,bT="lavender",eI="rgb",dH="salmon",bR="lightpink",bS="palevioletred",cx="blue",cy="lightgoldenrodyellow",ao=117,bQ="chocolate",dG="sienna",aZ=128,eG=135,eH="rgba",cw="linen",bP="darkslateblue",dF="oldlace",s="0",eF=136,cu="chartreuse",cv=248,eE=" is not a valid color",ct="antiquewhite",c3=126,e5="fd ",eD=121,bO="hotpink",eC=107,bN="lightslategrey",eB=131,cs="lightyellow",e4=141,bM="floralwhite",cr="gainsboro",eR=145,eS=112,aW="x",dE="darkslategrey",co="blanchedalmond",cp="cornsilk",cq="ivory",dD="darkviolet",bL="beige",aS="g",cn="skyblue",c1="cyan",c2="firebrick",bK="lightblue",aR=1073741823,cm="fuchsia",G=105,cl="mediumturquoise",c0="darkturquoise",dC="khaki",Y=110,eA="y",e3=-88,bI="springgreen",bJ="whitesmoke",cZ="aquamarine",aV="'",eq=132,aQ="int_of_string",ck="darkgoldenrod",dB="lightslategray",eQ="x_r",cY="purple",cj="mediumvioletred",at="e",bH="gold",dA="rosybrown",ez=139,X="-",bG="blueviolet",ae=-48,dz="maroon",dy="lemonchiffon",ci=" : file already exists",e2=109,bF="midnightblue",cX="brown",dw="aqua",dx="slategrey",ey="y_r",cW="moccasin",aY=101,dv="lightgreen",bE="slategray",ch="tomato",cV="white",e1="index out of bounds",ds="darkorange",dt="indigo",du="olive",dr="peachpuff",an=125,ex=142,cg="navajowhite",cT="papayawhip",cU="slateblue",dq="lavenderblush",i=255,cS="dimgray",e0=140,bD="greenyellow",cf="turquoise",ad=250,dp="darkolivegreen",bC="dodgerblue",bA="darkmagenta",bB="lightcyan",ce="goldenrod",by="bisque",bz="paleturquoise",eP=246,ac=102,cR="palegoldenrod",dn="mediumslateblue",eO="Unix.Unix_error",dm="darkblue",eZ=113,cQ="darksalmon",dl="darkkhaki",cP=122,bx="darkred",cO="royalblue",k="",ep=134,dk=143,bw="mediumpurple",O=100,dj="gray",bv="darkgrey",di="mediumaquamarine",dh="grey",bu="indianred",cd="honeydew",cM="darkgray",cN="dimgrey",as=103,bt="lightseagreen",eY="): ",bs="silver",cL="powderblue",cc="lime",dg="olivedrab",W=1e3,cb="peru",br="plum",de="crimson",df="pink",ar=".",bq="darkseagreen",ca="cadetblue",aT="+",aX=65535,ew=138,b$="seashell",eN=106,dd="orange",bp="lightsalmon",b_="snow",cK="f",cJ="navy",eX="color conversion error (",bo="ghostwhite",cI="green",cH=124,bn="sandybrown",b9=127,bm=400,ev=-32,b8="azure",eM=130,dc="lawngreen",b7="deepskyblue",ab=111,eL=133,db="lightgray",F=" ",c_="aliceblue",c$="lightcoral",da="wheat",bl="steelblue",b5="darkslategray",b6="magenta",b4="red",cF="darkorchid",cG="mistyrose",bk="thistle",eW=118,b2="cornflowerblue",b3="forestgreen",eu="nan",c9="yellow",eo=137,am=116,eV=65520,cE="orchid",c8="lightsteelblue",b1="lightskyblue",bj="violet",b0="burlywood",cD="tan",bi="mediumorchid",bZ="darkcyan",bh="mediumblue",bX="mintcream",bY="/",c7="coral",af=114,cC="orangered",et=146,bW="yellowgreen",cB="seagreen",eU=129,n_=new
Object();function
fg(a,b){throw[0,a,b]}function
dQ(a){if(a.charCodeAt(a.length-1)==10)a=a.substr(0,a.length-1);var
b=Q.console;b&&b.error&&b.error(a)}var
f=[0];function
ay(a,b){if(!a)return k;if(a&1)return ay(a-1,b)+b;var
c=ay(a>>1,b);return c+c}function
m(a){if(a!=null){this.bytes=this.fullBytes=a;this.last=this.len=a.length}}function
fi(){fg(f[4],new
m(e1))}m.prototype={string:null,bytes:null,fullBytes:null,array:null,len:null,last:0,toJsString:function(){var
a=this.getFullBytes();try{return this.string=decodeURIComponent(escape(a))}catch(f){dQ('MlString.toJsString: wrong encoding for "%s" ',a);return a}},toBytes:function(){if(this.string!=null)try{var
a=unescape(encodeURIComponent(this.string))}catch(f){dQ('MlString.toBytes: wrong encoding for "%s" ',this.string);var
a=this.string}else{var
a=k,c=this.array,d=c.length;for(var
b=0;b<d;b++)a+=String.fromCharCode(c[b])}this.bytes=this.fullBytes=a;this.last=this.len=a.length;return a},getBytes:function(){var
a=this.bytes;if(a==null)a=this.toBytes();return a},getFullBytes:function(){var
a=this.fullBytes;if(a!==null)return a;a=this.bytes;if(a==null)a=this.toBytes();if(this.last<this.len){this.bytes=a+=ay(this.len-this.last,"\0");this.last=this.len}this.fullBytes=a;return a},toArray:function(){var
c=this.bytes;if(c==null)c=this.toBytes();var
b=[],d=this.last;for(var
a=0;a<d;a++)b[a]=c.charCodeAt(a);for(d=this.len;a<d;a++)b[a]=0;this.string=this.bytes=this.fullBytes=null;this.last=this.len;this.array=b;return b},getArray:function(){var
a=this.array;if(!a)a=this.toArray();return a},getLen:function(){var
a=this.len;if(a!==null)return a;this.toBytes();return this.len},toString:function(){var
a=this.string;return a?a:this.toJsString()},valueOf:function(){var
a=this.string;return a?a:this.toJsString()},blitToArray:function(a,b,c,d){var
g=this.array;if(g)if(c<=a)for(var
e=0;e<d;e++)b[c+e]=g[a+e];else
for(var
e=d-1;e>=0;e--)b[c+e]=g[a+e];else{var
f=this.bytes;if(f==null)f=this.toBytes();var
h=this.last-a;if(d<=h)for(var
e=0;e<d;e++)b[c+e]=f.charCodeAt(a+e);else{for(var
e=0;e<h;e++)b[c+e]=f.charCodeAt(a+e);for(;e<d;e++)b[c+e]=0}}},get:function(a){var
c=this.array;if(c)return c[a];var
b=this.bytes;if(b==null)b=this.toBytes();return a<this.last?b.charCodeAt(a):0},safeGet:function(a){if(this.len==null)this.toBytes();if(a<0||a>=this.len)fi();return this.get(a)},set:function(a,b){var
c=this.array;if(!c){if(this.last==a){this.bytes+=String.fromCharCode(b&i);this.last++;return 0}c=this.toArray()}else
if(this.bytes!=null)this.bytes=this.fullBytes=this.string=null;c[a]=b&i;return 0},safeSet:function(a,b){if(this.len==null)this.toBytes();if(a<0||a>=this.len)fi();this.set(a,b)},fill:function(a,b,c){if(a>=this.last&&this.last&&c==0)return;var
d=this.array;if(!d)d=this.toArray();else
if(this.bytes!=null)this.bytes=this.fullBytes=this.string=null;var
f=a+b;for(var
e=a;e<f;e++)d[e]=c},compare:function(a){if(this.string!=null&&a.string!=null){if(this.string<a.string)return-1;if(this.string>a.string)return 1;return 0}var
b=this.getFullBytes(),c=a.getFullBytes();if(b<c)return-1;if(b>c)return 1;return 0},equal:function(a){if(this.string!=null&&a.string!=null)return this.string==a.string;return this.getFullBytes()==a.getFullBytes()},lessThan:function(a){if(this.string!=null&&a.string!=null)return this.string<a.string;return this.getFullBytes()<a.getFullBytes()},lessEqual:function(a){if(this.string!=null&&a.string!=null)return this.string<=a.string;return this.getFullBytes()<=a.getFullBytes()}};function
z(a){this.string=a}z.prototype=new
m();function
dP(a,b){fg(a,new
z(b))}function
aw(a){dP(f[4],a)}function
e9(){aw(e1)}function
nc(a,b){if(b<0||b>=a.length-1)e9();return a[b+1]}function
nd(a,b,c){if(b<0||b>=a.length-1)e9();a[b+1]=c;return 0}function
ne(a,b,c,d,e){if(e===0)return;if(d===c.last&&c.bytes!=null){var
f=a.bytes;if(f==null)f=a.toBytes();if(b>0||a.last>e)f=f.slice(b,b+e);c.bytes+=f;c.last+=f.length;return}var
g=c.array;if(!g)g=c.toArray();else
c.bytes=c.string=null;a.blitToArray(b,g,d,e)}function
P(c,b){if(c.fun)return P(c.fun,b);var
a=c.length,d=a-b.length;if(d==0)return c.apply(null,b);else
if(d<0)return P(c.apply(null,b.slice(0,a)),b.slice(a));else
return function(a){return P(c,b.concat([a]))}}function
nf(a){if(isFinite(a)){if(Math.abs(a)>=2.22507385850720138e-308)return 0;if(a!=0)return 1;return 2}return isNaN(a)?4:3}function
ns(a,b){var
c=a[3]<<16,d=b[3]<<16;if(c>d)return 1;if(c<d)return-1;if(a[2]>b[2])return 1;if(a[2]<b[2])return-1;if(a[1]>b[1])return 1;if(a[1]<b[1])return-1;return 0}function
nD(a,b){if(a<b)return-1;if(a==b)return 0;return 1}function
e_(a,b,c){var
e=[];for(;;){if(!(c&&a===b))if(a
instanceof
m)if(b
instanceof
m){if(a!==b){var
d=a.compare(b);if(d!=0)return d}}else
return 1;else
if(a
instanceof
Array&&a[0]===(a[0]|0)){var
f=a[0];if(f===e6)f=0;if(f===ad){a=a[1];continue}else
if(b
instanceof
Array&&b[0]===(b[0]|0)){var
g=b[0];if(g===e6)g=0;if(g===ad){b=b[1];continue}else
if(f!=g)return f<g?-1:1;else
switch(f){case
cv:var
d=nD(a[2],b[2]);if(d!=0)return d;break;case
251:aw("equal: abstract value");case
i:var
d=ns(a,b);if(d!=0)return d;break;default:if(a.length!=b.length)return a.length<b.length?-1:1;if(a.length>1)e.push(a,b,1)}}else
return 1}else
if(b
instanceof
m||b
instanceof
Array&&b[0]===(b[0]|0))return-1;else{if(a<b)return-1;if(a>b)return 1;if(a!=b){if(!c)return NaN;if(a==a)return 1;if(b==b)return-1}}if(e.length==0)return 0;var
h=e.pop();b=e.pop();a=e.pop();if(h+1<a.length)e.push(a,b,h+1);a=a[h];b=b[h]}}function
ng(a,b){return e_(a,b,true)}function
e7(a){this.bytes=k;this.len=a}e7.prototype=new
m();function
nh(a){if(a<0)aw("String.create");return new
e7(a)}function
fe(a){throw[0,a]}function
fh(){fe(f[6])}function
nj(a,b){if(b==0)fh();return a/b|0}function
nk(a,b,c,d){a.fill(b,c,d)}function
av(a){dP(f[3],a)}function
nl(a){var
b;a=a.getFullBytes();b=+a;if(a.length>0&&b===b)return b;a=a.replace(/_/g,k);b=+a;if(a.length>0&&b===b||/^[+-]?nan$/i.test(a))return b;if(/^ *0x[0-9a-f_]+p[+-]?[0-9_]+/i.test(a)){var
c=a.indexOf("p");c=c==-1?a.indexOf("P"):c;var
d=+a.substring(c+1);b=+a.substring(0,c);return b*Math.pow(2,d)}av("float_of_string")}function
dO(a){a=a.toString();var
e=a.length;if(e>31)aw("format_int: format too long");var
b={justify:aT,signstyle:X,filler:F,alternate:false,base:0,signedconv:false,width:0,uppercase:false,sign:1,prec:-1,conv:cK};for(var
d=0;d<e;d++){var
c=a.charAt(d);switch(c){case
X:b.justify=X;break;case
aT:case
F:b.signstyle=c;break;case
s:b.filler=s;break;case"#":b.alternate=true;break;case"1":case"2":case"3":case"4":case"5":case"6":case"7":case"8":case"9":b.width=0;while(c=a.charCodeAt(d)-48,c>=0&&c<=9){b.width=b.width*10+c;d++}d--;break;case
ar:b.prec=0;d++;while(c=a.charCodeAt(d)-48,c>=0&&c<=9){b.prec=b.prec*10+c;d++}d--;case"d":case"i":b.signedconv=true;case"u":b.base=10;break;case
aW:b.base=16;break;case"X":b.base=16;b.uppercase=true;break;case"o":b.base=8;break;case
at:case
cK:case
aS:b.signedconv=true;b.conv=c;break;case"E":case"F":case"G":b.signedconv=true;b.uppercase=true;b.conv=c.toLowerCase();break}}return b}function
dM(a,b){if(a.uppercase)b=b.toUpperCase();var
e=b.length;if(a.signedconv&&(a.sign<0||a.signstyle!=X))e++;if(a.alternate){if(a.base==8)e+=1;if(a.base==16)e+=2}var
c=k;if(a.justify==aT&&a.filler==F)for(var
d=e;d<a.width;d++)c+=F;if(a.signedconv)if(a.sign<0)c+=X;else
if(a.signstyle!=X)c+=a.signstyle;if(a.alternate&&a.base==8)c+=s;if(a.alternate&&a.base==16)c+="0x";if(a.justify==aT&&a.filler==s)for(var
d=e;d<a.width;d++)c+=s;c+=b;if(a.justify==X)for(var
d=e;d<a.width;d++)c+=F;return new
z(c)}function
nm(a,b){var
c,f=dO(a),e=f.prec<0?6:f.prec;if(b<0){f.sign=-1;b=-b}if(isNaN(b)){c=eu;f.filler=F}else
if(!isFinite(b)){c="inf";f.filler=F}else
switch(f.conv){case
at:var
c=b.toExponential(e),d=c.length;if(c.charAt(d-3)==at)c=c.slice(0,d-1)+s+c.slice(d-1);break;case
cK:c=b.toFixed(e);break;case
aS:e=e?e:1;c=b.toExponential(e-1);var
i=c.indexOf(at),h=+c.slice(i+1);if(h<-4||b.toFixed(0).length>e){var
d=i-1;while(c.charAt(d)==s)d--;if(c.charAt(d)==ar)d--;c=c.slice(0,d+1)+c.slice(i);d=c.length;if(c.charAt(d-3)==at)c=c.slice(0,d-1)+s+c.slice(d-1);break}else{var
g=e;if(h<0){g-=h+1;c=b.toFixed(g)}else
while(c=b.toFixed(g),c.length>e+1)g--;if(g){var
d=c.length-1;while(c.charAt(d)==s)d--;if(c.charAt(d)==ar)d--;c=c.slice(0,d+1)}}break}return dM(f,c)}function
nn(a,b){if(a.toString()=="%d")return new
z(k+b);var
c=dO(a);if(b<0)if(c.signedconv){c.sign=-1;b=-b}else
b>>>=0;var
d=b.toString(c.base);if(c.prec>=0){c.filler=F;var
e=c.prec-d.length;if(e>0)d=ay(e,s)+d}return dM(c,d)}function
np(a,b){return+(e_(a,b,false)>=0)}function
e$(a){if(!isFinite(a)){if(isNaN(a))return[i,1,0,eV];return a>0?[i,0,0,32752]:[i,0,0,eV]}var
f=a>=0?0:32768;if(f)a=-a;var
b=Math.floor(Math.LOG2E*Math.log(a))+1023;if(b<=0){b=0;a/=Math.pow(2,-1026)}else{a/=Math.pow(2,b-1027);if(a<16){a*=2;b-=1}if(b==0)a/=2}var
d=Math.pow(2,24),c=a|0;a=(a-c)*d;var
e=a|0;a=(a-e)*d;var
g=a|0;c=c&15|f|b<<4;return[i,g,e,c]}if(!Math.imul)Math.imul=function(a,b){return((a>>16)*b<<16)+(a&aX)*b|0};var
ax=Math.imul,nq=function(){var
r=256;function
c(a,b){return a<<b|a>>>32-b}function
g(a,b){b=ax(b,3432918353);b=c(b,15);b=ax(b,461845907);a^=b;a=c(a,13);return(a*5|0)+3864292196|0}function
u(a){a^=a>>>16;a=ax(a,2246822507);a^=a>>>13;a=ax(a,3266489909);a^=a>>>16;return a}function
v(a,b){var
d=b[1]|b[2]<<24,c=b[2]>>>8|b[3]<<16;a=g(a,d);a=g(a,c);return a}function
w(a,b){var
d=b[1]|b[2]<<24,c=b[2]>>>8|b[3]<<16;a=g(a,c^d);return a}function
y(a,b){var
e=b.length,c,d;for(c=0;c+4<=e;c+=4){d=b.charCodeAt(c)|b.charCodeAt(c+1)<<8|b.charCodeAt(c+2)<<16|b.charCodeAt(c+3)<<24;a=g(a,d)}d=0;switch(e&3){case
3:d=b.charCodeAt(c+2)<<16;case
2:d|=b.charCodeAt(c+1)<<8;case
1:d|=b.charCodeAt(c);a=g(a,d)}a^=e;return a}function
x(a,b){var
e=b.length,c,d;for(c=0;c+4<=e;c+=4){d=b[c]|b[c+1]<<8|b[c+2]<<16|b[c+3]<<24;a=g(a,d)}d=0;switch(e&3){case
3:d=b[c+2]<<16;case
2:d|=b[c+1]<<8;case
1:d|=b[c];a=g(a,d)}a^=e;return a}return function(a,b,c,d){var
l,n,o,j,h,f,e,k,q;j=b;if(j<0||j>r)j=r;h=a;f=c;l=[d];n=0;o=1;while(n<o&&h>0){e=l[n++];if(e
instanceof
Array&&e[0]===(e[0]|0))switch(e[0]){case
cv:f=g(f,e[2]);h--;break;case
ad:l[--n]=e[1];break;case
i:f=w(f,e);h--;break;default:var
t=e.length-1<<10|e[0];f=g(f,t);for(k=1,q=e.length;k<q;k++){if(o>=j)break;l[o++]=e[k]}break}else
if(e
instanceof
m){var
p=e.array;if(p)f=x(f,p);else{var
s=e.getFullBytes();f=y(f,s)}h--;break}else
if(e===(e|0)){f=g(f,e+e+1);h--}else
if(e===+e){f=v(f,e$(e));h--;break}}f=u(f);return f&aR}}();function
nA(a){return[a[3]>>8,a[3]&i,a[2]>>16,a[2]>>8&i,a[2]&i,a[1]>>16,a[1]>>8&i,a[1]&i]}function
nr(e,b,c){var
d=0;function
f(a){b--;if(e<0||b<0)return;if(a
instanceof
Array&&a[0]===(a[0]|0))switch(a[0]){case
cv:e--;d=d*cz+a[2]|0;break;case
ad:b++;f(a);break;case
i:e--;d=d*cz+a[1]+(a[2]<<24)|0;break;default:e--;d=d*19+a[0]|0;for(var
c=a.length-1;c>0;c--)f(a[c])}else
if(a
instanceof
m){e--;var
g=a.array,h=a.getLen();if(g)for(var
c=0;c<h;c++)d=d*19+g[c]|0;else{var
j=a.getFullBytes();for(var
c=0;c<h;c++)d=d*19+j.charCodeAt(c)|0}}else
if(a===(a|0)){e--;d=d*cz+a|0}else
if(a===+a){e--;var
k=nA(e$(a));for(var
c=7;c>=0;c--)d=d*19+k[c]|0}}f(c);return d&aR}function
nv(a){return(a[3]|a[2]|a[1])==0}function
ny(a){return[i,a&y,a>>24&y,a>>31&aX]}function
nz(a,b){var
c=a[1]-b[1],d=a[2]-b[2]+(c>>24),e=a[3]-b[3]+(d>>24);return[i,c&y,d&y,e&aX]}function
fb(a,b){if(a[3]>b[3])return 1;if(a[3]<b[3])return-1;if(a[2]>b[2])return 1;if(a[2]<b[2])return-1;if(a[1]>b[1])return 1;if(a[1]<b[1])return-1;return 0}function
fa(a){a[3]=a[3]<<1|a[2]>>23;a[2]=(a[2]<<1|a[1]>>23)&y;a[1]=a[1]<<1&y}function
nw(a){a[1]=(a[1]>>>1|a[2]<<23)&y;a[2]=(a[2]>>>1|a[3]<<23)&y;a[3]=a[3]>>>1}function
nC(a,b){var
e=0,d=a.slice(),c=b.slice(),f=[i,0,0,0];while(fb(d,c)>0){e++;fa(c)}while(e>=0){e--;fa(f);if(fb(d,c)>=0){f[1]++;d=nz(d,c)}nw(c)}return[0,f,d]}function
nB(a){return a[1]|a[2]<<24}function
nu(a){return a[3]<<16<0}function
nx(a){var
b=-a[1],c=-a[2]+(b>>24),d=-a[3]+(c>>24);return[i,b&y,c&y,d&aX]}function
nt(a,b){var
c=dO(a);if(c.signedconv&&nu(b)){c.sign=-1;b=nx(b)}var
d=k,h=ny(c.base),g="0123456789abcdef";do{var
f=nC(b,h);b=f[1];d=g.charAt(nB(f[2]))+d}while(!nv(b));if(c.prec>=0){c.filler=F;var
e=c.prec-d.length;if(e>0)d=ay(e,s)+d}return dM(c,d)}function
nU(a){var
b=0,c=10,d=a.get(0)==45?(b++,-1):1;if(a.get(b)==48)switch(a.get(b+1)){case
ap:case
88:c=16;b+=2;break;case
ab:case
79:c=8;b+=2;break;case
98:case
66:c=2;b+=2;break}return[b,d,c]}function
fd(a){if(a>=48&&a<=57)return a-48;if(a>=65&&a<=90)return a-55;if(a>=97&&a<=cP)return a-87;return-1}function
nE(a){var
g=nU(a),f=g[0],h=g[1],d=g[2],i=-1>>>0,e=a.get(f),c=fd(e);if(c<0||c>=d)av(aQ);var
b=c;for(;;){f++;e=a.get(f);if(e==95)continue;c=fd(e);if(c<0||c>=d)break;b=d*b+c;if(b>i)av(aQ)}if(f!=a.getLen())av(aQ);b=h*b;if(d==10&&(b|0)!=b)av(aQ);return b|0}function
nF(a){return+(a>31&&a<b9)}function
nG(a){return a.getFullBytes()}function
nH(a){return new
m(a)}function
nI(a){var
c=Array.prototype.slice;return function(){var
b=arguments.length>0?c.call(arguments):[undefined];return P(a,b)}}function
nJ(a,b){var
d=[0];for(var
c=1;c<=a;c++)d[c]=b;return d}function
e8(a){var
b=a.length;this.array=a;this.len=this.last=b}e8.prototype=new
m();var
nK=function(){function
n(a,b){return a+b|0}function
m(a,b,c,d,e,f){b=n(n(b,a),n(d,f));return n(b<<e|b>>>32-e,c)}function
h(a,b,c,d,e,f,g){return m(b&c|~b&d,a,b,e,f,g)}function
j(a,b,c,d,e,f,g){return m(b&d|c&~d,a,b,e,f,g)}function
k(a,b,c,d,e,f,g){return m(b^c^d,a,b,e,f,g)}function
l(a,b,c,d,e,f,g){return m(c^(b|~d),a,b,e,f,g)}function
o(a,b){var
g=b;a[g>>2]|=aZ<<8*(g&3);for(g=(g&~3)+8;(g&63)<60;g+=4)a[(g>>2)-1]=0;a[(g>>2)-1]=b<<3;a[g>>2]=b>>29&536870911;var
m=[1732584193,4023233417,2562383102,271733878];for(g=0;g<a.length;g+=16){var
c=m[0],d=m[1],e=m[2],f=m[3];c=h(c,d,e,f,a[g+0],7,3614090360);f=h(f,c,d,e,a[g+1],12,3905402710);e=h(e,f,c,d,a[g+2],17,606105819);d=h(d,e,f,c,a[g+3],22,3250441966);c=h(c,d,e,f,a[g+4],7,4118548399);f=h(f,c,d,e,a[g+5],12,1200080426);e=h(e,f,c,d,a[g+6],17,2821735955);d=h(d,e,f,c,a[g+7],22,4249261313);c=h(c,d,e,f,a[g+8],7,1770035416);f=h(f,c,d,e,a[g+9],12,2336552879);e=h(e,f,c,d,a[g+10],17,4294925233);d=h(d,e,f,c,a[g+11],22,2304563134);c=h(c,d,e,f,a[g+12],7,1804603682);f=h(f,c,d,e,a[g+13],12,4254626195);e=h(e,f,c,d,a[g+14],17,2792965006);d=h(d,e,f,c,a[g+15],22,1236535329);c=j(c,d,e,f,a[g+1],5,4129170786);f=j(f,c,d,e,a[g+6],9,3225465664);e=j(e,f,c,d,a[g+11],14,643717713);d=j(d,e,f,c,a[g+0],20,3921069994);c=j(c,d,e,f,a[g+5],5,3593408605);f=j(f,c,d,e,a[g+10],9,38016083);e=j(e,f,c,d,a[g+15],14,3634488961);d=j(d,e,f,c,a[g+4],20,3889429448);c=j(c,d,e,f,a[g+9],5,568446438);f=j(f,c,d,e,a[g+14],9,3275163606);e=j(e,f,c,d,a[g+3],14,4107603335);d=j(d,e,f,c,a[g+8],20,1163531501);c=j(c,d,e,f,a[g+13],5,2850285829);f=j(f,c,d,e,a[g+2],9,4243563512);e=j(e,f,c,d,a[g+7],14,1735328473);d=j(d,e,f,c,a[g+12],20,2368359562);c=k(c,d,e,f,a[g+5],4,4294588738);f=k(f,c,d,e,a[g+8],11,2272392833);e=k(e,f,c,d,a[g+11],16,1839030562);d=k(d,e,f,c,a[g+14],23,4259657740);c=k(c,d,e,f,a[g+1],4,2763975236);f=k(f,c,d,e,a[g+4],11,1272893353);e=k(e,f,c,d,a[g+7],16,4139469664);d=k(d,e,f,c,a[g+10],23,3200236656);c=k(c,d,e,f,a[g+13],4,681279174);f=k(f,c,d,e,a[g+0],11,3936430074);e=k(e,f,c,d,a[g+3],16,3572445317);d=k(d,e,f,c,a[g+6],23,76029189);c=k(c,d,e,f,a[g+9],4,3654602809);f=k(f,c,d,e,a[g+12],11,3873151461);e=k(e,f,c,d,a[g+15],16,530742520);d=k(d,e,f,c,a[g+2],23,3299628645);c=l(c,d,e,f,a[g+0],6,4096336452);f=l(f,c,d,e,a[g+7],10,1126891415);e=l(e,f,c,d,a[g+14],15,2878612391);d=l(d,e,f,c,a[g+5],21,4237533241);c=l(c,d,e,f,a[g+12],6,1700485571);f=l(f,c,d,e,a[g+3],10,2399980690);e=l(e,f,c,d,a[g+10],15,4293915773);d=l(d,e,f,c,a[g+1],21,2240044497);c=l(c,d,e,f,a[g+8],6,1873313359);f=l(f,c,d,e,a[g+15],10,4264355552);e=l(e,f,c,d,a[g+6],15,2734768916);d=l(d,e,f,c,a[g+13],21,1309151649);c=l(c,d,e,f,a[g+4],6,4149444226);f=l(f,c,d,e,a[g+11],10,3174756917);e=l(e,f,c,d,a[g+2],15,718787259);d=l(d,e,f,c,a[g+9],21,3951481745);m[0]=n(c,m[0]);m[1]=n(d,m[1]);m[2]=n(e,m[2]);m[3]=n(f,m[3])}var
p=[];for(var
g=0;g<4;g++)for(var
o=0;o<4;o++)p[g*4+o]=m[g]>>8*o&i;return p}return function(a,b,c){var
h=[];if(a.array){var
f=a.array;for(var
d=0;d<c;d+=4){var
e=d+b;h[d>>2]=f[e]|f[e+1]<<8|f[e+2]<<16|f[e+3]<<24}for(;d<c;d++)h[d>>2]|=f[d+b]<<8*(d&3)}else{var
g=a.getFullBytes();for(var
d=0;d<c;d+=4){var
e=d+b;h[d>>2]=g.charCodeAt(e)|g.charCodeAt(e+1)<<8|g.charCodeAt(e+2)<<16|g.charCodeAt(e+3)<<24}for(;d<c;d++)h[d>>2]|=g.charCodeAt(d+b)<<8*(d&3)}return new
e8(o(h,c))}}();function
A(a){dP(f[2],a)}function
nL(a){if(!a.opened)A("Cannot flush a closed channel");if(a.buffer==k)return 0;if(a.output)switch(a.output.length){case
2:a.output(a,a.buffer);break;default:a.output(a.buffer)}a.buffer=k}function
ff(a){a=a
instanceof
m?a.toString():a;A(a+": No such file or directory")}var
ni=bY;function
a0(a){a=a
instanceof
m?a.toString():a;if(a.charCodeAt(0)!=47)a=ni+a;var
d=a.split(bY),b=[];for(var
c=0;c<d.length;c++)switch(d[c]){case"..":if(b.length>1)b.pop();break;case
ar:case
k:if(b.length==0)b.push(k);break;default:b.push(d[c]);break}b.orig=a;return b}function
_(){this.content={}}_.prototype={exists:function(a){return this.content[a]?1:0},mk:function(a,b){this.content[a]=b},get:function(a){return this.content[a]},list:function(){var
a=[];for(var
b
in
this.content)a.push(b);return a},remove:function(a){delete
this.content[a]}};var
a2=new
_();a2.mk(k,new
_());function
dN(a){var
b=a2;for(var
c=0;c<a.length;c++){if(!(b.exists&&b.exists(a[c])))ff(a.orig);b=b.get(a[c])}return b}function
n4(a){var
c=a0(a),b=dN(c);return b
instanceof
_?1:0}function
au(a){this.data=a}au.prototype={content:function(){return this.data},truncate:function(){this.data.length=0}};function
no(a,b){var
e=a0(a),c=a2;for(var
f=0;f<e.length-1;f++){var
d=e[f];if(!c.exists(d))c.mk(d,new
_());c=c.get(d);if(!(c
instanceof
_))A(e.orig+ci)}var
d=e[e.length-1];if(c.exists(d))A(e.orig+ci);if(b
instanceof
_)c.mk(d,b);else
if(b
instanceof
au)c.mk(d,b);else
if(b
instanceof
m)c.mk(d,new
au(b.getArray()));else
if(b
instanceof
Array)c.mk(d,new
au(b));else
if(b.toString)c.mk(d,new
au(new
m(b.toString()).getArray()));else
aw("caml_fs_register")}function
n2(a){var
b=a2,d=a0(a),e;for(var
c=0;c<d.length;c++){if(b.auto)e=b.auto;if(!(b.exists&&b.exists(d[c])))return e?e(d.join(bY)):0;b=b.get(d[c])}return 1}function
az(a,b,c){if(f.fds===undefined)f.fds=new
Array();c=c?c:{};var
d={};d.array=b;d.offset=c.append?d.array.length:0;d.flags=c;f.fds[a]=d;f.fd_last_idx=a;return a}function
n9(a,b,c){var
d={};while(b){switch(b[1]){case
0:d.rdonly=1;break;case
1:d.wronly=1;break;case
2:d.append=1;break;case
3:d.create=1;break;case
4:d.truncate=1;break;case
5:d.excl=1;break;case
6:d.binary=1;break;case
7:d.text=1;break;case
8:d.nonblock=1;break}b=b[2]}var
g=a.toString(),i=a0(a);if(d.rdonly&&d.wronly)A(g+" : flags Open_rdonly and Open_wronly are not compatible");if(d.text&&d.binary)A(g+" : flags Open_text and Open_binary are not compatible");if(n2(a)){if(n4(a))A(g+" : is a directory");if(d.create&&d.excl)A(g+ci);var
h=f.fd_last_idx?f.fd_last_idx:0,e=dN(i);if(d.truncate)e.truncate();return az(h+1,e.content(),d)}else
if(d.create){var
h=f.fd_last_idx?f.fd_last_idx:0;no(a,[]);var
e=dN(i);return az(h+1,e.content(),d)}else
ff(a)}az(0,[]);az(1,[]);az(2,[]);function
nM(a){var
b=f.fds[a];if(b.flags.wronly)A(e5+a+" is writeonly");return{data:b,fd:a,opened:true}}function
n7(a){if(a.charCodeAt(a.length-1)==10)a=a.substr(0,a.length-1);var
b=Q.console;b&&b.log&&b.log(a)}var
a1=new
Array();function
nY(a,b){var
e=new
m(b),d=e.getLen();for(var
c=0;c<d;c++)a.data.array[a.data.offset+c]=e.get(c);a.data.offset+=d;return 0}function
nN(a){var
b;switch(a){case
1:b=n7;break;case
2:b=dQ;break;default:b=nY}var
d=f.fds[a];if(d.flags.rdonly)A(e5+a+" is readonly");var
c={data:d,fd:a,opened:true,buffer:k,output:b};a1[c.fd]=c;return c}function
nO(){var
a=0;for(var
b
in
a1)if(a1[b].opened)a=[0,a1[b],a];return a}function
nP(a,b){if(b==0)fh();return a%b}function
nR(a){return new
m(a)}function
nS(a,b){a[0]=b;return 0}function
nT(a){return a
instanceof
Array?a[0]:W}function
nW(a,b){f[a+1]=b}var
fc={};function
nX(a,b){fc[a.toString()]=b;return 0}function
nZ(a,b){var
c=a.fullBytes,d=b.fullBytes;if(c!=null&&d!=null)return c==d?1:0;return a.getFullBytes()==b.getFullBytes()?1:0}function
n0(a,b){return 1-nZ(a,b)}function
n1(){return 32}function
nV(){fe(f[7])}function
n3(){nV()}function
n5(){var
a=new
Date()^4294967295*Math.random();return{valueOf:function(){return a},0:0,1:a,length:2}}function
nQ(a){return fc[a]}function
n6(a){if(a
instanceof
Array)return a;if(Q.RangeError&&a
instanceof
Q.RangeError&&a.message&&a.message.match(/maximum call stack/i))return[0,f[9]];if(Q.InternalError&&a
instanceof
Q.InternalError&&a.message&&a.message.match(/too much recursion/i))return[0,f[9]];if(a
instanceof
Q.Error)return[0,nQ(es),a];return[0,f[3],new
z(String(a))]}function
n8(){return 0}var
w=nc,g=nd,aM=ne,aa=ng,M=nh,ek=nm,aN=nn,el=nE,be=nF,N=nG,en=nI,x=nJ,ei=nN,bf=nP,b=nR,E=nW,ej=nX,c=n0,em=n3,r=n6,aP=n8;function
V(a,b){return a.length==1?a(b):P(a,[b])}function
v(a,b,c){return a.length==2?a(b,c):P(a,[b,c])}function
l(a,b,c,d){return a.length==3?a(b,c,d):P(a,[b,c,d])}function
bg(a,b,c,d,e){return a.length==4?a(b,c,d,e):P(a,[b,c,d,e])}var
R=[0,b("Failure")],t=[0,b("Invalid_argument")],q=[0,b("Not_found")],m1=[0,b(cV),[0,b(bJ),[0,b(c9),[0,b(bW),0]]]],m2=[0,b(dx),[0,b(b_),[0,b(bI),[0,b(bl),[0,b(cD),[0,b(dL),[0,b(bk),[0,b(ch),[0,b(cf),[0,b(bj),[0,b(da),m1]]]]]]]]]]],m3=[0,b(cO),[0,b(c6),[0,b(dH),[0,b(bn),[0,b(cB),[0,b(b$),[0,b(dG),[0,b(bs),[0,b(cn),[0,b(cU),[0,b(bE),m2]]]]]]]]]]],m4=[0,b(bz),[0,b(bS),[0,b(cT),[0,b(dr),[0,b(cb),[0,b(df),[0,b(br),[0,b(cL),[0,b(cY),[0,b(b4),[0,b(dA),m3]]]]]]]]]]],m5=[0,b(cW),[0,b(cg),[0,b(cJ),[0,b(dF),[0,b(du),[0,b(dg),[0,b(dd),[0,b(cC),[0,b(cE),[0,b(cR),[0,b(c5),m4]]]]]]]]]]],m6=[0,b(bh),[0,b(bi),[0,b(bw),[0,b(bU),[0,b(dn),[0,b(cA),[0,b(cl),[0,b(cj),[0,b(bF),[0,b(bX),[0,b(cG),m5]]]]]]]]]]],m7=[0,b(b1),[0,b(dB),[0,b(bN),[0,b(c8),[0,b(cs),[0,b(cc),[0,b(dI),[0,b(cw),[0,b(b6),[0,b(dz),[0,b(di),m6]]]]]]]]]]],m8=[0,b(dy),[0,b(bK),[0,b(c$),[0,b(bB),[0,b(cy),[0,b(db),[0,b(dv),[0,b(dJ),[0,b(bR),[0,b(bp),[0,b(bt),m7]]]]]]]]]]],m9=[0,b(bD),[0,b(dh),[0,b(cd),[0,b(bO),[0,b(bu),[0,b(dt),[0,b(cq),[0,b(dC),[0,b(bT),[0,b(dq),[0,b(dc),m8]]]]]]]]]]],m_=[0,b(bC),[0,b(c2),[0,b(bM),[0,b(b3),[0,b(cm),[0,b(cr),[0,b(bo),[0,b(bH),[0,b(ce),[0,b(dj),[0,b(cI),m9]]]]]]]]]]],m$=[0,b(cQ),[0,b(bq),[0,b(bP),[0,b(b5),[0,b(dE),[0,b(c0),[0,b(dD),[0,b(c4),[0,b(b7),[0,b(cS),[0,b(cN),m_]]]]]]]]]]],na=[0,b(bZ),[0,b(ck),[0,b(cM),[0,b(bV),[0,b(bv),[0,b(dl),[0,b(bA),[0,b(dp),[0,b(ds),[0,b(cF),[0,b(bx),m$]]]]]]]]]]],nb=[0,b(cX),[0,b(b0),[0,b(ca),[0,b(cu),[0,b(bQ),[0,b(c7),[0,b(b2),[0,b(cp),[0,b(de),[0,b(c1),[0,b(dm),na]]]]]]]]]]];E(11,[0,b("Undefined_recursive_module")]);E(8,[0,b("Stack_overflow")]);E(7,[0,b("Match_failure")]);E(6,q);E(5,[0,b("Division_by_zero")]);E(4,[0,b("End_of_file")]);E(3,t);E(2,R);E(1,[0,b("Sys_error")]);var
fm=[0,b("Assert_failure")],fj=b("true"),fk=b("false"),fl=b("Pervasives.do_at_exit"),fn=b("nth"),fo=b("List.nth"),fr=b("\\b"),fs=b("\\t"),ft=b("\\n"),fu=b("\\r"),fq=b("\\\\"),fp=b("\\'"),fx=b("String.contains_from"),fw=b("String.blit"),fv=b("String.sub"),fz=b("CamlinternalLazy.Undefined"),fC=b("Buffer.add: cannot grow buffer"),fS=b(k),fT=b(k),fW=b("%.12g"),fX=b(eT),fY=b(eT),fU=b(aV),fV=b(aV),fR=b(eu),fP=b("neg_infinity"),fQ=b("infinity"),fO=b(ar),fN=b("printf: bad positional specification (0)."),fM=b("%_"),fL=[0,b("printf.ml"),dk,8],fJ=b(aV),fK=b("Printf: premature end of format string '"),fF=b(aV),fG=b(" in format string '"),fH=b(", at char number "),fI=b("Printf: bad conversion %"),fD=b("Sformat.index_of_int: negative argument "),fZ=b(aW),mZ=b("OCAMLRUNPARAM"),mX=b("CAMLRUNPARAM"),f0=b(k),f6=b("E2BIG"),f8=b("EACCES"),f9=b("EAGAIN"),f_=b("EBADF"),f$=b("EBUSY"),ga=b("ECHILD"),gb=b("EDEADLK"),gc=b("EDOM"),gd=b("EEXIST"),ge=b("EFAULT"),gf=b("EFBIG"),gg=b("EINTR"),gh=b("EINVAL"),gi=b("EIO"),gj=b("EISDIR"),gk=b("EMFILE"),gl=b("EMLINK"),gm=b("ENAMETOOLONG"),gn=b("ENFILE"),go=b("ENODEV"),gp=b("ENOENT"),gq=b("ENOEXEC"),gr=b("ENOLCK"),gs=b("ENOMEM"),gt=b("ENOSPC"),gu=b("ENOSYS"),gv=b("ENOTDIR"),gw=b("ENOTEMPTY"),gx=b("ENOTTY"),gy=b("ENXIO"),gz=b("EPERM"),gA=b("EPIPE"),gB=b("ERANGE"),gC=b("EROFS"),gD=b("ESPIPE"),gE=b("ESRCH"),gF=b("EXDEV"),gG=b("EWOULDBLOCK"),gH=b("EINPROGRESS"),gI=b("EALREADY"),gJ=b("ENOTSOCK"),gK=b("EDESTADDRREQ"),gL=b("EMSGSIZE"),gM=b("EPROTOTYPE"),gN=b("ENOPROTOOPT"),gO=b("EPROTONOSUPPORT"),gP=b("ESOCKTNOSUPPORT"),gQ=b("EOPNOTSUPP"),gR=b("EPFNOSUPPORT"),gS=b("EAFNOSUPPORT"),gT=b("EADDRINUSE"),gU=b("EADDRNOTAVAIL"),gV=b("ENETDOWN"),gW=b("ENETUNREACH"),gX=b("ENETRESET"),gY=b("ECONNABORTED"),gZ=b("ECONNRESET"),g0=b("ENOBUFS"),g1=b("EISCONN"),g2=b("ENOTCONN"),g3=b("ESHUTDOWN"),g4=b("ETOOMANYREFS"),g5=b("ETIMEDOUT"),g6=b("ECONNREFUSED"),g7=b("EHOSTDOWN"),g8=b("EHOSTUNREACH"),g9=b("ELOOP"),g_=b("EOVERFLOW"),g$=b("EUNKNOWNERR %d"),f7=b("Unix.Unix_error(Unix.%s, %S, %S)"),f2=b(eO),f3=b(k),f4=b(k),f5=b(eO),ha=b("0.0.0.0"),hb=b("127.0.0.1"),mW=b("::"),mV=b("::1"),hd=b("Js.Error"),he=b(es),hj=b("canvas"),hg=b("img"),hh=b("Dom_html.Canvas_not_available"),hk=b("[\\][()\\\\|+*.?{}^$]"),mi=b(eY),mj=b(eX),mg=b(eY),mh=b(eX),mc=b(eE),md=b("(rgba?)\\((?:(\\d*),(\\d*),(\\d*)(?:,(\\d*(?:\\.\\d*)?))?)\\)"),me=b("(rgba?)\\((?:(\\d*)%,(\\d*)%,(\\d*)%(?:,(\\d*(?:\\.\\d*)?))?)\\)"),mf=b("(hsla?)\\((?:(\\d*),(\\d*)%,(\\d*)%(?:,(\\d*(?:\\.\\d*)?))?)\\)"),mk=b(eI),ml=b(eH),mm=b(eI),mn=b(eH),mo=b("hsl"),mp=b("hsla"),l6=b("^rgb\\(\\s*\\d*,\\s*\\d*,\\s*\\d*\\)$"),l7=b("^rgb\\(\\s*\\d*%,\\s*\\d*%,\\s*\\d*%\\)$"),l8=b("^rgba\\(\\s*\\d*,\\s*\\d*,\\s*\\d*,\\d*\\.?\\d*\\)$"),l9=b("^rgba\\(\\s*\\d*%,\\s*\\d*%,\\s*\\d*%,\\d*\\.?\\d*\\)$"),l_=b("^hsl\\(\\s*\\d*,\\s*\\d*%,\\s*\\d*%\\)$"),l$=b("^hsla\\(\\s*\\d*,\\s*\\d*%,\\s*\\d*%,\\d*\\.?\\d*\\)$"),ma=[0,b(c_),[0,b(ct),[0,b(dw),[0,b(cZ),[0,b(b8),[0,b(bL),[0,b(by),[0,b(dK),[0,b(co),[0,b(cx),[0,b(bG),nb]]]]]]]]]]],mb=b(eE),l0=b("rgb(%d,%d,%d)"),l1=b("rgb(%d%%,%d%%,%d%%)"),l2=b("rgba(%d,%d,%d,%f)"),l3=b("rgba(%d%%,%d%%,%d%%,%f)"),l4=b("hsl(%d,%d%%,%d%%)"),l5=b("hsla(%d,%d%%,%d%%,%f)"),jG=b(c_),jH=b(ct),jI=b(dw),jJ=b(cZ),jK=b(b8),jL=b(bL),jM=b(by),jN=b(dK),jO=b(co),jP=b(cx),jQ=b(bG),jR=b(cX),jS=b(b0),jT=b(ca),jU=b(cu),jV=b(bQ),jW=b(c7),jX=b(b2),jY=b(cp),jZ=b(de),j0=b(c1),j1=b(dm),j2=b(bZ),j3=b(ck),j4=b(cM),j5=b(bV),j6=b(bv),j7=b(dl),j8=b(bA),j9=b(dp),j_=b(ds),j$=b(cF),ka=b(bx),kb=b(cQ),kc=b(bq),kd=b(bP),ke=b(b5),kf=b(dE),kg=b(c0),kh=b(dD),ki=b(c4),kj=b(b7),kk=b(cS),kl=b(cN),km=b(bC),kn=b(c2),ko=b(bM),kp=b(b3),kq=b(cm),kr=b(cr),ks=b(bo),kt=b(bH),ku=b(ce),kv=b(dj),kw=b(cI),kx=b(bD),ky=b(dh),kz=b(cd),kA=b(bO),kB=b(bu),kC=b(dt),kD=b(cq),kE=b(dC),kF=b(bT),kG=b(dq),kH=b(dc),kI=b(dy),kJ=b(bK),kK=b(c$),kL=b(bB),kM=b(cy),kN=b(db),kO=b(dv),kP=b(dJ),kQ=b(bR),kR=b(bp),kS=b(bt),kT=b(b1),kU=b(dB),kV=b(bN),kW=b(c8),kX=b(cs),kY=b(cc),kZ=b(dI),k0=b(cw),k1=b(b6),k2=b(dz),k3=b(di),k4=b(bh),k5=b(bi),k6=b(bw),k7=b(bU),k8=b(dn),k9=b(cA),k_=b(cl),k$=b(cj),la=b(bF),lb=b(bX),lc=b(cG),ld=b(cW),le=b(cg),lf=b(cJ),lg=b(dF),lh=b(du),li=b(dg),lj=b(dd),lk=b(cC),ll=b(cE),lm=b(cR),ln=b(c5),lo=b(bz),lp=b(bS),lq=b(cT),lr=b(dr),ls=b(cb),lt=b(df),lu=b(br),lv=b(cL),lw=b(cY),lx=b(b4),ly=b(dA),lz=b(cO),lA=b(c6),lB=b(dH),lC=b(bn),lD=b(cB),lE=b(b$),lF=b(dG),lG=b(bs),lH=b(cn),lI=b(cU),lJ=b(bE),lK=b(dx),lL=b(b_),lM=b(bI),lN=b(bl),lO=b(cD),lP=b(dL),lQ=b(bk),lR=b(ch),lS=b(cf),lT=b(bj),lU=b(da),lV=b(cV),lW=b(bJ),lX=b(c9),lY=b(bW),lZ=b(" is not a valid color name"),hl=b(c_),hm=b(ct),hn=b(dw),ho=b(cZ),hp=b(b8),hq=b(bL),hr=b(by),hs=b(dK),ht=b(co),hu=b(cx),hv=b(bG),hw=b(cX),hx=b(b0),hy=b(ca),hz=b(cu),hA=b(bQ),hB=b(c7),hC=b(b2),hD=b(cp),hE=b(de),hF=b(c1),hG=b(dm),hH=b(bZ),hI=b(ck),hJ=b(cM),hK=b(bV),hL=b(bv),hM=b(dl),hN=b(bA),hO=b(dp),hP=b(ds),hQ=b(cF),hR=b(bx),hS=b(cQ),hT=b(bq),hU=b(bP),hV=b(b5),hW=b(dE),hX=b(c0),hY=b(dD),hZ=b(c4),h0=b(b7),h1=b(cS),h2=b(cN),h3=b(bC),h4=b(c2),h5=b(bM),h6=b(b3),h7=b(cm),h8=b(cr),h9=b(bo),h_=b(bH),h$=b(ce),ia=b(dj),ib=b(dh),ic=b(cI),id=b(bD),ie=b(cd),ig=b(bO),ih=b(bu),ii=b(dt),ij=b(cq),ik=b(dC),il=b(bT),im=b(dq),io=b(dc),ip=b(dy),iq=b(bK),ir=b(c$),is=b(bB),it=b(cy),iu=b(db),iv=b(dv),iw=b(dJ),ix=b(bR),iy=b(bp),iz=b(bt),iA=b(b1),iB=b(dB),iC=b(bN),iD=b(c8),iE=b(cs),iF=b(cc),iG=b(dI),iH=b(cw),iI=b(b6),iJ=b(dz),iK=b(di),iL=b(bh),iM=b(bi),iN=b(bw),iO=b(bU),iP=b(dn),iQ=b(cA),iR=b(cl),iS=b(cj),iT=b(bF),iU=b(bX),iV=b(cG),iW=b(cW),iX=b(cg),iY=b(cJ),iZ=b(dF),i0=b(du),i1=b(dg),i2=b(dd),i3=b(cC),i4=b(cE),i5=b(cR),i6=b(c5),i7=b(bz),i8=b(bS),i9=b(cT),i_=b(dr),i$=b(cb),ja=b(df),jb=b(br),jc=b(cL),jd=b(cY),je=b(b4),jf=b(dA),jg=b(cO),jh=b(c6),ji=b(dH),jj=b(bn),jk=b(cB),jl=b(b$),jm=b(dG),jn=b(bs),jo=b(cn),jp=b(cU),jq=b(bE),jr=b(dx),js=b(b_),jt=b(bI),ju=b(bl),jv=b(cD),jw=b(dL),jx=b(bk),jy=b(ch),jz=b(cf),jA=b(bj),jB=b(da),jC=b(cV),jD=b(bJ),jE=b(c9),jF=b(bW),mu=b(aW),mv=b(eA),mw=b(eQ),mx=b(ey),mq=b(aW),mr=b(eA),ms=b(eQ),mt=b(ey),mz=b("rp01.png"),mB=b("rp02.png"),mD=b("rp03.png"),mF=b("rp04.png"),mH=b("rp05.png"),mJ=b("rp06.png"),mL=b("rp07.png"),mN=b("rp08.png"),mP=b("rp09.png"),mR=b("bg.jpg"),mT=b("Blue is running");function
aA(a){throw[0,R,a]}function
$(a){throw[0,t,a]}function
j(a,b){var
c=a.getLen(),e=b.getLen(),d=M(c+e|0);aM(a,0,d,0,c);aM(b,0,d,c,e);return d}function
aB(a){return b(k+a)}nM(0);ei(1);ei(2);function
dR(a){var
b=nO(0);for(;;){if(b){var
c=b[2],d=b[1];try{nL(d)}catch(f){}var
b=c;continue}return 0}}ej(fl,dR);function
aC(a,b){var
c=M(a);nk(c,0,a,b);return c}function
aD(a,b,c){if(0<=b)if(0<=c)if(!((a.getLen()-c|0)<b)){var
d=M(c);aM(a,b,d,0,c);return d}return $(fv)}function
aE(a,b,c,d,e){if(0<=e)if(0<=b)if(!((a.getLen()-e|0)<b))if(0<=d)if(!((c.getLen()-e|0)<d))return aM(a,b,c,d,e);return $(fw)}var
a3=n1(0),a4=(1<<(a3-10|0))-1|0,ag=ax(a3/8|0,a4)-1|0,fA=[0,fz];function
fB(a){throw[0,fA]}function
a5(a){var
b=1<=a?a:1,c=ag<b?ag:b,d=M(c);return[0,d,0,c,d]}function
a6(a){return aD(a[1],0,a[2])}function
dU(a,b){var
c=[0,a[3]];for(;;){if(c[1]<(a[2]+b|0)){c[1]=2*c[1]|0;continue}if(ag<c[1])if((a[2]+b|0)<=ag)c[1]=ag;else
aA(fC);var
d=M(c[1]);aE(a[1],0,d,0,a[2]);a[1]=d;a[3]=c[1];return 0}}function
ah(a,b){var
c=a[2];if(a[3]<=c)dU(a,1);a[1].safeSet(c,b);a[2]=c+1|0;return 0}function
a7(a,b){var
c=b.getLen(),d=a[2]+c|0;if(a[3]<d)dU(a,c);aE(b,0,a[1],a[2],c);a[2]=d;return 0}function
a8(a){return 0<=a?a:aA(j(fD,aB(a)))}function
dV(a,b){return a8(a+b|0)}var
fE=1;function
dW(a){return dV(fE,a)}function
dX(a){return aD(a,0,a.getLen())}function
dY(a,b,c){var
d=j(fG,j(a,fF)),e=j(fH,j(aB(b),d));return $(j(fI,j(aC(1,c),e)))}function
ai(a,b,c){return dY(dX(a),b,c)}function
aG(a){return $(j(fK,j(dX(a),fJ)))}function
S(f,b,c,d){function
j(a){if((f.safeGet(a)+ae|0)<0||9<(f.safeGet(a)+ae|0))return a;var
b=a+1|0;for(;;){var
c=f.safeGet(b);if(48<=c){if(!(58<=c)){var
b=b+1|0;continue}}else
if(36===c)return b+1|0;return a}}var
k=j(b+1|0),g=a5((c-k|0)+10|0);ah(g,37);var
e=d,i=0;for(;;){if(e){var
m=[0,e[1],i],e=e[2],i=m;continue}var
a=k,h=i;for(;;){if(a<=c){var
l=f.safeGet(a);if(42===l){if(h){var
n=h[2];a7(g,aB(h[1]));var
a=j(a+1|0),h=n;continue}throw[0,fm,fL]}ah(g,l);var
a=a+1|0;continue}return a6(g)}}}function
dZ(a,b,c,d,e){var
f=S(b,c,d,e);if(78!==a)if(Y!==a)return f;f.safeSet(f.getLen()-1|0,ao);return f}function
d0(a){return function(d,b){var
k=d.getLen();function
l(a,b){var
m=40===a?41:an,c=b;for(;;){if(k<=c)return aG(d);if(37===d.safeGet(c)){var
e=c+1|0;if(k<=e)return aG(d);var
f=d.safeGet(e),g=f-40|0;if(g<0||1<g){var
i=g-83|0;if(i<0||2<i)var
h=1;else
switch(i){case
1:var
h=1;break;case
2:var
j=1,h=0;break;default:var
j=0,h=0}if(h){var
c=e+1|0;continue}}else
var
j=0===g?0:1;if(j)return f===m?e+1|0:ai(d,b,f);var
c=l(f,e+1|0)+1|0;continue}var
c=c+1|0;continue}}return l(a,b)}}function
d1(i,b,c){var
m=i.getLen()-1|0;function
r(a){var
k=a;a:for(;;){if(k<m){if(37===i.safeGet(k)){var
f=0,h=k+1|0;for(;;){if(m<h)var
e=aG(i);else{var
n=i.safeGet(h);if(58<=n){if(95===n){var
f=1,h=h+1|0;continue}}else
if(32<=n)switch(n+ev|0){case
1:case
2:case
4:case
5:case
6:case
7:case
8:case
9:case
12:case
15:break;case
0:case
3:case
11:case
13:var
h=h+1|0;continue;case
10:var
h=l(b,f,h,G);continue;default:var
h=h+1|0;continue}var
d=h;b:for(;;){if(m<d)var
e=aG(i);else{var
j=i.safeGet(d);if(c3<=j)var
g=0;else
switch(j){case
78:case
88:case
O:case
G:case
ab:case
ao:case
ap:var
e=l(b,f,d,G),g=1;break;case
69:case
70:case
71:case
aY:case
ac:case
as:var
e=l(b,f,d,ac),g=1;break;case
33:case
37:case
44:case
64:var
e=d+1|0,g=1;break;case
83:case
91:case
Z:var
e=l(b,f,d,Z),g=1;break;case
97:case
af:case
am:var
e=l(b,f,d,j),g=1;break;case
76:case
aU:case
Y:var
s=d+1|0;if(m<s)var
e=l(b,f,d,G),g=1;else{var
p=i.safeGet(s)+e3|0;if(p<0||32<p)var
q=1;else
switch(p){case
0:case
12:case
17:case
23:case
29:case
32:var
e=v(c,l(b,f,d,j),G),g=1,q=0;break;default:var
q=1}if(q)var
e=l(b,f,d,G),g=1}break;case
67:case
99:var
e=l(b,f,d,99),g=1;break;case
66:case
98:var
e=l(b,f,d,66),g=1;break;case
41:case
an:var
e=l(b,f,d,j),g=1;break;case
40:var
e=r(l(b,f,d,j)),g=1;break;case
aq:var
t=l(b,f,d,j),u=v(d0(j),i,t),o=t;for(;;){if(o<(u-2|0)){var
o=v(c,o,i.safeGet(o));continue}var
d=u-1|0;continue b}default:var
g=0}if(!g)var
e=ai(i,d,j)}break}}var
k=e;continue a}}var
k=k+1|0;continue}return k}}r(0);return 0}function
d2(a){var
d=[0,0,0,0];function
b(a,b,c){var
f=41!==c?1:0,g=f?an!==c?1:0:f;if(g){var
e=97===c?2:1;if(af===c)d[3]=d[3]+1|0;if(a)d[2]=d[2]+e|0;else
d[1]=d[1]+e|0}return b+1|0}d1(a,b,function(a,b){return a+1|0});return d[1]}function
d3(a,b,c){var
g=a.safeGet(c);if((g+ae|0)<0||9<(g+ae|0))return v(b,0,c);var
e=g+ae|0,d=c+1|0;for(;;){var
f=a.safeGet(d);if(48<=f){if(!(58<=f)){var
e=(10*e|0)+(f+ae|0)|0,d=d+1|0;continue}}else
if(36===f)return 0===e?aA(fN):v(b,[0,a8(e-1|0)],d+1|0);return v(b,0,c)}}function
p(a,b){return a?b:dW(b)}function
d4(a,b){return a?a[1]:b}function
H(h){function
e(a){var
b=a6(a);a[2]=0;return b}var
E=a5(2*h.getLen()|0),aX=1;function
an(a){return a7(E,a)}function
aV(a,b,g,aW){var
f=g.getLen();function
z(h,b){var
k=b;for(;;){if(f<=k)return V(a,E);var
c=g.safeGet(k);if(37===c){var
i=function(a,b){return w(aW,d4(a,b))},aG=function(f,e,c,d){var
a=d;for(;;){var
ae=g.safeGet(a)+ev|0;if(!(ae<0||25<ae))switch(ae){case
1:case
2:case
4:case
5:case
6:case
7:case
8:case
9:case
12:case
15:break;case
10:return d3(g,function(a,b){var
d=[0,i(a,e),c];return aG(f,p(a,e),d,b)},a+1|0);default:var
a=a+1|0;continue}var
l=g.safeGet(a);if(!(cH<=l))switch(l){case
78:case
88:case
O:case
G:case
ab:case
ao:case
ap:var
bj=i(f,e),bk=aN(dZ(l,g,k,a,c),bj);return m(p(f,e),bk,a+1|0);case
69:case
71:case
aY:case
ac:case
as:var
bb=i(f,e),bc=ek(S(g,k,a,c),bb);return m(p(f,e),bc,a+1|0);case
76:case
aU:case
Y:var
ak=g.safeGet(a+1|0)+e3|0;if(!(ak<0||32<ak))switch(ak){case
0:case
12:case
17:case
23:case
29:case
32:var
T=a+1|0,al=l-108|0;if(al<0||2<al)var
ar=0;else{switch(al){case
1:var
ar=0,at=0;break;case
2:var
bi=i(f,e),aM=aN(S(g,k,T,c),bi),at=1;break;default:var
bh=i(f,e),aM=aN(S(g,k,T,c),bh),at=1}if(at)var
aL=aM,ar=1}if(!ar)var
bg=i(f,e),aL=nt(S(g,k,T,c),bg);return m(p(f,e),aL,T+1|0)}var
bd=i(f,e),bf=aN(dZ(Y,g,k,a,c),bd);return m(p(f,e),bf,a+1|0);case
37:case
64:return m(e,aC(1,l),a+1|0);case
83:case
Z:var
u=i(f,e);if(Z===l)var
w=u;else{var
b=[0,0],ax=u.getLen()-1|0,aZ=0;if(!(ax<0)){var
I=aZ;for(;;){var
t=u.safeGet(I),bq=14<=t?34===t?1:92===t?1:0:11<=t?13<=t?1:0:8<=t?1:0,a2=bq?2:be(t)?1:4;b[1]=b[1]+a2|0;var
a3=I+1|0;if(ax!==I){var
I=a3;continue}break}}if(b[1]===u.getLen())var
aP=u;else{var
h=M(b[1]);b[1]=0;var
ay=u.getLen()-1|0,a0=0;if(!(ay<0)){var
H=a0;for(;;){var
s=u.safeGet(H),x=s-34|0;if(x<0||58<x)if(-20<=x)var
U=1;else{switch(x+34|0){case
8:h.safeSet(b[1],92);b[1]++;h.safeSet(b[1],98);var
F=1;break;case
9:h.safeSet(b[1],92);b[1]++;h.safeSet(b[1],am);var
F=1;break;case
10:h.safeSet(b[1],92);b[1]++;h.safeSet(b[1],Y);var
F=1;break;case
13:h.safeSet(b[1],92);b[1]++;h.safeSet(b[1],af);var
F=1;break;default:var
U=1,F=0}if(F)var
U=0}else
var
U=(x-1|0)<0||56<(x-1|0)?(h.safeSet(b[1],92),b[1]++,h.safeSet(b[1],s),0):1;if(U)if(be(s))h.safeSet(b[1],s);else{h.safeSet(b[1],92);b[1]++;h.safeSet(b[1],48+(s/O|0)|0);b[1]++;h.safeSet(b[1],48+((s/10|0)%10|0)|0);b[1]++;h.safeSet(b[1],48+(s%10|0)|0)}b[1]++;var
a1=H+1|0;if(ay!==H){var
H=a1;continue}break}}var
aP=h}var
w=j(fY,j(aP,fX))}if(a===(k+1|0))var
aO=w;else{var
D=S(g,k,a,c);try{var
W=0,o=1;for(;;){if(D.getLen()<=o)var
az=[0,0,W];else{var
X=D.safeGet(o);if(49<=X)if(58<=X)var
au=0;else
var
az=[0,el(aD(D,o,(D.getLen()-o|0)-1|0)),W],au=1;else{if(45===X){var
W=1,o=o+1|0;continue}var
au=0}if(!au){var
o=o+1|0;continue}}var
$=az;break}}catch(f){f=r(f);if(f[1]!==R)throw f;var
$=dY(D,0,Z)}var
J=$[1],y=w.getLen(),a4=$[2],K=0,a8=32;if(J===y)if(0===K)var
aa=w,av=1;else
var
av=0;else
var
av=0;if(!av)if(J<=y)var
aa=aD(w,K,y);else{var
_=aC(J,a8);if(a4)aE(w,K,_,0,y);else
aE(w,K,_,J-y|0,y);var
aa=_}var
aO=aa}return m(p(f,e),aO,a+1|0);case
67:case
99:var
n=i(f,e);if(99===l)var
aJ=aC(1,n);else{if(39===n)var
q=fp;else
if(92===n)var
q=fq;else{if(14<=n)var
A=0;else
switch(n){case
8:var
q=fr,A=1;break;case
9:var
q=fs,A=1;break;case
10:var
q=ft,A=1;break;case
13:var
q=fu,A=1;break;default:var
A=0}if(!A)if(be(n)){var
aw=M(1);aw.safeSet(0,n);var
q=aw}else{var
B=M(4);B.safeSet(0,92);B.safeSet(1,48+(n/O|0)|0);B.safeSet(2,48+((n/10|0)%10|0)|0);B.safeSet(3,48+(n%10|0)|0);var
q=B}}var
aJ=j(fV,j(q,fU))}return m(p(f,e),aJ,a+1|0);case
66:case
98:var
a$=a+1|0,ba=i(f,e)?fj:fk;return m(p(f,e),ba,a$);case
40:case
aq:var
Q=i(f,e),aH=v(d0(l),g,a+1|0);if(aq===l){var
L=a5(Q.getLen()),aA=function(a,b){ah(L,b);return a+1|0};d1(Q,function(a,b,c){if(a)a7(L,fM);else
ah(L,37);return aA(b,c)},aA);var
a9=a6(L);return m(p(f,e),a9,aH)}var
aI=p(f,e),bp=dV(d2(Q),aI);return aV(function(a){return z(bp,aH)},aI,Q,aW);case
33:return z(e,a+1|0);case
41:return m(e,fS,a+1|0);case
44:return m(e,fT,a+1|0);case
70:var
ag=i(f,e);if(0===c)var
aK=fW;else{var
ad=S(g,k,a,c);if(70===l)ad.safeSet(ad.getLen()-1|0,as);var
aK=ad}var
aF=nf(ag);if(3===aF)var
aj=ag<0?fP:fQ;else
if(4<=aF)var
aj=fR;else{var
P=ek(aK,ag),N=0,a_=P.getLen();for(;;){if(a_<=N)var
aB=j(P,fO);else{var
C=P.safeGet(N)-46|0,br=C<0||23<C?55===C?1:0:(C-1|0)<0||21<(C-1|0)?1:0;if(!br){var
N=N+1|0;continue}var
aB=P}var
aj=aB;break}}return m(p(f,e),aj,a+1|0);case
91:return ai(g,a,l);case
97:var
aQ=i(f,e),aR=dW(d4(f,e)),aS=i(0,aR),bl=a+1|0,bm=p(f,aR);if(aX)an(v(aQ,0,aS));else
v(aQ,E,aS);return z(bm,bl);case
af:return ai(g,a,l);case
am:var
aT=i(f,e),bn=a+1|0,bo=p(f,e);if(aX)an(V(aT,0));else
V(aT,E);return z(bo,bn)}return ai(g,a,l)}},d=k+1|0,e=0;return d3(g,function(a,b){return aG(a,h,e,b)},d)}ah(E,c);var
k=k+1|0;continue}}function
m(a,b,c){an(b);return z(a,c)}return z(b,0)}var
d=a8(0);function
i(a,b){return aV(e,d,a,b)}var
c=d2(h);if(c<0||6<c){var
k=function(j,b){if(c<=j){var
l=x(c,0),m=function(a,b){return g(l,(c-a|0)-1|0,b)},d=0,a=b;for(;;){if(a){var
e=a[2],f=a[1];if(e){m(d,f);var
d=d+1|0,a=e;continue}m(d,f)}return i(h,l)}}return function(a){return k(j+1|0,[0,a,b])}};return k(0,0)}switch(c){case
1:return function(a){var
b=x(1,0);g(b,0,a);return i(h,b)};case
2:return function(a,b){var
c=x(2,0);g(c,0,a);g(c,1,b);return i(h,c)};case
3:return function(a,b,c){var
d=x(3,0);g(d,0,a);g(d,1,b);g(d,2,c);return i(h,d)};case
4:return function(a,b,c,d){var
e=x(4,0);g(e,0,a);g(e,1,b);g(e,2,c);g(e,3,d);return i(h,e)};case
5:return function(a,b,c,d,e){var
f=x(5,0);g(f,0,a);g(f,1,b);g(f,2,c);g(f,3,d);g(f,4,e);return i(h,f)};case
6:return function(a,b,c,d,e,f){var
j=x(6,0);g(j,0,a);g(j,1,b);g(j,2,c);g(j,3,d);g(j,4,e);g(j,5,f);return i(h,j)};default:return i(h,[0])}}var
d5=[0,0];function
a9(a){d5[1]=[0,a,d5[1]];return 0}32===a3;try{var
m0=em(mZ),a_=m0}catch(f){f=r(f);if(f[1]!==q)throw f;try{var
mY=em(mX),d6=mY}catch(f){f=r(f);if(f[1]!==q)throw f;var
d6=f0}var
a_=d6}var
dS=a_.getLen(),f1=82,dT=0;if(0<=0)if(dS<dT)var
aO=0;else
try{var
aF=dT;for(;;){if(dS<=aF)throw[0,q];if(a_.safeGet(aF)!==f1){var
aF=aF+1|0;continue}var
fy=1,a$=fy,aO=1;break}}catch(f){f=r(f);if(f[1]!==q)throw f;var
a$=0,aO=1}else
var
aO=0;if(!aO)var
a$=$(fx);var
I=[eP,function(a){var
n=n5(0),b=[0,x(55,0),0],k=0===n.length-1?[0,0]:n,f=k.length-1,o=0;if(!0){var
d=o;for(;;){g(b[1],d,d);var
u=d+1|0;if(54!==d){var
d=u;continue}break}}var
h=[0,fZ],p=0,q=55,r=np(55,f)?q:f,l=54+r|0;if(!(l<0)){var
c=p;for(;;){var
m=c%55|0,s=h[1],i=j(s,aB(w(k,bf(c,f))));h[1]=nK(i,0,i.getLen());var
e=h[1];g(b[1],m,(w(b[1],m)^(((e.safeGet(0)+(e.safeGet(1)<<8)|0)+(e.safeGet(2)<<16)|0)+(e.safeGet(3)<<24)|0))&aR);var
t=c+1|0;if(l!==c){var
c=t;continue}break}}b[2]=0;return b}];function
aj(a,b){var
l=a?a[1]:a$,d=16;for(;;){if(!(b<=d))if(!(a4<(d*2|0))){var
d=d*2|0;continue}if(l){var
i=nT(I);if(ad===i)var
c=I[1];else
if(eP===i){var
k=I[0+1];I[0+1]=fB;try{var
e=V(k,0);I[0+1]=e;nS(I,ad)}catch(f){f=r(f);I[0+1]=function(a){throw f};throw f}var
c=e}else
var
c=I;c[2]=(c[2]+1|0)%55|0;var
f=w(c[1],c[2]),h=(w(c[1],(c[2]+24|0)%55|0)+(f^f>>>25&31)|0)&aR;g(c[1],c[2],h);var
j=h}else
var
j=0;return[0,0,x(d,0),j,d]}}function
d7(l,b){var
d=b[2],e=d.length-1,f=e*2|0,h=f<a4?1:0;if(h){var
c=x(f,0);b[2]=c;var
i=function(a){if(a){var
d=a[1],f=a[2];i(a[3]);var
e=v(l,b,d);return g(c,e,[0,d,f,w(c,e)])}return 0},j=e-1|0,m=0;if(!(j<0)){var
a=m;for(;;){i(w(d,a));var
n=a+1|0;if(j!==a){var
a=n;continue}break}}var
k=0}else
var
k=h;return k}function
ak(a,b){return 3<=a.length-1?nq(10,O,a[3],b)&(a[2].length-1-1|0):bf(nr(10,O,b),a[2].length-1)}function
h(a,b,c){var
d=ak(a,b);g(a[2],d,[0,b,c,w(a[2],d)]);a[1]=a[1]+1|0;var
e=a[2].length-1<<1<a[1]?1:0;return e?d7(ak,a):e}function
e(a,b,c){function
e(a){if(a){var
d=a[3],f=a[1],g=a[2];return 0===aa(f,b)?[0,b,c,d]:[0,f,g,e(d)]}throw[0,q]}var
d=ak(a,b),h=w(a[2],d);try{var
f=e(h),j=g(a[2],d,f)}catch(f){f=r(f);if(f[1]===q){g(a[2],d,[0,b,c,h]);a[1]=a[1]+1|0;var
i=a[2].length-1<<1<a[1]?1:0;return i?d7(ak,a):i}throw f}return j}function
d8(a,b){return ej(a,b[0+1])}var
d9=[0,f2];d8(f5,[0,d9,0,f4,f3]);a9(function(a){if(a[1]===d9){var
c=a[2],d=a[4],e=a[3];if(typeof
c==="number")switch(c){case
1:var
b=f8;break;case
2:var
b=f9;break;case
3:var
b=f_;break;case
4:var
b=f$;break;case
5:var
b=ga;break;case
6:var
b=gb;break;case
7:var
b=gc;break;case
8:var
b=gd;break;case
9:var
b=ge;break;case
10:var
b=gf;break;case
11:var
b=gg;break;case
12:var
b=gh;break;case
13:var
b=gi;break;case
14:var
b=gj;break;case
15:var
b=gk;break;case
16:var
b=gl;break;case
17:var
b=gm;break;case
18:var
b=gn;break;case
19:var
b=go;break;case
20:var
b=gp;break;case
21:var
b=gq;break;case
22:var
b=gr;break;case
23:var
b=gs;break;case
24:var
b=gt;break;case
25:var
b=gu;break;case
26:var
b=gv;break;case
27:var
b=gw;break;case
28:var
b=gx;break;case
29:var
b=gy;break;case
30:var
b=gz;break;case
31:var
b=gA;break;case
32:var
b=gB;break;case
33:var
b=gC;break;case
34:var
b=gD;break;case
35:var
b=gE;break;case
36:var
b=gF;break;case
37:var
b=gG;break;case
38:var
b=gH;break;case
39:var
b=gI;break;case
40:var
b=gJ;break;case
41:var
b=gK;break;case
42:var
b=gL;break;case
43:var
b=gM;break;case
44:var
b=gN;break;case
45:var
b=gO;break;case
46:var
b=gP;break;case
47:var
b=gQ;break;case
48:var
b=gR;break;case
49:var
b=gS;break;case
50:var
b=gT;break;case
51:var
b=gU;break;case
52:var
b=gV;break;case
53:var
b=gW;break;case
54:var
b=gX;break;case
55:var
b=gY;break;case
56:var
b=gZ;break;case
57:var
b=g0;break;case
58:var
b=g1;break;case
59:var
b=g2;break;case
60:var
b=g3;break;case
61:var
b=g4;break;case
62:var
b=g5;break;case
63:var
b=g6;break;case
64:var
b=g7;break;case
65:var
b=g8;break;case
66:var
b=g9;break;case
67:var
b=g_;break;default:var
b=f6}else
var
f=c[1],b=V(H(g$),f);return[0,l(H(f7),b,e,d)]}return 0});aP(ha);aP(hb);try{aP(mW)}catch(f){f=r(f);if(f[1]!==R)throw f}try{aP(mV)}catch(f){f=r(f);if(f[1]!==R)throw f}aj(0,7);var
B=Q,aH=null,aI=undefined,T=true,J=RegExp,d_=[0,hd];d8(he,[0,d_,{}]);var
hc=Array;a9(function(a){return a[1]===d_?[0,new
z(a[2].toString())]:0});a9(function(a){return a
instanceof
hc?0:[0,new
z(a.toString())]});function
U(d){return en(function(a){if(a){var
e=V(d,a);if(!(e|0))a.preventDefault();return e}var
c=event,b=V(d,c);if(!(b|0))c.returnValue=b;return b})}var
hf="2d";function
d$(a,b){return a.createElement(b.toString())}var
hi=[0,hh];B.HTMLElement===aI;function
aJ(a){return new
J(N(a),aS)}function
ba(a,b,c){a.lastIndex=c;var
d=a.exec(N(b)),e=d==aH?aH:d;return e==aH?0:[0,e]}function
n(a,b){var
c=a[b],d=c===aI?aI:nH(c);return d===aI?0:[0,d]}new
J("[$]",aS);aJ(hk);function
ea(a){switch(a[0]){case
1:var
e=a[1],h=e[3],i=e[2],j=e[1];return l(H(l0),j,i,h);case
2:var
f=a[1],k=f[3],m=f[2],n=f[1];return l(H(l1),n,m,k);case
3:var
b=a[1],o=b[4],p=b[3],q=b[2],r=b[1];return bg(H(l2),r,q,p,o);case
4:var
c=a[1],s=c[4],t=c[3],u=c[2],v=c[1];return bg(H(l3),v,u,t,s);case
5:var
g=a[1],w=g[3],x=g[2],y=g[1];return l(H(l4),y,x,w);case
6:var
d=a[1],z=d[4],A=d[3],B=d[2],C=d[1];return bg(H(l5),C,B,A,z);default:switch(a[1]){case
1:return hm;case
2:return hn;case
3:return ho;case
4:return hp;case
5:return hq;case
6:return hr;case
7:return hs;case
8:return ht;case
9:return hu;case
10:return hv;case
11:return hw;case
12:return hx;case
13:return hy;case
14:return hz;case
15:return hA;case
16:return hB;case
17:return hC;case
18:return hD;case
19:return hE;case
20:return hF;case
21:return hG;case
22:return hH;case
23:return hI;case
24:return hJ;case
25:return hK;case
26:return hL;case
27:return hM;case
28:return hN;case
29:return hO;case
30:return hP;case
31:return hQ;case
32:return hR;case
33:return hS;case
34:return hT;case
35:return hU;case
36:return hV;case
37:return hW;case
38:return hX;case
39:return hY;case
40:return hZ;case
41:return h0;case
42:return h1;case
43:return h2;case
44:return h3;case
45:return h4;case
46:return h5;case
47:return h6;case
48:return h7;case
49:return h8;case
50:return h9;case
51:return h_;case
52:return h$;case
53:return ia;case
54:return ib;case
55:return ic;case
56:return id;case
57:return ie;case
58:return ig;case
59:return ih;case
60:return ii;case
61:return ij;case
62:return ik;case
63:return il;case
64:return im;case
65:return io;case
66:return ip;case
67:return iq;case
68:return ir;case
69:return is;case
70:return it;case
71:return iu;case
72:return iv;case
73:return iw;case
74:return ix;case
75:return iy;case
76:return iz;case
77:return iA;case
78:return iB;case
79:return iC;case
80:return iD;case
81:return iE;case
82:return iF;case
83:return iG;case
84:return iH;case
85:return iI;case
86:return iJ;case
87:return iK;case
88:return iL;case
89:return iM;case
90:return iN;case
91:return iO;case
92:return iP;case
93:return iQ;case
94:return iR;case
95:return iS;case
96:return iT;case
97:return iU;case
98:return iV;case
99:return iW;case
O:return iX;case
aY:return iY;case
ac:return iZ;case
as:return i0;case
eK:return i1;case
G:return i2;case
eN:return i3;case
eC:return i4;case
aU:return i5;case
e2:return i6;case
Y:return i7;case
ab:return i8;case
eS:return i9;case
eZ:return i_;case
af:return i$;case
Z:return ja;case
am:return jb;case
ao:return jc;case
eW:return jd;case
eJ:return je;case
ap:return jf;case
eD:return jg;case
cP:return jh;case
aq:return ji;case
cH:return jj;case
an:return jk;case
c3:return jl;case
b9:return jm;case
aZ:return jn;case
eU:return jo;case
eM:return jp;case
eB:return jq;case
eq:return jr;case
eL:return js;case
ep:return jt;case
eG:return ju;case
eF:return jv;case
eo:return jw;case
ew:return jx;case
ez:return jy;case
e0:return jz;case
e4:return jA;case
ex:return jB;case
dk:return jC;case
er:return jD;case
eR:return jE;case
et:return jF;default:return hl}}}function
aK(a){var
f=new
J(N(l6)),g=new
J(N(l7)),h=new
J(N(l8)),i=new
J(N(l9)),k=new
J(N(l_)),l=new
J(N(l$));if(!(f.test(a)|0))if(!(h.test(a)|0))if(!(g.test(a)|0))if(!(i.test(a)|0))if(!(k.test(a)|0))if(!(l.test(a)|0)){var
b=ma,m=new
z(a);for(;;){if(b){var
e=b[2],c=0===aa(b[1],m)?1:0;if(!c){var
b=e;continue}var
d=c}else
var
d=0;if(d)return a;throw[0,t,j(new
z(a),mb)]}}return a}function
aL(a){var
b=new
z(a);try{if(c(b,jG))if(c(b,jH))if(c(b,jI))if(c(b,jJ))if(c(b,jK))if(c(b,jL))if(c(b,jM))if(c(b,jN))if(c(b,jO))if(c(b,jP))if(c(b,jQ))if(c(b,jR))if(c(b,jS))if(c(b,jT))if(c(b,jU))if(c(b,jV))if(c(b,jW))if(c(b,jX))if(c(b,jY))if(c(b,jZ))if(c(b,j0))if(c(b,j1))if(c(b,j2))if(c(b,j3))if(c(b,j4))if(c(b,j5))if(c(b,j6))if(c(b,j7))if(c(b,j8))if(c(b,j9))if(c(b,j_))if(c(b,j$))if(c(b,ka))if(c(b,kb))if(c(b,kc))if(c(b,kd))if(c(b,ke))if(c(b,kf))if(c(b,kg))if(c(b,kh))if(c(b,ki))if(c(b,kj))if(c(b,kk))if(c(b,kl))if(c(b,km))if(c(b,kn))if(c(b,ko))if(c(b,kp))if(c(b,kq))if(c(b,kr))if(c(b,ks))if(c(b,kt))if(c(b,ku))if(c(b,kv))if(c(b,kw))if(c(b,kx))if(c(b,ky))if(c(b,kz))if(c(b,kA))if(c(b,kB))if(c(b,kC))if(c(b,kD))if(c(b,kE))if(c(b,kF))if(c(b,kG))if(c(b,kH))if(c(b,kI))if(c(b,kJ))if(c(b,kK))if(c(b,kL))if(c(b,kM))if(c(b,kN))if(c(b,kO))if(c(b,kP))if(c(b,kQ))if(c(b,kR))if(c(b,kS))if(c(b,kT))if(c(b,kU))if(c(b,kV))if(c(b,kW))if(c(b,kX))if(c(b,kY))if(c(b,kZ))if(c(b,k0))if(c(b,k1))if(c(b,k2))if(c(b,k3))if(c(b,k4))if(c(b,k5))if(c(b,k6))if(c(b,k7))if(c(b,k8))if(c(b,k9))if(c(b,k_))if(c(b,k$))if(c(b,la))if(c(b,lb))if(c(b,lc))if(c(b,ld))if(c(b,le))if(c(b,lf))if(c(b,lg))if(c(b,lh))if(c(b,li))if(c(b,lj))if(c(b,lk))if(c(b,ll))if(c(b,lm))if(c(b,ln))if(c(b,lo))if(c(b,lp))if(c(b,lq))if(c(b,lr))if(c(b,ls))if(c(b,lt))if(c(b,lu))if(c(b,lv))if(c(b,lw))if(c(b,lx))if(c(b,ly))if(c(b,lz))if(c(b,lA))if(c(b,lB))if(c(b,lC))if(c(b,lD))if(c(b,lE))if(c(b,lF))if(c(b,lG))if(c(b,lH))if(c(b,lI))if(c(b,lJ))if(c(b,lK))if(c(b,lL))if(c(b,lM))if(c(b,lN))if(c(b,lO))if(c(b,lP))if(c(b,lQ))if(c(b,lR))if(c(b,lS))if(c(b,lT))if(c(b,lU))if(c(b,lV))if(c(b,lW))if(c(b,lX)){if(c(b,lY))throw[0,t,j(b,lZ)];var
d=et}else
var
d=eR;else
var
d=er;else
var
d=dk;else
var
d=ex;else
var
d=e4;else
var
d=e0;else
var
d=ez;else
var
d=ew;else
var
d=eo;else
var
d=eF;else
var
d=eG;else
var
d=ep;else
var
d=eL;else
var
d=eq;else
var
d=eB;else
var
d=eM;else
var
d=eU;else
var
d=aZ;else
var
d=b9;else
var
d=c3;else
var
d=an;else
var
d=cH;else
var
d=aq;else
var
d=cP;else
var
d=eD;else
var
d=ap;else
var
d=eJ;else
var
d=eW;else
var
d=ao;else
var
d=am;else
var
d=Z;else
var
d=af;else
var
d=eZ;else
var
d=eS;else
var
d=ab;else
var
d=Y;else
var
d=e2;else
var
d=aU;else
var
d=eC;else
var
d=eN;else
var
d=G;else
var
d=eK;else
var
d=as;else
var
d=ac;else
var
d=aY;else
var
d=O;else
var
d=99;else
var
d=98;else
var
d=97;else
var
d=96;else
var
d=95;else
var
d=94;else
var
d=93;else
var
d=92;else
var
d=91;else
var
d=90;else
var
d=89;else
var
d=88;else
var
d=87;else
var
d=86;else
var
d=85;else
var
d=84;else
var
d=83;else
var
d=82;else
var
d=81;else
var
d=80;else
var
d=79;else
var
d=78;else
var
d=77;else
var
d=76;else
var
d=75;else
var
d=74;else
var
d=73;else
var
d=72;else
var
d=71;else
var
d=70;else
var
d=69;else
var
d=68;else
var
d=67;else
var
d=66;else
var
d=65;else
var
d=64;else
var
d=63;else
var
d=62;else
var
d=61;else
var
d=60;else
var
d=59;else
var
d=58;else
var
d=57;else
var
d=54;else
var
d=56;else
var
d=55;else
var
d=53;else
var
d=52;else
var
d=51;else
var
d=50;else
var
d=49;else
var
d=48;else
var
d=47;else
var
d=46;else
var
d=45;else
var
d=44;else
var
d=43;else
var
d=42;else
var
d=41;else
var
d=40;else
var
d=39;else
var
d=38;else
var
d=37;else
var
d=36;else
var
d=35;else
var
d=34;else
var
d=33;else
var
d=32;else
var
d=31;else
var
d=30;else
var
d=29;else
var
d=28;else
var
d=27;else
var
d=26;else
var
d=25;else
var
d=24;else
var
d=23;else
var
d=22;else
var
d=21;else
var
d=20;else
var
d=19;else
var
d=18;else
var
d=17;else
var
d=16;else
var
d=15;else
var
d=14;else
var
d=13;else
var
d=12;else
var
d=11;else
var
d=10;else
var
d=9;else
var
d=8;else
var
d=7;else
var
d=6;else
var
d=5;else
var
d=4;else
var
d=3;else
var
d=2;else
var
d=1;else
var
d=0;var
f=[0,d]}catch(f){f=r(f);if(f[1]===t){var
g=function(a){throw[0,t,j(b,mc)]},M=aJ(md),N=aJ(me),P=aJ(mf),e=function(a){if(a){var
b=a[1];try{var
d=el(b)}catch(f){f=r(f);if(f[1]===t)var
c=f[2];else{if(f[1]!==R)throw f;var
c=f[2]}throw[0,t,j(mh,j(b,j(mg,c)))]}return d}return g(0)},l=function(a){try{var
c=nl(a)}catch(f){f=r(f);if(f[1]===t)var
b=f[2];else{if(f[1]!==R)throw f;var
b=f[2]}throw[0,t,j(mj,j(a,j(mi,b)))]}return c},q=ba(M,b,0);if(q){var
h=q[1],s=n(h,2),u=n(h,3),v=n(h,4),m=n(h,5),w=n(h,1);if(w){var
x=w[1];if(!c(x,mk)){if(m)return g(0);var
U=e(v),V=e(u);return[1,[0,e(s),V,U]]}if(!c(x,ml)){if(m){var
Q=l(m[1]),S=e(v),T=e(u);return[3,[0,e(s),T,S,Q]]}return g(0)}}return g(0)}var
y=ba(N,b,0);if(y){var
i=y[1],A=n(i,2),B=n(i,3),C=n(i,4),o=n(i,5),D=n(i,1);if(D){var
E=D[1];if(!c(E,mm)){if(o)return g(0);var
$=e(C),aa=e(B);return[2,[0,e(A),aa,$]]}if(!c(E,mn)){if(o){var
W=l(o[1]),X=e(C),_=e(B);return[4,[0,e(A),_,X,W]]}return g(0)}}return g(0)}var
F=ba(P,b,0);if(F){var
k=F[1],H=n(k,2),I=n(k,3),J=n(k,4),p=n(k,5),K=n(k,1);if(K){var
L=K[1];if(!c(L,mo)){if(p)return g(0);var
ah=e(J),ai=e(I);return[5,[0,e(H),ai,ah]]}if(!c(L,mp)){if(p){var
ad=l(p[1]),ae=e(J),ag=e(I);return[6,[0,e(H),ag,ae,ad]]}return g(0)}}return g(0)}return g(0)}throw f}return f}function
a(a,b,c,d){return ea([3,[0,a,b,c,d]]).toString()}a(i,i,i,1);var
eb=a(0,0,0,1);a(i,0,0,1);a(0,0,i,1);a(0,i,0,1);a(i,0,i,1);a(0,i,i,1);a(i,i,0,1);a(i,192,203,1);a(i,i,i,0);function
u(a){return[0,a]}function
bb(a){return a[1]}var
d=aj(0,ab);function
ec(a){var
b=a-9|0;if(!(b<0||81<b))switch(b){case
0:return 58;case
18:return 36;case
23:return 57;case
28:return 71;case
29:return 73;case
30:return 72;case
31:return 74;case
56:return 0;case
57:return 1;case
58:return 2;case
59:return 3;case
60:return 4;case
61:return 5;case
62:return 6;case
63:return 7;case
64:return 8;case
65:return 9;case
66:return 10;case
67:return 11;case
68:return 12;case
69:return 13;case
70:return 14;case
71:return 15;case
72:return 16;case
73:return 17;case
74:return 18;case
75:return 19;case
76:return 20;case
77:return 21;case
78:return 22;case
79:return 23;case
80:return 24;case
81:return 25}return ac}var
C=aj(0,30);function
ed(a){var
b=0!==a?1:0;if(b){if(1!==a)return 1;var
c=2}else
var
c=b;return c}var
L=aj(0,10);function
ee(a){var
e=aL(aK(a)),f=3===e[0]?e[1][4]:0,d=aL(aK(a)),g=3===d[0]?d[1][3]:0,c=aL(aK(a)),h=3===c[0]?c[1][2]:0,b=aL(aK(a)),i=3===b[0]?b[1][1]:0;return ea([3,[0,i,h,g,f]]).toString()}function
bc(i,b,c,d,e,o,g){var
p=i[3].globalAlpha;i[3].globalAlpha=g;try{var
f=bb(b),r=i[6],u=ak(r,f),j=w(r[2],u);if(!j)throw[0,q];var
k=j[3],v=j[2];if(0===aa(f,j[1]))var
n=v;else{if(!k)throw[0,q];var
l=k[3],x=k[2];if(0===aa(f,k[1]))var
n=x;else{if(!l)throw[0,q];var
y=l[3],z=l[2];if(0===aa(f,l[1]))var
n=z;else{var
a=y;for(;;){if(!a)throw[0,q];var
s=a[3],t=a[2];if(0!==aa(f,a[1])){var
a=s;continue}var
n=t;break}}}}i[3].drawImage(n[1],c,d,e,o);var
A=i[3].globalAlpha=p}catch(f){var
m=d$(i[1],hg);m.src=bb(b).toString();return m.onload=U(function(a){var
f=bb(b);h(i[6],f,[0,m]);i[3].drawImage(m,c,d,e,o);i[3].globalAlpha=p;return T})}return A}var
mA=u(mz),mC=u(mB),mE=u(mD),mG=u(mF),mI=u(mH),mK=u(mJ),mM=u(mL),mO=u(mN),mQ=u(mP),K=[0,[0,mA,[0,mC,[0,mE,[0,mG,[0,mI,[0,mK,[0,mM,[0,mO,[0,mQ,0]]]]]]]]],0,4,0],D=[0,u(mR),0,15],ef=B.document,al=d$(ef,hj),mS=60,eg=bm,eh=800;if(1-(al.getContext==aH?1:0)){var
bd=al.getContext(hf);al.width=eh|0;al.height=eg|0;bd.fillStyle=ee(eb);bd.fillRect(0,0,eh,eg);h(d,0,0);h(d,1,0);h(d,2,0);h(d,3,0);h(d,4,0);h(d,5,0);h(d,6,0);h(d,7,0);h(d,8,0);h(d,9,0);h(d,10,0);h(d,11,0);h(d,12,0);h(d,13,0);h(d,14,0);h(d,15,0);h(d,16,0);h(d,17,0);h(d,18,0);h(d,19,0);h(d,20,0);h(d,21,0);h(d,22,0);h(d,23,0);h(d,24,0);h(d,25,0);h(d,57,0);h(d,36,0);h(d,58,0);h(d,73,0);h(d,74,0);h(d,71,0);h(d,72,0);h(L,mq,0);h(L,mr,0);h(L,ms,0);h(L,mt,0);h(C,0,0);h(C,1,0);h(C,2,0);var
my=aj(0,10),o=[0,ef,al,bd,ee(eb),W/mS,my,0,mT];o[1].title=o[8].toString();var
mU=1;B.onload=U(function(a){o[1].body.appendChild(o[2]);var
b=o[5];B.setInterval(en(function(a){B.onkeydown=U(function(a){switch(ec(a.keyCode)){case
0:e(d,0,1);break;case
1:e(d,1,1);break;case
2:e(d,2,1);break;case
3:e(d,3,1);break;case
4:e(d,4,1);break;case
5:e(d,5,1);break;case
6:e(d,6,1);break;case
7:e(d,7,1);break;case
8:e(d,8,1);break;case
9:e(d,9,1);break;case
10:e(d,10,1);break;case
11:e(d,11,1);break;case
12:e(d,12,1);break;case
13:e(d,13,1);break;case
14:e(d,14,1);break;case
15:e(d,15,1);break;case
16:e(d,16,1);break;case
17:e(d,17,1);break;case
18:e(d,18,1);break;case
19:e(d,19,1);break;case
20:e(d,20,1);break;case
21:e(d,21,1);break;case
22:e(d,22,1);break;case
23:e(d,23,1);break;case
24:e(d,24,1);break;case
25:e(d,25,1);break;case
36:e(d,36,1);break;case
57:e(d,57,1);break;case
58:e(d,58,1);break;case
71:e(d,71,1);break;case
72:e(d,72,1);break;case
73:e(d,73,1);break;case
74:e(d,74,1);break}return T});B.onkeyup=U(function(a){switch(ec(a.keyCode)){case
0:e(d,0,0);break;case
1:e(d,1,0);break;case
2:e(d,2,0);break;case
3:e(d,3,0);break;case
4:e(d,4,0);break;case
5:e(d,5,0);break;case
6:e(d,6,0);break;case
7:e(d,7,0);break;case
8:e(d,8,0);break;case
9:e(d,9,0);break;case
10:e(d,10,0);break;case
11:e(d,11,0);break;case
12:e(d,12,0);break;case
13:e(d,13,0);break;case
14:e(d,14,0);break;case
15:e(d,15,0);break;case
16:e(d,16,0);break;case
17:e(d,17,0);break;case
18:e(d,18,0);break;case
19:e(d,19,0);break;case
20:e(d,20,0);break;case
21:e(d,21,0);break;case
22:e(d,22,0);break;case
23:e(d,23,0);break;case
24:e(d,24,0);break;case
25:e(d,25,0);break;case
36:e(d,36,0);break;case
57:e(d,57,0);break;case
58:e(d,58,0);break;case
71:e(d,71,0);break;case
72:e(d,72,0);break;case
73:e(d,73,0);break;case
74:e(d,74,0);break}return T});B.onmousedown=U(function(a){switch(ed(a.button)){case
0:e(C,0,1);break;case
1:e(C,1,1);break;case
2:e(C,2,1);break}return T});B.onmouseup=U(function(a){switch(ed(a.button)){case
0:e(C,0,0);break;case
1:e(C,1,0);break;case
2:e(C,2,0);break}return T});B.onmousemove=U(function(a){e(L,mu,a.screenX);e(L,mv,a.screenY);e(L,mw,a.clientX);e(L,mx,a.clientY);return T});if(mU){o[2].width=o[2].width;o[3].fillStyle=o[4];o[3].fillRect(0,0,o[2].width,o[2].height)}bc(o,D[1],0-D[2],0,W,bm,1);bc(o,D[1],0-D[2]+W,0,W,bm,1);var
t=W,m=W<D[2]?D[2]-t:D[2];D[2]=m+D[3];var
i=K[2],n=1,p=aZ,q=90,r=260,s=200,l=K[1];if(0<=i){var
b=l,g=i;for(;;){if(b){var
j=b[2],k=b[1];if(0!==g){var
b=j,g=g-1|0;continue}var
h=k}else
var
h=aA(fn);break}}else
var
h=$(fo);bc(o,h,s,r,q,p,n);K[4]=K[4]+1|0;var
f=0,c=K[1];for(;;){if(c){var
f=f+1|0,c=c[2];continue}K[2]=bf(nj(K[4],K[3]),f);return 0}}),b);return T});dR(0);return}throw[0,hi]}(this));
