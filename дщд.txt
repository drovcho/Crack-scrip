-- Statically extracted preserved payload; entrypoint/runtime behavior is unverified.

local __devirt_support = {
[2] = table.move,
[25] = table.pack,
["ds"] = function(U,K,R,...)
	local _=U[25](...);
	U[2](_,1,_.n,R+1,K);
end,
}

return (function(U,K,K,K,K)
	return function(K)
		return function(...)
			local K={cache={}};
			K.load=function(R)
				if not(K.cache[R])then 
					local _,N=K.cache,{};
					N.c,_[R]=K[R](),N;
				end;
				return K.cache[R].c;
			end;
			K.a=function()
				local R=getgenv();
				local _=rawget(R,"\0sh");
				local N;
				if type(_)~="table"then 
					_={fields={},detours={}};
					rawset(R,"\0sh",_);
					N=_;
				else 
					N=_;
				end;
				local R=cloneref and cloneref(game:GetService("RunService"))or game:GetService("RunService");
				local _=hookfunction or replaceclosure;
				local h,F,t=restorefunction or restorefunc,isreadonly,setreadonly;
				local function f(l)
					if type(t)~="function"then 
						return false;
					elseif type(F)~="function"then 
						return false;
					end;
					local g,u=pcall(F,l);
					if g then 
						if not(u)then 
							return false;
						end;
					else 
						return false;
					end;
					return pcall(t,l,false);
				end;
				local function F(l,g)
					if g then 
						pcall(t,l,true);
					end;
				end;
				local function t(l,g,u)
					local s,C=f(l),pcall(function()
						l[g]=u;
					end);
					F(l,s);
					return C;
				end;
				local F,f,l,g,u,s={},{},{},{},{},true;
				local C,z={shared=N,takeover=function()
					local q=N.unload;
					N.unload=nil;
					if type(q)=="function"then 
						pcall(q);
					end;
				end,publish=function(q)
					N.unload=q;
				end,adopt=function(q)
					if q then 
						F[#F+1]=q;
					end;
					return q;
				end,connect=function(q,r)
					local x=q:Connect(r);
					F[#F+1]=x;
					return x;
				end,bind=function(q,r)
					local x="\0"..tostring(math.random(10000000,90000000));
					R:BindToRenderStep(x,q,r);
					f[#f+1]=x;
					return x;
				end,own=function(q)
					l[#l+1]=q;
					return q;
				end,spawn=function(q,...)
					local r=task.spawn(q,...);
					g[#g+1]=r;
					return r;
				end,teardown=function(q)
					u[#u+1]=q;
					return q;
				end,field=function(q,r,x)
					local G,a=N.fields[q];
					if G then 
						a=G;
					else 
						G={};
						N.fields[q]=G;
						a=G;
					end;
					local G,m=a[r];
					if G==nil then 
						G=q[r];
						if G==nil then 
							return nil;
						end;
						a[r]=G;
						m=G;
					else 
						m=G;
					end;
					local G=x(m);
					if type(G)~="function"then 
						return m;
					end;
					if not(t(q,r,G))then 
						a[r]=nil;
						return m;
					end;
					u[#u+1]=function()
						if q[r]==G then 
							t(q,r,m);
						end;
						a[r]=nil;
					end;
					return m;
				end,detour=function(t,q)
					if type(_)~="function"then 
						return nil;
					elseif type(t)~="function"then 
						return nil;
					end;
					local r=N.detours[t];
					if r then 
						return r;
					end;
					local r,x=pcall(_,t,q);
					if r then 
						if type(x)~="function"then 
							return nil;
						end;
					else 
						return nil;
					end;
					N.detours[t]=x;
					u[#u+1]=function()
						if type(h)~="function"then 
							pcall(_,t,x);
						elseif not(pcall(h,t))then 
							pcall(_,t,x);
						end;
						N.detours[t]=nil;
					end;
					return x;
				end},getupvalues or debug and debug.getupvalues;
				local _=setupvalue or debug and debug.setupvalue;
				C.upvalue=function(h,t,q)
					if type(z)~="function"then 
						return false;
					elseif type(_)~="function"then 
						return false;
					end;
					local r,x=pcall(z,h);
					if r then 
						if type(x)~="table"then 
							return false;
						end;
					else 
						return false;
					end;
					local r=x[t];
					if not(pcall(_,h,t,q))then 
						return false;
					end;
					u[#u+1]=function()
						local x,G=pcall(z,h);
						if x then 
							if type(G)=="table"then 
								if G[t]==q then 
									pcall(_,h,t,r);
								end;
							end;
						end;
					end;
					return true;
				end;
				C.alive=function()
					local _=s;
					return _;
				end;
				C.release=function()
					if not(s)then 
						return;
					end;
					s=false;
					for _=#u,1,-1 do 
						pcall(u[_]);
						u[_]=nil;
					end;
					for _=#f,1,-1 do 
						pcall(R.UnbindFromRenderStep,R,f[_]);
						f[_]=nil;
					end;
					for R=#F,1,-1 do 
						local _=F[R];
						F[R]=nil;
						if typeof(_)=="RBXScriptConnection"then 
							pcall(_.Disconnect,_);
						elseif type(_)=="function"then 
							pcall(_);
						elseif type(_)=="table"then 
							if type(_.Disconnect)=="function"then 
								pcall(_.Disconnect,_);
							end;
						end;
					end;
					for R=#g,1,-1 do 
						pcall(task.cancel,g[R]);
						g[R]=nil;
					end;
					for R=#l,1,-1 do 
						local _=l[R];
						l[R]=nil;
						pcall(_.Destroy,_);
					end;
					N.unload=nil;
				end;
				return C;
			end;
			K.b=function()
				local R=cloneref or function(_)
					return _;
				end;
				local _,N=getgenv(),{};
				N.players=game:GetService("Players");
				N.run=R(game:GetService("RunService"));
				N.input=R(game:GetService("UserInputService"));
				N.storage=R(game:GetService("ReplicatedStorage"));
				N.lighting=R(game:GetService("Lighting"));
				N.workspace=R(game:GetService("Workspace"));
				N.collection=R(game:GetService("CollectionService"));
				N.guiservice=R(game:GetService("GuiService"));
				N.http=R(game:GetService("HttpService"));
				N.stats=R(game:GetService("Stats"));
				N.tween=R(game:GetService("TweenService"));
				N.sounds=R(game:GetService("SoundService"));
				N.content=R(game:GetService("ContentProvider"));
				N.assets=R(game:GetService("AssetService"));
				N.debris=R(game:GetService("Debris"));
				N.keyframes=R(game:GetService("KeyframeSequenceProvider"));
				N.lp=N.players.LocalPlayer;
				N.hook=hookfunction or replaceclosure;
				N.newc=newcclosure or function(h)
					return h;
				end;
				N.getups=getupvalues or debug and debug.getupvalues;
				N.setup=setupvalue or debug and debug.setupvalue;
				N.info=debug and(debug.info or debug.getinfo);
				N.custom_asset=getcustomasset;
				local h=getthreadidentity or getidentity;
				local F=setthreadidentity or setidentity;
				N.identity=(function()
					if type(h)~="function"then 
						return nil;
					end;
					local t,f=pcall(h);
					if t then 
						if type(f)=="number"then 
							return f;
						end;
					end;
					return nil;
				end)();
				N.reclaim=function()
					if type(F)=="function"then 
						if N.identity then 
							pcall(F,N.identity);
						end;
					end;
				end;
				N.elevate=function(t,f,l,g,u)
					if type(F)~="function"then 
						return pcall(t,f,l,g,u);
					end;
					local s;
					if type(h)=="function"then 
						local C,z=pcall(h);
						s=if C then if type(z)=="number"then z else s else s;
					else 
					end;
					pcall(F,N.identity or 8);
					local C,z=pcall(t,f,l,g,u);
					if s then 
						pcall(F,s);
					end;
					return C,z;
				end;
				N.plain=function(t,...)
					if type(F)~="function"then 
						return pcall(t,...);
					end;
					local f=N.identity;
					if type(h)=="function"then 
						local l,g=pcall(h);
						f=if l then if type(g)=="number"then g else f else f;
					else 
					end;
					pcall(F,2);
					local h=table.pack(pcall(t,...));
					if f then 
						pcall(F,f);
					end;
					return table.unpack(h,1,h.n);
				end;
				N.host=(function()
					if type(gethui)=="function"then 
						local h,F=pcall(gethui);
						if h then 
							if typeof(F)=="Instance"then 
								return R(F);
							end;
						end;
					end;
					local h,F=pcall(game.GetService,game,"CoreGui");
					if h then 
						if typeof(F)=="Instance"then 
							return R(F);
						end;
					end;
					return N.lp:FindFirstChildOfClass("PlayerGui");
				end)();
				N.screen=function(R)
					local h=Instance.new("ScreenGui");
					h.IgnoreGuiInset=true;
					h.ResetOnSpawn=false;
					h.ZIndexBehavior=Enum.ZIndexBehavior.Sibling;
					h.DisplayOrder=R or 0;
					R=pcall(function()
						h.Parent=N.host;
					end);
					if R then 
					else 
						local F=N.lp:FindFirstChildOfClass("PlayerGui");
						R=F~=nil and pcall(function()
							h.Parent=F;
						end);
					end;
					if R then 
						if not(h.Parent)then 
							h:Destroy();
							return nil;
						end;
					else 
						h:Destroy();
						return nil;
					end;
					return h;
				end;
				N.weak=function()
					return setmetatable({},{__mode="k"});
				end;
				N.module=function(R,...)
					local h=R or N.storage;
					for R=1,select("#",...),1 do 
						h=h:FindFirstChild((select(R,...)));
						if not(h)then 
							return nil;
						end;
					end;
					if not(h:IsA("ModuleScript"))then 
						return nil;
					end;
					local R,F=pcall(require,h);
					if R then 
						return F;
					end;
					return nil;
				end;
				N.drawmask=function()
					local R=rawget(_,"shitaro_drawmask");
					if type(R)=="table"then 
						return R;
					end;
					return nil;
				end;
				return N;
			end;
			K.c=function()
				local R=bit32.band;
				local _=bit32.bxor;
				local N=bit32.bnot;
				local h=bit32.rrotate;
				local F=bit32.rshift;
				local t=string.char;
				local f=string.byte;
				local l=string.rep;
				local g=string.sub;
				local u=string.gsub;
				local s=string.format;
				local C=table.concat;
				local z=table.create;
				local q=math.floor;
				local r,x=request or syn and syn.request or http and http.request or fluxus and fluxus.request or http_request,{1116352408,1899447441,3049323471,3921009573,961987163,1508970993,2453635748,2870763221,3624381080,310598401,607225278,1426881987,1925078388,2162078206,2614888103,3248222580,3835390401,4022224774,264347078,604807628,770255983,1249150122,1555081692,1996064986,2554220882,2821834349,2952996808,3210313671,3336571891,3584528711,113926993,338241895,666307205,773529912,1294757372,1396182291,1695183700,1986661051,2177026350,2456956037,2730485921,2820302411,3259730800,3345764771,3516065817,3600352804,4094571909,275423344,430227734,506948616,659060556,883997877,958139571,1322822218,1537002063,1747873779,1955562222,2024104815,2227730452,2361852424,2428436474,2756734187,3204031479,3329325298};
				local G=z(64,0);
				local function a(m)
					return t(q(m/16777216)%256,q(m/65536)%256,q(m/256)%256,m%256);
				end;
				local function m(c)
					local n=#c;
					local O,j=n*8%4294967296,q(n*8/4294967296);
					c..="\128"..l("\0",(56-(n+1)%64)%64)..a(j)..a(O);
					local E,P,T,Y,v,Z,L,o=1779033703,3144134277,1013904242,2773480762,1359893119,2600822924,528734635,1541459225;
					for X=1,#c,64 do 
						for Q=0,15,1 do 
							O=X+Q*4;
							G[Q+1]=f(c,O)*16777216+f(c,O+1)*65536+f(c,O+2)*256+f(c,O+3);
						end;
						for c=17,64,1 do 
							n,j=G[c-15],G[c-2];
							local O,X=_(h(n,7),h(n,18),F(n,3)),_(h(j,17),h(j,19),F(j,10));
							G[c]=(G[c-16]+O+G[c-7]+X)%4294967296;
						end;
						local F,c,n,O,j,X,Q,S=v,Z,L,o,E,P,T,Y;
						for A=1,64,1 do 
							local J,y=_(h(F,6),h(F,11),h(F,25)),_(R(F,c),R(N(F),n));
							local N,e=(O+J+y+x[A]+G[A])%4294967296,(_(h(j,2),h(j,13),h(j,22))+_(R(j,X),R(j,Q),R(X,Q)))%4294967296;
							F,O,j,S,c,n,X,Q=(S+N)%4294967296,n,(N+e)%4294967296,Q,F,c,j,X;
						end;
						E,P,T,Y,v,Z,L,o=(E+j)%4294967296,(P+X)%4294967296,(T+Q)%4294967296,(Y+S)%4294967296,(v+F)%4294967296,(Z+c)%4294967296,(L+n)%4294967296,(o+O)%4294967296;
					end;
					return a(E)..a(P)..a(T)..a(Y)..a(v)..a(Z)..a(L)..a(o);
				end;
				local R=z(64,"");
				local N=z(64,"");
				local function h(F,x)
					F=if#F>64 then m(F)else F;
					F=if#F<64 then F..l("\0",64-#F)else F;
					for G=1,64,1 do 
						local a=f(F,G);
						R[G]=t(_(a,92));
						N[G]=t(_(a,54));
					end;
					return m(C(R)..m(C(N)..x));
				end;
				local R={};
				for N=1,64,1 do 
					R[g("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/",N,N)]=N-1;
				end;
				local function N(F)
					local x,G={},0;
					for a=1,#F,3 do 
						local c,n,O=f(F,a),f(F,a+1),f(F,a+2);
						a=c*65536+(n or 0)*256+(O or 0);
						local F,j=q(a/262144)+1,q(a/4096)%64+1;
						G+=1;
						x[G]=g("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_",F,F);
						G+=1;
						x[G]=g("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_",j,j);
						if n then 
							j=q(a/64)%64+1;
							G+=1;
							x[G]=g("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_",j,j);
						else 
						end;
						if O then 
							c=a%64+1;
							G+=1;
							x[G]=g("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_",c,c);
						else 
						end;
					end;
					return C(x);
				end;
				local function F(x)
					x=u(u(u(x,"-","+"),"_","/"),"[^A-Za-z0-9+/=]","");
					x..=l("=",(4-#x%4)%4);
					local l,G={},0;
					for a=1,#x,4 do 
						local c,n=g(x,a+2,a+2),g(x,a+3,a+3);
						local O=(R[g(x,a,a)]or 0)*262144+(R[g(x,a+1,a+1)]or 0)*4096+(R[c]or 0)*64+(R[n]or 0);
						G+=1;
						l[G]=t(q(O/65536)%256);
						if c~="="then 
							G+=1;
							l[G]=t(q(O/256)%256);
						else 
						end;
						if n~="="then 
							G+=1;
							l[G]=t(O%256);
						else 
						end;
					end;
					return C(l);
				end;
				local R=u("02d417c2bd7b033a00d3c4e9fda43fc56761f68f516cf68a68a6110f2cb99e49","..",function(l)
					return t(tonumber(l,16));
				end);
				local l=Random.new(os.time()+q(os.clock()*1000000)%2147483647);
				local function g()
					local x=z(16);
					for G=1,16,1 do 
						x[G]=t(l:NextInteger(0,255));
					end;
					return C(x);
				end;
				local function l(x)
					local G=z(8);
					for z=8,1,-1 do 
						G[z]=t(x%256);
						x=q(x/256);
					end;
					return C(G);
				end;
				local function z(q)
					return(u(q,"[^%w%-%._~/]",function(q)
						return s("%%%02X",f(q));
					end));
				end;
				local q=bit32.lshift;
				local x=bit32.rshift;
				local G=bit32.band;
				local function a(c)
					local function n(O)
						local j,E,P,T=f(c,O,O+3);
						return T*16777216+P*65536+E*256+j;
					end;
					local c=n(1);
					local O=n(5);
					local j=n(9);
					local E=n(13);
					local n,P,T,Y;
					if c==0 and O==0 and j==0 and E==0 then 
						c,O,j,E=2654435769,608135816,3084996962,2246822507;
						n,P,T,Y=c,O,j,E;
					else 
						n,P,T,Y=c,O,j,E;
					end;
					local function c()
						local O=_(n,q(n,11));
						O,n,P,T=_(O,x(O,8)),P,T,Y;
						local q=_(_(Y,x(Y,19)),O);
						Y=q;
						return q;
					end;
					return c;
				end;
				local function q(c,n)
					local O,j=a(h(R,"SHITARO-ASSET-MASK-v1\0"..n)),#c;
					if buffer and buffer.fromstring then 
						local a,E=buffer.fromstring(c),0;
						while E+4<=j do 
							buffer.writeu32(a,E,_(buffer.readu32(a,E),O()));
							E+=4;
						end;
						if E<j then 
							local P,T=O(),0;
							while E+T<j do 
								buffer.writeu8(a,E+T,_(buffer.readu8(a,E+T),G(x(P,T*8),255)));
								T+=1;
							end;
						end;
						return buffer.tostring(a);
					end;
					local a,E,P={},1,0;
					while E<=j do 
						n=O();
						for O=0,3,1 do 
							if E+O<=j then 
								P+=1;
								a[P]=t(_(f(c,E+O),G(x(n,O*8),255)));
							else 
							end;
						end;
						E=E+4;
					end;
					return C(a);
				end;
				local function _(t,C,x,G)
					if not(r)then 
						return nil;
					end;
					local a,c=g(),l(os.time());
					local g={["X-Shitaro-Token"]=N(a..c..h(R,"SHITARO-"..C.."-REQ-v1\0"..x.."\0"..a.."\0"..c)),Accept="*/*",["Cache-Control"]="no-cache"};
					if G then 
						g["Content-Type"]="application/json";
					end;
					local N,c=pcall(r,{Url=t,Method=G and"POST"or"GET",Headers=g,Body=G});
					if N then 
						if type(c)~="table"then 
							return nil;
						end;
					else 
						return nil;
					end;
					if c.StatusCode~=200 then 
						return nil,nil,c.StatusCode;
					end;
					G=c.Body;
					if type(G)~="string"then 
						return nil;
					elseif#G==0 then 
						return nil;
					end;
					N=c.Headers or{};
					t=N["X-Shitaro-Sig"]or N["x-shitaro-sig"];
					if t then 
						if t==""then 
							return nil;
						end;
					else 
						return nil;
					end;
					N=h(R,"SHITARO-"..C.."-RESP-v1\0"..x.."\0"..a.."\0"..l(#G)..G);
					if F(t)~=N then 
						return nil;
					end;
					return G,a;
				end;
				local function R(N)
					return(u(N,".",function(N)
						return s("%02x",f(N));
					end));
				end;
				return{library=function(N)
					for h=1,3,1 do 
						h=_("https://shitaro.lol/api/library/"..z(N),"LIB",N);
						if type(h)=="string"then 
							if#h>0 then 
								return h;
							end;
						end;
						task.wait(0.5);
					end;
					return nil;
				end,asset=function(N)
					local h,F=_("https://shitaro.lol/api/assets/"..z(N),"ASSET",N);
					if type(h)~="string"then 
						return nil;
					elseif#h==0 then 
						return nil;
					end;
					return q(h,F);
				end,share_put=function(N)
					local h,F,F=_("https://shitaro.lol/api/share","CFGPUT",R(m(N)),N);
					if type(h)~="string"then 
						return nil,F;
					end;
					F=string.match(h,"\"code\"%s*:%s*\"([%w%-]+)\"");
					if not F then 
						return nil,0;
					end;
					return F;
				end,share_get=function(R)
					R=string.upper(u(R,"[^%w%-]",""));
					if#R<4 then 
						return nil,404;
					elseif#R>16 then 
						return nil,404;
					end;
					local N,h,h=_("https://shitaro.lol/api/share/"..R,"CFGGET",R);
					if type(N)~="string"then 
						return nil,h;
					end;
					return N;
				end};
			end;
			K.d=function()
				local function R(_)
					return cloneref(game:GetService(_));
				end;
				local _,N=R("Players"),R("RunService");
				local h=R("UserInputService");
				local F=R("TweenService");
				local t=R("HttpService");
				local f=R("GuiService");
				local l=R("ReplicatedStorage");
				local g=R("Lighting");
				local u=R("Stats");
				local s,C,z,q,r,x,G,a,m=_.LocalPlayer,N,h,F,t,f,l,g,u;
				local N=s;
				local h=Color3.fromRGB;
				local F=Color3.fromHSV;
				local t=Color3.new;
				local f=UDim2.new;
				local l=UDim2.fromOffset;
				local g=UDim2.fromScale;
				local u=UDim.new;
				local s=Vector2.new;
				local c=ColorSequence.new;
				local n=ColorSequenceKeypoint.new;
				local O=NumberSequence.new;
				local j=NumberSequenceKeypoint.new;
				local E=math.clamp;
				local P=math.floor;
				local T=math.max;
				local Y=math.min;
				local v=math.abs;
				local Z=string.format;
				local L=string.sub;
				local o=string.upper;
				local X=string.lower;
				local Q=string.gsub;
				local S=string.match;
				local A=string.find;
				local J=table.find;
				local y=table.remove;
				local e=table.clear;
				local M=table.concat;
				local I=table.sort;
				local i=table.clone;
				local k=task.spawn;
				local B=task.delay;
				local d=task.defer;
				local b=Enum.TextXAlignment;
				local p=Enum.AutomaticSize.X;
				local D=Enum.AutomaticSize.Y;
				local V=Enum.AutomaticSize.XY;
				local W=Enum.AutomaticSize.None;
				local H=Enum.HorizontalAlignment;
				local w=Enum.VerticalAlignment;
				local UQ=Enum.TextTruncate.AtEnd;
				local KQ=Enum.UserInputType.MouseButton1;
				local RQ=Enum.UserInputType.MouseButton2;
				local _Q=Enum.UserInputType.MouseButton3;
				local NQ=Enum.UserInputType.MouseMovement;
				local hQ=Enum.UserInputType.Touch;
				local FQ=Enum.UserInputState.End;
				local tQ=Enum.KeyCode.Unknown;
				local fQ=Enum.PlaybackState.Completed;
				local lQ=Enum.EasingStyle.Quint;
				local gQ=Enum.EasingStyle.Quad;
				local uQ=Enum.EasingStyle.Sine;
				local sQ=t(1,1,1);
				local CQ=t(0,0,0);
				local zQ,qQ,rQ,xQ=getgenv(),base64encode,base64decode,{};
				xQ.__index=xQ;
				xQ.new=function()
					return setmetatable({},xQ);
				end;
				xQ.add=function(GQ,aQ)
					GQ[#GQ+1]=aQ;
					return aQ;
				end;
				xQ.clean=function(GQ)
					for aQ=#GQ,1,-1 do 
						local mQ=GQ[aQ];
						GQ[aQ]=nil;
						aQ=typeof(mQ);
						if aQ=="RBXScriptConnection"then 
							mQ:Disconnect();
						elseif aQ=="Instance"then 
							mQ:Destroy();
						elseif aQ=="function"then 
							pcall(mQ);
						elseif aQ=="thread"then 
							pcall(task.cancel,mQ);
						elseif aQ=="table"then 
							if type(mQ.destroy)=="function"then 
								mQ:destroy();
							elseif type(mQ.clean)=="function"then 
								mQ:clean();
							end;
						end;
					end;
				end;
				local function GQ(aQ,mQ,cQ)
					local nQ=aQ:Connect(mQ);
					if cQ then 
						cQ[#cQ+1]=nQ;
					end;
					return nQ;
				end;
				local function aQ(mQ)
					local cQ,nQ=pcall(r.JSONEncode,r,mQ);
					return cQ and nQ or nil;
				end;
				local function mQ(cQ)
					if type(cQ)~="string"then 
						return nil;
					elseif cQ==""then 
						return nil;
					end;
					local nQ,OQ=pcall(r.JSONDecode,r,cQ);
					if nQ then 
						if type(OQ)=="table"then 
							return OQ;
						end;
					end;
					return nil;
				end;
				local cQ={dir=function(nQ)
					local OQ,jQ=pcall(isfolder,nQ);
					if OQ then 
						if not(jQ)then 
							pcall(makefolder,nQ);
						end;
					end;
				end,has=function(nQ)
					local OQ,jQ=pcall(isfile,nQ);
					return OQ and jQ==true;
				end};
				cQ.read=function(nQ)
					if cQ.has(nQ)then 
						local OQ,jQ=pcall(readfile,nQ);
						if OQ then 
							return jQ;
						end;
					end;
					return nil;
				end;
				cQ.write=function(nQ,OQ)
					return(pcall(writefile,nQ,OQ));
				end;
				cQ.del=function(nQ)
					if cQ.has(nQ)then 
						pcall(delfile,nQ);
					end;
				end;
				cQ.list=function(nQ)
					local OQ,jQ=pcall(isfolder,nQ);
					if OQ then 
						if jQ then 
							local OQ,jQ=pcall(listfiles,nQ);
							if OQ then 
								if type(jQ)=="table"then 
									return jQ;
								end;
							end;
						end;
					end;
					return{};
				end;
				local nQ,OQ;
				do 
				local function jQ(EQ)
					local PQ,TQ=pcall(request,{Url=EQ,Method="GET"});
					if PQ then 
						if type(TQ)=="table"then 
							if TQ.StatusCode==200 then 
								if type(TQ.Body)=="string"then 
									return TQ.Body;
								end;
							end;
						end;
					end;
					return nil;
				end;
				nQ=function(EQ)
					local PQ,TQ=pcall(getcustomasset,EQ);
					if PQ then 
						if type(TQ)=="string"then 
							return TQ;
						end;
					end;
					return nil;
				end;
				local function EQ(PQ,TQ,YQ)
					if not(cQ.has(PQ))then 
						local vQ=jQ(TQ);
						if vQ then 
							if#vQ<(YQ or 1)then 
								return nil;
							elseif not(cQ.write(PQ,vQ))then 
								return nil;
							end;
						else 
							return nil;
						end;
					end;
					return nQ(PQ);
				end;
				OQ=EQ;end;
			local jQ,EQ={};
				do 
				local PQ=bit32.band;
				local TQ=bit32.bxor;
				local YQ=bit32.rshift;
				local vQ=buffer.create;
				local ZQ=buffer.writeu8;
				local LQ=buffer.readu8;
				local oQ=buffer.copy;
				local XQ=buffer.tostring;
				local QQ=math.exp;
				local SQ=math.sqrt;
				local AQ,JQ=string.byte,{};
				for yQ=0,255,1 do 
					R=yQ;
					for eQ=1,8,1 do 
						R=if PQ(R,1)==1 then TQ(3988292384,YQ(R,1))else YQ(R,1);
					end;
					JQ[yQ]=R;
				end;
				local function yQ(eQ,MQ,IQ)
					local iQ=4294967295;
					for kQ=MQ,MQ+IQ-1,1 do 
						iQ=TQ(JQ[PQ(TQ(iQ,LQ(eQ,kQ)),255)],YQ(iQ,8));
					end;
					return TQ(iQ,4294967295);
				end;
				local function JQ(eQ,MQ,IQ)
					ZQ(eQ,MQ,PQ(YQ(IQ,24),255));
					ZQ(eQ,MQ+1,PQ(YQ(IQ,16),255));
					ZQ(eQ,MQ+2,PQ(YQ(IQ,8),255));
					ZQ(eQ,MQ+3,PQ(IQ,255));
				end;
				local eQ={137,80,78,71,13,10,26,10};
				local function MQ(IQ,iQ,kQ)
					local BQ=IQ*4+1;
					local dQ=BQ*iQ;
					local bQ=vQ(dQ);
					for pQ=0,iQ-1,1 do 
						local DQ=pQ*BQ;
						ZQ(bQ,DQ,0);
						for BQ=0,IQ-1,1 do 
							local VQ,WQ,HQ,wQ=kQ(BQ,pQ);
							local pQ=DQ+1+BQ*4;
							ZQ(bQ,pQ,VQ);
							ZQ(bQ,pQ+1,WQ);
							ZQ(bQ,pQ+2,HQ);
							ZQ(bQ,pQ+3,wQ);
						end;
					end;
					local BQ=math.ceil(dQ/65535);
					kQ=2+dQ+BQ*5+4;
					local pQ=vQ(45+kQ+12);
					for vQ=1,8,1 do 
						ZQ(pQ,vQ-1,eQ[vQ]);
					end;
					local vQ=8;
					local function eQ(DQ,VQ,WQ)
						JQ(pQ,vQ,VQ);
						for HQ=1,4,1 do 
							ZQ(pQ,vQ+3+HQ,AQ(DQ,HQ));
						end;
						WQ(vQ+8);
						JQ(pQ,vQ+8+VQ,yQ(pQ,vQ+4,VQ+4));
						DQ=vQ;
						vQ=DQ+(12+VQ);
					end;
					eQ("IHDR",13,function(vQ)
						JQ(pQ,vQ,IQ);
						JQ(pQ,vQ+4,iQ);
						ZQ(pQ,vQ+8,8);
						ZQ(pQ,vQ+9,6);
						ZQ(pQ,vQ+10,0);
						ZQ(pQ,vQ+11,0);
						ZQ(pQ,vQ+12,0);
					end);
					eQ("IDAT",kQ,function(vQ)
						ZQ(pQ,vQ,120);
						ZQ(pQ,vQ+1,1);
						local AQ,yQ,IQ=vQ+2,1,0;
						for iQ=0,BQ-1,1 do 
							vQ=iQ*65535;
							local kQ=Y(65535,dQ-vQ);
							local dQ=TQ(kQ,65535);
							ZQ(pQ,AQ,iQ==BQ-1 and 1 or 0);
							ZQ(pQ,AQ+1,PQ(kQ,255));
							ZQ(pQ,AQ+2,YQ(kQ,8));
							ZQ(pQ,AQ+3,PQ(dQ,255));
							ZQ(pQ,AQ+4,YQ(dQ,8));
							oQ(pQ,AQ+5,bQ,vQ,kQ);
							for PQ=vQ,vQ+kQ-1,1 do 
								yQ=(yQ+LQ(bQ,PQ))%65521;
								IQ=(IQ+yQ)%65521;
							end;
							AQ=AQ+(5+kQ);
						end;
						JQ(pQ,AQ,IQ*65536+yQ);
					end);
					eQ("IEND",0,function()
					end);
					return XQ(pQ);
				end;
				local function PQ(TQ,YQ,vQ,ZQ,LQ)
					local oQ,XQ=v(TQ)-vQ+LQ,v(YQ)-ZQ+LQ;
					TQ,ZQ=T(oQ,0),T(XQ,0);
					return SQ(TQ*TQ+ZQ*ZQ)+Y(T(oQ,XQ),0)-LQ;
				end;
				local function TQ(YQ,vQ,ZQ,LQ,oQ,XQ,SQ)
					return{w=YQ,h=vQ,v=2,px=function(AQ,JQ)
						local yQ=PQ(AQ+0.5-YQ/2,JQ+0.5-vQ/2,ZQ,LQ,oQ);
						if yQ<=-1.25 then 
							return 0,0,0,0;
						elseif yQ>=XQ then 
							return 0,0,0,0;
						end;
						AQ,JQ=1-T(yQ,0)/XQ,yQ<0 and(yQ+1.25)/1.25 or 1;
						return 0,0,0,P(255*SQ*AQ*AQ*JQ+0.5);
					end};
				end;
				local YQ={};
				YQ.pshadow=TQ(63,61,17.5,16.5,16.5,14,0.42);
				YQ.bshadow=TQ(52,52,12,12,10,14,0.42);
				YQ.shadow={w=96,h=96,px=function(TQ,vQ)
					local ZQ=PQ(TQ+0.5-48,vQ+0.5-48,20,20,12);
					if ZQ<=0 then 
						return 0,0,0,0;
					end;
					return 0,0,0,P(127.5*QQ(-3.4*ZQ/28)+0.5);
				end};
				YQ.checker={w=2,h=2,px=function(PQ,TQ)
					local vQ=(PQ+TQ)%2==0 and 206 or 146;
					return vQ,vQ,vQ,255;
				end};
				local function PQ(TQ)
					for vQ,ZQ in next,YQ,nil do 
						local YQ=TQ.."/"..vQ.."_v"..(ZQ.v or 1)..".png";
						if not(cQ.has(YQ))then 
							local TQ,LQ=pcall(MQ,ZQ.w,ZQ.h,ZQ.px);
							if TQ then 
								cQ.write(YQ,LQ);
							end;
						end;
						jQ[vQ]=nQ(YQ);
					end;
				end;
				EQ=PQ;end;
			local function PQ(TQ,YQ)
					local vQ=Z("#%02x%02x%02x",P(TQ.R*255+0.5),P(TQ.G*255+0.5),P(TQ.B*255+0.5));
					return if YQ then vQ..Z("%02x",P(YQ*255+0.5))else vQ;
				end;
				local function TQ(YQ)
					if type(YQ)~="string"then 
						return nil;
					end;
					YQ=Q(YQ,"[^%x]","");
					local vQ=#YQ;
					if vQ~=6 then 
						if vQ~=8 then 
							return nil;
						end;
					end;
					return h(tonumber(L(YQ,1,2),16),tonumber(L(YQ,3,4),16),(tonumber(L(YQ,5,6),16))),vQ==8 and tonumber(L(YQ,7,8),16)/255 or 1;
				end;
				local YQ,vQ;
				do 
				local function ZQ(LQ)
					return(Q(Q(Q(tostring(LQ),"&","&amp;"),"<","&lt;"),">","&gt;"));
				end;
				local function LQ(oQ,XQ)
					return(Q(ZQ(oQ),"{(.-)}",function(ZQ)
						return Z("<font color=\"%s\">%s</font>",PQ(XQ),ZQ);
					end));
				end;
				local ZQ={Insert="INS",Delete="DEL",Home="HOME",End="END",PageUp="PGUP",PageDown="PGDN",LeftShift="LSHIFT",RightShift="RSHIFT",LeftControl="LCTRL",RightControl="RCTRL",LeftAlt="LALT",RightAlt="RALT",LeftSuper="LWIN",RightSuper="RWIN",CapsLock="CAPS",Backspace="BKSP",Return="ENTER",Space="SPACE",Tab="TAB",Escape="ESC",MouseButton1="M1",MouseButton2="M2",MouseButton3="M3",Zero="0",One="1",Two="2",Three="3",Four="4",Five="5",Six="6",Seven="7",Eight="8",Nine="9",Backquote="`",Minus="-",Equals="=",LeftBracket="[",RightBracket="]",BackSlash="\\",Semicolon=";",Quote="'",Comma=",",Period=".",Slash="/",Up="UP",Down="DOWN",Left="LEFT",Right="RIGHT"};
				local function oQ(XQ)
					if not(XQ)then 
						return nil;
					end;
					local QQ=ZQ[XQ];
					if QQ then 
						return QQ;
					end;
					QQ=S(XQ,"^Keypad(.+)$");
					if QQ then 
						return"NUM"..(ZQ[QQ]or o(QQ));
					end;
					return o(XQ);
				end;
				YQ,vQ=LQ,oQ;end;
			local function o(ZQ)
					if ZQ.KeyCode~=tQ then 
						return ZQ.KeyCode.Name;
					end;
					local tQ=ZQ.UserInputType;
					if tQ==KQ then 
						return tQ.Name;
					elseif tQ==RQ then 
						return tQ.Name;
					elseif tQ==_Q then 
						return tQ.Name;
					end;
					return nil;
				end;
				local tQ={};
				tQ.win=h(12,12,14);
				tQ.bg=h(7,7,9);
				tQ.pop=h(19,19,23);
				tQ.hud=h(12,12,15);
				tQ.txt=h(230,230,236);
				tQ.sub=h(170,170,178);
				tQ.dim=h(112,112,122);
				tQ.faint=h(68,68,76);
				tQ.knob=h(146,146,154);
				tQ.acc=h(200,148,232);
				tQ.ink=h(22,14,28);
				tQ.ok=h(128,214,156);
				tQ.bad=h(255,112,118);
				tQ.warn=h(255,198,96);
				local ZQ,LQ,oQ={card=0.958,edge=0.935,sep=0.955,hov=0.972,ctl=0.952,ctle=0.925,ctlh=0.932,trk=0.885,line=0.94,tab=0.925,sel=0.952,phov=0.962,psel=0.945,pfil=0.955};
				do 
				local XQ=Enum.FontWeight;
				LQ={};
				LQ.r=Font.new("rbxasset://fonts/families/BuilderSans.json",XQ.Regular);
				LQ.m=Font.new("rbxasset://fonts/families/BuilderSans.json",XQ.Medium);
				LQ.s=Font.new("rbxasset://fonts/families/BuilderSans.json",XQ.SemiBold);
				LQ.b=Font.new("rbxasset://fonts/families/BuilderSans.json",XQ.Bold);
				LQ.h=Font.new("rbxasset://fonts/families/Montserrat.json",XQ.Bold);
				local QQ,SQ={geist={"geist/v5/gyBhhwUxId8gMGYQMKR3pzfaWI_RnOM4nQ.ttf","geist/v5/gyBhhwUxId8gMGYQMKR3pzfaWI_RruM4nQ.ttf","geist/v5/gyBhhwUxId8gMGYQMKR3pzfaWI_RQuQ4nQ.ttf","geist/v5/gyBhhwUxId8gMGYQMKR3pzfaWI_Re-Q4nQ.ttf"},onest={"onest/v11/gNMZW3F-SZuj7zOT0IfSjTS16cPh9R-Zsg.ttf","onest/v11/gNMZW3F-SZuj7zOT0IfSjTS16cPhxx-Zsg.ttf","onest/v11/gNMZW3F-SZuj7zOT0IfSjTS16cPhKxiZsg.ttf","onest/v11/gNMZW3F-SZuj7zOT0IfSjTS16cPhEhiZsg.ttf"},inter={"inter/v20/UcCO3FwrK3iLTeHuS_nVMrMxCp50SjIw2boKoduKmMEVuLyfMZg.ttf","inter/v20/UcCO3FwrK3iLTeHuS_nVMrMxCp50SjIw2boKoduKmMEVuI6fMZg.ttf","inter/v20/UcCO3FwrK3iLTeHuS_nVMrMxCp50SjIw2boKoduKmMEVuGKYMZg.ttf","inter/v20/UcCO3FwrK3iLTeHuS_nVMrMxCp50SjIw2boKoduKmMEVuFuYMZg.ttf"}},{{400,"Regular"},{500,"Medium"},{600,"SemiBold"},{700,"Bold"}};
				local function AQ(JQ,yQ)
					yQ=QQ[yQ]and yQ or"geist";
					local eQ,MQ=QQ[yQ],table.create(4);
					for QQ=1,4,1 do 
						local IQ=SQ[QQ];
						local SQ=OQ(JQ.."/"..yQ.."-"..IQ[1]..".ttf","https://fonts.gstatic.com/s/"..eQ[QQ],20000);
						if not(SQ)then 
							return false;
						end;
						MQ[QQ]={name=IQ[2],weight=IQ[1],style="normal",assetId=SQ};
					end;
					local QQ,SQ=JQ.."/"..yQ..".json",aQ({name=yQ,faces=MQ});
					if SQ then 
						if not(cQ.write(QQ,SQ))then 
							return false;
						end;
					else 
						return false;
					end;
					SQ=nQ(QQ);
					if not SQ then 
						return false;
					end;
					LQ.r,LQ.m,LQ.s,LQ.b=Font.new(SQ,XQ.Regular),Font.new(SQ,XQ.Medium),Font.new(SQ,XQ.SemiBold),Font.new(SQ,XQ.Bold);
					return true;
				end;
				oQ=AQ;end;
			local nQ={logo=106124864132557,code=106124864132557,aim=80648116191645,crosshair=83752373575368,target=121091323240554,dot=122878673716704,trigger=81854854241463,zap=109718589733073,eye=127234874352422,view=127234874352422,players=119713822992150,users=85332511060401,user=114567720540659,chams=132705178126217,world=75025349205767,globe=125685532120024,move=80792036653047,misc=133109875194066,skins=127369887384101,spray=97652569554326,bug=75649814233484,map=131325044235094,configs=97828544806816,folder=77937190465422,settings=106205298246017,cog=123222732420633,sliders=125396339381135,gear=109485777305919,save=122894934359450,chevron=71457658246709,right=101007429951147,dots=95127553964880,check=86817768619372,x=116396312853810,keyboard=121978468376124,plus=101123124881873,pencil=113132794872298,trash=126010725826757,refresh=106497040962250,load=109698732019071,copy=116378866141355,import=87776530532335,clock=136533241128438,wifi=104941258142372,layers=114499998778667,grip=128492050787735,bomb=85112456002145,shield=106509993556171,sparkles=105634041692696,sun=139232691165198,bell=84691420588185,gamepad=99293705721130,flag=121835250831612,feather=103991922506350,ram=82464660673318,cpu=105237370909681,skull=101060850237115,camera=114084146151777,volume=129861259578431,message=86432989388834,power=89331085993646};
				local function XQ(QQ)
					if QQ==nil then 
						return"";
					end;
					local SQ=nQ[QQ];
					if SQ then 
						return"rbxassetid://"..SQ;
					end;
					if type(QQ)=="number"then 
						return"rbxassetid://"..QQ;
					end;
					return tostring(QQ);
				end;
				local QQ;
				do 
				local SQ={Frame={BorderSizePixel=0,BackgroundTransparency=1},CanvasGroup={BorderSizePixel=0,BackgroundTransparency=1}};
				SQ.ScrollingFrame={BorderSizePixel=0,BackgroundTransparency=1,ScrollBarThickness=0,ScrollBarImageColor3=sQ,ScrollBarImageTransparency=1,CanvasSize=f(0,0,0,0),AutomaticCanvasSize=D,ScrollingDirection=Enum.ScrollingDirection.Y,ElasticBehavior=Enum.ElasticBehavior.Never};
				SQ.TextLabel={BorderSizePixel=0,BackgroundTransparency=1,TextXAlignment=b.Left,TextSize=14,Text="",AutoLocalize=false};
				SQ.TextButton={BorderSizePixel=0,BackgroundTransparency=1,AutoButtonColor=false,Text="",TextSize=14,AutoLocalize=false};
				SQ.TextBox={BorderSizePixel=0,BackgroundTransparency=1,ClearTextOnFocus=false,TextXAlignment=b.Left,TextSize=14,Text="",AutoLocalize=false};
				SQ.ImageLabel={BorderSizePixel=0,BackgroundTransparency=1,ScaleType=Enum.ScaleType.Fit};
				SQ.ImageButton={BorderSizePixel=0,BackgroundTransparency=1,AutoButtonColor=false,ScaleType=Enum.ScaleType.Fit};
				local AQ={TextLabel=true,TextButton=true,TextBox=true};
				local function JQ(yQ,eQ,MQ)
					local IQ,iQ=Instance.new(yQ),SQ[yQ];
					if iQ then 
						for SQ,kQ in next,iQ,nil do 
							IQ[SQ]=kQ;
						end;
					end;
					if AQ[yQ]then 
						IQ.FontFace=LQ.s;
						IQ.TextColor3=tQ.txt;
					end;
					iQ=nil;
					if eQ then 
						for SQ,AQ in next,eQ,nil do 
							if SQ=="Parent"then 
								iQ=AQ;
							else 
								IQ[SQ]=AQ;
							end;
						end;
					else 
					end;
					if MQ then 
						for SQ,AQ in next,MQ,nil do 
							IQ[SQ]=tQ[AQ];
							IQ:SetAttribute("t_"..SQ,AQ);
						end;
					end;
					if iQ then 
						IQ.Parent=iQ;
					end;
					return IQ;
				end;
				QQ=JQ;end;
			local function SQ(AQ,JQ)
					return QQ("UICorner",{CornerRadius=u(0,JQ or 6),Parent=AQ});
				end;
				local function AQ(JQ)
					return QQ("UICorner",{CornerRadius=u(1,0),Parent=JQ});
				end;
				local JQ,yQ;
				do 
				_,R=setmetatable,{__mode="k"};
				local eQ,MQ=_({},R),1;
				local function IQ(iQ,kQ,BQ)
					local dQ=QQ("UIStroke",{Color=BQ or sQ,Transparency=kQ or ZQ.edge,Thickness=MQ,ApplyStrokeMode=Enum.ApplyStrokeMode.Border,Parent=iQ});
					eQ[dQ]=true;
					return dQ;
				end;
				local function iQ(kQ,BQ)
					MQ=kQ<1 and 1/kQ or 1;
					for kQ in next,eQ,nil do 
						if kQ.Parent then 
							kQ.Thickness=BQ and kQ:IsDescendantOf(BQ)and MQ or 1;
						else 
							eQ[kQ]=nil;
						end;
					end;
				end;
				JQ,yQ=IQ,iQ;end;
			local function eQ(MQ,IQ,iQ,kQ,BQ)
					return QQ("UIPadding",{PaddingLeft=u(0,IQ or 0),PaddingRight=u(0,iQ or 0),PaddingTop=u(0,kQ or 0),PaddingBottom=u(0,BQ or 0),Parent=MQ});
				end;
				local function MQ(IQ,iQ,kQ)
					return QQ("UIListLayout",{SortOrder=Enum.SortOrder.LayoutOrder,Padding=u(0,iQ or 0),HorizontalAlignment=kQ or H.Left,Parent=IQ});
				end;
				local function IQ(iQ,kQ,BQ)
					return QQ("UIListLayout",{SortOrder=Enum.SortOrder.LayoutOrder,FillDirection=Enum.FillDirection.Horizontal,Padding=u(0,kQ or 0),HorizontalAlignment=BQ or H.Left,VerticalAlignment=w.Center,Parent=iQ});
				end;
				local w;
				do 
				local iQ={};
				local function kQ(BQ,dQ,bQ,pQ,DQ)
					bQ,pQ,DQ=bQ or 0.16,pQ or lQ,DQ or 0;
					local lQ=pQ.Name..bQ..":"..DQ;
					local VQ=iQ[lQ];
					if VQ then 
					else 
						VQ=TweenInfo.new(bQ,pQ,Enum.EasingDirection.Out,0,false,DQ);
						iQ[lQ]=VQ;
					end;
					lQ=q:Create(BQ,VQ,dQ);
					lQ:Play();
					return lQ;
				end;
				w=kQ;end;
			local function lQ(iQ,kQ)
					local BQ,dQ=iQ.AbsolutePosition,iQ.AbsoluteSize;
					return kQ.X>=BQ.X and kQ.Y>=BQ.Y and kQ.X<=BQ.X+dQ.X and kQ.Y<=BQ.Y+dQ.Y;
				end;
				local iQ,kQ={flags={},els={},fl={},profs={},dir="polar",thm=tQ,fnt=LQ,ico=nQ,ver="1.0.0"},{};
				kQ.md=xQ.new();
				kQ.pops={};
				kQ.bmap={};
				kQ.drag={};
				kQ.open=false;
				kQ.dead=false;
				kQ.live=false;
				kQ.fn=0;
				kQ.unl={};
				kQ.bgt=0.08;
				kQ.blur=true;
				_,R=setmetatable,{__mode="k"};
				kQ.hbg=_({},R);
				local function nQ()
					local BQ=kQ.us;
					return BQ and BQ.Scale or 1;
				end;
				local function BQ()
					local dQ=kQ.tp;
					if dQ then 
						return dQ;
					end;
					local dQ,bQ=z:GetMouseLocation(),kQ.probe;
					if bQ then 
						return dQ+bQ.AbsolutePosition;
					end;
					return dQ;
				end;
				local function dQ(bQ)
					local pQ=bQ.Position;
					return s(pQ.X,pQ.Y);
				end;
				local function bQ(pQ)
					return pQ==KQ or pQ==hQ;
				end;
				local pQ,DQ,VQ,WQ;
				local function HQ(wQ,Ui,Ki,Ri)
					local _i=kQ.drag;
					_i.mv=wQ;
					_i.up=Ui;
					_i.own=Ki;
					_i.ti=Ri and Ri.UserInputType==hQ and Ri or nil;
				end;
				local function wQ(Ui)
					local Ki=kQ.drag;
					local Ri=Ki.up;
					Ki.mv=nil;
					Ki.up=nil;
					Ki.own=nil;
					Ki.ti=nil;
					if Ri then 
						Ri(Ui);
					end;
				end;
				_,R=setmetatable,{__mode="k"};
				local Ui=_({},R);
				local Ki,Ri;
				do 
				local function _i(Ni,hi)
					local Fi=kQ.pops;
					local ti=Ni and J(Fi,Ni)or 0;
					for Ni=#Fi,ti+1,-1 do 
						if lQ(Fi[Ni].frame,hi)then 
							return true;
						end;
					end;
					return false;
				end;
				local function Ni(hi,Fi)
					local ti,fi=hi.o,hi.p;
					if ti.Parent==nil then 
						hi.i=false;
						Ui[hi]=nil;
					end;
					local li=hi.i and kQ.open and(fi==nil or fi.isopen==true)and lQ(ti,Fi)and not _i(fi,Fi);
					if li~=hi.s then 
						hi.s=li;
						if li then 
							hi.on();
						else 
							hi.off();
						end;
					end;
				end;
				local function _i()
					if next(Ui)==nil then 
						return;
					end;
					local hi=BQ();
					for Fi in next,Ui,nil do 
						Ni(Fi,hi);
					end;
				end;
				local function hi(Fi,ti,fi,li)
					local gi={o=Fi,p=ti,on=fi,off=li,i=false,s=false};
					GQ(Fi.MouseEnter,function()
						gi.i=true;
						Ui[gi]=true;
						Ni(gi,BQ());
					end);
					GQ(Fi.MouseLeave,function()
						gi.i=false;
						Ui[gi]=nil;
						Ni(gi,BQ());
					end);
					return gi;
				end;
				Ki,Ri=_i,hi;end;
			local function _i(Ni,hi,Fi,ti,fi,li)
					return Ri(Ni,hi,function()
						w(Ni,{[Fi]=fi},li or 0.12);
					end,function()
						w(Ni,{[Fi]=ti},li or 0.12);
					end);
				end;
				local function Ni(hi,Fi)
					GQ(hi.InputBegan,function(hi)
						if hi.UserInputType~=hQ then 
							return;
						end;
						local ti=hi.Position;
						B(0.5,function()
							if hi.UserInputState~=FQ then 
								if(hi.Position-ti).Magnitude<10 then 
									if not(kQ.dead)then 
										Fi(hi);
									end;
								end;
							end;
						end);
					end);
				end;
				local function FQ(hi)
					return QQ("TextButton",{Size=g(1,1),ZIndex=0,Parent=hi});
				end;
				local function hi(Fi,ti,fi)
					if not(jQ.shadow)then 
						return nil;
					end;
					local li=(ti or 12)/12;
					ti=P(28*li+0.5);
					return QQ("ImageLabel",{Image=jQ.shadow,ScaleType=Enum.ScaleType.Slice,SliceCenter=Rect.new(40,40,56,56),SliceScale=li,ImageTransparency=fi or 0,Position=l(-ti,-ti),Size=f(1,ti*2,1,ti*2),ZIndex=0,Parent=Fi});
				end;
				local function Fi()
					return kQ.live==true and kQ.open and kQ.ft==nil and not kQ.dead;
				end;
				_,R=setmetatable,{__mode="k"};
				local ti=_({},R);
				local fi;
				do 
				local li=Enum.EasingStyle.Cubic;
				local function gi(ui,si,Ci,zi,qi,ri)
					local xi,Gi=ti[ui];
					if xi then 
						Gi=xi;
					else 
						if qi and kQ.live and not kQ.dead or Fi()then 
							if not(ui.Parent)then 
								ui.Visible=si;
								if ri then 
									ri();
								end;
								return;
							end;
						else 
							ui.Visible=si;
							if ri then 
								ri();
							end;
							return;
						end;
						if not si and not ui.Visible then 
							if ri then 
								ri();
							end;
							return;
						end;
						local ai,mi=ui.AutomaticSize,ui.Size;
						local ci,ni,Oi,ji=ai==p or ai==V,ai==D or ai==V,qi and 20 or 0,ui.AnchorPoint;
						xi={};
						xi.p=ui.Parent;
						xi.pos=ui.Position;
						xi.ap=ji;
						xi.sz=mi;
						xi.n=0;
						xi.m=Oi;
						xi.d=l(Oi*(2*ji.X-1),Oi*(2*ji.Y-1));
						xi.g=QQ("CanvasGroup",{Position=xi.pos+xi.d,AnchorPoint=ji,Size=mi+l(Oi*2,Oi*2),AutomaticSize=ai,LayoutOrder=ui.LayoutOrder,ZIndex=ui.ZIndex,GroupTransparency=si and 1 or 0,Parent=xi.p});
						if Oi>0 then 
							eQ(xi.g,Oi,Oi,Oi,Oi);
						end;
						ti[ui]=xi;
						ui.Parent=xi.g;
						ui.AnchorPoint=s(0,0);
						ui.Position=l(0,0);
						ui.Size=f(ci and 0 or 1,ci and mi.X.Offset or 0,ni and 0 or 1,ni and mi.Y.Offset or 0);
						Gi=xi;
					end;
					Gi.n=Gi.n+1;
					local qi=Gi.n;
					if si then 
						ui.Visible=true;
					end;
					Gi.g.Interactable=si;
					local xi,ai,mi,ci,ni=Gi.g,{GroupTransparency=si and 0 or 1},Ci or 0.2,si and gQ or li,function(li)
						if li~=fQ then 
							return;
						elseif Gi.n~=qi then 
							return;
						elseif ti[ui]~=Gi then 
							return;
						end;
						ti[ui]=nil;
						if not(si)then 
							ui.Visible=false;
						end;
						pcall(function()
							ui.Parent=Gi.p;
							ui.Position,ui.AnchorPoint,ui.Size=Gi.pos,Gi.ap,Gi.sz;
						end);
						Gi.g:Destroy();
						if ri then 
							ri();
						end;
					end;
					w(xi,ai,mi,ci,si and zi or nil).Completed:Once(ni);
				end;
				fi=gi;end;
			local function li(gi)
					local ui=ti[gi];
					if ui then 
						ti[gi]=nil;
						ui.g:Destroy();
					end;
					gi:Destroy();
				end;
				local function gi(ui)
					local si=ti[ui];
					return si and si.pos or ui.Position;
				end;
				local function ui(si,Ci)
					local zi=ti[si];
					if zi then 
						zi.pos=Ci;
						zi.g.Position=Ci+zi.d;
					else 
						si.Position=Ci;
					end;
				end;
				local function si(Ci,zi)
					local qi=ti[Ci];
					if qi then 
						qi.sz=zi;
						qi.g.Size=zi+l(qi.m*2,qi.m*2);
					else 
						Ci.Size=zi;
					end;
				end;
				R,_=setmetatable,{__mode="k"};
				local Ci=R({},_);
				local function zi(qi,ri,xi)
					if Ci[qi]==ri then 
						return;
					end;
					Ci[qi]=ri;
					fi(qi,ri,xi or 0.2,nil,true);
				end;
				local qi,ri;
				do 
				local xi={};
				xi.__index=xi;
				local function Gi(ai,mi,ci)
					local ni=kQ.mt;
					if if ni then not ni.Parent else not ni then 
						ni=QQ("TextLabel",{Size=l(0,0),TextTransparency=1,Parent=kQ.gui});
						kQ.mt=ni;
					else 
					end;
					ni.FontFace=mi or LQ.s;
					ni.TextSize=ci or 13;
					ni.Text=X(tostring(ai or""));
					return ni.TextBounds.X;
				end;
				_,R=setmetatable,{__mode="k"};
				local ai=_({},R);
				local function R(_)
					GQ(_.DescendantAdded,function(_)
						if ai[_]then 
							return;
						end;
						local mi=_:IsA("TextBox")and"PlaceholderText"or(_:IsA("TextLabel")or _:IsA("TextButton"))and"Text";
						if not mi then 
							return;
						end;
						ai[_]=true;
						local function ai()
							local ci=_[mi];
							local ni=X(ci);
							if ci~=ni then 
								_[mi]=ni;
							end;
						end;
						ai();
						GQ(_:GetPropertyChangedSignal(mi),ai);
					end);
				end;
				local function _(ai)
					local mi=setmetatable({w=ai.w or 180,aw=ai.w==nil and not ai.raw,keep=ai.keep,par=ai.par,anchor=ai.anchor,md=xQ.new(),isopen=false,px=0,py=0,an=0},xi);
					mi.box=QQ("Frame",{Size=l(mi.w,0),Visible=false,Parent=kQ.pl});
					local xQ,ci=ai.rad or 10,QQ("Frame",{Size=g(1,1),BackgroundTransparency=0,Parent=mi.box},{BackgroundColor3="pop"});
					mi.frame=ci;
					SQ(ci,xQ);
					QQ("UIGradient",{Rotation=90,Color=c(sQ,t(0.84,0.84,0.86)),Parent=ci});
					QQ("UIGradient",{Rotation=90,Transparency=O(0.1,0.75),Parent=JQ(ci,0.88)});
					hi(ci,xQ,0);
					FQ(ci);
					local t=QQ("Frame",{Size=f(1,0,0,46),BackgroundColor3=sQ,BackgroundTransparency=0,ZIndex=1,Parent=ci});
					SQ(t,xQ);
					QQ("UIGradient",{Rotation=90,Transparency=O({j(0,0.962),j(0.7,0.99),j(1,1)}),Parent=t});
					t=QQ("Frame",{Size=f(1,0,0,0),AutomaticSize=D,ZIndex=2,Parent=ci});
					mi.body=t;
					GQ(t:GetPropertyChangedSignal("AbsoluteSize"),function()
						mi:fit();
					end);
					if not(ai.raw)then 
						eQ(t,6,6,ai.title and 0 or 6,6);
						MQ(t,6);
						if ai.title then 
							mi:head(ai.title);
						end;
						mi.c=VQ(t,ai.tab,mi);
						mi.c.tmp=ai.tmp;
					end;
					return mi;
				end;
				xi.head=function(t,xQ)
					local ai=QQ("Frame",{Size=f(1,0,0,38),LayoutOrder=-1,Parent=t.body});
					t.ttl=X(tostring(xQ or""));
					QQ("TextLabel",{Position=l(12,1),Size=f(1,-48,1,0),Text=t.ttl,FontFace=LQ.h,TextSize=14,TextTruncate=UQ,Parent=ai},{TextColor3="txt"});
					xQ=QQ("Frame",{AnchorPoint=s(1,0.5),Position=f(1,-2,0.5,1),Size=l(0,24),AutomaticSize=p,Parent=ai});
					IQ(xQ,2,H.Right);
					t.hd=ai;
					t.hr=xQ;
					return ai;
				end;
				xi.fitw=function(t)
					local xQ=nQ();
					local ai,mi=if t.ttl then T(172,12+Gi(t.ttl,LQ.h,14)+16+t.hr.AbsoluteSize.X/xQ+14)else 172,t.rws;
					if mi then 
						for ci=#mi,1,-1 do 
							local ni=mi[ci];
							if ni.r.Parent then 
								ai=if ni.r.Visible then T(ai,ni.x+(ni.n and Gi(X(ni.n))+8 or 0)+ni.af.AbsoluteSize.X/xQ+26)else ai;
							else 
								y(mi,ci);
							end;
						end;
					else 
					end;
					t.w=P(Y(ai,340)+0.5);
				end;
				xi.hbtn=function(t,xQ,Gi,ai)
					local mi=QQ("ImageButton",{Size=l(24,24),BackgroundColor3=sQ,BackgroundTransparency=1,Parent=t.hr});
					SQ(mi,7);
					local ci=QQ("ImageLabel",{AnchorPoint=s(0.5,0.5),Position=g(0.5,0.5),Size=l(13,13),Image=XQ(xQ),Parent=mi},{ImageColor3="dim"});
					Ri(mi,t,function()
						w(mi,{BackgroundTransparency=ZQ.pfil},0.12,gQ);
						w(ci,{ImageColor3=tQ[Gi or"txt"]},0.12,gQ);
					end,function()
						w(mi,{BackgroundTransparency=1},0.12,gQ);
						w(ci,{ImageColor3=tQ.dim},0.12,gQ);
					end);
					GQ(mi.MouseButton1Click,ai);
					return mi,ci;
				end;
				xi.fit=function(t)
					local xQ=t.body.AbsoluteSize.Y/nQ();
					t.box.Size=l(t.w,P(xQ+0.5));
				end;
				xi.clampit=function(t)
					local xQ=t.box;
					if xQ.Parent then 
						if not(kQ.pl)then 
							return;
						end;
					else 
						return;
					end;
					local Gi,ai,mi,ci,ni=nQ(),kQ.pl.AbsolutePosition,kQ.probe.AbsolutePosition,kQ.gui.AbsoluteSize,t.frame.AbsoluteSize;
					local Oi,ji=E(ai.X+t.px*Gi,mi.X+6,T(mi.X+6,mi.X+ci.X-ni.X-6)),E(ai.Y+t.py*Gi,mi.Y+6,T(mi.Y+6,mi.Y+ci.Y-ni.Y-6));
					xQ.Position=l(P((Oi-ai.X)/Gi+0.5),P((ji-ai.Y)/Gi+0.5));
				end;
				xi.place=function(t,xQ,Gi)
					local ai,mi=nQ(),kQ.pl.AbsolutePosition;
					t.px,t.py=(xQ-mi.X)/ai,(Gi-mi.Y)/ai;
					t.box.Position=l(t.px,t.py);
					t:clampit();
					xQ,ai,mi=t.md,t.frame,function()
						t:clampit();
					end;
					xQ:add(ai:GetPropertyChangedSignal("AbsoluteSize"):Connect(mi));
				end;
				local function t(xQ)
					local Gi=xQ.cg;
					if Gi then 
						xQ.cg=nil;
						if xQ.frame.Parent==Gi then 
							xQ.frame.Parent=xQ.box;
						end;
						Gi:Destroy();
					end;
				end;
				xi.settle=function(xQ)
					xQ.an=xQ.an+1;
					t(xQ);
				end;
				xi.anim=function(xQ,Gi,ai)
					xQ.an=xQ.an+1;
					local mi=xQ.an;
					local ci=xQ.cg;
					if ci then 
					else 
						ci=QQ("CanvasGroup",{Position=l(-24,-24),Size=f(1,48,1,48),GroupTransparency=Gi and 1 or 0,Parent=xQ.box});
						eQ(ci,24,24,24,24);
						xQ.cg=ci;
						xQ.frame.Parent=ci;
					end;
					ci.Interactable=Gi;
					local ni,Oi,ji={GroupTransparency=Gi and 0 or 1},Gi and 0.2 or 0.18,Gi and gQ;
					local Gi,Ei=w(ci,ni,Oi,ji or uQ),function(uQ)
						if uQ~=fQ then 
							return;
						elseif xQ.an~=mi then 
							return;
						end;
						t(xQ);
						if ai then 
							ai();
						end;
					end;
					Gi.Completed:Once(Ei);
				end;
				xi.hide=function(t,uQ)
					if not(t.isopen)then 
						return;
					end;
					t.isopen=false;
					t.md:clean();
					if kQ.drag.own==t then 
						wQ();
					end;
					local xQ=kQ.listen;
					if xQ then 
						if xQ.c then 
							if xQ.c.pop==t then 
								kQ.listen=nil;
								xQ.lst=false;
								xQ:draw();
							end;
						end;
					end;
					xQ=t.onclose;
					if xQ then 
						t.onclose=nil;
						xQ();
					end;
					local xQ,xi=t.box;
					if t.keep then 
						xi=function()
							xQ.Visible=false;
						end;
					else 
						t.dead=true;
						xi=function()
							xQ:Destroy();
						end;
					end;
					if uQ or not Fi()then 
						t:settle();
						xi();
					else 
						t:anim(false,xi);
					end;
				end;
				qi,ri=R,_;end;
			local function R(_,t)
					local uQ=kQ.pops;
					local xQ=#uQ;
					for xi=xQ,T(_,1),-1 do 
						local Gi=uQ[xi];
						uQ[xi]=nil;
						Gi:hide(t);
					end;
					if xQ>=T(_,1)then 
						Ki();
					end;
				end;
				local function _(t)
					R(1,t);
				end;
				local function t(uQ)
					local xQ=J(kQ.pops,uQ);
					if xQ then 
						R(xQ);
					end;
				end;
				local function uQ(xQ,xi,Gi)
					local ai=kQ.pops;
					R((xQ.par and J(ai,xQ.par)or 0)+1);
					ai[#ai+1]=xQ;
					xQ.isopen=true;
					xQ.box.ZIndex=10+#ai;
					xQ.box.Visible=true;
					if xQ.aw then 
						xQ:fitw();
					end;
					xQ:fit();
					xQ:place(xi,Gi);
					if Fi()then 
						xQ:anim(true);
					else 
						xQ:settle();
					end;
					Ki();
				end;
				local function xQ(Fi)
					local xi=kQ.pops;
					for Gi=#xi,1,-1 do 
						local ai=xi[Gi];
						if lQ(ai.frame,Fi)then 
							R(Gi+1);
							return;
						elseif ai.anchor then 
							if ai.anchor.Parent then 
								if lQ(ai.anchor,Fi)then 
									R(Gi+1);
									return;
								end;
							end;
						end;
					end;
					_();
				end;
				local function Fi(xi,Gi)
					local ai=kQ.bmap[Gi];
					if ai then 
					else 
						ai={};
						kQ.bmap[Gi]=ai;
					end;
					if not(J(ai,xi))then 
						ai[#ai+1]=xi;
					end;
				end;
				local function xi(Gi,ai)
					local mi=kQ.bmap[ai];
					if not(mi)then 
						return;
					end;
					local ci=J(mi,Gi);
					if ci then 
						y(mi,ci);
					end;
					if#mi==0 then 
						kQ.bmap[ai]=nil;
					end;
				end;
				local Gi={MouseButton1=true,MouseButton2=true,MouseButton3=true};
				local function ai(mi)
					if mi then 
						if kQ.open then 
							if not(kQ.root)then 
								return false;
							end;
						else 
							return false;
						end;
					else 
						return false;
					end;
					if lQ(kQ.root,mi)then 
						return true;
					end;
					local ci=kQ.pops;
					for ni=1,#ci,1 do 
						if lQ(ci[ni].frame,mi)then 
							return true;
						end;
					end;
					return false;
				end;
				local function lQ(mi)
					if kQ.dead then 
						return;
					end;
					local ci,ni=mi.UserInputType;
					if ci==hQ then 
						ni=dQ(mi);
						kQ.tp=ni;
					else 
						if ci==KQ or ci==RQ or ci==_Q then 
							kQ.tp=nil;
							ni=(BQ());
						else 
						end;
					end;
					local RQ=kQ.listen;
					if RQ then 
						local Oi=o(mi);
						if Oi then 
							kQ.listen=nil;
							RQ.lst=false;
							if Oi=="Escape"then 
								RQ:setkey(nil);
							elseif Oi=="Backspace"then 
								RQ:setkey(nil);
							elseif Gi[Oi]and RQ.o.nomouse or Oi=="MouseButton1"and ai(ni)then 
								RQ:draw();
							else 
								if Gi[Oi]then 
									kQ.eat=RQ;
									B(0.35,function()
										if kQ.eat==RQ then 
											kQ.eat=nil;
										end;
									end);
								end;
								RQ:setkey(Oi);
							end;
							return;
						end;
					end;
					if ni then 
						if ci~=_Q then 
							if#kQ.pops>0 then 
								xQ(ni);
							end;
						end;
					end;
					if ci==hQ then 
						return;
					end;
					ci=o(mi);
					if ci then 
						if z:GetFocusedTextBox()then 
							return;
						elseif ai(ni)then 
							return;
						end;
					else 
						return;
					end;
					if ci=="Escape"then 
						if kQ.open then 
							if#kQ.pops>0 then 
								t(kQ.pops[#kQ.pops]);
								return;
							end;
						end;
					end;
					mi=kQ.bmap[ci];
					if mi then 
						for RQ=#mi,1,-1 do 
							ci=mi[RQ];
							if ci then 
								ci:bdown();
							end;
						end;
					end;
				end;
				local function RQ(_Q)
					if kQ.dead then 
						return;
					end;
					local xQ,ai=_Q.UserInputType,kQ.drag;
					if xQ==hQ then 
						local mi=kQ.tg;
						if mi then 
							if mi.i==_Q then 
								kQ.tg=nil;
								mi.tap(dQ(_Q));
							end;
						end;
					end;
					if ai.mv then 
						if xQ==KQ and not ai.ti then 
							wQ(true);
						elseif xQ==hQ then 
							if ai.ti==_Q then 
								wQ(true);
							end;
						end;
					end;
					ai=o(_Q);
					if not ai then 
						return;
					end;
					_Q=kQ.bmap[ai];
					if _Q then 
						for o=#_Q,1,-1 do 
							ai=_Q[o];
							if ai then 
								ai:bup();
							end;
						end;
					end;
				end;
				local function o(_Q)
					if kQ.dead then 
						return;
					end;
					local xQ,ai=_Q.UserInputType,kQ.drag;
					if xQ==NQ then 
						kQ.tp=nil;
						if ai.mv then 
							if not(ai.ti)then 
								ai.mv(BQ());
							end;
						end;
						Ki();
					elseif xQ==hQ then 
						local NQ=dQ(_Q);
						kQ.tp=NQ;
						local xQ=kQ.tg;
						if xQ then 
							if xQ.i==_Q then 
								local mi,ci=v(NQ.X-xQ.p0.X),v(NQ.Y-xQ.p0.Y);
								if mi>6 then 
									if mi>=ci then 
										kQ.tg=nil;
										xQ.drag(NQ);
									elseif ci>6 then 
										kQ.tg=nil;
									end;
								elseif ci>6 then 
									kQ.tg=nil;
								end;
							end;
						end;
						if ai.mv then 
							if ai.ti==_Q then 
								ai.mv(NQ);
							end;
						end;
					end;
				end;
				local function v()
					for _Q,NQ in next,kQ.bmap,nil do 
						for xQ=#NQ,1,-1 do 
							_Q=NQ[xQ];
							if _Q then 
								_Q:bup();
							end;
						end;
					end;
				end;
				local function _Q(NQ)
					local xQ=NQ and J(kQ.pops,NQ);
					R(xQ and xQ+1 or 1);
				end;
				do 
				local R={};
				R.__index=R;
				local NQ,xQ,ai=0,setmetatable,{__mode="k"};
				local mi=xQ({},ai);
				local function xQ(ai,ci,ni,Oi)
					NQ+=1;
					local ji,Ei=setmetatable,{id=NQ,kind=Oi,c=ci,o=ni,name=ni.name or ni.text or"",flag=ni.flag,cb=ni.cb or ni.callback,dis=false,an=0,tmp=ni.tmp or ci and ci.tmp or false};
					return ji(Ei,ai);
				end;
				local function NQ(ai)
					local ci=ai.h==true or(ai.o or 0)>0;
					if ai.l==ci then 
						return;
					end;
					ai.l=ci;
					local ni,Oi,ji=ai.hl,{},ci and(ai.b.soft and ZQ.phov or ZQ.hov);
					Oi.BackgroundTransparency=ji or 1;
					w(ni,Oi,0.12,gQ);
				end;
				local function ai(ci,ni)
					local Oi=ci and mi[ci];
					if Oi then 
						if not(Oi.hl)then 
							return;
						end;
					else 
						return;
					end;
					Oi.o=T(0,(Oi.o or 0)+(ni and 1 or-1));
					NQ(Oi);
				end;
				local ci={};
				ci.__index=ci;
				local function ni(Oi,ji,Ei,Pi)
					local Ti=QQ("Frame",{Size=f(1,0,0,0),AutomaticSize=D,BackgroundColor3=sQ,BackgroundTransparency=Ei and ZQ.card or 1,LayoutOrder=ji,Parent=Oi});
					if Ei then 
						SQ(Ti,7);
						JQ(Ti,ZQ.edge);
					end;
					MQ(Ti,0);
					return setmetatable({f=Ti,rows={},n=0,rad=Ei and 7 or 0,pop=Pi,soft=not Ei},ci);
				end;
				ci.fix=function(Oi)
					local ji,Ei,Pi=Oi.rows;
					for Ti=1,#ji,1 do 
						local Yi=ji[Ti];
						if Yi.r.Visible then 
							Ei,Pi=Ei or Yi,Yi;
						else 
						end;
					end;
					local Ti=Oi.rad;
					for Yi=1,#ji,1 do 
						local vi=ji[Yi];
						if vi.sp then 
							vi.sp.Visible=vi~=Ei;
						end;
						Yi=vi.hc and vi.hl;
						if Yi then 
							local ji,Zi=Ti>0 and vi==Ei,Ti>0 and vi==Pi;
							vi.hc.CornerRadius=u(0,(ji or Zi)and Ti or 0);
							if ji and not Zi then 
								Yi.Position,Yi.Size=l(0,0),f(1,0,1,Ti);
							elseif Zi and not ji then 
								Yi.Position,Yi.Size=l(0,-Ti),f(1,0,1,Ti);
							else 
								Yi.Position,Yi.Size=l(0,0),g(1,1);
							end;
						end;
					end;
					Oi.f.Visible=Ei~=nil;
				end;
				ci.add=function(Oi,ji,Ei)
					Oi.n=Oi.n+1;
					local Pi=QQ("Frame",{Size=f(1,0,0,ji),LayoutOrder=Oi.n,Parent=Oi.f});
					local Ti={r=Pi,b=Oi};
					if not(Oi.soft)then 
						Ti.sp=QQ("Frame",{Size=f(1,0,0,1),BackgroundColor3=sQ,BackgroundTransparency=ZQ.sep,ZIndex=3,Parent=Pi});
					end;
					if if Ei then not Ei else Oi.soft then 
						Ti.hl=QQ("Frame",{Size=g(1,1),BackgroundColor3=sQ,BackgroundTransparency=1,ZIndex=0,Parent=Pi});
						SQ(Ti.hl,7);
						Ri(Pi,Oi.pop,function()
							Ti.h=true;
							NQ(Ti);
						end,function()
							Ti.h=false;
							NQ(Ti);
						end);
					elseif Ei then 
					else 
						ji=QQ("Frame",{Size=g(1,1),ClipsDescendants=true,ZIndex=0,Parent=Pi});
						Ti.hl=QQ("Frame",{Size=g(1,1),BackgroundColor3=sQ,BackgroundTransparency=1,ZIndex=0,Parent=ji});
						Ti.hc=SQ(Ti.hl,0);
						Ri(Pi,Oi.pop,function()
							Ti.h=true;
							NQ(Ti);
						end,function()
							Ti.h=false;
							NQ(Ti);
						end);
					end;
					mi[Pi]=Ti;
					ji=Oi.rows;
					ji[#ji+1]=Ti;
					Oi:fix();
					return Pi,Ti;
				end;
				ci.del=function(NQ,Oi)
					local ji=mi[Oi];
					if not(ji)then 
						return;
					end;
					mi[Oi]=nil;
					local Ei=NQ.rows;
					local Pi=J(Ei,ji);
					if Pi then 
						y(Ei,Pi);
					end;
					Oi:Destroy();
					NQ:fix();
				end;
				ci.clear=function(NQ)
					local ci=NQ.rows;
					for Oi=#ci,1,-1 do 
						local ji=ci[Oi];
						mi[ji.r]=nil;
						ji.r:Destroy();
						ci[Oi]=nil;
					end;
					NQ.n=0;
					NQ:fix();
				end;
				R.get=function(NQ)
					return NQ.val;
				end;
				R.eff=function(NQ)
					return NQ.val;
				end;
				R.ser=function(NQ)
					return NQ.val;
				end;
				R.unser=function(NQ,NQ)
					return NQ;
				end;
				R.load=function(NQ)
				end;
				R.draw=function(NQ)
				end;
				R.rw=function(NQ)
					return NQ.row or NQ.host and NQ.host.row;
				end;
				R.nexta=function(NQ)
					NQ.an=NQ.an+1;
					return NQ.an*2;
				end;
				R.hostof=function(NQ)
					if NQ.accf then 
						return NQ;
					end;
					return NQ.host;
				end;
				local function NQ(ci,Oi)
					local ji=ci.accs;
					if ji then 
					else 
						ji={};
						ci.accs=ji;
					end;
					ji[#ji+1]=Oi;
					Oi.host=ci;
					if Oi.name==""then 
						Oi.name=ci.name;
					end;
				end;
				R.kbdraw=function(ci)
					local Oi=ci.bnd;
					if not(Oi)then 
						return;
					end;
					local ji,Ei=Oi.key,ci.kt;
					if ji then 
						if Ei then 
						else 
							local Pi=ci:hostof();
							if not(Pi)then 
								return;
							end;
							local Ti=QQ("TextButton",{Size=l(0,18),AutomaticSize=p,TextSize=11,BackgroundColor3=sQ,BackgroundTransparency=ZQ.ctl,LayoutOrder=(ci.lo or 1000000)-1,Parent=Pi.accf},{TextColor3="dim"});
							SQ(Ti,4);
							JQ(Ti,ZQ.ctle);
							eQ(Ti,6,6,0,0);
							GQ(Ti.MouseButton1Click,function()
								DQ(ci);
							end);
							ci.kt=Ti;
							Ei=Ti;
						end;
					else 
					end;
					if Ei then 
						Ei.Visible=ji~=nil;
						if ji then 
							Ei.Text=vQ(ji);
							w(Ei,{TextColor3=Oi.act and tQ.acc or tQ.dim},0.12,gQ);
						end;
					end;
				end;
				R.bdown=function(ci)
					local Oi=ci.bnd;
					if Oi then 
						if ci.dis then 
							return;
						elseif ci.dead then 
							return;
						end;
					else 
						return;
					end;
					if Oi.mode=="hold"then 
						if not(Oi.act)then 
							Oi.act=true;
							ci:draw();
							ci:fire();
						end;
					elseif ci.kind=="tgl"then 
						ci:set(not ci.val);
					else 
						Oi.act=not Oi.act;
						ci:draw();
						ci:fire();
					end;
				end;
				R.bup=function(ci)
					local Oi=ci.bnd;
					if Oi then 
						if Oi.mode=="hold"then 
							if Oi.act then 
								Oi.act=false;
								ci:draw();
								ci:fire();
							end;
						end;
					end;
				end;
				R.onchange=function(ci,Oi)
					local ji=ci.ucb;
					if ji then 
					else 
						ji={};
						ci.ucb=ji;
					end;
					ji[#ji+1]=Oi;
					return ci;
				end;
				R.fire=function(ci,Oi)
					local ji=ci:eff();
					if ci.flag then 
						if not(ci.tmp)then 
							iQ.flags[ci.flag]=ji;
							if ci.a~=nil then 
								iQ.flags[ci.flag.."_a"]=ci.a;
							end;
						end;
					end;
					local Ei=ci.prof;
					if Ei then 
						if not(Ei.ld)then 
							Ei.dirty=true;
							if tostring(Ei.cur)==Ei.g then 
								Ei:spread(ci);
							end;
						end;
					end;
					if not(Oi)then 
						if ci.cb then 
							k(ci.cb,ji,ci.a);
						end;
						Ei=ci.ucb;
						if Ei then 
							for Oi=1,#Ei,1 do 
								k(Ei[Oi],ji,ci.a);
							end;
						end;
					end;
					Ei=ci.dnt;
					if Ei then 
						for Oi=1,#Ei,1 do 
							Ei[Oi]:chkdep();
						end;
					end;
					if ci.ind then 
						if not(ci.tmp)then 
							pQ();
						end;
					end;
				end;
				R.dep=function(ci,Oi,ji)
					local Ei=ci.deps;
					if Ei then 
					else 
						Ei={};
						ci.deps=Ei;
					end;
					Ei[#Ei+1]={src=Oi,want=ji};
					ji=Oi.dnt;
					if ji then 
					else 
						ji={};
						Oi.dnt=ji;
					end;
					if not(J(ji,ci))then 
						ji[#ji+1]=ci;
					end;
					ci:chkdep();
					return ci;
				end;
				R.chkdep=function(ci)
					local Oi,ji=true,ci.deps;
					if ji then 
						for Ei=1,#ji,1 do 
							local Pi=ji[Ei];
							local ji,Ti=Pi.src,Pi.want;
							Ei=ji:eff();
							Pi=if type(Ti)=="function"then Ti(Ei)else if Ti==nil then Ei==true else if type(Ei)=="table"then J(Ei,Ti)~=nil else Ei==Ti;
							if if Pi then ji.dis else not Pi then 
								Oi=false;
								break;
							end;
						end;
					else 
					end;
					ci:setdis(not Oi);
				end;
				R.setdis=function(ci,Oi)
					Oi=Oi==true;
					if ci.dis==Oi then 
						return ci;
					end;
					ci.dis=Oi;
					ci:draw();
					if ci.ind then 
						if not(ci.tmp)then 
							pQ();
						end;
					end;
					local ji=ci.accs;
					if ji then 
						for Ei=1,#ji,1 do 
							ji[Ei]:setdis(Oi);
						end;
					end;
					ji=ci.dnt;
					if ji then 
						for Oi=1,#ji,1 do 
							ji[Oi]:chkdep();
						end;
					end;
					return ci;
				end;
				R.vis=function(ci,Oi)
					local ji=ci.row;
					if ji then 
						ji.Visible=Oi~=false;
						local Oi=mi[ji];
						if Oi then 
							Oi.b:fix();
						end;
					end;
					return ci;
				end;
				R.setbind=function(ci,Oi,ji)
					local Ei=ci.bnd;
					if not(Ei)then 
						return ci;
					end;
					if Ei.key then 
						xi(ci,Ei.key);
					end;
					Ei.act=false;
					Ei.key=Oi;
					if ji then 
						Ei.mode=ji;
					end;
					if Oi then 
						Fi(ci,Oi);
					end;
					ci:kbdraw();
					ci:draw();
					ci:fire();
					return ci;
				end;
				local function ci(Oi)
					if Oi then 
						t(Oi);
						Oi.md:clean();
						Oi.box:Destroy();
					end;
				end;
				R.destroy=function(Oi)
					if Oi.dead then 
						return;
					end;
					Oi.dead=true;
					local ji=Oi.bnd;
					if ji then 
						if ji.key then 
							xi(Oi,ji.key);
						end;
					end;
					if Oi.kind=="kbd"then 
						if Oi.val then 
							xi(Oi,Oi.val);
						end;
					end;
					if kQ.listen==Oi then 
						kQ.listen=nil;
					end;
					ji=J(iQ.els,Oi);
					if ji then 
						y(iQ.els,ji);
					end;
					ji=Oi.prof;
					if ji then 
						local Ei=J(ji.els,Oi);
						if Ei then 
							y(ji.els,Ei);
						end;
					end;
					if Oi.flag then 
						if iQ.fl[Oi.flag]==Oi then 
							iQ.fl[Oi.flag]=nil;
							iQ.flags[Oi.flag]=nil;
						end;
					end;
					ji=Oi.accs;
					if ji then 
						for Ei=#ji,1,-1 do 
							ji[Ei]:destroy();
						end;
					end;
					ji=Oi.host;
					if ji then 
						if ji.accs then 
							local Ei=J(ji.accs,Oi);
							if Ei then 
								y(ji.accs,Ei);
							end;
						end;
					end;
					ci(Oi.lp);
					ci(Oi.pp);
					ci(Oi.sp);
					ji=Oi.row;
					if ji then 
						local ci=mi[ji];
						if ci then 
							ci.b:del(ji);
						elseif ji.Parent then 
							ji:Destroy();
						end;
					elseif Oi.ctl then 
						Oi.ctl:Destroy();
					end;
					if Oi.kt then 
						Oi.kt:Destroy();
					end;
					pQ();
				end;
				local function mi(ci)
					if ci.tmp then 
						return;
					end;
					local Oi=iQ.els;
					Oi[#Oi+1]=ci;
					Oi=ci:ser();
					ci.def=if type(Oi)=="table"then i(Oi)else Oi;
					if ci.flag then 
						iQ.fl[ci.flag]=ci;
						iQ.flags[ci.flag]=ci:eff();
						if ci.a~=nil then 
							iQ.flags[ci.flag.."_a"]=ci.a;
						end;
						Oi=ci.c and ci.c.tab;
						local ji=Oi and Oi.prof;
						if ji then 
							if not(ci.o.noprof)then 
								ci.prof=ji;
								ji.els[#ji.els+1]=ci;
							end;
						end;
					end;
					if ci.ind then 
						if ci.ind.on then 
							pQ();
						elseif ci.bnd then 
							if ci.bnd.key then 
								pQ();
							end;
						end;
					end;
				end;
				local ci={};
				ci.__index=ci;
				VQ=function(Oi,ji,Ei)
					return setmetatable({frame=Oi,tab=ji,pop=Ei,n=0},ci);
				end;
				ci.blk=function(Oi)
					local ji=Oi.cb;
					if ji then 
					else 
						Oi.n=Oi.n+1;
						ji=ni(Oi.frame,Oi.n,true,Oi.pop);
						Oi.cb=ji;
					end;
					return ji;
				end;
				ci.brk=function(ni)
					ni.cb=nil;
				end;
				ci.row=function(ni,Oi,ji)
					return ni:blk():add(Oi or 30,ji);
				end;
				ci.free=function(ni,Oi)
					ni.cb=nil;
					ni.n=ni.n+1;
					return QQ("Frame",{Size=f(1,0,0,Oi or 0),AutomaticSize=Oi and W or D,LayoutOrder=ni.n,Parent=ni.frame});
				end;
				ci.head=function(ni,Oi)
					local ji=ni:row(32,true);
					QQ("TextLabel",{Position=l(12,0),Size=f(1,-24,1,0),Text=tostring(Oi or""),FontFace=LQ.b,TextSize=13,TextTruncate=UQ,Parent=ji});
					return ji;
				end;
				ci.space=function(ni,Oi)
					return ni:free(Oi or 6);
				end;
				ci.div=function(ni)
					local Oi=ni:free(1);
					QQ("Frame",{Position=l(6,0),Size=f(1,-12,0,1),BackgroundColor3=sQ,BackgroundTransparency=0.955,Parent=Oi});
					return Oi;
				end;
				local function ni(Oi,ji)
					local Ei=ji.pop;
					local Pi=ji:row(Ei and 28 or 30);
					local Ti,Yi=QQ("TextButton",{Size=g(1,1),ZIndex=1,Parent=Pi}),QQ("Frame",{AnchorPoint=s(1,0.5),Position=f(1,-10,0.5,0),Size=l(0,22),AutomaticSize=p,ZIndex=2,Parent=Pi});
					IQ(Yi,8,H.Right);
					local vi,Zi,Li,oi=12;
					if Oi.o.icon then 
						Zi,vi=QQ("ImageLabel",{AnchorPoint=s(0,0.5),Position=f(0,12,0.5,0),Size=l(13,13),Image=XQ(Oi.o.icon),ZIndex=2,Parent=Pi},{ImageColor3="txt"}),32;
						Li,oi=vi,Zi;
					else 
						Li,oi=vi,Zi;
					end;
					local vi,Zi;
					if Oi.name~=""then 
						Zi=QQ("TextLabel",{Position=l(Li,0),Size=f(1,-(Li+12),1,0),Text=Oi.name,TextSize=13,TextTruncate=UQ,ZIndex=2,Parent=Pi},{TextColor3="txt"});
						GQ(Yi:GetPropertyChangedSignal("AbsoluteSize"),function()
							Zi.Size=f(1,-(Li+18+Yi.AbsoluteSize.X/nQ()),1,0);
						end);
						if oi then 
							GQ(Zi:GetPropertyChangedSignal("TextColor3"),function()
								oi.ImageColor3=Zi.TextColor3;
							end);
						end;
					else 
						Zi=vi;
					end;
					if Ei then 
						ji=Ei.rws;
						if ji then 
						else 
							ji={};
							Ei.rws=ji;
						end;
						local Ei,vi=#ji+1,{r=Pi};
						vi.n,vi.af,vi.x,ji[Ei]=Zi and Oi.name,Yi,Li,vi;
					end;
					Oi.row=Pi;
					Oi.hit=Ti;
					Oi.accf=Yi;
					Oi.lbl=Zi;
					return Pi,Ti,Yi;
				end;
				local Oi=setmetatable({},R);
				Oi.__index=Oi;
				ci.toggle=function(ji,Ei)
					Ei=Ei or{};
					local Pi=xQ(Oi,ji,Ei,"tgl");
					Pi.val=Ei.default==true;
					Pi.lo=1000000;
					local Ti,Ti,Yi=ni(Pi,ji);
					ji=QQ("Frame",{Size=l(26,14),BackgroundColor3=sQ,BackgroundTransparency=ZQ.trk,LayoutOrder=Pi.lo,Parent=Yi});
					AQ(ji);
					Yi=QQ("Frame",{AnchorPoint=s(0,0.5),Position=f(0,2,0.5,0),Size=l(10,10),BackgroundTransparency=0,Parent=ji},{BackgroundColor3="knob"});
					AQ(Yi);
					Pi.trk=ji;
					Pi.kn=Yi;
					Pi.bnd={key=nil,mode=Ei.mode or"toggle",act=false};
					Pi.ind={on=Ei.ind~=nil and Ei.ind~=false,name=type(Ei.ind)=="string"and Ei.ind or""};
					GQ(Ti.MouseButton1Click,function()
						if Pi.lpd then 
							Pi.lpd=false;
							return;
						end;
						if not(Pi.dis)then 
							Pi:set(not Pi.val);
						end;
					end);
					GQ(Ti.MouseButton2Click,function()
						DQ(Pi);
					end);
					Ni(Ti,function()
						Pi.lpd=true;
						B(1,function()
							Pi.lpd=false;
						end);
						DQ(Pi);
					end);
					if Ei.bind then 
						Pi.bnd.key=Ei.bind;
						Fi(Pi,Ei.bind);
					end;
					Pi:draw(true);
					mi(Pi);
					return Pi;
				end;
				Oi.eff=function(ji)
					local Ei=ji.bnd;
					if Ei.act then 
						if Ei.mode=="hold"then 
							return not ji.val;
						end;
					end;
					return ji.val;
				end;
				Oi.set=function(ji,Ei,Pi)
					Ei=Ei==true;
					if ji.val==Ei then 
						return ji;
					end;
					ji.val=Ei;
					ji:draw();
					ji:fire(Pi);
					return ji;
				end;
				Oi.load=function(ji,Ei)
					if type(Ei)=="boolean"then 
						ji:set(Ei);
					end;
				end;
				Oi.draw=function(Oi,ji)
					local Ei,Pi=Oi:eff(),Oi.dis;
					local Ti,Yi,vi,Zi,Li,oi,Xi=Pi and tQ.faint or(Ei and Oi.o.risky and tQ.bad or tQ.txt),Ei and tQ.acc or sQ,Ei and(Pi and 0.6 or 0)or(Pi and 0.95 or ZQ.trk),Ei and sQ or tQ.knob,f(0,Ei and 14 or 2,0.5,0),Pi and 0.55 or 0,Oi.lbl;
					if ji then 
						if Xi then 
							Xi.TextColor3=Ti;
						end;
						Oi.trk.BackgroundColor3,Oi.trk.BackgroundTransparency=Yi,vi;
						Oi.kn.Position,Oi.kn.BackgroundColor3,Oi.kn.BackgroundTransparency=Li,Zi,oi;
					else 
						if Xi then 
							w(Xi,{TextColor3=Ti},0.14,gQ);
						end;
						w(Oi.trk,{BackgroundColor3=Yi,BackgroundTransparency=vi},0.16,gQ);
						w(Oi.kn,{Position=Li,BackgroundColor3=Zi,BackgroundTransparency=oi},0.2);
					end;
					Oi:kbdraw();
				end;
				R.settings=function(Oi,ji)
					ji=ji or{};
					local Ei=Oi:hostof();
					if not Ei then 
						return nil;
					end;
					local Pi,Ti=Oi.c,QQ("ImageButton",{Size=l(14,14),Image=XQ("dots"),LayoutOrder=-1,Parent=Ei.accf},{ImageColor3="dim"});
					_i(Ti,Pi.pop,"ImageColor3",tQ.dim,tQ.txt);
					local Yi=ri({w=ji.w,keep=true,anchor=Ti,par=Pi.pop,tab=Pi.tab,tmp=Oi.tmp,title=ji.title or Oi.name});
					Yi.owner=Oi;
					Yi.c.page,Yi.c.sec=Pi.page,Pi.sec;
					GQ(Ti.MouseButton1Click,function()
						if Ei.dis then 
							return;
						end;
						if Yi.isopen then 
							t(Yi);
							return;
						end;
						local ji=Ei.row;
						ai(ji,true);
						function Yi.onclose()
							ai(ji,false);
						end;
						local ji,Ei=Ti.AbsolutePosition,Ti.AbsoluteSize;
						uQ(Yi,ji.X+Ei.X+12,ji.Y-8);
					end);
					Oi.sp=Yi;
					return Yi.c;
				end;
				R.color=function(Oi,ji)
					local Ei=Oi:hostof();
					return Ei and Oi.c:colorpicker(ji or{},Ei);
				end;
				R.colorpicker=R.color;
				R.dropdown=function(Oi,ji)
					local Ei=Oi:hostof();
					return Ei and Oi.c:dropdown(ji or{},Ei);
				end;
				R.slider=function(Oi,ji)
					local Ei=Oi:hostof();
					return Ei and Oi.c:slider(ji or{},Ei);
				end;
				local Oi=setmetatable({},R);
				Oi.__index=Oi;
				local function ji(Ei,Pi,Ti)
					local Yi=QQ("Frame",{Size=l(0,22),AutomaticSize=p,LayoutOrder=Ei.lo,Parent=Pi});
					IQ(Yi,8);
					local vi=QQ("TextBox",{Size=l(0,18),AutomaticSize=p,BackgroundColor3=sQ,BackgroundTransparency=ZQ.ctl,TextSize=11,TextXAlignment=b.Center,LayoutOrder=1,Parent=Yi});
					SQ(vi,4);
					JQ(vi,ZQ.ctle);
					eQ(vi,7,7,0,0);
					QQ("UISizeConstraint",{MinSize=s(40,18),Parent=vi});
					Pi=QQ("TextButton",{Size=l(Ei.o.sw or 72,18),LayoutOrder=2,Parent=Yi});
					local Zi=QQ("Frame",{AnchorPoint=s(0,0.5),Position=g(0,0.5),Size=f(1,0,0,4),BackgroundColor3=sQ,BackgroundTransparency=ZQ.trk,Parent=Pi});
					AQ(Zi);
					local Li=QQ("Frame",{Size=g(0,1),BackgroundTransparency=0,Parent=Zi},{BackgroundColor3="acc"});
					AQ(Li);
					local oi=QQ("Frame",{AnchorPoint=s(0.5,0.5),Position=g(0,0.5),Size=l(10,10),BackgroundColor3=sQ,BackgroundTransparency=0,ZIndex=3,Parent=Zi});
					AQ(oi);
					Ei.ctl=Yi;
					Ei.vl=vi;
					Ei.trk=Pi;
					Ei.bar=Zi;
					Ei.fil=Li;
					Ei.kn=oi;
					Ei.mv=function(Yi)
						local Li,Xi=Zi.AbsolutePosition.X,Zi.AbsoluteSize.X;
						if Xi<=0 then 
							return;
						end;
						local Zi=Ei.min+E((Yi.X-Li)/Xi,0,1)*(Ei.max-Ei.min);
						if Ei.bnd.act then 
							Ei:setbv(Zi);
						else 
							Ei:set(Zi);
						end;
					end;
					Ei.mu=function()
						Ei.drg=false;
						local Yi=Ei.hov and 12 or 10;
						w(oi,{Size=l(Yi,Yi)},0.14);
						if Ei.pend then 
							Ei.pend=false;
							Ei:fire();
						end;
					end;
					local function Yi(Zi)
						Ei.drg=true;
						w(oi,{Size=l(12,12)},0.14);
						HQ(Ei.mv,Ei.mu,Ti,Zi);
					end;
					GQ(Pi.InputBegan,function(Zi)
						if Ei.dis then 
							return;
						end;
						local Li=Zi.UserInputType;
						if Li==KQ then 
							Ei.mv(BQ());
							Yi(Zi);
						elseif Li==hQ then 
							local KQ={i=Zi};
							KQ.p0=dQ(Zi);
							KQ.drag=function(Li)
								Ei.mv(Li);
								Yi(Zi);
							end;
							KQ.tap=function(Yi)
								Ei.mv(Yi);
								Ei.mu();
							end;
							kQ.tg=KQ;
							B(0.5,function()
								if kQ.tg==KQ then 
									kQ.tg=nil;
									DQ(Ei);
								end;
							end);
						end;
					end);
					GQ(Pi.MouseButton2Click,function()
						DQ(Ei);
					end);
					Ri(Pi,Ti,function()
						Ei.hov=true;
						if not(Ei.drg)then 
							w(oi,{Size=l(12,12)},0.14);
						end;
					end,function()
						Ei.hov=false;
						if not(Ei.drg)then 
							w(oi,{Size=l(10,10)},0.14);
						end;
					end);
					GQ(vi.Focused,function()
						if Ei.dis then 
							vi:ReleaseFocus();
							return;
						end;
						Ei.foc=true;
						vi.Text=tostring(Ei:eff());
						vi.TextColor3=tQ.acc;
						ai(Ei:rw(),true);
					end);
					GQ(vi.FocusLost,function()
						if Ei.foc then 
							Ei.foc=false;
							ai(Ei:rw(),false);
						end;
						local KQ=tonumber((Q(vi.Text,"[^%d%.%-]","")));
						if KQ then 
							if Ei.bnd.act then 
								Ei:setbv(KQ);
							else 
								Ei:set(KQ);
							end;
						end;
						Ei:draw();
					end);
				end;
				ci.slider=function(KQ,Ei,Pi)
					Ei=Ei or{};
					local Ti=xQ(Oi,KQ,Ei,"sld");
					Ti.min,Ti.max=Ei.min or 0,Ei.max or 100;
					Ti.dec=Ei.dec or Ei.decimals or 0;
					Ti.step=Ei.step or 10^(-Ti.dec);
					Ti.pat="%."..Ti.dec.."f";
					Ti.suf=Ei.suffix or"";
					Ti.zero=Ei.zero;
					Ti.val=Ti:rnd(Ei.default or Ti.min);
					Ti.bnd={key=nil,mode=Ei.mode or"hold",act=false,v=Ti.val};
					Ti.ind={on=Ei.ind~=nil and Ei.ind~=false,name=type(Ei.ind)=="string"and Ei.ind or""};
					if Ei.bindvalue~=nil then 
						Ti.bnd.v=Ti:rnd(Ei.bindvalue);
					end;
					if Pi then 
						NQ(Pi,Ti);
						Ti.lo=Pi:nexta();
						ji(Ti,Pi.accf,KQ.pop);
					else 
						Ti.lo=1000000;
						local Pi,Pi=ni(Ti,KQ);
						ji(Ti,Ti.accf,KQ.pop);
						GQ(Pi.MouseButton2Click,function()
							DQ(Ti);
						end);
						Ni(Pi,function()
							DQ(Ti);
						end);
					end;
					if Ei.bind then 
						Ti.bnd.key=Ei.bind;
						Fi(Ti,Ei.bind);
					end;
					Ti:draw();
					mi(Ti);
					return Ti;
				end;
				Oi.rnd=function(KQ,Ni)
					local ji,Ei=KQ.min,KQ.max;
					Ni=E(tonumber(Ni)or ji,ji,Ei);
					local Pi=KQ.step;
					Ni=if Pi>0 then ji+P((Ni-ji)/Pi+0.5)*Pi else Ni;
					return tonumber(Z(KQ.pat,E(Ni,ji,Ei)));
				end;
				Oi.eff=function(KQ)
					local Ni=KQ.bnd;
					if Ni then 
						if Ni.act then 
							return Ni.v;
						end;
					end;
					return KQ.val;
				end;
				Oi.set=function(KQ,Ni,ji)
					Ni=KQ:rnd(Ni);
					if Ni==KQ.val then 
						return KQ;
					end;
					KQ.val=Ni;
					KQ:draw();
					if KQ.bnd.act then 
						return KQ;
					end;
					if KQ.drg then 
						if KQ.o.release then 
							KQ.pend=true;
							return KQ;
						end;
					end;
					KQ:fire(ji);
					return KQ;
				end;
				Oi.setbv=function(KQ,Ni)
					Ni=KQ:rnd(Ni);
					local ji=KQ.bnd;
					if ji.v==Ni then 
						return KQ;
					end;
					ji.v=Ni;
					if ji.act then 
						KQ:draw();
						KQ:fire();
					end;
					return KQ;
				end;
				Oi.load=function(KQ,Ni)
					if type(Ni)=="number"then 
						KQ:set(Ni);
					end;
				end;
				Oi.fmtv=function(KQ,Ni)
					local ji=KQ.o.fmt;
					if ji then 
						return ji(Ni);
					end;
					if KQ.zero then 
						if Ni<=KQ.min then 
							return KQ.zero;
						end;
					end;
					return Z(KQ.pat,Ni)..KQ.suf;
				end;
				Oi.draw=function(Z)
					local KQ,Ni,Oi,ji=Z:eff(),Z.dis,Z.bnd,Z.max-Z.min;
					local Ei=ji>0 and(KQ-Z.min)/ji or 0;
					if Z.drawn then 
						w(Z.fil,{Size=g(Ei,1)},0.12);
						w(Z.kn,{Position=g(Ei,0.5)},0.12);
					else 
						Z.drawn=true;
						Z.fil.Size=g(Ei,1);
						Z.kn.Position=g(Ei,0.5);
					end;
					Z.fil.BackgroundTransparency=Ni and 0.6 or 0;
					Z.kn.BackgroundTransparency=Ni and 0.6 or 0;
					if Z.lbl then 
						Z.lbl.TextColor3=Ni and tQ.faint or tQ.txt;
					end;
					if not(Z.vl:IsFocused())then 
						Z.vl.Text=Z:fmtv(KQ);
						Ei,ji=Z.vl,Ni and tQ.faint or(Oi.act and tQ.acc or tQ.txt);
						Ei.TextColor3=ji;
					end;
					Z.vl.TextEditable=not Ni;
					Z:kbdraw();
				end;
				local Z=setmetatable({},R);
				Z.__index=Z;
				local function KQ(Ni,Oi,ji,Ei)
					if ji then 
						for ji,Pi in next,Oi,nil do 
							Ni[ji]=Pi;
						end;
					else 
						w(Ni,Oi,Ei or 0.12,gQ);
					end;
				end;
				local function Ni(Oi)
					local ji=QQ("UIGradient",{Enabled=false,Parent=Oi});
					local function Ei()
						local Pi=Oi.AbsoluteSize.X;
						local Ti=Pi>1 and Oi.TextBounds.X>Pi+1.5;
						ji.Enabled=Ti;
						if Ti then 
							local Ti=E(1-18*nQ()/Pi,0.05,0.95);
							ji.Transparency=O({j(0,0),j(Ti,0),j(1,1)});
						end;
					end;
					GQ(Oi:GetPropertyChangedSignal("TextBounds"),Ei);
					GQ(Oi:GetPropertyChangedSignal("AbsoluteSize"),Ei);
					Ei();
				end;
				local function j(Oi,ji,Ei,Pi,Ti)
					Ti=Ti or 22;
					local Yi=QQ("TextButton",{Size=l(Pi and 0 or ji,Ti),AutomaticSize=Pi and p or W,BackgroundColor3=sQ,BackgroundTransparency=ZQ.ctl,LayoutOrder=Ei or 0,Parent=Oi});
					SQ(Yi,6);
					Oi=JQ(Yi,ZQ.ctle);
					eQ(Yi,9,8,0,0);
					IQ(Yi,Pi and 2 or 6);
					ji=QQ("TextLabel",{Size=Pi and l(0,Ti)or f(1,-16,1,0),AutomaticSize=Pi and p or W,TextSize=12,ClipsDescendants=true,LayoutOrder=1,Parent=Yi},{TextColor3="sub"});
					if Pi then 
						eQ(ji,0,4,0,0);
						QQ("UISizeConstraint",{MaxSize=s(154,Ti),Parent=ji});
					end;
					Ni(ji);
					return Yi,ji,QQ("ImageLabel",{Size=l(10,10),Image=XQ("chevron"),LayoutOrder=2,Parent=Yi},{ImageColor3="dim"}),Oi;
				end;
				local function Oi(ji,Ei)
					local Pi=QQ("TextButton",{Size=l(0,22),AutomaticSize=p,LayoutOrder=Ei or 0,Parent=ji});
					IQ(Pi,1);
					ji=QQ("TextLabel",{Size=l(0,22),AutomaticSize=p,TextSize=13,ClipsDescendants=true,LayoutOrder=1,Parent=Pi},{TextColor3="sub"});
					eQ(ji,0,4,0,0);
					QQ("UISizeConstraint",{MaxSize=s(122,22),Parent=ji});
					Ni(ji);
					return Pi,ji,(QQ("ImageLabel",{Size=l(12,12),Image=XQ("right"),LayoutOrder=2,Parent=Pi},{ImageColor3="dim"}));
				end;
				ci.dropdown=function(Ni,ji,Ei)
					ji=ji or{};
					local Pi=xQ(Z,Ni,ji,"drp");
					Pi.multi=ji.multi==true;
					Pi.values=ji.values or ji.options or{};
					if Pi.multi then 
						Pi.val={};
						local Ti=ji.default;
						if type(Ti)=="table"then 
							for Yi=1,#Ti,1 do 
								Pi.val[Yi]=Ti[Yi];
							end;
						elseif Ti~=nil then 
							Pi.val[1]=Ti;
						end;
					else 
						Pi.val=ji.default;
						if Pi.val==nil then 
							if not(ji.none)then 
								Pi.val=Pi.values[1];
							end;
						end;
					end;
					Pi.srt=function(Ti,Yi)
						return(J(Pi.values,Ti)or 0)<(J(Pi.values,Yi)or 0);
					end;
					Pi.ind={on=ji.ind~=nil and ji.ind~=false,name=type(ji.ind)=="string"and ji.ind or""};
					local Ti=Ni.pop;
					Pi.fly=Ti~=nil and ji.par==nil and ji.box~=true;
					local Yi,vi,Zi=ji.par,ji.w or 112,ji.lo;
					if Ei then 
						NQ(Ei,Pi);
						Pi.lo=Ei:nexta();
						Yi,vi,Zi=Ei.accf,ji.w or 96,Pi.lo;
					else 
						if Yi then 
						else 
							Pi.lo=1000000;
							local Ei,Li=ni(Pi,Ni);
							Yi,Zi=Pi.accf,Pi.lo;
							GQ(Li.MouseButton1Click,function()
								Pi:flip();
							end);
							GQ(Li.MouseButton2Click,function()
								DQ(Pi);
							end);
							if Pi.fly then 
								Ri(Ei,Ti,function()
									Pi.rh=true;
									Pi:draw();
								end,function()
									Pi.rh=false;
									Pi:draw();
								end);
							end;
						end;
					end;
					if Pi.fly then 
						Pi.btn,Pi.t,Pi.ch=Oi(Yi,Zi);
					else 
						Pi.btn,Pi.t,Pi.ch,Pi.sk=j(Yi,vi,Zi,ji.auto,ji.h);
					end;
					Pi.ctl=Pi.btn;
					Ri(Pi.btn,Ti,function()
						Pi.bh=true;
						Pi:draw();
					end,function()
						Pi.bh=false;
						Pi:draw();
					end);
					GQ(Pi.btn.MouseButton1Click,function()
						Pi:flip();
					end);
					Pi:draw(true);
					mi(Pi);
					return Pi;
				end;
				Z.flip=function(j)
					if j.dis then 
						return;
					end;
					if j.lp then 
						if j.lp.isopen then 
							t(j.lp);
						else 
							j:openlist();
						end;
					else 
						j:openlist();
					end;
				end;
				Z.has=function(j,Ni)
					if j.multi then 
						return J(j.val,Ni)~=nil;
					end;
					return j.val==Ni;
				end;
				Z.none=function(j)
					if j.multi then 
						return#j.val==0;
					end;
					return j.val==nil;
				end;
				Z.text=function(j)
					if j:none()then 
						return j.o.empty or(j.multi and not j.fly and"None"or"Select");
					end;
					if j.multi then 
						local Ni=#j.val;
						local Oi=table.create(Ni);
						for ji=1,Ni,1 do 
							Oi[ji]=tostring(j.val[ji]);
						end;
						return M(Oi,", ");
					end;
					return tostring(j.val);
				end;
				Z.draw=function(j,Ni)
					local Oi=j.dis;
					if Oi then 
						if j.lp then 
							t(j.lp);
							return;
						end;
					end;
					local ji,Ei,Pi=j.lp~=nil,if Oi then not Oi else j.bh or j.rh,j:none();
					j.t.Text=j:text();
					local Ti,Yi;
					if Oi then 
						Ti,Yi=tQ.faint,tQ.faint;
					else 
						Ti,Yi=(ji or Ei)and tQ.txt or(Pi and tQ.dim or tQ.sub),ji and tQ.txt or(Ei and tQ.sub or tQ.dim);
					end;
					KQ(j.t,{TextColor3=Ti},Ni);
					Pi=j.sk;
					if Pi then 
						local Ti,vi=j.btn,{};
						vi.BackgroundTransparency=(ji or Ei)and ZQ.ctlh or ZQ.ctl;
						KQ(Ti,vi,Ni);
						KQ(Pi,{Transparency=ji and 0.88 or ZQ.ctle},Ni);
						Ti,vi=j.ch,{ImageColor3=Yi};
						vi.Rotation=ji and 180 or 0;
						KQ(Ti,vi,Ni,0.16);
					else 
						KQ(j.ch,{ImageColor3=Yi},Ni);
					end;
					if j.lbl then 
						j.lbl.TextColor3=Oi and tQ.faint or tQ.txt;
					end;
					ji=j.items;
					if ji then 
						Oi,Pi,Ei=j.hv,j.multi;
						for Ti=1,#ji,1 do 
							local Yi=ji[Ti];
							local ji,vi=j:has(Yi.v),Oi==Yi;
							Ei=Ei or(ji and not Pi and Ti or nil);
							local Ti,Zi=Yi.t,{};
							Zi.TextColor3=(ji or vi)and tQ.txt or tQ.sub;
							KQ(Ti,Zi,Ni,0.1);
							if Pi then 
								KQ(Yi.m,{BackgroundColor3=ji and tQ.acc or sQ,BackgroundTransparency=ji and 0 or ZQ.trk},Ni,0.14);
								KQ(Yi.k,{Position=f(0,ji and 12 or 2,0.5,0),BackgroundColor3=ji and sQ or tQ.knob},Ni,0.18);
							end;
						end;
						if j.cap then 
							j.cap(Oi and Oi.i,Ei,Ni);
						end;
					end;
				end;
				Z.set=function(j,Ni,Oi)
					if j.multi then 
						local ji=j.val;
						Ni=if Ni==ji then(i(Ni))else Ni;
						e(ji);
						if type(Ni)=="table"then 
							for Ei=1,#Ni,1 do 
								local Pi=Ni[Ei];
								if J(j.values,Pi)then 
									if not(J(ji,Pi))then 
										ji[#ji+1]=Pi;
									end;
								end;
							end;
						elseif Ni~=nil then 
							if J(j.values,Ni)then 
								ji[1]=Ni;
							end;
						end;
						I(ji,j.srt);
					else 
						if Ni~=nil then 
							if not(J(j.values,Ni))then 
								return j;
							end;
						end;
						if j.val==Ni then 
							return j;
						end;
						j.val=Ni;
					end;
					j:draw();
					j:fire(Oi);
					return j;
				end;
				Z.pick=function(j,Ni)
					local Oi=j.val;
					local ji=J(Oi,Ni);
					if ji then 
						if j.o.min1 then 
							if#Oi==1 then 
								return;
							end;
						end;
						y(Oi,ji);
					else 
						Oi[#Oi+1]=Ni;
						I(Oi,j.srt);
					end;
					j:draw();
					j:fire();
				end;
				Z.setvalues=function(j,Ni)
					j.values=Ni or{};
					if j.multi then 
						Ni=j.val;
						for Oi=#Ni,1,-1 do 
							if not(J(j.values,Ni[Oi]))then 
								y(Ni,Oi);
							end;
						end;
					elseif j.val~=nil then 
						if not(J(j.values,j.val))then 
							j.val=j.values[1];
						end;
					end;
					if j.lp then 
						if j.lp.isopen then 
							t(j.lp);
						end;
					end;
					j:draw();
					j:fire();
					return j;
				end;
				Z.ser=function(j)
					if j.multi then 
						return i(j.val);
					end;
					return j.val;
				end;
				Z.load=function(j,i)
					if j.multi then 
						if type(i)=="table"then 
							j:set(i);
						end;
					elseif i~=nil then 
						j:set(i);
					end;
				end;
				Z.openlist=function(j)
					local Z,i,Ni,Oi=j.btn,j.fly,j.c and j.c.pop,j:rw();
					local ji,Ei=nQ(),j.values;
					local Pi,Ti,Yi,vi,Zi,Li=#Ei,j.multi,28,2,8,5;
					local oi=T(1,Y(Pi,Zi));
					local Xi,Qi=oi*Yi+(oi-1)*vi+10,ri({w=140,raw=true,rad=8,anchor=Oi or Z,par=Ni});
					local Si=T(Pi,1)*Yi+T(Pi-1,0)*vi+10;
					local Ai=QQ("ScrollingFrame",{Size=f(1,0,0,Xi),CanvasSize=f(0,0,0,Si),AutomaticCanvasSize=W,ZIndex=2,Parent=Qi.body});
					local W=QQ("Frame",{Position=l(Li,Li),Size=f(1,-10,0,Yi),BackgroundColor3=sQ,BackgroundTransparency=1,ZIndex=2,Parent=Ai});
					SQ(W,6);
					local Ji=JQ(W,1);
					Si=QQ("Frame",{Position=l(Li,Li),Size=f(1,-10,0,0),AutomaticSize=D,ZIndex=3,Parent=Ai});
					MQ(Si,vi);
					if Pi==0 then 
						QQ("TextLabel",{Size=f(1,0,0,Yi),Text="Nothing here",TextSize=13,TextXAlignment=b.Center,ZIndex=3,Parent=Si},{TextColor3="dim"});
					end;
					local yi;
					local ei=0;
					local function Mi(Ii,ii)
						local ki=Ii~=nil;
						if ki then 
							local Bi=l(Li,Li+(Ii-1)*(Yi+vi));
							if ii then 
								W.Position=Bi;
							elseif yi==nil then 
								W.Position=Bi;
							elseif yi~=Ii then 
								w(W,{Position=Bi},0.22);
							end;
						end;
						yi=Ii;
						KQ(W,{BackgroundTransparency=ki and 0.955 or 1},ii,0.14);
						KQ(Ji,{Transparency=ki and 0.93 or 1},ii,0.14);
					end;
					local function W(KQ,vi,Li)
						ei+=1;
						if KQ then 
							Mi(KQ or vi,Li);
							return;
						elseif Li then 
							Mi(KQ or vi,Li);
							return;
						end;
						local KQ=ei;
						B(0.08,function()
							if ei==KQ then 
								if j.cap==W then 
									Mi(vi);
								end;
							end;
						end);
					end;
					j.cap=W;
					local KQ,vi,Li=table.create(Pi),Ti and 40 or 10;
					local Ji=0;
					for yi=1,Pi,1 do 
						local ei=Ei[yi];
						local Mi=j:has(ei);
						Li=Li or(Mi and yi or nil);
						local Ii=QQ("TextButton",{Size=f(1,0,0,Yi),LayoutOrder=yi,ZIndex=3,Parent=Si});
						local Yi=QQ("TextLabel",{Position=l(10,0),Size=f(1,-(10+vi),1,0),Text=tostring(ei),TextSize=13,TextColor3=Mi and tQ.txt or tQ.sub,TextTruncate=UQ,ZIndex=3,Parent=Ii});
						local ii,ki;
						if Ti then 
							ii=QQ("Frame",{AnchorPoint=s(1,0.5),Position=f(1,-9,0.5,0),Size=l(22,12),BackgroundColor3=Mi and tQ.acc or sQ,BackgroundTransparency=Mi and 0 or ZQ.trk,ZIndex=3,Parent=Ii});
							AQ(ii);
							ki=QQ("Frame",{AnchorPoint=s(0,0.5),Position=f(0,Mi and 12 or 2,0.5,0),Size=l(8,8),BackgroundColor3=Mi and sQ or tQ.knob,BackgroundTransparency=0,ZIndex=3,Parent=ii});
							AQ(ki);
						else 
						end;
						Ji=T(Ji,Yi.TextBounds.X);
						local Mi={b=Ii,t=Yi,m=ii,k=ki,v=ei,i=yi};
						Ri(Ii,Qi,function()
							j.hv=Mi;
							j:draw();
						end,function()
							if j.hv==Mi then 
								j.hv=nil;
								j:draw();
							end;
						end);
						GQ(Ii.MouseButton1Click,function()
							if j.multi then 
								j:pick(ei);
							else 
								t(Qi);
								j:set(ei);
							end;
						end);
						KQ[yi]=Mi;
					end;
					Si=i and 0 or Z.AbsoluteSize.X/ji;
					Qi.w=P(E(T(Ji+10+vi+10+4,j.o.lw or 0,132),Si,T(Si,280))+0.5);
					j.items=KQ;
					j.lp=Qi;
					ai(Oi,true);
					Qi.onclose=function()
						j.items=nil;
						j.hv=nil;
						j.lp=nil;
						j.cap=nil;
						ai(Oi,false);
						j:draw();
					end;
					if Li then 
						if Pi>Zi then 
							Ai.CanvasPosition=s(0,T(0,(Li-1)*30-P((oi-1)/2)*30));
						end;
					end;
					Si,Zi,Ei,Pi,KQ,Ai=kQ.probe.AbsolutePosition,kQ.gui.AbsoluteSize,Qi.w*ji,Xi*ji;
					if i and Ni then 
						Xi,vi,oi=Ni.frame.AbsolutePosition,Ni.frame.AbsoluteSize,Oi or Z;
						KQ=Xi.X+vi.X+6*ji;
						KQ,Ai=if KQ+Ei>Si.X+Zi.X-6 then Xi.X-6*ji-Ei else KQ,oi.AbsolutePosition.Y+(oi.AbsoluteSize.Y-Pi)/2;
					else 
						local i,Ni=Z.AbsolutePosition,Z.AbsoluteSize;
						KQ,Ai=j.o.par and i.X or i.X+Ni.X-Ei,i.Y+Ni.Y+4*ji;
						Ai=if Ai+Pi>Si.Y+Zi.Y-6 then if i.Y-4*ji-Pi>=Si.Y+6 then i.Y-4*ji-Pi else Ai else Ai;
					end;
					W(nil,(if Ti then not Ti else Li)or nil,true);
					uQ(Qi,KQ,Ai);
					j:draw();
				end;
				local j=setmetatable({},R);
				j.__index=j;
				local function Z(i,W,KQ)
					if not(jQ.checker)then 
						return nil;
					end;
					local Ni=QQ("ImageLabel",{Size=g(1,1),Image=jQ.checker,ScaleType=Enum.ScaleType.Tile,TileSize=l(W or 8,W or 8),ResampleMode=Enum.ResamplerMode.Pixelated,Parent=i});
					if KQ==true then 
						AQ(Ni);
					elseif KQ then 
						SQ(Ni,KQ);
					end;
					return Ni;
				end;
				local function i(W,KQ,Ni,Oi)
					local ji=QQ("Frame",{AnchorPoint=s(0.5,0.5),Position=g(0,0.5),Size=l(KQ,Ni),BackgroundTransparency=0,ZIndex=5,Parent=W});
					SQ(ji,Oi);
					QQ("UIStroke",{Color=sQ,Thickness=2,Parent=ji});
					W=QQ("Frame",{AnchorPoint=s(0.5,0.5),Position=g(0.5,0.5),Size=l(KQ+5,Ni+5),ZIndex=4,Parent=ji});
					SQ(W,Oi+2);
					QQ("UIStroke",{Color=CQ,Transparency=0.72,Thickness=1,Parent=W});
					return ji;
				end;
				local W={"RGB","HEX","HSV"};
				ci.colorpicker=function(KQ,Ni,Oi)
					Ni=Ni or{};
					local ji=xQ(j,KQ,Ni,"cpk");
					local Ei=Ni.default or Ni.color or sQ;
					ji.val=Ei;
					ji.a=Ni.alpha or 1;
					ji.h,ji.s,ji.v=Ei:ToHSV();
					Ei=nil;
					if Oi then 
						NQ(Oi,ji);
						ji.lo=Oi:nexta();
						Ei=Oi.accf;
					else 
						ji.lo=1000000;
						local NQ,NQ=ni(ji,KQ);
						Ei=ji.accf;
						GQ(NQ.MouseButton1Click,function()
							ji:flip();
						end);
					end;
					Oi=QQ("TextButton",{Size=l(16,16),LayoutOrder=ji.lo,Parent=Ei});
					SQ(Oi,5);
					Z(Oi,4,5);
					ji.swc=QQ("Frame",{Size=g(1,1),BackgroundTransparency=0,ZIndex=2,Parent=Oi});
					SQ(ji.swc,5);
					JQ(Oi,0.86);
					ji.sw=Oi;
					ji.ctl=Oi;
					GQ(Oi.MouseButton1Click,function()
						ji:flip();
					end);
					ji:draw();
					mi(ji);
					return ji;
				end;
				j.flip=function(KQ)
					if KQ.dis then 
						return;
					end;
					if KQ.pp then 
						if KQ.pp.isopen then 
							t(KQ.pp);
						else 
							KQ:openpick();
						end;
					else 
						KQ:openpick();
					end;
				end;
				j.ser=function(KQ)
					return PQ(KQ.val,KQ.a);
				end;
				j.unser=function(KQ,KQ)
					return TQ(KQ)or KQ;
				end;
				j.load=function(KQ,NQ)
					local Ni,Oi=TQ(NQ);
					if Ni then 
						KQ:set(Ni,Oi);
					end;
				end;
				j.set=function(KQ,NQ,Ni,Oi)
					if typeof(NQ)~="Color3"then 
						return KQ;
					end;
					Ni=Ni or KQ.a;
					if NQ==KQ.val then 
						if Ni==KQ.a then 
							return KQ;
						end;
					end;
					KQ.val=NQ;
					KQ.a=Ni;
					local Ni,ji,Ei=NQ:ToHSV();
					if ji>0 then 
						if Ei>0 then 
							KQ.h=Ni;
						end;
					end;
					KQ.s=ji;
					KQ.v=Ei;
					KQ:draw();
					KQ:fire(Oi);
					return KQ;
				end;
				j.sethsv=function(KQ,NQ,Ni,Oi,ji)
					KQ.h=NQ;
					KQ.s=Ni;
					KQ.v=Oi;
					if ji then 
						KQ.a=ji;
					end;
					KQ.val=F(NQ,Ni,Oi);
					KQ:draw();
					KQ:fire();
				end;
				j.draw=function(KQ)
					KQ.swc.BackgroundColor3=KQ.val;
					KQ.swc.BackgroundTransparency=KQ.dis and Y(1,1.55-KQ.a)or 1-KQ.a;
					if KQ.lbl then 
						KQ.lbl.TextColor3=KQ.dis and tQ.faint or tQ.txt;
					end;
					local NQ=KQ.pu;
					if NQ then 
						NQ();
					end;
				end;
				j.openpick=function(j)
					local KQ,NQ,Ni,Oi=j,196,6,184;
					local ji=ri({w=NQ,raw=true,rad=8,anchor=j.row or j.sw,par=j.c and j.c.pop});
					KQ.pp=ji;
					local Ei=QQ("Frame",{Size=l(NQ,170),ZIndex=2,Parent=ji.body});
					local Pi=QQ("TextButton",{Position=l(Ni,Ni),Size=l(Oi,100),BackgroundTransparency=0,Parent=Ei});
					SQ(Pi,5);
					NQ=QQ("Frame",{Size=g(1,1),BackgroundColor3=sQ,BackgroundTransparency=0,Parent=Pi});
					SQ(NQ,5);
					QQ("UIGradient",{Transparency=O(0,1),Parent=NQ});
					NQ=QQ("Frame",{Size=g(1,1),BackgroundColor3=CQ,BackgroundTransparency=0,Parent=Pi});
					SQ(NQ,5);
					QQ("UIGradient",{Rotation=90,Transparency=O(1,0),Parent=NQ});
					NQ=QQ("Frame",{Size=g(1,1),ZIndex=3,Parent=Pi});
					SQ(NQ,5);
					JQ(NQ,0.92);
					local Ti=QQ("Frame",{AnchorPoint=s(0.5,0.5),Size=l(9,9),ZIndex=5,Parent=Pi});
					AQ(Ti);
					QQ("UIStroke",{Color=sQ,Thickness=2,Parent=Ti});
					NQ=QQ("Frame",{AnchorPoint=s(0.5,0.5),Position=g(0.5,0.5),Size=l(14,14),ZIndex=4,Parent=Ti});
					AQ(NQ);
					QQ("UIStroke",{Color=CQ,Transparency=0.72,Thickness=1,Parent=NQ});
					local function Yi(vi)
						local Zi=QQ("TextButton",{Position=l(Ni,vi-8),Size=l(Oi,16),Parent=Ei});
						vi=QQ("Frame",{AnchorPoint=s(0,0.5),Position=g(0,0.5),Size=f(1,0,0,8),BackgroundColor3=sQ,BackgroundTransparency=1,Parent=Zi});
						SQ(vi,3);
						return Zi,vi,i(vi,6,12,2);
					end;
					local i,vi,Zi=Yi(117);
					vi.BackgroundTransparency=0;
					NQ=table.create(7);
					for Li=0,6,1 do 
						NQ[Li+1]=n(Li/6,F(Li/6%1,1,1));
					end;
					QQ("UIGradient",{Color=c(NQ),Parent=vi});
					local c,n,Li=Yi(133);
					Z(n,4,3);
					local Z=QQ("Frame",{Size=g(1,1),BackgroundTransparency=0,ZIndex=2,Parent=n});
					SQ(Z,3);
					QQ("UIGradient",{Transparency=O(1,0),Parent=Z});
					local O=QQ("Frame",{Position=l(Ni,144),Size=l(Oi,20),Parent=Ei});
					IQ(O,4);
					NQ=QQ("TextButton",{Size=l(36,20),LayoutOrder=1,Parent=O});
					local Ni=QQ("ImageLabel",{AnchorPoint=s(0,0.5),Position=f(0,1,0.5,0),Size=l(9,9),Image=XQ("chevron"),Parent=NQ},{ImageColor3="dim"});
					local Oi=QQ("TextLabel",{Position=l(13,0),Size=f(1,-13,1,0),TextSize=11,Parent=NQ},{TextColor3="sub"});
					Ri(NQ,ji,function()
						w(Oi,{TextColor3=tQ.txt},0.12,gQ);
						w(Ni,{ImageColor3=tQ.sub},0.12,gQ);
					end,function()
						w(Oi,{TextColor3=tQ.sub},0.12,gQ);
						w(Ni,{ImageColor3=tQ.dim},0.12,gQ);
					end);
					local function Ni(Ei,Yi)
						local oi=QQ("TextBox",{Size=l(Yi or 27,20),BackgroundColor3=sQ,BackgroundTransparency=ZQ.ctl,TextSize=11,TextXAlignment=b.Center,ClipsDescendants=true,LayoutOrder=Ei,Parent=O});
						SQ(oi,4);
						local Ei=JQ(oi,ZQ.ctle);
						GQ(oi.Focused,function()
							w(Ei,{Color=tQ.acc,Transparency=0.5},0.14,gQ);
						end);
						GQ(oi.FocusLost,function()
							w(Ei,{Color=sQ,Transparency=ZQ.ctle},0.14,gQ);
						end);
						return oi;
					end;
					local Ei={};
					U:ds(Ei,0,Ni(2),Ni(3),(Ni(4)));
					local Yi=Ni(5,89);
					local oi=Ni(6);
					local Ni=QQ("ImageButton",{Size=l(20,20),BackgroundColor3=sQ,BackgroundTransparency=ZQ.ctl,LayoutOrder=7,Parent=O});
					SQ(Ni,4);
					JQ(Ni,ZQ.ctle);
					local O=QQ("ImageLabel",{AnchorPoint=s(0.5,0.5),Position=g(0.5,0.5),Size=l(11,11),Image=XQ("copy"),Parent=Ni},{ImageColor3="dim"});
					Ri(Ni,ji,function()
						w(Ni,{BackgroundTransparency=ZQ.ctlh},0.12,gQ);
						w(O,{ImageColor3=tQ.txt},0.12,gQ);
					end,function()
						w(Ni,{BackgroundTransparency=ZQ.ctl},0.12,gQ);
						w(O,{ImageColor3=tQ.dim},0.12,gQ);
					end);
					local function O()
						local Xi=KQ.cm or"RGB";
						Oi.Text=Xi;
						local Oi=Xi=="HEX";
						for Qi=1,3,1 do 
							Ei[Qi].Visible=not Oi;
						end;
						Yi.Visible=Oi;
						return Xi;
					end;
					KQ.pu=function()
						local Oi,Xi=F(KQ.h,1,1),KQ.val;
						Pi.BackgroundColor3=Oi;
						Ti.Position=g(KQ.s,1-KQ.v);
						Zi.Position=g(KQ.h,0.5);
						Zi.BackgroundColor3=Oi;
						Z.BackgroundColor3=Xi;
						Li.Position=g(KQ.a,0.5);
						Li.BackgroundColor3=Xi;
						Oi=if(KQ.cm or"RGB")=="HSV"then{P(KQ.h*360+0.5),P(KQ.s*100+0.5),P(KQ.v*100+0.5)}else{P(Xi.R*255+0.5),P(Xi.G*255+0.5),P(Xi.B*255+0.5)};
						for F=1,3,1 do 
							if not(Ei[F]:IsFocused())then 
								Ei[F].Text=tostring(Oi[F]);
							end;
						end;
						if not(Yi:IsFocused())then 
							Yi.Text=PQ(Xi);
						end;
						if not(oi:IsFocused())then 
							oi.Text=tostring(P(KQ.a*255+0.5));
						end;
					end;
					O();
					GQ(NQ.MouseButton1Click,function()
						KQ.cm=W[(J(W,KQ.cm or"RGB")or 0)%#W+1];
						O();
						KQ.pu();
					end);
					for F=1,3,1 do 
						local O=Ei[F];
						GQ(O.FocusLost,function()
							local Z=tonumber((Q(O.Text,"[^%d%.]","")));
							if Z then 
								if(KQ.cm or"RGB")=="HSV"then 
									local O,W,Oi=KQ.h,KQ.s,KQ.v;
									if F==1 then 
										O=E(Z,0,359.9)/360;
									else 
										if F==2 then 
											W=E(Z,0,100)/100;
										else 
											Oi=E(Z,0,100)/100;
										end;
									end;
									KQ:sethsv(O,W,Oi);
								else 
									local O=KQ.val;
									local W={O.R*255,O.G*255,O.B*255,[F]=E(Z,0,255)};
									KQ:set(h(W[1],W[2],W[3]));
								end;
							end;
							if KQ.pu then 
								KQ.pu();
							end;
						end);
					end;
					GQ(Yi.FocusLost,function()
						local F=Yi.Text;
						local O,Z=TQ(F);
						if O then 
							KQ:set(O,#Q(F,"[^%x]","")==8 and Z or KQ.a);
						end;
						if KQ.pu then 
							KQ.pu();
						end;
					end);
					GQ(oi.FocusLost,function()
						local F=tonumber((Q(oi.Text,"[^%d%.]","")));
						if F then 
							KQ:sethsv(KQ.h,KQ.s,KQ.v,E(F,0,255)/255);
						end;
						if KQ.pu then 
							KQ.pu();
						end;
					end);
					GQ(Ni.MouseButton1Click,function()
						local F=PQ(KQ.val,KQ.a);
						if pcall(setclipboard,F)then 
							iQ:notify("Copied {"..F.."}");
						end;
					end);
					local function F(O,Z)
						GQ(O.InputBegan,function(O)
							local W=O.UserInputType;
							if bQ(W)then 
								Z(W==hQ and dQ(O)or BQ());
								HQ(Z,nil,ji,O);
							end;
						end);
					end;
					F(Pi,function(O)
						local Z,W=Pi.AbsolutePosition,Pi.AbsoluteSize;
						KQ:sethsv(KQ.h,E((O.X-Z.X)/W.X,0,1),1-E((O.Y-Z.Y)/W.Y,0,1));
					end);
					F(i,function(O)
						local Z,i=vi.AbsolutePosition,vi.AbsoluteSize;
						KQ:sethsv(E((O.X-Z.X)/i.X,0,0.9999),KQ.s,KQ.v);
					end);
					F(c,function(F)
						local O,Z=n.AbsolutePosition,n.AbsoluteSize;
						KQ:sethsv(KQ.h,KQ.s,KQ.v,E((F.X-O.X)/Z.X,0,1));
					end);
					local F=KQ:rw();
					ai(F,true);
					ji.onclose=function()
						KQ.pu=nil;
						KQ.pp=nil;
						ai(F,false);
					end;
					KQ.pu();
					NQ,c=j.sw.AbsolutePosition,j.sw.AbsoluteSize;
					uQ(ji,NQ.X+c.X+10,NQ.Y-8);
				end;
				local F=setmetatable({},R);
				F.__index=F;
				ci.keybind=function(c,n)
					local O=n or{};
					local n=xQ(F,c,O,"kbd");
					local j=O.default;
					j=if typeof(j)=="EnumItem"then j.Name else j;
					j=if j=="None"then nil else j;
					n.val=j;
					n.lo=1000000;
					local Z,Z,i=ni(n,c);
					local W=QQ("TextButton",{Size=l(0,20),AutomaticSize=p,TextSize=11,BackgroundColor3=sQ,BackgroundTransparency=ZQ.ctl,LayoutOrder=n.lo,Parent=i});
					SQ(W,5);
					eQ(W,8,8,0,0);
					QQ("UISizeConstraint",{MinSize=s(44,20),Parent=W});
					n.ks=JQ(W,ZQ.ctle);
					n.b=W;
					n.ctl=W;
					_i(W,c.pop,"BackgroundTransparency",ZQ.ctl,ZQ.ctlh);
					local function c()
						if kQ.eat~=n then 
							if not(n.dis)then 
								n:listen();
							end;
						end;
					end;
					GQ(W.MouseButton1Click,c);
					GQ(Z.MouseButton1Click,c);
					GQ(W.MouseButton2Click,function()
						if kQ.eat~=n then 
							if not(n.dis)then 
								if not(O.nonone)then 
									n:setkey(nil);
								end;
							end;
						end;
					end);
					if j then 
						if not(n.tmp)then 
							Fi(n,j);
						end;
					end;
					n:draw();
					mi(n);
					return n;
				end;
				F.listen=function(c)
					local n=kQ.listen;
					if n then 
						if n~=c then 
							n.lst=false;
							n:draw();
						end;
					end;
					kQ.listen=c;
					c.lst=true;
					c:draw();
				end;
				F.setkey=function(c,n,O)
					c.lst=false;
					if kQ.listen==c then 
						kQ.listen=nil;
					end;
					if n==nil then 
						if c.o.nonone then 
							c:draw();
							return c;
						end;
					end;
					if n==c.val then 
						c:draw();
						return c;
					end;
					if c.val then 
						if not(c.tmp)then 
							xi(c,c.val);
						end;
					end;
					c.val=n;
					if n then 
						if not(c.tmp)then 
							Fi(c,n);
						end;
					end;
					c:draw();
					c:fire(O);
					return c;
				end;
				F.set=function(c,n)
					return c:setkey(n);
				end;
				F.ser=function(c)
					return c.val or"None";
				end;
				F.unser=function(c,c)
					if c=="None"then 
						return nil;
					end;
					return c;
				end;
				F.load=function(c,n)
					if n==nil then 
						c:setkey(nil);
					elseif n=="None"then 
						c:setkey(nil);
					elseif type(n)=="string"then 
						c:setkey(n);
					end;
				end;
				F.bdown=function(c)
					local n=c.o.onpress;
					if n then 
						if not(c.dis)then 
							k(n,c.val);
						end;
					end;
				end;
				F.bup=function(c)
					local n=c.o.onrelease;
					if n then 
						if not(c.dis)then 
							k(n,c.val);
						end;
					end;
				end;
				F.down=function(c)
					local n=c.val;
					if not n then 
						return false;
					end;
					if Gi[n]then 
						c=Enum.UserInputType[n];
						return z:IsMouseButtonPressed(c);
					end;
					local c,O=pcall(function()
						return Enum.KeyCode[n];
					end);
					return c and z:IsKeyDown(O)or false;
				end;
				F.draw=function(F)
					local c,n=F.b,F.lst==true;
					c.Text=n and"..."or(vQ(F.val)or"none");
					w(c,{TextColor3=F.dis and tQ.faint or(n and tQ.acc or(F.val and tQ.txt or tQ.dim))},0.12,gQ);
					w(F.ks,{Color=n and tQ.acc or sQ,Transparency=n and 0.5 or ZQ.ctle},0.14,gQ);
					if F.lbl then 
						F.lbl.TextColor3=F.dis and tQ.faint or tQ.txt;
					end;
					if F.lsh~=n then 
						F.lsh=n;
						ai(F.row,n);
					end;
				end;
				local F=setmetatable({},R);
				F.__index=F;
				ci.input=function(c,n)
					local O=n or{};
					local n=xQ(F,c,O,"inp");
					n.val=tostring(O.default or"");
					local j;
					if n.name~=""then 
						n.lo=1000000;
						local Z,Z,i=ni(n,c);
						j=QQ("TextBox",{Size=l(O.w or 140,22),BackgroundColor3=sQ,BackgroundTransparency=ZQ.ctl,Text=n.val,TextSize=13,PlaceholderText=O.placeholder or"",TextTruncate=UQ,ClipsDescendants=true,LayoutOrder=n.lo,Parent=i},{PlaceholderColor3="dim"});
						SQ(j,5);
						eQ(j,8,8,0,0);
						n.sk=JQ(j,ZQ.ctle);
						GQ(Z.MouseButton1Click,function()
							if not(n.dis)then 
								j:CaptureFocus();
							end;
						end);
					else 
						local Z=c:row(30);
						n.row=Z;
						local c=QQ("TextBox",{Position=l(12,0),Size=f(1,-24,1,0),Text=n.val,TextSize=13,PlaceholderText=O.placeholder or"",TextTruncate=UQ,ClipsDescendants=true,ZIndex=2,Parent=Z},{PlaceholderColor3="dim"});
						j=c;
					end;
					n.b=j;
					n.ctl=j;
					GQ(j.Focused,function()
						n.foc=true;
						ai(n.row,true);
						if n.sk then 
							w(n.sk,{Color=tQ.acc,Transparency=0.5},0.14,gQ);
						end;
					end);
					GQ(j.FocusLost,function(c)
						if n.foc then 
							n.foc=false;
							ai(n.row,false);
						end;
						if n.sk then 
							w(n.sk,{Color=sQ,Transparency=ZQ.ctle},0.14,gQ);
						end;
						n:set(j.Text);
						if c then 
							if O.onenter then 
								k(O.onenter,n.val);
							end;
						end;
					end);
					if O.live then 
						GQ(j:GetPropertyChangedSignal("Text"),function()
							if j:IsFocused()then 
								if j.Text~=n.val then 
									n.val=j.Text;
									n:fire();
								end;
							end;
						end);
					end;
					n:draw();
					mi(n);
					return n;
				end;
				F.set=function(c,n,O)
					n=tostring(n or"");
					local j=c.o.max;
					n=if j then(L(n,1,j))else n;
					if c.b.Text~=n then 
						c.b.Text=n;
					end;
					if n==c.val then 
						return c;
					end;
					c.val=n;
					c:fire(O);
					return c;
				end;
				F.load=function(c,n)
					if type(n)=="string"then 
						c:set(n);
					end;
				end;
				F.draw=function(c)
					c.b.TextColor3=c.dis and tQ.faint or tQ.txt;
					c.b.TextEditable=not c.dis;
					if c.lbl then 
						c.lbl.TextColor3=c.dis and tQ.faint or tQ.txt;
					end;
				end;
				F.focus=function(F)
					F.b:CaptureFocus();
					return F;
				end;
				local F=setmetatable({},R);
				F.__index=F;
				local c={ghost={tc="txt",ic="sub"},primary={tc="acc",ic="acc"},danger={tc="bad",ic="bad"}};
				ci.button=function(n,O)
					O=O or{};
					local j=xQ(F,n,O,"btn");
					local Z,i=c[O.style or"ghost"]or c.ghost,n:free();
					j.row=i;
					local c=ZQ.card;
					local W=QQ("TextButton",{Size=f(1,0,0,O.h or(n.pop and 28 or 30)),BackgroundColor3=sQ,BackgroundTransparency=c,Parent=i});
					SQ(W,7);
					JQ(W,ZQ.edge);
					i=QQ("Frame",{AnchorPoint=s(0.5,0.5),Position=g(0.5,0.5),Size=l(0,20),AutomaticSize=p,Parent=W});
					IQ(i,7);
					if O.icon then 
						j.ic=QQ("ImageLabel",{Size=l(12,12),Image=XQ(O.icon),LayoutOrder=1,Parent=i},{ImageColor3=Z.ic});
					end;
					j.t=QQ("TextLabel",{Size=l(0,20),AutomaticSize=p,Text=j.name,TextSize=13,LayoutOrder=2,Parent=i},{TextColor3=Z.tc});
					j.b=W;
					j.vr=Z;
					_i(W,n.pop,"BackgroundTransparency",c,0.94);
					GQ(W.MouseButton1Click,function()
						if not(j.dis)then 
							if j.cb then 
								k(j.cb);
							end;
						end;
					end);
					j:draw();
					return j;
				end;
				F.draw=function(c)
					c.t.TextTransparency=c.dis and 0.55 or 0;
					if c.ic then 
						c.ic.ImageTransparency=c.dis and 0.55 or 0;
					end;
				end;
				F.press=function(c)
					if c.cb then 
						k(c.cb);
					end;
				end;
				F.settext=function(F,c)
					F.name=tostring(c or"");
					F.t.Text=F.name;
					return F;
				end;
				local F=setmetatable({},R);
				F.__index=F;
				ci.label=function(c,n)
					n=(if type(n)=="string"then{text=n}else n)or{};
					local O,j=xQ(F,c,n,"lbl"),c:row(n.h or 30,true);
					j.AutomaticSize=D;
					O.row=j;
					c=QQ("Frame",{Size=f(1,0,0,0),AutomaticSize=D,Parent=j});
					eQ(c,12,12,8,8);
					O.l=QQ("TextLabel",{Size=f(1,0,0,14),AutomaticSize=D,TextWrapped=true,RichText=n.rich==true,TextSize=13,TextXAlignment=n.center and b.Center or b.Left,Text=O.name,Parent=c},{TextColor3=n.bright and"sub"or"dim"});
					return O;
				end;
				F.settext=function(F,c)
					F.name=tostring(c or"");
					F.l.Text=F.name;
					return F;
				end;
				local F=setmetatable({},R);
				F.__index=F;
				local function c(n)
					if type(n)=="table"then 
						local O=n.value;
						O=if O==nil then n.name else O;
						return O,tostring(n.name or O),n.image,n.crop==true;
					end;
					return n,tostring(n),nil,false;
				end;
				local function n(O,j)
					local Z=QQ("TextButton",{Size=l(100,100),BackgroundColor3=sQ,BackgroundTransparency=ZQ.card,LayoutOrder=j,Parent=O.gr});
					SQ(Z,7);
					local j={b=Z,sk=JQ(Z,ZQ.edge),im=QQ("ImageLabel",{AnchorPoint=s(0.5,0),Position=f(0.5,0,0,7),Size=f(1,-14,1,-34),Parent=Z}),tl=QQ("TextLabel",{AnchorPoint=s(0,1),Position=f(0,8,1,-7),Size=f(1,-16,0,16),FontFace=LQ.m,TextSize=12,TextXAlignment=b.Center,TextTruncate=UQ,TextColor3=tQ.sub,Parent=Z}),h=false};
					Ri(Z,O.c.pop,function()
						j.h=true;
						O:paint(j,true);
					end,function()
						j.h=false;
						O:paint(j,true);
					end);
					GQ(Z.MouseButton1Click,function()
						if not(O.dis)then 
							if j.v~=nil then 
								O:set(j.v);
							end;
						end;
					end);
					return j;
				end;
				ci.cards=function(O,j)
					j=j or{};
					local Z=xQ(F,O,j,"crd");
					Z.cols=E(P(tonumber(j.cols)or 3),1,6);
					Z.gap=6;
					Z.ratio=tonumber(j.ratio)or 0.75;
					Z.pool={};
					Z.items={};
					Z.idx={};
					Z.val=j.default;
					local i=O:free();
					Z.row=i;
					O=QQ("Frame",{Size=f(1,0,0,0),AutomaticSize=D,Parent=i});
					Z.gr=O;
					Z.grid=QQ("UIGridLayout",{CellPadding=l(Z.gap,Z.gap),CellSize=l(100,100),FillDirectionMaxCells=Z.cols,SortOrder=Enum.SortOrder.LayoutOrder,Parent=O});
					GQ(O:GetPropertyChangedSignal("AbsoluteSize"),function()
						Z:fit();
					end);
					Z:setvalues(j.values,true);
					if Z.val==nil then 
						if Z.items[1]then 
							Z.val=Z.items[1].v;
						end;
					end;
					Z:fit();
					Z:draw();
					mi(Z);
					return Z;
				end;
				F.fit=function(O)
					local j=O.gr.AbsoluteSize.X/nQ();
					if j<=0 then 
						return;
					end;
					local Z=O.cols;
					local i=P((j-O.gap*(Z-1))/Z);
					Z=P((i-14)*O.ratio+34+0.5);
					if O.cw~=i or O.ch~=Z then 
						O.cw=i;
						O.ch=Z;
						O.grid.CellSize=l(i,Z);
					end;
				end;
				F.paint=function(O,j,Z)
					local i,W=j.v~=nil and j.v==O.val,O.dis;
					local O,KQ,NQ,vQ,Ni,Gi=i and tQ.acc or sQ,i and 0.9 or(j.h and not W and ZQ.ctlh or ZQ.card),i and tQ.acc or sQ,i and 0.35 or ZQ.edge,W and tQ.faint or(i and tQ.txt or(j.h and tQ.txt or tQ.sub)),W and 0.55 or 0;
					if Z then 
						w(j.b,{BackgroundColor3=O,BackgroundTransparency=KQ},0.14,gQ);
						w(j.sk,{Color=NQ,Transparency=vQ},0.14,gQ);
						w(j.tl,{TextColor3=Ni},0.14,gQ);
						w(j.im,{ImageTransparency=Gi},0.14,gQ);
					else 
						j.b.BackgroundColor3,j.b.BackgroundTransparency=O,KQ;
						j.sk.Color,j.sk.Transparency=NQ,vQ;
						j.tl.TextColor3=Ni;
						j.im.ImageTransparency=Gi;
					end;
				end;
				F.draw=function(O)
					local j=O.pool;
					for Z=1,#j,1 do 
						local i=j[Z];
						if i.v~=nil then 
							O:paint(i,true);
						end;
					end;
				end;
				F.setvalues=function(O,j,Z)
					local i,W,KQ={},{},O.pool;
					if type(j)=="table"then 
						for NQ=1,#j,1 do 
							local vQ,Ni,Gi,mi=c(j[NQ]);
							if vQ~=nil then 
								if W[vQ]==nil then 
									NQ=#i+1;
									i[NQ]={v=vQ,t=Ni,img=Gi,crop=mi};
									W[vQ]=NQ;
								end;
							end;
						end;
					end;
					O.items=i;
					O.idx=W;
					for c=1,#i,1 do 
						j=KQ[c];
						if j then 
						else 
							j=n(O,c);
							KQ[c]=j;
						end;
						local n=i[c];
						j.v=n.v;
						if j.t~=n.t then 
							j.t=n.t;
							j.tl.Text=n.t;
						end;
						c=n.img or"";
						if j.img~=c then 
							j.img=c;
							j.im.Image=c;
						end;
						c=n.crop and Enum.ScaleType.Crop or Enum.ScaleType.Fit;
						if j.im.ScaleType~=c then 
							j.im.ScaleType=c;
						end;
						j.b.Visible=true;
						O:paint(j,false);
					end;
					for c=#i+1,#KQ,1 do 
						local n=KQ[c];
						n.v=nil;
						n.h=false;
						n.b.Visible=false;
					end;
					if not(Z)then 
						if O.val~=nil then 
							if W[O.val]==nil then 
								KQ=i[1];
								O.val=KQ and KQ.v or nil;
								O:draw();
								O:fire();
							end;
						end;
					end;
					return O;
				end;
				F.set=function(c,n,O)
					if n~=nil then 
						if c.idx[n]==nil then 
							return c;
						end;
					end;
					if c.val==n then 
						return c;
					end;
					c.val=n;
					c:draw();
					c:fire(O);
					return c;
				end;
				F.load=function(F,c)
					if c~=nil then 
						F:set(c);
					end;
				end;
				local F=setmetatable({},R);
				F.__index=F;
				ci.submenu=function(R,c)
					c=(if type(c)=="string"then{name=c}else c)or{};
					local n=xQ(F,R,c,"sub");
					n.lo=1000000;
					local O,j,Z=ni(n,R);
					n.ch=QQ("ImageLabel",{Size=l(12,12),Image=XQ("right"),LayoutOrder=n.lo,Parent=Z},{ImageColor3="dim"});
					local Z=ri({w=c.w,keep=true,anchor=O,par=R.pop,tab=R.tab,tmp=R.tmp,title=c.title});
					Z.owner=n;
					Z.c.page,Z.c.sec=R.page,R.sec;
					n.sp=Z;
					GQ(j.MouseButton1Click,function()
						if n.dis then 
							return;
						end;
						if Z.isopen then 
							t(Z);
							return;
						end;
						ai(O,true);
						w(n.ch,{ImageColor3=tQ.txt},0.12,gQ);
						function Z.onclose()
							ai(O,false);
							w(n.ch,{ImageColor3=tQ.dim},0.12,gQ);
						end;
						if Z.aw then 
							Z:fitw();
						end;
						local t,c,j,i,W=nQ(),O.AbsolutePosition,O.AbsoluteSize,kQ.probe.AbsolutePosition,kQ.gui.AbsoluteSize;
						local O,KQ,NQ=Z.w*t,c.X,c.X+j.X;
						if R.pop then 
							j=R.pop.frame;
							KQ,NQ=j.AbsolutePosition.X,j.AbsolutePosition.X+j.AbsoluteSize.X;
						else 
						end;
						j=NQ+8*t;
						uQ(Z,if j+O>i.X+W.X-6 then KQ-8*t-O else j,c.Y-6*t);
					end);
					n:draw();
					return Z.c,n;
				end;
				ci.menu=ci.submenu;
				F.draw=function(R)
					if R.lbl then 
						R.lbl.TextColor3=R.dis and tQ.faint or tQ.txt;
					end;
				end;
				local R={};
				R.__index=R;
				local function F(t,c,n,O,j)
					local Z=#c;
					local i=setmetatable({i=n or 1,b={},cb=O,n=Z},R);
					n=j~=nil;
					O=QQ("Frame",{Size=f(1,0,0,30),BackgroundColor3=sQ,BackgroundTransparency=n and ZQ.pfil or ZQ.card,Parent=t});
					SQ(O,n and 8 or 7);
					if not n then 
						JQ(O,ZQ.edge);
					end;
					eQ(O,3,3,3,3);
					i.hl=QQ("Frame",{Size=f(1/Z,0,1,0),BackgroundColor3=sQ,BackgroundTransparency=n and 0.935 or ZQ.tab,Parent=O});
					SQ(i.hl,n and 6 or 5);
					t=QQ("Frame",{Size=g(1,1),ZIndex=2,Parent=O});
					IQ(t,0);
					i.f=O;
					for n=1,Z,1 do 
						local O=QQ("TextButton",{Size=f(1/Z,0,1,0),Text=c[n],TextSize=13,LayoutOrder=n,ZIndex=2,Parent=t},{TextColor3="dim"});
						i.b[n]=O;
						GQ(O.MouseButton1Click,function()
							i:set(n,true);
						end);
						Ri(O,j,function()
							if i.i~=n then 
								w(O,{TextColor3=tQ.sub},0.1,gQ);
							end;
						end,function()
							if i.i~=n then 
								w(O,{TextColor3=tQ.dim},0.1,gQ);
							end;
						end);
					end;
					i:paint(false);
					i:place(false);
					return i;
				end;
				R.place=function(t,c)
					local n=g((t.i-1)/t.n,0);
					if c then 
						w(t.hl,{Position=n},0.22);
					else 
						t.hl.Position=n;
					end;
				end;
				R.paint=function(t,c)
					for n=1,#t.b,1 do 
						local O,j=n==t.i,t.b[n];
						j.FontFace=O and LQ.b or LQ.s;
						n=O and tQ.txt or tQ.dim;
						if c then 
							w(j,{TextColor3=n},0.14,gQ);
						else 
							j.TextColor3=n;
						end;
					end;
				end;
				R.set=function(R,t,c)
					if t==R.i then 
						return;
					elseif not(R.b[t])then 
						return;
					end;
					R.i=t;
					R:paint(true);
					R:place(true);
					if R.cb then 
						R.cb(t,c);
					end;
				end;
				ci.subtabs=function(R,t,c)
					local n=c or{};
					local c,O=R:free(),table.create(#t);
					local j=F(c,t,n.default or 1,function(F,Z)
						_Q(R.pop);
						for i=1,#O,1 do 
							if i~=F then 
								O[i].frame.Visible=false;
							end;
						end;
						fi(O[F].frame,true,0.2);
						if Z then 
							if n.cb then 
								k(n.cb,F,t[F]);
							end;
						end;
					end,R.pop);
					for F=1,#t,1 do 
						R.n=R.n+1;
						c=QQ("Frame",{Size=f(1,0,0,0),AutomaticSize=D,LayoutOrder=R.n,Visible=F==j.i,Parent=R.frame});
						MQ(c,6);
						local t=VQ(c,R.tab,R.pop);
						t.tmp,t.page,t.sec=R.tmp,R.page,R.sec;
						t.sub={s=j,i=F,up=R.sub};
						O[F]=t;
					end;
					R.cb=nil;
					return O;
				end;
				DQ=function(R)
					if R.tmp then 
						return;
					elseif R.dead then 
						return;
					elseif kQ.dead then 
						return;
					elseif kQ.eat then 
						return;
					end;
					local F=R.ind;
					local t=R.bnd;
					if not F and not t then 
						return;
					end;
					local c=ri({tmp=true,par=R.c and R.c.pop,title=R.name});
					local n,O,j,Z,i,W=c.c;
					if t then 
						i=n:keybind({name="Key",icon="keyboard",default=t.key,cb=function(KQ)
							if KQ then 
								if not(t.key)then 
									if Z then 
										if t.v==R.val then 
											R:setbv(R.val>=R.max and R.min or R.max);
											Z:set(t.v,true);
										end;
									end;
								end;
							end;
							if KQ then 
								if not(t.key)then 
									if F then 
										if not(F.on)then 
											F.on=true;
											if O then 
												O:set(true,true);
											end;
										end;
									end;
								end;
							end;
							R:setbind(KQ);
						end});
						n:dropdown({name="Mode",icon="refresh",values={"Hold","Toggle"},default=t.mode=="hold"and"Hold"or"Toggle",w=96,cb=function(KQ)
							R:setbind(t.key,KQ=="Hold"and"hold"or"toggle");
						end});
						if R.kind=="sld"then 
							Z=n:slider({name="Value",icon="sliders",min=R.min,max=R.max,dec=R.dec,step=R.step,suffix=R.suf,zero=R.zero,fmt=R.o.fmt,sw=56,default=t.v,cb=function(Z)
								R:setbv(Z);
							end});
						else 
						end;
						W=i;
					else 
						W=i;
					end;
					local Z;
					if F then 
						n:brk();
						O=n:toggle({name="Show in list",icon="eye",default=F.on,cb=function(i)
							F.on=i;
							pQ();
						end});
						j=n:input({name="List name",icon="pencil",placeholder=R.name,default=F.name,w=104,cb=function(i)
							F.name=i;
							pQ();
						end});
						Z=j;
					else 
						Z=j;
					end;
					c:hbtn("trash","bad",function()
						if t then 
							R:setbind(nil);
							if W then 
								W:setkey(nil,true);
							end;
						end;
						if F then 
							F.on=false;
							F.name="";
							if O then 
								O:set(false,true);
							end;
							if Z then 
								Z:set("",true);
							end;
						end;
						pQ();
					end);
					local F=R:rw();
					ai(F,true);
					c.onclose=function()
						ai(F,false);
					end;
					n=BQ();
					uQ(c,n.X+4,n.Y+4);
				end;end;
			local R;
				local F,t,c,n,O,j,Z,i,W,KQ={"User","FPS","Ping","CPU","RAM","Time"};
				do 
				local _Q=Font.new("rbxasset://fonts/families/SourceSansPro.json");
				local NQ,uQ=h(12,20,25),0.686274528503418;
				local xQ=h(210,220,230);
				local vQ=h(20,20,20);
				local function h(DQ)
					return(Q(Q(Q(Q(DQ,"<[^>]->",""),"&lt;","<"),"&gt;",">"),"&amp;","&"));
				end;
				local function DQ(Ni,ri)
					local Gi=QQ("TextLabel",{Position=l(1,1),Size=g(1,1),Text=Ni.RichText and h(Ni.Text)or Ni.Text,FontFace=Ni.FontFace,TextSize=Ni.TextSize,TextXAlignment=Ni.TextXAlignment,TextColor3=CQ,TextTransparency=ri or 0.2,ZIndex=Ni.ZIndex,Parent=Ni});
					local ri=QQ("TextLabel",{Size=g(1,1),Text=Ni.Text,RichText=Ni.RichText,FontFace=Ni.FontFace,TextSize=Ni.TextSize,TextXAlignment=Ni.TextXAlignment,TextColor3=Ni.TextColor3,ZIndex=Ni.ZIndex+1,Parent=Ni});
					Ni.TextTransparency=1;
					GQ(Ni:GetPropertyChangedSignal("Text"),function()
						ri.Text=Ni.Text;
						Gi.Text=Ni.RichText and h(Ni.Text)or Ni.Text;
					end);
					GQ(Ni:GetPropertyChangedSignal("TextColor3"),function()
						ri.TextColor3=Ni.TextColor3;
					end);
					return Ni,ri,Gi;
				end;
				local function h(Ni,ri)
					Ni.FontFace=_Q;
					Ni.TextSize=16;
					if Ni.AutomaticSize==nil then 
						Ni.AutomaticSize=V;
					end;
					if Ni.TextColor3==nil then 
						if not(ri)then 
							Ni.TextColor3=sQ;
						end;
					end;
					return DQ(QQ("TextLabel",Ni,ri),0.15);
				end;
				local function _Q(DQ,Ni)
					local ri=QQ("Frame",{Size=l(25,14),LayoutOrder=Ni,Parent=DQ});
					QQ("Frame",{AnchorPoint=s(0.5,0.5),Position=g(0.5,0.5),Size=l(1,14),BackgroundColor3=sQ,BackgroundTransparency=0.392,Parent=ri});
					return ri;
				end;
				local function DQ(Ni,ri,Gi,ai,mi,ci)
					return QQ("ImageLabel",{Size=l(mi,mi),Image=XQ(ri),ImageTransparency=ci,LayoutOrder=Gi,Parent=Ni},ai and{ImageColor3=ai}or nil);
				end;
				local function Ni(ri,Gi,ai)
					return QQ("Frame",{Size=l(Gi,1),LayoutOrder=ai,Parent=ri});
				end;
				local function ri(Gi,ai,mi)
					local ci=QQ("ImageLabel",{Size=l(18,18),Image="rbxthumb://type=AvatarHeadShot&id="..ai.."&w=48&h=48",ScaleType=Enum.ScaleType.Crop,BackgroundColor3=vQ,BackgroundTransparency=0,LayoutOrder=mi,Parent=Gi});
					AQ(ci);
					return ci;
				end;
				local function vQ(Gi,ai,mi)
					local ci,ni=pcall(Instance.new,"UIShadow");
					if ci then 
						if ni then 
							ni.BlurRadius=u(0,8);
							ni.Spread=l(2,2);
							ni.Transparency=0.5;
							ni.Parent=ai;
							return;
						end;
					end;
					ai=mi and jQ.pshadow or jQ.bshadow;
					if ai then 
						QQ("ImageLabel",{Image=ai,ScaleType=Enum.ScaleType.Slice,SliceCenter=mi and Rect.new(31,0,32,61)or Rect.new(24,24,28,28),Position=l(-14,-14),Size=mi and f(1,28,0,62)or f(1,28,1,28),ZIndex=0,Parent=Gi});
					end;
				end;
				local function u(jQ,Gi,ai,mi)
					local ci=QQ("Frame",{Size=l(0,34),LayoutOrder=ai or 0,Parent=jQ});
					jQ=QQ("Frame",{Size=g(1,1),BackgroundColor3=NQ,BackgroundTransparency=uQ,ZIndex=1,Parent=ci});
					if Gi then 
						AQ(jQ);
					else 
						SQ(jQ,17);
					end;
					vQ(ci,jQ,Gi);
					local NQ=QQ("Frame",{AnchorPoint=s(0,Gi and 0.5 or 0),Position=g(0,Gi and 0.5 or 0),Size=mi and f(1,0,0,0)or l(0,0),AutomaticSize=mi and D or V,ZIndex=2,Parent=ci});
					eQ(NQ,12,12,8,8);
					local function uQ()
						local jQ=NQ.AbsoluteSize;
						si(ci,mi and f(1,0,0,jQ.Y)or l(jQ.X,Gi and T(jQ.Y,34)or jQ.Y));
					end;
					GQ(NQ:GetPropertyChangedSignal("AbsoluteSize"),uQ);
					uQ();
					return ci,NQ,uQ;
				end;
				local function NQ(uQ,jQ,vQ)
					local Gi=QQ("Frame",{Size=f(1,0,0,20),LayoutOrder=0,Parent=uQ});
					IQ(Gi,0);
					DQ(Gi,jQ,1,"acc",18,0.392);
					Ni(Gi,8,2);
					h({Text=vQ,LayoutOrder=3,Parent=Gi});
					vQ=QQ("Frame",{Size=f(1,0,0,10),LayoutOrder=1,Parent=uQ});
					QQ("Frame",{AnchorPoint=s(0.5,0.5),Position=g(0.5,0.5),Size=f(1,0,0,1),BackgroundColor3=sQ,BackgroundTransparency=0.75,Parent=vQ});
					vQ=QQ("Frame",{Size=f(1,0,0,0),AutomaticSize=D,LayoutOrder=2,Parent=uQ});
					MQ(vQ,4);
					return vQ;
				end;
				t={on=true,rows={},q=false};
				local function uQ(jQ)
					local vQ=jQ.kind;
					if vQ=="tgl"then 
						local Gi=jQ:eff();
						return Gi and"ON"or"OFF",Gi and tQ.acc or xQ;
					elseif vQ=="sld"then 
						return jQ:fmtv(jQ:eff()),jQ.bnd.act and tQ.acc or xQ;
					elseif vQ=="drp"then 
						return jQ:text(),xQ;
					end;
					return"",xQ;
				end;
				local function jQ()
					local vQ=t.f;
					if vQ then 
						if kQ.dead then 
							return;
						end;
					else 
						return;
					end;
					local Gi,ai,mi,ci,ni=t.rows,{},iQ.els,0,0;
					for Oi=1,#mi,1 do 
						local ji=mi[Oi];
						Oi=ji.ind;
						if Oi and not ji.dead and not ji.dis and(Oi.on or ji.bnd and ji.bnd.key)then 
							ci+=1;
							ai[ji]=true;
							local mi=Gi[ji];
							if mi then 
							else 
								local Ei=QQ("Frame",{Size=f(1,0,0,20),Parent=vQ});
								local vQ,Pi,Ti=h({Size=l(0,20),AutomaticSize=p,TextColor3=xQ,Parent=Ei});
								local Yi,vi,Zi=h({AnchorPoint=s(1,0),Position=g(1,0),Size=l(0,20),AutomaticSize=p,TextXAlignment=b.Right,TextColor3=xQ,Parent=Ei});
								mi={f=Ei,n=vQ,v=Yi};
								Gi[ji]=mi;
								Pi.TextTransparency=1;
								Ti.TextTransparency=1;
								vi.TextTransparency=1;
								Zi.TextTransparency=1;
								w(Pi,{TextTransparency=0},0.22,gQ);
								w(vi,{TextTransparency=0},0.22,gQ);
								w(Ti,{TextTransparency=0.15},0.22,gQ);
								w(Zi,{TextTransparency=0.15},0.22,gQ);
								GQ(mi.n:GetPropertyChangedSignal("AbsoluteSize"),pQ);
								GQ(mi.v:GetPropertyChangedSignal("AbsoluteSize"),pQ);
							end;
							mi.f.LayoutOrder=10+ci;
							mi.n.Text=Oi.name~=""and Oi.name or ji.name;
							local vQ,Oi=uQ(ji);
							mi.v.Text=vQ;
							w(mi.v,{TextColor3=Oi},0.14,gQ);
							ni=T(ni,mi.n.AbsoluteSize.X+T(mi.v.AbsoluteSize.X,26)+2);
						else 
						end;
					end;
					for uQ,vQ in next,Gi,nil do 
						if not(ai[uQ])then 
							Gi[uQ]=nil;
							vQ.f:Destroy();
						end;
					end;
					Gi=t.g;
					si(Gi,l(24+T(132,P(ni+0.5)),0));
					zi(Gi,t.on and(kQ.open or ci>0));
				end;
				pQ=function()
					if t.q then 
						return;
					elseif t.f then 
						if kQ.dead then 
							return;
						end;
					else 
						return;
					end;
					t.q=true;
					d(function()
						t.q=false;
						jQ();
					end);
				end;
				local function uQ(jQ,vQ)
					local Gi=QQ("Frame",{Position=vQ,Size=l(156,0),AutomaticSize=D,Visible=false,Parent=jQ});
					jQ,vQ=u(Gi,false,0,true);
					MQ(vQ,0);
					t.g,t.f=Gi,NQ(vQ,"code","Keybinds");
					t.hh=QQ("TextButton",{Size=g(1,1),ZIndex=5,Visible=false,Parent=Gi});
					return Gi;
				end;
				c={on=true,use=false,rows={},list={},q=false};
				local function jQ()
					local vQ=c.f;
					if vQ then 
						if kQ.dead then 
							return;
						end;
					else 
						return;
					end;
					local Gi,ai,mi,ci,ni=c.rows,{},c.list,0,0;
					for Oi=1,#mi,1 do 
						local ji=mi[Oi];
						Oi=ji.id;
						if ai[Oi]then 
						else 
							ci+=1;
							ai[Oi]=true;
							local Ei=Gi[Oi];
							if Ei then 
							else 
								local Pi=QQ("Frame",{Size=f(1,0,0,20),Parent=vQ});
								IQ(Pi,0);
								local vQ=ri(Pi,Oi,1);
								Ni(Pi,8,2);
								local Ti,Yi,vi=h({Size=l(0,20),AutomaticSize=p,TextColor3=xQ,LayoutOrder=3,Parent=Pi});
								Ei={f=Pi,n=Ti};
								Gi[Oi]=Ei;
								vQ.ImageTransparency=1;
								vQ.BackgroundTransparency=1;
								Yi.TextTransparency=1;
								vi.TextTransparency=1;
								w(Yi,{TextTransparency=0},0.22,gQ);
								w(vi,{TextTransparency=0.15},0.22,gQ);
								w(vQ,{ImageTransparency=0,BackgroundTransparency=0},0.22,gQ);
								GQ(Ti:GetPropertyChangedSignal("AbsoluteSize"),R);
							end;
							Ei.f.LayoutOrder=10+ci;
							Ei.n.Text=ji.name;
							ni=T(ni,Ei.n.AbsoluteSize.X+26);
						end;
					end;
					for xQ,vQ in next,Gi,nil do 
						if not(ai[xQ])then 
							Gi[xQ]=nil;
							vQ.f:Destroy();
						end;
					end;
					si(c.g,l(24+T(132,P(ni+0.5)),0));
					mi,ai=c.g,c.use and c.on and(kQ.open or ci>0);
					zi(mi,ai);
				end;
				R=function()
					if c.q then 
						return;
					elseif c.f then 
						if kQ.dead then 
							return;
						end;
					else 
						return;
					end;
					c.q=true;
					d(function()
						c.q=false;
						jQ();
					end);
				end;
				local function xQ(jQ,vQ)
					local si=QQ("Frame",{AnchorPoint=s(1,0),Position=vQ,Size=l(156,0),AutomaticSize=D,Visible=false,Parent=jQ});
					vQ,jQ=u(si,false,0,true);
					MQ(jQ,0);
					c.g,c.f=si,NQ(jQ,"eye","Spectators");
					c.hh=QQ("TextButton",{Size=g(1,1),ZIndex=5,Visible=false,Parent=si});
					return si;
				end;
				iQ.spectators=function(NQ,jQ)
					NQ=c.list;
					e(NQ);
					if type(jQ)=="table"then 
						for vQ=1,#jQ,1 do 
							local si,Gi,ai=jQ[vQ];
							if typeof(si)=="Instance"and si:IsA("Player")then 
								Gi,ai=si.UserId,si.DisplayName;
							else 
								if type(si)=="table"then 
									Gi,ai=(tonumber(si.id)),si.name;
								else 
								end;
							end;
							if Gi then 
								if ai~=nil then 
									si,vQ=#NQ+1,{id=Gi};
									vQ.name,NQ[si]=tostring(ai),vQ;
								end;
							end;
						end;
					end;
					R();
				end;
				n={on=true,show={"User","FPS","Ping","RAM","Time"},title="polar",v={},n=0};
				local NQ={FPS="layers",Ping="wifi",CPU="cpu",RAM="ram",Time="clock"};
				local function jQ()
					local vQ,si=pcall(function()
						return m.PerformanceStats.CPU:GetValue();
					end);
					if(if vQ then type(si)~="number"else not vQ)or si<=0 then 
						vQ,si=pcall(function()
							return m.RenderCPUFrameTime*1000;
						end);
					else 
					end;
					if vQ then 
						if type(si)~="number"then 
							return nil;
						elseif si<=0 then 
							return nil;
						end;
					else 
						return nil;
					end;
					return E(P(si*T(kQ.fps or 60,1)/10+0.5),0,100);
				end;
				O=function()
					local vQ=n.nl;
					if not(vQ)then 
						return;
					end;
					vQ.Text=n.title;
					vQ=n.v;
					if vQ.User then 
						vQ.User.Text=N.Name;
					end;
					if vQ.FPS then 
						vQ.FPS.Text=tostring(kQ.fps or 0);
					end;
					if vQ.Ping then 
						local si,Gi=pcall(N.GetNetworkPing,N);
						vQ.Ping.Text=P((si and Gi or 0)*1000+0.5).."ms";
					end;
					if vQ.CPU then 
						local si=jQ();
						vQ.CPU.Text=si and si.."%"or"-";
					end;
					if vQ.RAM then 
						local jQ,si=pcall(m.GetTotalMemoryUsageMb,m);
						vQ.RAM.Text=(jQ and P(si+0.5)or 0).."mb";
					end;
					if vQ.Time then 
						vQ.Time.Text=os.date("%H:%M");
					end;
				end;
				j=function()
					local m=n.f;
					if not(m)then 
						return;
					end;
					local jQ=m:GetChildren();
					for vQ=1,#jQ,1 do 
						if jQ[vQ]:IsA("GuiObject")then 
							jQ[vQ]:Destroy();
						end;
					end;
					jQ={};
					n.v=jQ;
					local vQ=0;
					for si=1,#F,1 do 
						local Gi=F[si];
						if J(n.show,Gi)then 
							vQ+=1;
							if vQ>1 then 
								_Q(m,si*2-1);
							end;
							local ai=QQ("Frame",{Size=l(0,0),AutomaticSize=V,LayoutOrder=si*2,Parent=m});
							IQ(ai,0);
							if Gi=="User"then 
								ri(ai,N.UserId,1);
							else 
								DQ(ai,NQ[Gi],1,nil,14,0.392);
							end;
							Ni(ai,8,2);
							jQ[Gi]=h({LayoutOrder=3,Parent=ai});
						else 
						end;
					end;
					n.n=vQ;
					n.p2.Visible=vQ>0;
					O();
				end;
				local function N(m,NQ)
					local jQ=QQ("Frame",{AnchorPoint=s(1,0),Position=NQ,Size=l(0,0),AutomaticSize=V,Visible=false,Parent=m});
					m=QQ("Frame",{Size=l(0,0),AutomaticSize=V,Parent=jQ});
					IQ(m,10,H.Right);
					local vQ,vQ=u(m,true,1);
					IQ(vQ,0);
					DQ(vQ,"code",1,nil,18,0.392);
					Ni(vQ,8,2);
					n.nl=h({LayoutOrder=3,Parent=vQ});
					NQ,vQ=u(m,true,2);
					IQ(vQ,0);
					n.g,n.p2,n.f=jQ,NQ,vQ;
					n.hh=QQ("TextButton",{Size=g(1,1),ZIndex=10,Visible=false,Parent=jQ});
					j();
					return jQ;
				end;
				Z={on=true,n=0,l={}};
				local m={ok="ok",bad="bad",warn="warn"};
				local function NQ(jQ)
					local vQ=J(Z.l,jQ);
					if vQ then 
						y(Z.l,vQ);
					end;
					li(jQ);
				end;
				iQ.notify=function(y,jQ,vQ,li)
					y=Z.f;
					if y then 
						if kQ.dead then 
							return;
						elseif not(Z.on)then 
							return;
						end;
					else 
						return;
					end;
					Z.n=Z.n+1;
					local si,ri=m[vQ]or"acc",QQ("Frame",{Size=l(0,34),LayoutOrder=Z.n,Parent=y});
					local m,y,Gi=u(ri,true);
					m.Visible=false;
					IQ(y,0);
					DQ(y,"code",1,si,18,0.15);
					Ni(y,8,2);
					h({Text=kQ.brand or"polar",LayoutOrder=3,Parent=y},{TextColor3=si});
					_Q(y,4);
					h({Text=YQ(tostring(jQ),tQ.acc),RichText=true,LayoutOrder=5,Parent=y});
					Gi();
					ri.Size=l(y.AbsoluteSize.X,34);
					GQ(m:GetPropertyChangedSignal("AbsoluteSize"),function()
						ri.Size=l(m.AbsoluteSize.X,34);
					end);
					vQ=Z.l;
					vQ[#vQ+1]=ri;
					while#vQ>6 do 
						NQ(vQ[1]);
					end;
					fi(m,true,0.24,nil,true);
					B(li or 4,function()
						if ri.Parent then 
							if kQ.dead then 
								return;
							end;
						else 
							return;
						end;
						fi(m,false,0.3,nil,true,function()
							NQ(ri);
						end);
					end);
				end;
				iQ.log=function(h,u,m,y)
					return h:notify(u,m,y);
				end;
				i,W,KQ=uQ,N,xQ;end;
			local N={};
				N.__index=N;
				local function h(u,m,y,_Q)
					local NQ=QQ("Frame",{Size=g(1,1),Visible=false,Parent=u.frame});
					eQ(NQ,10,10,0,0);
					return setmetatable({tab=u,name=m,i=y,frame=NQ,sn=0,cols={},nc=E(P(tonumber(_Q and _Q.cols)or 2),1,4)},N);
				end;
				N.col=function(u,m)
					local y=u.cols;
					m=E(P(tonumber(m)or 1),1,4);
					if m>u.nc then 
						u.nc=m;
					end;
					local _Q=u.nc;
					if#y<_Q then 
						for NQ=#y+1,_Q,1 do 
							local uQ=QQ("ScrollingFrame",{ScrollBarThickness=0,Parent=u.frame});
							eQ(uQ,2,2,10,12);
							MQ(uQ,8);
							y[NQ]=uQ;
						end;
						for u=1,_Q,1 do 
							y[u].Position=f((u-1)/_Q,(u-1)*8/_Q,0,0);
							y[u].Size=f(1/_Q,-(_Q-1)*8/_Q,1,0);
						end;
					end;
					return y[m];
				end;
				N.section=function(u,m)
					m=(if type(m)=="string"then{name=m}else m)or{};
					local y=m.side;
					local _Q=u:col(tonumber(if y=="left"then 1 else if y=="right"then u.nc>2 and u.nc or 2 else if y=="center"then 2 else if y=="middle"then 2 else y)or 1);
					u.sn=u.sn+1;
					local y=QQ("Frame",{Size=f(1,0,0,0),AutomaticSize=D,LayoutOrder=u.sn,Parent=_Q});
					MQ(y,6);
					_Q=VQ(y,u.tab);
					_Q.page=u;
					_Q.sec={name=m.name or"",page=u,frame=y};
					if m.name then 
						if m.name~=""then 
							_Q.n=_Q.n+1;
							u=QQ("Frame",{Size=f(1,0,0,14),LayoutOrder=_Q.n,Parent=y});
							QQ("TextLabel",{Position=l(10,0),Size=f(1,-10,1,0),Text=m.name,FontFace=LQ.s,TextSize=12,TextTruncate=UQ,Parent=u},{TextColor3="dim"});
						end;
					end;
					return _Q;
				end;
				local u={};
				u.__index=u;
				u.pgdraw=function(m)
					local y=m.pages;
					local D=#y>1;
					for _Q=1,#y,1 do 
						local NQ=y[_Q];
						local y,_Q=NQ==m.pg,NQ.btn;
						_Q.Visible=D;
						_Q.FontFace=y and LQ.b or LQ.s;
						w(_Q,{TextColor3=y and tQ.txt or(NQ.hov and tQ.sub or tQ.dim)},0.14,gQ);
					end;
				end;
				u.page=function(m,y,D)
					if type(y)=="table"then 
						y,D=y.name,y;
					else 
					end;
					local _Q=m.pages;
					local NQ=h(m,y or"Main",#_Q+1,D);
					_Q[#_Q+1]=NQ;
					_Q=QQ("TextButton",{Size=l(0,40),AutomaticSize=p,Text=NQ.name,TextSize=13,LayoutOrder=NQ.i,Parent=m.tr},{TextColor3="dim"});
					NQ.btn=_Q;
					Ri(_Q,nil,function()
						NQ.hov=true;
						m:pgdraw();
					end,function()
						NQ.hov=false;
						m:pgdraw();
					end);
					GQ(_Q.MouseButton1Click,function()
						m:show(NQ.i);
					end);
					if not(m.pg)then 
						m.pg=NQ;
						NQ.frame.Visible=true;
					end;
					m:pgdraw();
					return NQ;
				end;
				u.show=function(h,m)
					local y=h.pages[m];
					if y then 
						if y==h.pg then 
							return;
						end;
					else 
						return;
					end;
					_();
					fi(h.pg.frame,false,0.12);
					h.pg=y;
					fi(y.frame,true,0.2,0.07);
					h:pgdraw();
				end;
				u.section=function(h,m)
					return(h.pages[1]or h:page("Main")):section(m);
				end;
				u.navdraw=function(h)
					local m=h.win.cur==h;
					local y=h.hov and not m;
					h.nl.FontFace=m and LQ.b or LQ.s;
					local D,_Q,NQ=h.ni,{},m and tQ.acc or(y and tQ.sub or tQ.dim);
					_Q.ImageColor3=NQ;
					w(D,_Q,0.14,gQ);
					D,NQ,_Q=h.nl,{},m and tQ.txt or(y and tQ.sub or tQ.dim);
					NQ.TextColor3=_Q;
					w(D,NQ,0.14,gQ);
				end;
				u.hc=function(h)
					local m=h.hcc;
					if m then 
					else 
						m=VQ(h.tl,h,nil);
						h.hcc=m;
					end;
					return m;
				end;
				u.tbdrop=function(h,m)
					m=m or{};
					m.noprof=true;
					h.tn=h.tn+1;
					m.par=h.tl;
					m.lo=h.tn;
					m.auto=true;
					m.h=m.h or 24;
					return h:hc():dropdown(m);
				end;
				local h={};
				h.__index=h;
				u.profile=function(m,y)
					y=y or{};
					local D=y.global or"Global";
					local _Q,NQ={D},y.items or{};
					for uQ=1,#NQ,1 do 
						if NQ[uQ]~=D then 
							_Q[#_Q+1]=NQ[uQ];
						end;
					end;
					local NQ=setmetatable({tab=m,items=_Q,g=D,data={},els={},id=y.id or y.flag or m.name},h);
					NQ.cur=J(_Q,y.default)and y.default or D;
					m.prof=NQ;
					NQ.idd=m:tbdrop({values=_Q,default=NQ.cur,cb=function(m)
						NQ:select(m);
					end});
					iQ.profs[#iQ.profs+1]=NQ;
					return NQ;
				end;
				h.store=function(m)
					local y=tostring(m.cur);
					local D=m.data[y];
					if D then 
					else 
						if not(m.dirty)then 
							if y~=m.g then 
								return;
							end;
						end;
						D={};
						m.data[y]=D;
					end;
					y=m.els;
					for _Q=1,#y,1 do 
						m=y[_Q];
						D[m.flag]=m:ser();
					end;
				end;
				h.apply=function(m)
					local y=tostring(m.cur);
					local D=m.data[y];
					D=if D==nil then if y~=m.g then m.data[m.g]else D else D;
					m.ld=true;
					y=m.els;
					for _Q=1,#y,1 do 
						local NQ=y[_Q];
						_Q=D and D[NQ.flag];
						NQ:load(if _Q==nil then NQ.def else _Q);
					end;
					m.ld=false;
					m.dirty=false;
					if m.cb then 
						k(m.cb,m.cur);
					end;
				end;
				h.select=function(m,y)
					if y==m.cur then 
						return;
					elseif not(J(m.items,y))then 
						return;
					end;
					m:store();
					m.cur=y;
					if m.idd.val~=y then 
						m.idd:set(y,true);
					end;
					m:apply();
				end;
				h.spread=function(m,y)
					local D=y.flag;
					for _Q,NQ in next,m.data,nil do 
						if _Q~=m.g then 
							NQ[D]=y:ser();
						end;
					end;
				end;
				h.get=function(m,y,D)
					local _Q=tostring(m.cur);
					D=D~=nil and tostring(D)or _Q;
					D=if _Q==m.g then m.g else if J(m.items,D)then D else m.g;
					if D==_Q then 
						return iQ.flags[y];
					end;
					_Q=m.data[D];
					if _Q==nil then 
						if D~=m.g then 
							return m:get(y,m.g);
						end;
					end;
					local m,D=iQ.fl[y],_Q and _Q[y];
					D=if D==nil then m and m.def else D;
					return if m then(m:unser(D))else D;
				end;
				h.ser=function(m)
					m:store();
					return{cur=m.cur,data=m.data};
				end;
				h.load=function(h,m)
					if type(m)~="table"then 
						return;
					end;
					h.data=type(m.data)=="table"and m.data or{};
					if m.cur~=nil then 
						if J(h.items,m.cur)then 
							h.cur=m.cur;
							h.idd:set(m.cur,true);
						end;
					end;
					h:apply();
				end;
				local h={};
				h.__index=h;
				h.group=function(m)
					return m;
				end;
				h.barhl=function(m,y)
					local D=m.cur;
					if not(D)then 
						return;
					end;
					local _Q=D.nb;
					if _Q.AbsoluteSize.X<=0 then 
						return;
					end;
					D=nQ();
					local NQ,uQ=(_Q.AbsolutePosition-m.bls.AbsolutePosition)/D,_Q.AbsoluteSize/D;
					_Q,D=l(NQ.X,NQ.Y),l(uQ.X,uQ.Y);
					if y then 
						w(m.bhl,{Position=_Q,Size=D},0.24);
					else 
						m.bhl.Position,m.bhl.Size=_Q,D;
					end;
				end;
				h.tab=function(m,y)
					y=(if type(y)=="string"then{name=y}else y)or{};
					m.nn=m.nn+1;
					local D=setmetatable({win=m,o=y,name=y.name or"Tab",pages={},tn=0},u);
					local _Q=QQ("TextButton",{Size=l(0,26),AutomaticSize=p,LayoutOrder=m.nn,ZIndex=4,Parent=m.bls});
					eQ(_Q,10,12,0,0);
					IQ(_Q,6);
					D.ni=QQ("ImageLabel",{Size=l(13,13),Image=XQ(y.icon or"misc"),LayoutOrder=1,ZIndex=4,Parent=_Q},{ImageColor3="dim"});
					D.nl=QQ("TextLabel",{Size=l(0,26),AutomaticSize=p,Text=D.name,TextSize=13,LayoutOrder=2,ZIndex=4,Parent=_Q},{TextColor3="dim"});
					D.nb=_Q;
					D.frame=QQ("Frame",{Size=g(1,1),Visible=false,Parent=m.body});
					D.tl=QQ("Frame",{Size=l(0,40),AutomaticSize=p,Visible=false,LayoutOrder=10+m.nn,Parent=m.tl});
					IQ(D.tl,8);
					D.tr=QQ("Frame",{Size=l(0,40),AutomaticSize=p,Visible=false,Parent=m.tr});
					IQ(D.tr,16,H.Right);
					Ri(_Q,nil,function()
						D.hov=true;
						D:navdraw();
					end,function()
						D.hov=false;
						D:navdraw();
					end);
					GQ(_Q.MouseButton1Click,function()
						m:select(D);
					end);
					GQ(_Q:GetPropertyChangedSignal("AbsoluteSize"),function()
						if m.cur==D then 
							m:barhl(true);
						end;
					end);
					_Q=m.tabs;
					_Q[#_Q+1]=D;
					if m.cur then 
						D:navdraw();
					else 
						m:select(D);
					end;
					return D;
				end;
				h.select=function(m,y)
					local D=m.cur;
					if D==y then 
						return;
					end;
					_();
					m.cur=y;
					if D then 
						fi(D.frame,false,0.12);
						D.tl.Visible=false;
						D.tr.Visible=false;
						D:navdraw();
					end;
					fi(y.tl,true,0.2);
					fi(y.tr,true,0.2);
					fi(y.frame,true,0.2,D and 0.07 or nil);
					y:navdraw();
					m:barhl(D~=nil);
					d(function()
						if m.cur==y then 
							m:barhl(D~=nil);
						end;
					end);
				end;
				h.toggle=function(m,y)
					iQ:toggle(y);
					return m;
				end;
				local function m()
				end;
				local y,D;
				do 
				y=function()
					return iQ.dir.."/configs";
				end;
				local function _Q(NQ)
					return y().."/"..NQ..".json";
				end;
				local function NQ(uQ)
					return L(S(Q(tostring(uQ or""),"[\\/:%*%?\"<>|]",""),"^%s*(.-)%s*$")or"",1,40);
				end;
				local function L()
					return os.date("%Y-%m-%d %H:%M");
				end;
				local function Q(uQ)
					if not(uQ)then 
						return nil;
					end;
					local xQ=gi(uQ);
					return{xQ.X.Scale,xQ.X.Offset,xQ.Y.Scale,xQ.Y.Offset};
				end;
				local function uQ(xQ)
					if type(xQ)=="table"then 
						if#xQ==4 then 
							return f(tonumber(xQ[1])or 0,tonumber(xQ[2])or 0,tonumber(xQ[3])or 0,tonumber(xQ[4])or 0);
						end;
					end;
					return nil;
				end;
				local function xQ()
					local jQ=kQ.hold;
					return{kbp=t and Q(t.g),wmp=n and Q(n.g),spp=c and Q(c.g),mob=Q(kQ.mob),size=jQ and{jQ.Size.X.Offset,jQ.Size.Y.Offset}or nil};
				end;
				local function Q(jQ)
					if type(jQ)~="table"then 
						return;
					end;
					local YQ=uQ(jQ.kbp);
					if YQ then 
						if t then 
							if t.g then 
								ui(t.g,YQ);
							end;
						end;
					end;
					YQ=uQ(jQ.wmp);
					if YQ then 
						if n then 
							if n.g then 
								ui(n.g,YQ);
							end;
						end;
					end;
					YQ=uQ(jQ.spp);
					if YQ then 
						if c then 
							if c.g then 
								ui(c.g,YQ);
							end;
						end;
					end;
					YQ=uQ(jQ.mob);
					if YQ then 
						if kQ.mob then 
							ui(kQ.mob,YQ);
						end;
					end;
					local uQ,YQ=jQ.size,kQ.hold;
					if YQ then 
						if type(uQ)=="table"then 
							if tonumber(uQ[1])then 
								if tonumber(uQ[2])then 
									YQ.Size=l(T(680,P(tonumber(uQ[1]))),T(400,P(tonumber(uQ[2]))));
								end;
							end;
						end;
					end;
					WQ();
				end;
				local function uQ()
					local jQ,YQ={flags={},binds={},inds={},profs={},ui=xQ()},iQ.profs;
					for xQ=1,#YQ,1 do 
						local vQ=YQ[xQ];
						jQ.profs[vQ.id]=vQ:ser();
					end;
					YQ=iQ.els;
					for xQ=1,#YQ,1 do 
						local vQ=YQ[xQ];
						xQ=vQ.flag;
						if xQ and vQ.o.nocfg then 
							jQ.flags[xQ]=vQ:ser();
						elseif xQ then 
							if not(vQ.prof)then 
								jQ.flags[xQ]=vQ:ser();
							end;
							local YQ=vQ.bnd;
							if YQ and(YQ.key or vQ.kind=="sld"and YQ.v~=vQ.val)then 
								jQ.binds[xQ]={k=YQ.key,m=YQ.mode,v=YQ.v};
							end;
							YQ=vQ.ind;
							if YQ and(YQ.on or YQ.name~="")then 
								jQ.inds[xQ]={on=YQ.on,n=YQ.name};
							end;
						end;
					end;
					return jQ;
				end;
				local function xQ(jQ)
					if type(jQ)~="table"then 
						return false;
					end;
					local YQ,vQ,DQ,Ni,fi=type(jQ.flags)=="table"and jQ.flags or{},type(jQ.binds)=="table"and jQ.binds or{},type(jQ.inds)=="table"and jQ.inds or{},type(jQ.profs)=="table"and jQ.profs or{},iQ.els;
					for li=1,#fi,1 do 
						local si=fi[li];
						li=si.flag;
						if li and si.o.nocfg then 
							local ri=YQ[li];
							if ri~=nil then 
								si:load(ri);
							end;
						elseif li then 
							if not(si.prof)then 
								local ri=YQ[li];
								si:load(if ri==nil then si.def else ri);
							end;
							local ri=si.bnd;
							if ri then 
								local Gi,ai,mi=vQ[li];
								if type(Gi)=="table"then 
									ai,mi=type(Gi.k)=="string"and Gi.k or nil,(Gi.m=="hold"or Gi.m=="toggle")and Gi.m or nil;
									if si.kind=="sld"then 
										if type(Gi.v)=="number"then 
											ri.v=si:rnd(Gi.v);
										end;
									end;
								else 
									if si.kind=="sld"then 
										ri.v=si.val;
									end;
								end;
								if ri.key~=ai then 
									si:setbind(ai,mi);
								elseif mi then 
									if ri.mode~=mi then 
										si:setbind(ai,mi);
									end;
								end;
							end;
							ri=si.ind;
							if ri then 
								local vQ=DQ[li];
								if type(vQ)=="table"then 
									ri.on=vQ.on==true;
									ri.name=type(vQ.n)=="string"and vQ.n or"";
								else 
									ri.on=si.o.ind~=nil and si.o.ind~=false;
									ri.name=type(si.o.ind)=="string"and si.o.ind or"";
								end;
							end;
						end;
					end;
					YQ=iQ.profs;
					for vQ=1,#YQ,1 do 
						fi=YQ[vQ];
						DQ=Ni[fi.id];
						if type(DQ)=="table"then 
							fi:load(DQ);
						else 
							fi.data={};
							fi:apply();
						end;
					end;
					Q(jQ.ui);
					pQ();
					return true;
				end;
				local function Q(jQ,YQ)
					local vQ=aQ({meta={name=jQ,modified=L(),ver=iQ.ver},data=YQ});
					return vQ~=nil and cQ.write(_Q(jQ),vQ);
				end;
				local function jQ(YQ)
					kQ.cfg=YQ;
					cQ.write(iQ.dir.."/last.txt",YQ or"");
				end;
				local function YQ(vQ)
					if type(vQ)~="string"then 
						return nil;
					elseif vQ==""then 
						return nil;
					end;
					local DQ=mQ(vQ);
					if DQ then 
					else 
						local Ni,fi=pcall(rQ,vQ);
						DQ=if Ni then(mQ(fi))else DQ;
					end;
					if DQ then 
						if type(DQ.data)=="table"then 
							return DQ.data;
						end;
					end;
					return DQ;
				end;
				local rQ={seen={},busy={},get=false,pack=function(vQ)
					local DQ=YQ(vQ);
					if type(DQ)~="table"then 
						return nil;
					elseif type(DQ.flags)~="table"then 
						return nil;
					end;
					vQ={};
					for Ni,fi in next,DQ.flags,nil do 
						local li=iQ.fl[Ni];
						if li then 
							if not(li.o.nocfg)then 
								vQ[Ni]=fi;
							end;
						else 
							vQ[Ni]=fi;
						end;
					end;
					return aQ({data={flags=vQ,binds=DQ.binds,inds=DQ.inds,profs=DQ.profs}});
				end,fail=function(vQ,DQ)
					if vQ==404 then 
						return"Share code {"..tostring(DQ).."} not found";
					elseif vQ==429 then 
						return"Too many share requests, wait a minute";
					elseif vQ==413 then 
						return"Config is too big to share";
					elseif vQ==400 then 
						return"Config can not be shared";
					end;
					return"Share server is not responding";
				end,names=function()
					local vQ,DQ={},cQ.list(y());
					for Ni=1,#DQ,1 do 
						local fi=S(DQ[Ni],"([^/\\]+)%.json$");
						if fi then 
							vQ[#vQ+1]=fi;
						end;
					end;
					I(vQ);
					return M(vQ,"\0");
				end};
				iQ.export=function(M)
					return aQ({meta={name=kQ.cfg or"shared",modified=L(),ver=iQ.ver},data=uQ()});
				end;
				iQ.share=function(L)
					local M=L:export();
					return M and qQ(M)or nil;
				end;
				iQ.import=function(L,M)
					L=YQ(M);
					if not L then 
						return false;
					end;
					return xQ(L);
				end;
				iQ.save=function(L,M)
					M=NQ(M or kQ.cfg or"default");
					M=if M==""then"default"else M;
					if Q(M,uQ())then 
						jQ(M);
						L:notify("Saved config {"..M.."}","ok");
						m();
						return true;
					end;
					return false;
				end;
				iQ.load=function(L,M)
					M=NQ(M);
					local vQ=YQ(cQ.read(_Q(M)));
					if not(vQ)then 
						L:notify("Config {"..M.."} is broken","bad");
						return false;
					end;
					xQ(vQ);
					jQ(M);
					L:notify("Loaded config {"..M.."}","ok");
					m();
					return true;
				end;
				iQ.create=function(L,M,vQ)
					M=NQ(M);
					if M==""then 
						L:notify("Enter a config name","warn");
						return false;
					end;
					if cQ.has(_Q(M))then 
						L:notify("Config {"..M.."} already exists","warn");
						return false;
					end;
					vQ=S(tostring(vQ or""),"^%s*(.-)%s*$")or"";
					if vQ~=""then 
						if rQ.get then 
							return false;
						end;
						local DQ,Ni=kQ.share;
						if DQ then 
							if#vQ<=32 then 
								rQ.get=true;
								local fi,li,si=pcall(DQ.get,vQ);
								rQ.get=false;
								if kQ.dead then 
									return false;
								end;
								local DQ=fi and YQ(li)or nil;
								if not(DQ)then 
									L:notify(rQ.fail(fi and si,vQ),"bad");
									return false;
								end;
								Ni=DQ;
							else 
								Ni=(YQ(vQ));
							end;
						else 
							Ni=(YQ(vQ));
						end;
						if not(Ni)then 
							L:notify("Share code is invalid","bad");
							return false;
						end;
						if cQ.has(_Q(M))then 
							L:notify("Config {"..M.."} already exists","warn");
							return false;
						end;
						xQ(Ni);
					end;
					Q(M,uQ());
					jQ(M);
					L:notify("Created config {"..M.."}","ok");
					m();
					return true;
				end;
				iQ.sharecode=function(L,Q)
					Q=NQ(Q);
					local M=cQ.read(_Q(Q));
					if not(M)then 
						return nil;
					end;
					local uQ=kQ.share;
					if not(uQ)then 
						setclipboard(qQ(M));
						L:notify("Share code for {"..Q.."} copied");
						return true;
					end;
					local qQ=rQ.seen[Q];
					if qQ then 
						if qQ.raw==M then 
							setclipboard(qQ.code);
							L:notify("Share code {"..qQ.code.."} for {"..Q.."} copied","ok");
							return qQ.code;
						end;
					end;
					if rQ.busy[Q]then 
						return nil;
					end;
					qQ=rQ.pack(M);
					if not qQ then 
						L:notify("Config {"..Q.."} is broken","bad");
						return nil;
					end;
					rQ.busy[Q]=true;
					local xQ,YQ,vQ=pcall(uQ.put,qQ);
					rQ.busy[Q]=nil;
					if kQ.dead then 
						return nil;
					end;
					if(if xQ then type(YQ)~="string"else not xQ)or YQ==""then 
						L:notify(rQ.fail(xQ and vQ),"bad");
						return nil;
					end;
					rQ.seen[Q]={raw=M,code=YQ};
					setclipboard(YQ);
					L:notify("Share code {"..YQ.."} for {"..Q.."} copied","ok");
					return YQ;
				end;
				iQ.delete=function(L,Q)
					Q=NQ(Q);
					cQ.del(_Q(Q));
					if kQ.cfg==Q then 
						jQ(nil);
					end;
					L:notify("Deleted config {"..Q.."}");
					m();
				end;
				iQ.rename=function(L,Q,M)
					Q,M=NQ(Q),NQ(M);
					if M==""then 
						return false;
					elseif Q==M then 
						return false;
					elseif cQ.has(_Q(M))then 
						return false;
					end;
					local uQ=mQ(cQ.read(_Q(Q)));
					if not(uQ)then 
						return false;
					end;
					if type(uQ.meta)=="table"then 
						uQ.meta.name=M;
					end;
					local qQ=aQ(uQ);
					if qQ then 
						if not(cQ.write(_Q(M),qQ))then 
							return false;
						end;
					else 
						return false;
					end;
					cQ.del(_Q(Q));
					if kQ.cfg==Q then 
						jQ(M);
					end;
					L:notify("Renamed {"..Q.."} to {"..M.."}");
					m();
					return true;
				end;
				iQ.list=function(L)
					local Q,M={},cQ.list(y());
					for uQ=1,#M,1 do 
						L=M[uQ];
						uQ=S(L,"([^/\\]+)%.json$");
						if uQ then 
							local S=mQ(cQ.read(L));
							local L,M,qQ=S and S.meta,#Q+1,{name=uQ};
							qQ.modified,Q[M]=type(L)=="table"and tostring(L.modified or"")or"",qQ;
						end;
					end;
					I(Q,function(L,S)
						return X(L.name)<X(S.name);
					end);
					return Q;
				end;
				iQ.current=function(L)
					return kQ.cfg;
				end;
				iQ.get=function(L,X)
					return L.flags[X];
				end;
				iQ.set=function(L,X,Q,S)
					local M=L.fl[X];
					if not(M)then 
						return nil;
					end;
					if M.kind=="cpk"then 
						M:set(Q,S);
					else 
						M:set(Q);
					end;
					return M;
				end;
				iQ.el=function(L,X)
					return L.fl[X];
				end;
				iQ.onunload=function(L,L)
					kQ.unl[#kQ.unl+1]=L;
				end;
				local function L(X,Q,S,M,I)
					local uQ=QQ("ImageButton",{Size=l(22,22),BackgroundColor3=sQ,BackgroundTransparency=1,LayoutOrder=S,ZIndex=3,Parent=X});
					SQ(uQ,5);
					local X=QQ("ImageLabel",{AnchorPoint=s(0.5,0.5),Position=g(0.5,0.5),Size=l(13,13),Image=XQ(Q),ZIndex=3,Parent=uQ},{ImageColor3=I or"dim"});
					Ri(uQ,M,function()
						w(uQ,{BackgroundTransparency=ZQ.ctl},0.1);
						w(X,{ImageColor3=tQ.txt},0.1);
					end,function()
						w(uQ,{BackgroundTransparency=1},0.1);
						w(X,{ImageColor3=tQ[I or"dim"]},0.1);
					end);
					return uQ,X;
				end;
				local function X(Q,S)
					local M=S.name;
					local I=kQ.cfg==M;
					local uQ=Q:add(30);
					local Q=QQ("TextLabel",{Position=l(12,0),Size=f(1,-230,1,0),Text=M,FontFace=I and LQ.b or LQ.s,TextSize=13,TextTruncate=UQ,ZIndex=2,Parent=uQ},{TextColor3=I and"acc"or"txt"});
					QQ("TextLabel",{AnchorPoint=s(1,0),Position=f(1,-108,0,0),Size=l(110,30),Text=S.modified~=""and S.modified or"never saved",TextSize=11,TextXAlignment=b.Right,ZIndex=2,Parent=uQ},{TextColor3="dim"});
					S=QQ("Frame",{AnchorPoint=s(1,0.5),Position=f(1,-6,0.5,0),Size=l(0,22),AutomaticSize=p,ZIndex=3,Parent=uQ});
					IQ(S,2,H.Right);
					local b,qQ,xQ,jQ,YQ=L(S,I and"save"or"load",1),L(S,"copy",2),L(S,"pencil",3),L(S,"trash",4);
					GQ(b.MouseButton1Click,function()
						if I then 
							iQ:save(M);
						else 
							iQ:load(M);
						end;
					end);
					GQ(qQ.MouseButton1Click,function()
						k(iQ.sharecode,iQ,M);
					end);
					local L=false;
					GQ(jQ.MouseButton1Click,function()
						if L then 
							iQ:delete(M);
							return;
						end;
						L=true;
						w(YQ,{ImageColor3=tQ.bad},0.12);
						iQ:notify("Click again to delete {"..M.."}","warn",2.5);
						B(2.5,function()
							if YQ.Parent then 
								L=false;
								w(YQ,{ImageColor3=tQ.dim},0.12);
							end;
						end);
					end);
					GQ(xQ.MouseButton1Click,function()
						Q.Visible=false;
						local L=QQ("TextBox",{Position=l(8,4),Size=f(1,-226,0,22),BackgroundColor3=sQ,BackgroundTransparency=ZQ.ctl,Text=M,TextSize=13,ZIndex=4,Parent=uQ});
						SQ(L,5);
						JQ(L,0.5,tQ.acc);
						eQ(L,4,4,0,0);
						GQ(L.FocusLost,function(S)
							local I=NQ(L.Text);
							L:Destroy();
							Q.Visible=true;
							if S then 
								if I~=""then 
									if I~=M then 
										iQ:rename(M,I);
									end;
								end;
							end;
						end);
						L:CaptureFocus();
					end);
					return uQ;
				end;
				local function L()
					if not(kQ.dead)then 
						if rQ.names()~=rQ.sig then 
							m();
						end;
					end;
				end;
				m=function()
					if kQ.dead then 
						return;
					end;
					rQ.sig=rQ.names();
					local Q,S=iQ:list(),kQ.cfgl;
					if S then 
						S(Q);
					end;
					S=kQ.cdd;
					if S then 
						local M=table.create(#Q);
						for I=1,#Q,1 do 
							M[I]=Q[I].name;
						end;
						S.values=M;
						S.val=kQ.cfg and J(M,kQ.cfg)and kQ.cfg or nil;
						S:draw();
					end;
				end;
				N.configs=function(Q,S)
					S=S or{};
					local M=Q:section({name="Configs"}):blk();
					function kQ.cfgl(I)
						M:clear();
						if#I==0 then 
							local k=M:add(30,true);
							QQ("TextLabel",{Position=l(12,0),Size=f(1,-24,1,0),Text="No configs yet. Create one on the right.",TextSize=13,TextTruncate=UQ,Parent=k},{TextColor3="dim"});
							return;
						end;
						for k=1,#I,1 do 
							X(M,I[k]);
						end;
					end;
					local X=Q:section({name="Create",side=2});
					X.tmp=true;
					local M=X:input({placeholder="Config name",nosearch=true});
					local I=X:input({placeholder="Share code (optional)",nosearch=true});
					X:button({name="Create config",icon="plus",style="primary",cb=function()
						local X,k=M.val,I.val;
						if iQ:create(X,k)then 
							M:set("",true);
							I:set("",true);
						end;
					end});
					m();
					if S.autoload~=false then 
						d(function()
							local X=cQ.read(iQ.dir.."/last.txt");
							if X then 
								if X~=""then 
									if cQ.has(_Q(X))then 
										if not(kQ.dead)then 
											iQ:load(X);
										end;
									end;
								end;
							end;
						end);
					end;
					return Q;
				end;
				u.configs=function(X,Q)
					X:page("Configs"):configs(Q);
					return X;
				end;
				local X,Q={"BackgroundColor3","TextColor3","ImageColor3","Color","PlaceholderColor3","ScrollBarImageColor3"},{};
				for S=1,#X,1 do 
					Q[S]="t_"..X[S];
				end;
				local function S()
					local M=iQ.els;
					for I=1,#M,1 do 
						M[I]:draw();
					end;
					M=kQ.win;
					if M then 
						for I=1,#M.tabs,1 do 
							M.tabs[I]:navdraw();
						end;
					end;
					pQ();
					m();
				end;
				iQ.settheme=function(M,I,k)
					if tQ[I]==nil then 
						return;
					elseif typeof(k)~="Color3"then 
						return;
					end;
					tQ[I]=k;
					M=kQ.gui;
					if M then 
						local b=M:GetDescendants();
						for M=1,#b,1 do 
							local UQ=b[M];
							for M=1,#Q,1 do 
								if UQ:GetAttribute(Q[M])==I then 
									UQ[X[M]]=k;
								end;
							end;
						end;
					end;
					S();
				end;
				D=L;end;
			local L={key="polar"};
				L.rk=r:GenerateGUID(false);
				local X;
				do 
				local Q=Enum.MouseBehavior.Default;
				local function S(M)
					local I,k=pcall(getloadedmodules);
					return I and type(k)=="table"and J(k,M)~=nil;
				end;
				local function M()
					local I=L.t;
					if I==nil then 
						I=false;
						local k=G:FindFirstChild("Controllers");
						local G=k and(k:FindFirstChild("CameraController"));
						if G then 
							if G:IsA("ModuleScript")then 
								if S(G)then 
									local S,b=pcall(require,G);
									k=S and type(b)=="table"and b.isForceLockOverrideActive;
									if type(k)=="function"then 
										S,b=pcall(debug.getupvalues,k);
										if S then 
											if type(b)=="table"then 
												local G=I;
												for S,S in next,b,nil do 
													if type(S)=="table"then 
														G=S;
														break;
													end;
												end;
												I=G;
											else 
											end;
										else 
										end;
									else 
									end;
								else 
								end;
							else 
							end;
						else 
						end;
						L.t=I;
					else 
					end;
					return I or nil;
				end;
				local function G(S)
					S=S==true;
					if L.on==S then 
						return;
					end;
					L.on=S;
					if kQ.modal then 
						kQ.modal.Visible=S;
					end;
					local I=M();
					if S then 
						if I then 
							I[L.key]=true;
						else 
							L.mb,L.mi=z.MouseBehavior,z.MouseIconEnabled;
						end;
						local S,M=L.rk,Enum;
						local k,b=M.RenderPriority.Last,function()
							if I then 
								if I[L.key]==nil then 
									I[L.key]=true;
								end;
							end;
							if z.MouseBehavior~=Q then 
								z.MouseBehavior=Q;
							end;
							if not(z.MouseIconEnabled)then 
								z.MouseIconEnabled=true;
							end;
						end;
						C:BindToRenderStep(S,k.Value,b);
						return;
					end;
					pcall(C.UnbindFromRenderStep,C,L.rk);
					if I then 
						I[L.key]=nil;
					elseif L.mb then 
						z.MouseBehavior=L.mb;
						z.MouseIconEnabled=L.mi;
					end;
					L.mb=nil;
					L.mi=nil;
				end;
				X=G;end;
			local G,Q,S;
				do 
				local M={off={},rg={},dead={}};
				local function I(k,b)
					local UQ=M.d;
					if k then 
						if UQ then 
						else 
							UQ=Instance.new("DepthOfFieldEffect");
							UQ.Name=r:GenerateGUID(false);
							UQ.FarIntensity=0;
							UQ.FocusDistance=0;
							UQ.InFocusRadius=0.1;
							UQ.NearIntensity=1;
							UQ.Enabled=false;
							M.d=UQ;
						end;
						if M.ni~=b then 
							M.ni=b;
							UQ.NearIntensity=b;
						end;
						if M.on then 
							return;
						end;
						M.on=true;
						local k=a:GetChildren();
						for b=1,#k,1 do 
							local _Q=k[b];
							if _Q:IsA("DepthOfFieldEffect")then 
								if _Q~=UQ then 
									if _Q.Enabled then 
										M.off[_Q]=true;
										_Q.Enabled=false;
									end;
								end;
							end;
						end;
						UQ.Parent=a;
						UQ.Enabled=true;
					elseif M.on then 
						M.on=false;
						if UQ then 
							UQ.Enabled=false;
						end;
						for a in next,M.off,nil do 
							if a.Parent then 
								a.Enabled=true;
							end;
						end;
						e(M.off);
					end;
				end;
				local function a(k,b,UQ,_Q,NQ)
					if M.rg[k]then 
						return;
					end;
					local uQ=Instance.new("Part");
					uQ.Name=r:GenerateGUID(false);
					uQ.Material=Enum.Material.Glass;
					uQ.Color=CQ;
					uQ.Transparency=1;
					uQ.Anchored=true;
					uQ.CanCollide=false;
					uQ.CanQuery=false;
					uQ.CanTouch=false;
					uQ.CastShadow=false;
					uQ.Size=Vector3.new(1,1,0.001);
					local CQ=Instance.new("SpecialMesh");
					CQ.MeshType=Enum.MeshType.Brick;
					CQ.Scale=Vector3.new(0,0,0);
					CQ.Parent=uQ;
					M.rg[k]={p=uQ,m=CQ,f=b,ix=UQ or 3,iy=_Q or UQ or 3,v=false,lead=NQ==true};
				end;
				local function k(b)
					local UQ=M.rg[b];
					if UQ then 
						M.rg[b]=nil;
						UQ.p:Destroy();
					end;
				end;
				local function b(UQ,_Q,NQ)
					local uQ=UQ:ScreenPointToRay(_Q,NQ);
					return uQ.Origin+uQ.Direction*0.001;
				end;
				local function UQ(_Q)
					local NQ=workspace.CurrentCamera;
					if NQ then 
						if kQ.dead then 
							return;
						end;
					else 
						return;
					end;
					local uQ,CQ,qQ=kQ.blur and kQ.live,M.dead;
					local rQ,xQ=false;
					for jQ,YQ in next,M.rg,nil do 
						local vQ=0;
						if jQ.Parent then 
							if uQ then 
								if jQ.Visible then 
									local DQ,Ni=pcall(YQ.f);
									vQ=DQ and tonumber(Ni)or 0;
								else 
								end;
							else 
							end;
						else 
							CQ[#CQ+1]=jQ;
						end;
						qQ=if YQ.lead then T(qQ or 0,vQ)else qQ;
						local DQ=false;
						if vQ>(YQ.lead and 0.01 or 0.45)then 
							local vQ,Ni=jQ.AbsolutePosition,jQ.AbsoluteSize;
							local jQ,fi,li,si=vQ.X+YQ.ix,vQ.Y+YQ.iy,vQ.X+Ni.X-YQ.ix,vQ.Y+Ni.Y-YQ.iy;
							if li-jQ>2 then 
								if si-fi>2 then 
									local vQ,Ni,ri,Gi,ai,mi,ci=true,true,xQ or NQ.CFrame,b(NQ,jQ,fi),b(NQ,li,fi),b(NQ,li,si),YQ.p;
									ci.CFrame=CFrame.fromMatrix((Gi+mi)/2,ri.XVector,ri.YVector,ri.ZVector);
									YQ.m.Scale=Vector3.new((ai-Gi).Magnitude,(ai-mi).Magnitude,0);
									if ci.Parent~=NQ then 
										ci.Parent=NQ;
									end;
									DQ,rQ,xQ=vQ,Ni,ri;
								else 
								end;
							else 
							end;
						else 
						end;
						if YQ.v~=DQ then 
							YQ.v=DQ;
							YQ.p.Transparency=DQ and 0.98 or 1;
						end;
					end;
					for b=#CQ,1,-1 do 
						k(CQ[b]);
						CQ[b]=nil;
					end;
					NQ,uQ=qQ and qQ>0 and qQ<0.999 and qQ or 1,M.c or 0;
					uQ=if rQ then if NQ<uQ then NQ else Y(NQ,uQ+(tonumber(_Q)or 0.016666666666666666)*4)else 0;
					M.c=uQ;
					I(rQ,P(uQ^2.5*500+0.5)/500);
				end;
				local function k()
					for b,b in next,M.rg,nil do 
						b.p:Destroy();
					end;
					e(M.rg);
					I(false);
					if M.d then 
						M.d:Destroy();
						M.d=nil;
					end;
					M.ni=nil;
					M.c=nil;
				end;
				G,Q,S=a,UQ,k;end;
			local a=TweenInfo.new(0.2,gQ,Enum.EasingDirection.Out);
				local M=TweenInfo.new(0.18,Enum.EasingStyle.Sine,Enum.EasingDirection.Out);
				local function I(k)
					local b=kQ.hold;
					local UQ=kQ.cv;
					kQ.fn=kQ.fn+1;
					local _Q=kQ.fn;
					if kQ.ft then 
						kQ.ft:Cancel();
						kQ.ft=nil;
					end;
					if b.Parent~=UQ then 
						UQ.GroupTransparency=k and 1 or 0;
						b.Parent=UQ;
					end;
					b.Visible=true;
					UQ.Visible=true;
					UQ.Interactable=k;
					local NQ=q:Create(UQ,k and a or M,{GroupTransparency=k and 0 or 1});
					kQ.ft=NQ;
					local function q(a)
						if kQ.dead then 
							return;
						elseif kQ.fn~=_Q then 
							return;
						elseif a~=fQ then 
							return;
						end;
						kQ.ft=nil;
						b.Visible=k;
						b.Parent=kQ.gui;
						UQ.Visible=false;
					end;
					NQ.Completed:Once(q);
					NQ:Play();
				end;
				local function q()
					local a,M=kQ.us,kQ.gui;
					if a then 
						if not(M)then 
							return;
						end;
					else 
						return;
					end;
					local k,b=iQ.flags;
					if k.ps_fscale and type(k.ps_scale)=="number"then 
						b=k.ps_scale;
					else 
						local k=M.AbsoluteSize;
						k=if k.Y<=0 then workspace.CurrentCamera.ViewportSize else k;
						local M=kQ.hold.Size;
						b=E(Y((k.Y-40)/M.Y.Offset,(k.X-40)/M.X.Offset),0.45,1);
					end;
					if kQ.sc==b then 
						if kQ.skd then 
							return;
						end;
					end;
					kQ.sc=b;
					kQ.skd=true;
					a.Scale=b;
					yQ(b,kQ.hold);
					d(function()
						local a=kQ.pops;
						for M=1,#a,1 do 
							a[M]:clampit();
						end;
					end);
				end;
				iQ.toggle=function(a,M)
					if kQ.dead then 
						return;
					elseif not(kQ.root)then 
						return;
					end;
					M=if M==nil then not kQ.open else M;
					if M==kQ.open then 
						return;
					end;
					kQ.open=M;
					t.hh.Visible=M;
					n.hh.Visible=M;
					if c.hh then 
						c.hh.Visible=M;
					end;
					if not(M)then 
						_(true);
						wQ();
						a=kQ.listen;
						if a then 
							kQ.listen=nil;
							a.lst=false;
							a:draw();
						end;
						local a=z:GetFocusedTextBox();
						if a then 
							local k=kQ.gui;
							if a:IsDescendantOf(k)then 
								a:ReleaseFocus();
							end;
						end;
					end;
					X(M);
					I(M);
					Ki();
					pQ();
					if M then 
						D();
					end;
					R();
					if M then 
						d(function()
							local a=kQ.win;
							if a then 
								if kQ.open then 
									a:barhl(false);
								end;
							end;
						end);
					end;
				end;
				local function a()
					kQ.prefs=mQ(cQ.read(iQ.dir.."/prefs.json"))or{};
				end;
				WQ=function()
					if kQ.pst then 
						return;
					end;
					kQ.pst=true;
					B(0.5,function()
						kQ.pst=false;
						if kQ.dead then 
							return;
						end;
						local M=iQ.flags;
						local function I(k)
							if not(k)then 
								return nil;
							end;
							local B=gi(k);
							return{B.X.Scale,B.X.Offset,B.Y.Scale,B.Y.Offset};
						end;
						cQ.write(iQ.dir.."/prefs.json",aQ({key=M.ps_key,acc=typeof(M.ps_acc)=="Color3"and PQ(M.ps_acc)or nil,blur=M.ps_blur,op=M.ps_op,fscale=M.ps_fscale,scale=M.ps_scale,wm=M.ps_wm,wms=M.ps_wms,kb=M.ps_kb,spec=M.ps_spec,logs=M.ps_logs,size=kQ.hold and{kQ.hold.Size.X.Offset,kQ.hold.Size.Y.Offset},mob=I(kQ.mob),kbp=I(t.g),wmp=I(n.g),spp=I(c.g)})or"{}");
					end);
				end;
				local function M(I)
					if type(I)=="table"then 
						if#I==4 then 
							return f(tonumber(I[1])or 0,tonumber(I[2])or 0,tonumber(I[3])or 0,tonumber(I[4])or 0);
						end;
					end;
					return nil;
				end;
				local function I()
					local k=kQ.root;
					if k then 
						k.BackgroundTransparency=kQ.bgt;
					end;
					for k,B in next,kQ.hbg,nil do 
						if k.Parent then 
							k.BackgroundTransparency=Y(kQ.bgt+(tonumber(B)or 0),0.9);
						else 
							kQ.hbg[k]=nil;
						end;
					end;
				end;
				N.settings=function(N)
					local Y=kQ.prefs or{};
					xi(kQ.mk,kQ.mkey);
					local k=N:section({name="Menu"});
					k:keybind({name="Menu key",flag="ps_key",nocfg=true,nonone=true,nomouse=true,default=kQ.mkey,onpress=function()
						iQ:toggle();
					end,cb=function(B)
						kQ.mkey=B;
						WQ();
					end});
					k:colorpicker({name="Accent color",flag="ps_acc",nocfg=true,default=tQ.acc,cb=function(B)
						iQ:settheme("acc",B);
						WQ();
					end});
					k:toggle({name="Background blur",flag="ps_blur",nocfg=true,default=kQ.blur,cb=function(B)
						kQ.blur=B;
						WQ();
					end});
					k:slider({name="Background opacity",flag="ps_op",nocfg=true,min=50,max=100,suffix="%",default=P((1-kQ.bgt)*100+0.5),cb=function(B)
						kQ.bgt=1-B/100;
						I();
						WQ();
					end});
					local I=k:toggle({name="Custom scale",flag="ps_fscale",nocfg=true,default=Y.fscale==true,cb=function()
						q();
						WQ();
					end});
					I:slider({flag="ps_scale",nocfg=true,release=true,min=0.5,max=1.5,dec=2,suffix="x",sw=64,default=tonumber(Y.scale)or 1,cb=function()
						q();
						WQ();
					end}):dep(I);
					I=N:section({name="Overlay",side=2});
					I:toggle({name="Watermark",flag="ps_wm",nocfg=true,default=n.on,cb=function(Y)
						n.on=Y;
						zi(n.g,Y);
						WQ();
					end}):dropdown({flag="ps_wms",nocfg=true,multi=true,values=F,default=n.show,w=112,cb=function(Y)
						n.show=Y;
						j();
						WQ();
					end});
					I:toggle({name="Keybind list",flag="ps_kb",nocfg=true,default=t.on,cb=function(j)
						t.on=j;
						pQ();
						WQ();
					end});
					if c.use then 
						I:toggle({name="Spectator list",flag="ps_spec",nocfg=true,default=c.on,cb=function(j)
							c.on=j;
							R();
							WQ();
						end});
					end;
					I:toggle({name="Event logs",flag="ps_logs",nocfg=true,default=Z.on,cb=function(R)
						Z.on=R;
						WQ();
					end});
					I:button({name="Reset overlay",icon="refresh",cb=function()
						ui(t.g,kQ.kbd);
						ui(n.g,kQ.wmd);
						if c.g then 
							ui(c.g,kQ.spd);
						end;
						WQ();
					end});
					I:button({name="Unload",icon="power",style="danger",cb=function()
						iQ:unload();
					end});
					q();
					return N;
				end;
				u.settings=function(R)
					R:page("Settings"):settings();
					return R;
				end;
				local function R(N,u,j,Y)
					GQ(N.InputBegan,function(N)
						local I=N.UserInputType;
						if bQ(I)then 
							if j then 
								if not(j())then 
									return;
								end;
							end;
						else 
							return;
						end;
						local j=I==hQ and dQ(N)or BQ();
						local I=gi(u);
						HQ(function(k)
							local B=k-j;
							ui(u,f(I.X.Scale,I.X.Offset+P(B.X+0.5),I.Y.Scale,I.Y.Offset+P(B.Y+0.5)));
						end,Y,nil,N);
					end);
				end;
				local function N(u,j)
					GQ(u.InputBegan,function(u)
						local Y=u.UserInputType;
						if not(bQ(Y))then 
							return;
						end;
						local I=Y==hQ and dQ(u)or BQ();
						local Y=j.Size;
						HQ(function(k)
							local B,d=(k-I)/nQ(),workspace.CurrentCamera.ViewportSize/nQ();
							j.Size=l(E(Y.X.Offset+B.X,680,T(680,d.X-40)),E(Y.Y.Offset+B.Y,400,T(400,d.Y-40)));
						end,function()
							WQ();
						end,nil,u);
					end);
				end;
				local function u(j,Y)
					local I,k=OQ(iQ.dir.."/assets/astolfo.png",j.mobimg or"https://cdn3.emoji.gg/emojis/3859-astolfowink.png",1000),z.TouchEnabled and 46 or 52;
					local B,d=kQ.gui.AbsoluteSize,j.mobile;
					if d==nil then 
						local j,b=pcall(z.GetPlatform,z);
						d=if j and typeof(b)=="EnumItem"and b~=Enum.Platform.None then b==Enum.Platform.IOS or b==Enum.Platform.Android else z.TouchEnabled and not z.MouseEnabled;
					else 
					end;
					local j=QQ("ImageButton",{Size=l(k,k),Position=M(Y.mob)or l(16,P(T(B.Y,400)*0.3)),Image=I or XQ("code"),ImageTransparency=1,ZIndex=30,Visible=false,Parent=kQ.gui});
					local Y,I=QQ("UIScale",{Parent=j}),0;
					function kQ.mobv(B)
						I+=1;
						local b=I;
						if B then 
							j.Visible=true;
							w(j,{ImageTransparency=0},0.2,gQ);
						elseif j.Visible then 
							w(j,{ImageTransparency=1},0.2,gQ).Completed:Once(function(B)
								if B==fQ then 
									if I==b then 
										j.Visible=false;
									end;
								end;
							end);
						end;
					end;
					GQ(j.InputBegan,function(I)
						local B=I.UserInputType;
						if not(bQ(B))then 
							return;
						end;
						local b=B==hQ and dQ(I)or BQ();
						local B,UQ=j.Position,false;
						w(Y,{Scale=0.9},0.08,gQ);
						HQ(function(_Q)
							local NQ=_Q-b;
							if not(UQ)then 
								if NQ.Magnitude<6 then 
									return;
								end;
							end;
							UQ=true;
							_Q=kQ.gui.AbsoluteSize;
							j.Position=l(E(B.X.Offset+NQ.X,0,T(0,_Q.X-k)),E(B.Y.Offset+NQ.Y,0,T(0,_Q.Y-k)));
						end,function(k)
							w(Y,{Scale=1},0.16);
							if UQ then 
								WQ();
							elseif k then 
								iQ:toggle();
							end;
						end,nil,I);
					end);
					if d then 
						kQ.mobv(true);
					end;
					return j;
				end;
				iQ.window=function(j,Y)
					Y=Y or{};
					j=zQ.polar_lib;
					if j then 
						if j~=iQ then 
							if type(j.unload)=="function"then 
								pcall(j.unload,j);
							end;
						end;
					end;
					zQ.polar_lib=iQ;
					iQ.dir=Y.folder or iQ.dir;
					kQ.brand=Y.title or"polar";
					kQ.share=type(Y.share)=="table"and type(Y.share.put)=="function"and type(Y.share.get)=="function"and Y.share or nil;
					cQ.dir(iQ.dir);
					cQ.dir(y());
					cQ.dir(iQ.dir.."/fonts");
					cQ.dir(iQ.dir.."/assets");
					if Y.font~=false then 
						oQ(iQ.dir.."/fonts",Y.font);
					end;
					EQ(iQ.dir.."/assets");
					a();
					j=kQ.prefs;
					local a=TQ(j.acc);
					if a then 
						tQ.acc=a;
					end;
					kQ.blur=j.blur~=false;
					if tonumber(j.op)then 
						kQ.bgt=E(1-tonumber(j.op)/100,0,0.5);
					end;
					n.on=j.wm~=false;
					if type(j.wms)=="table"then 
						a={};
						for E=1,#j.wms,1 do 
							local y=j.wms[E]=="Name"and"User"or j.wms[E];
							if J(F,y)then 
								if not(J(a,y))then 
									a[#a+1]=y;
								end;
							end;
						end;
						n.show=a;
					end;
					n.title=Y.script or kQ.brand;
					t.on=j.kb~=false;
					c.on=j.spec~=false;
					c.use=Y.spectators==true;
					Z.on=j.logs~=false;
					a=Y.key;
					a=if typeof(a)=="EnumItem"then a.Name else a;
					kQ.mkey=type(j.key)=="string"and j.key or a or"Insert";
					a=QQ("ScreenGui",{Name=r:GenerateGUID(false),IgnoreGuiInset=true,ResetOnSpawn=false,ZIndexBehavior=Enum.ZIndexBehavior.Sibling,DisplayOrder=10000,AutoLocalize=false});
					kQ.gui=a;
					qi(a);
					kQ.probe=QQ("Frame",{Size=l(0,0),Parent=a});
					kQ.cv=QQ("CanvasGroup",{Size=g(1,1),GroupTransparency=1,Visible=false,ZIndex=5,Parent=a});
					local F=type(j.size)=="table"and j.size or Y.size or{780,470};
					local r=QQ("Frame",{Size=l(T(680,P(tonumber(F[1])or 780)),T(400,P(tonumber(F[2])or 470))),Visible=false,ZIndex=5,Parent=a});
					kQ.hold=r;
					kQ.sc=1;
					kQ.us=QQ("UIScale",{Parent=r});
					hi(r,10,0);
					F=QQ("Frame",{Size=g(1,1),BackgroundTransparency=kQ.bgt,ZIndex=1,Parent=r},{BackgroundColor3="bg"});
					kQ.root=F;
					SQ(F,10);
					JQ(F,ZQ.edge);
					FQ(F);
					G(F,function()
						if not(r.Visible)then 
							return 0;
						end;
						local G=kQ.cv;
						if r.Parent==G then 
							return G.Visible and 1-G.GroupTransparency or 0;
						end;
						return 1;
					end,3,3,true);
					local G=QQ("Frame",{Size=f(1,0,0,40),Parent=F});
					local E=QQ("Frame",{Size=g(1,1),ClipsDescendants=true,ZIndex=0,Parent=G});
					SQ(QQ("Frame",{Size=f(1,0,1,12),BackgroundColor3=sQ,BackgroundTransparency=0.976,ZIndex=0,Parent=E}),10);
					E=QQ("TextButton",{Size=g(1,1),ZIndex=0,Parent=G});
					QQ("Frame",{Position=l(0,40),Size=f(1,0,0,1),BackgroundColor3=sQ,BackgroundTransparency=ZQ.line,Parent=F});
					local T=QQ("Frame",{Position=l(14,0),Size=l(0,40),AutomaticSize=p,ZIndex=2,Parent=G});
					IQ(T,8);
					if Y.logo then 
						local J=Y.logo;
						J=if type(J)=="string"then if A(J,"^https?://")then OQ(iQ.dir.."/assets/logo.png",J,100)else J else J;
						QQ("ImageLabel",{Size=l(Y.logow or 24,24),Image=XQ(J),LayoutOrder=1,Parent=T});
					else 
						QQ("TextLabel",{Size=l(0,40),AutomaticSize=p,Text=kQ.brand,FontFace=LQ.b,TextSize=15,LayoutOrder=1,Parent=T});
					end;
					QQ("Frame",{Size=l(4,1),LayoutOrder=2,Parent=T});
					local A=QQ("ImageButton",{Size=l(24,24),BackgroundColor3=sQ,BackgroundTransparency=ZQ.ctl,LayoutOrder=3,Parent=T});
					SQ(A,6);
					JQ(A,ZQ.ctle);
					local J=QQ("ImageLabel",{AnchorPoint=s(0.5,0.5),Position=g(0.5,0.5),Size=l(13,13),Image=XQ("save"),Parent=A},{ImageColor3="dim"});
					Ri(A,nil,function()
						w(A,{BackgroundTransparency=ZQ.ctlh},0.12);
						w(J,{ImageColor3=tQ.txt},0.12);
					end,function()
						w(A,{BackgroundTransparency=ZQ.ctl},0.12);
						w(J,{ImageColor3=tQ.dim},0.12);
					end);
					GQ(A.MouseButton1Click,function()
						iQ:save();
					end);
					local A=VQ(T);
					A.tmp=true;
					kQ.cdd=A:dropdown({par=T,lo=4,auto=true,h=24,none=true,empty="No config",values={},cb=function(J)
						if J then 
							if J~=kQ.cfg then 
								iQ:load(J);
							end;
						end;
					end});
					A=QQ("Frame",{AnchorPoint=s(1,0),Position=f(1,-16,0,0),Size=l(0,40),AutomaticSize=p,ZIndex=2,Parent=G});
					IQ(A,0,H.Right);
					local J,y=QQ("Frame",{Position=l(0,41),Size=f(1,0,1,-89),Parent=F}),QQ("Frame",{AnchorPoint=s(0.5,1),Position=f(0.5,0,1,-9),Size=l(0,32),AutomaticSize=p,BackgroundColor3=sQ,BackgroundTransparency=ZQ.card,ZIndex=3,Parent=F});
					AQ(y);
					JQ(y,ZQ.edge);
					eQ(y,3,3,3,3);
					local I=QQ("Frame",{Size=l(0,26),BackgroundColor3=sQ,BackgroundTransparency=ZQ.tab,ZIndex=3,Parent=y});
					AQ(I);
					local k=QQ("Frame",{Size=l(0,26),AutomaticSize=p,ZIndex=4,Parent=y});
					IQ(k,2);
					kQ.pl=QQ("Frame",{Size=g(1,1),ZIndex=50,Parent=r});
					kQ.modal=QQ("TextButton",{Modal=true,Size=l(0,0),Visible=false,Parent=a});
					local B=QQ("ImageButton",{AnchorPoint=s(1,1),Position=f(1,-6,1,-6),Size=l(11,11),Image=XQ("grip"),ZIndex=10,Parent=F},{ImageColor3="faint"});
					_i(B,nil,"ImageColor3",tQ.faint,tQ.sub);
					N(B,r);
					R(E,r);
					B,E=x:GetGuiInset(),workspace.CurrentCamera.ViewportSize.Y;
					local function N()
						return kQ.open;
					end;
					kQ.kbd=l(16,P(E*0.34));
					kQ.wmd=f(1,-16,0,B.Y+10);
					i(a,M(j.kbp)or kQ.kbd);
					W(a,M(j.wmp)or kQ.wmd);
					R(t.hh,t.g,N,WQ);
					R(n.hh,n.g,N,WQ);
					if c.use then 
						kQ.spd=f(1,-16,0,P(E*0.34));
						KQ(a,M(j.spp)or kQ.spd);
						R(c.hh,c.g,N,WQ);
					end;
					zi(n.g,n.on);
					Z.f=QQ("Frame",{AnchorPoint=s(0.5,0),Position=g(0.5,0.64),Size=l(0,0),AutomaticSize=V,ZIndex=20,Parent=a});
					MQ(Z.f,8,H.Center);
					local R,N,f=0,0,0;
					kQ.md:add(C.Heartbeat:Connect(function(g)
						N+=1;
						R+=g;
						if R>=0.5 then 
							kQ.fps=P(N/R+0.5);
							R,N=0,0;
							O();
							if kQ.open then 
								f+=1;
								if f>=2 then 
									f=0;
									D();
								end;
							end;
						end;
					end));
					kQ.md:add(C.PreRender:Connect(Q));
					kQ.md:add(z.InputBegan:Connect(lQ));
					kQ.md:add(z.InputEnded:Connect(RQ));
					kQ.md:add(z.InputChanged:Connect(o));
					kQ.md:add(z.WindowFocusReleased:Connect(v));
					kQ.md:add(a:GetPropertyChangedSignal("AbsoluteSize"):Connect(q));
					kQ.md:add(r:GetPropertyChangedSignal("Size"):Connect(q));
					kQ.mk={bdown=function()
						iQ:toggle();
					end,bup=function()
					end};
					Fi(kQ.mk,kQ.mkey);
					B=setmetatable({tabs={},top=G,tl=T,tr=A,body=J,root=F,bw=y,bhl=I,bls=k,nn=0},h);
					kQ.win=B;
					if protect_gui then 
						protect_gui(a);
					end;
					a.Parent=gethui();
					kQ.mob=u(Y,j);
					m();
					q();
					T,G=a.AbsoluteSize,r.Size;
					T=if T.X<=0 then workspace.CurrentCamera.ViewportSize else T;
					r.Position=l(P((T.X-G.X.Offset*kQ.sc)/2),P((T.Y-G.Y.Offset*kQ.sc)/2));
					kQ.open=false;
					kQ.live=true;
					iQ:toggle(true);
					return B;
				end;
				iQ.unload=function(R)
					if kQ.dead then 
						return;
					end;
					_(true);
					wQ();
					X(false);
					S();
					kQ.dead=true;
					kQ.live=false;
					kQ.listen=nil;
					kQ.tg=nil;
					if kQ.ft then 
						kQ.ft:Cancel();
						kQ.ft=nil;
					end;
					kQ.md:clean();
					if kQ.gui then 
						kQ.gui:Destroy();
					end;
					local _=kQ.unl;
					for N=1,#_,1 do 
						pcall(_[N]);
					end;
					e(_);
					e(Ui);
					e(ti);
					e(Ci);
					e(t.rows);
					e(kQ.bmap);
					e(kQ.pops);
					e(R.els);
					e(R.fl);
					e(R.flags);
					e(R.profs);
					kQ.gui=nil;
					kQ.root=nil;
					kQ.hold=nil;
					kQ.pl=nil;
					kQ.win=nil;
					kQ.us=nil;
					kQ.mk=nil;
					kQ.probe=nil;
					kQ.cv=nil;
					kQ.mob=nil;
					kQ.mobv=nil;
					kQ.modal=nil;
					kQ.cdd=nil;
					kQ.cfgl=nil;
					kQ.share=nil;
					t.g,t.f,t.hh=nil,nil,nil;
					c.g,c.f,c.hh=nil,nil,nil;
					e(c.rows);
					e(c.list);
					n.g,n.f,n.nl,n.hh,n.p2=nil,nil,nil,nil,nil;
					n.v,n.n={},0;
					Z.f=nil;
					e(Z.l);
					L.t=nil;
					function m()
					end;
					if zQ.polar_lib==R then 
						zQ.polar_lib=nil;
					end;
				end;
				return iQ;
			end;
			K.e=function()
				local R,_,N=K.load("a"),K.load("c"),K.load("d");
				local h=N:window({title="shitaro",script="shitaro.lol",folder="shitaroblox",key="Insert",spectators=true,share={put=_.share_put,get=_.share_get}});
				_={lib=N,win=h,tabs={aim=h:tab({name="aim",icon="crosshair"}),trigger=h:tab({name="trigger",icon="trigger"}),visuals=h:tab({name="visuals",icon="eye"}),misc=h:tab({name="misc",icon="gear"}),skins=h:tab({name="skins",icon="skins"})},finish=function()
					local F=N.els;
					for t=1,#F,1 do 
						F[t]:fire();
					end;
					F=h:tab({name="settings",icon="sliders"});
					F:page("menu"):settings();
					F:page("configs"):configs();
				end};
				N:onunload(R.release);
				R.teardown(function()
					N:unload();
				end);
				return _;
			end;
			K.f=function()
				local R=table.create;
				local _=table.clear;
				local N,h=table.move,{trim=function(F,t)
					for f=#F,t+1,-1 do 
						F[f]=nil;
					end;
					return F;
				end,drop=function(F,t)
					local f=#F;
					F[t]=F[f];
					F[f]=nil;
				end};
				h.copy_with=function(F,t,f)
					local l=#t;
					N(t,1,l,1,F);
					if f~=nil then 
						l+=1;
						F[l]=f;
					else 
					end;
					return h.trim(F,l);
				end;
				local F={};
				F.__index=F;
				F.new=function(t)
					return setmetatable({items=R(t or 8),head=1,tail=0},F);
				end;
				F.count=function(R)
					return R.tail-R.head+1;
				end;
				F.push=function(R,t)
					local f=R.tail+1;
					R.tail=f;
					R.items[f]=t;
					return t;
				end;
				F.peek=function(R)
					if R.head>R.tail then 
						return nil;
					end;
					return R.items[R.head];
				end;
				F.shift=function(R)
					local t=R.head;
					if t>R.tail then 
						return nil;
					end;
					local f=R.items;
					local l=f[t];
					f[t]=nil;
					R.head=t+1;
					if R.head>R.tail then 
						R.head=1;
						R.tail=0;
					elseif t>64 then 
						local g=R.tail-t;
						N(f,t+1,R.tail,1);
						h.trim(f,g);
						R.head=1;
						R.tail=g;
					end;
					return l;
				end;
				F.remove=function(R,t)
					local f=R.items;
					N(f,t+1,R.tail,t);
					f[R.tail]=nil;
					R.tail=R.tail-1;
					if R.head>R.tail then 
						R.head=1;
						R.tail=0;
					end;
				end;
				F.reset=function(R)
					_(R.items);
					R.head=1;
					R.tail=0;
				end;
				h.queue=F;
				local R={};
				R.__index=R;
				R.new=function(_,N)
					return setmetatable({items={},create=_,hide=N,count=0,used=0},R);
				end;
				R.open=function(_)
					_.used=0;
				end;
				R.next=function(_)
					local N=_.used+1;
					_.used=N;
					local F=_.items[N];
					if F==nil then 
						F=_.create();
						if F==nil then 
							_.used=N-1;
							return nil;
						end;
						_.items[N]=F;
						if N>_.count then 
							_.count=N;
						end;
					else 
					end;
					return F;
				end;
				R.close=function(_)
					local N=_.hide;
					if not(N)then 
						return;
					end;
					local F=_.items;
					for t=_.used+1,_.count,1 do 
						local _=F[t];
						if _~=nil then 
							N(_);
						end;
					end;
				end;
				R.purge=function(_,N)
					local F=_.items;
					for t=_.count,1,-1 do 
						local f=F[t];
						F[t]=nil;
						if f~=nil then 
							if N then 
								N(f);
							end;
						end;
					end;
					_.count=0;
					_.used=0;
				end;
				h.pool=R;
				return h;
			end;
			K.g=function()
				local R,_=K.load("b"),K.load("a");
				local N=R.storage;
				local h=R.workspace;
				local F=R.players;
				local t,f,l,g,u,s,C,z,q,r=os.clock,{version=0},{},0,{},{},{},{},{};
				local x={GetAttribute=function(G,a)
					return rawget(G,"folder"):GetAttribute(a);
				end,GetAttributes=function(G)
					return rawget(G,"folder"):GetAttributes();
				end,GetAttributeChangedSignal=function(G,a)
					return rawget(G,"folder"):GetAttributeChangedSignal(a);
				end};
				local function G(a,m)
					return a:IsA("Model")and a:GetAttribute("Bot")==true and a:GetAttribute("CombatantId")==m;
				end;
				local function a(m,c,n,O)
					if not(m)then 
						return n,O;
					end;
					local j=m:GetChildren();
					for E=1,#j,1 do 
						m=j[E];
						if G(m,c)then 
							E=(m:GetAttribute("Dead")~=true and 2 or 0)+(m:IsDescendantOf(h)and 1 or 0);
							if E>O then 
								O,n=E,m;
							else 
							end;
						else 
						end;
					end;
					return n,O;
				end;
				local function m(c)
					local n=rawget(c,"folder"):GetAttribute("CombatantId");
					if n==nil then 
						return nil;
					end;
					local O=rawget(c,"m");
					if O then 
						if O.Parent then 
							if O:GetAttribute("Dead")~=true then 
								if O:IsDescendantOf(h)then 
									if G(O,n)then 
										return O;
									end;
								end;
							end;
						end;
					end;
					local G=t();
					if G<(rawget(c,"next")or 0)then 
						return O and O.Parent and O or nil;
					end;
					rawset(c,"next",G+0.1);
					G,O=a(h:FindFirstChild("Characters"),n,nil,-1);
					G=if O<3 then a(N:FindFirstChild("_PVS_CulledCharacters"),n,G,O)else G;
					rawset(c,"m",G);
					return G;
				end;
				local h={__index=function(t,G)
					local a=x[G];
					if a then 
						return a;
					end;
					a=rawget(t,"folder");
					if G=="Character"then 
						return m(t);
					elseif G=="Parent"then 
						return a.Parent~=nil and F or nil;
					elseif G=="Name"or G=="DisplayName"then 
						local F=a:GetAttribute("DisplayName");
						return type(F)=="string"and F or a.Name;
					elseif G=="UserId"then 
						local F=a:GetAttribute("UserId");
						return tonumber(F)or F;
					elseif G=="avatar"then 
						return a:GetAttribute("AvatarUserId");
					end;
					return nil;
				end,__tostring=function(F)
					return"npc:"..tostring(rawget(F,"folder").Name);
				end};
				local function F()
					g=0;
					table.clear(s);
					table.clear(C);
					for t,x in u,nil,nil do 
						g+=1;
						l[g]=x;
						local G=t:GetAttribute("ActorId");
						if G~=nil then 
							s[G]=x;
						end;
						G=t:GetAttribute("UserId");
						if G~=nil then 
							C[G]=x;
							t=tonumber(G);
							if t then 
								C[t]=x;
							end;
						end;
					end;
					local t,x=#l,g;
					for G=t,x+1,-1 do 
						l[G]=nil;
					end;
					f.version=f.version+1;
				end;
				local function t(x)
					if x:IsA("Folder")then 
						if u[x]then 
							return;
						end;
					else 
						return;
					end;
					local G=setmetatable({folder=x},h);
					u[x]=G;
					F();
					_.connect(x:GetAttributeChangedSignal("ActorId"),F);
					for x=1,#z,1 do 
						pcall(z[x],G);
					end;
				end;
				local function x(G)
					local a=u[G];
					if not(a)then 
						return;
					end;
					u[G]=nil;
					F();
					for F=1,#q,1 do 
						pcall(q[F],a);
					end;
				end;
				local function F(G)
					if r==G then 
						return;
					end;
					r=G;
					_.connect(G.ChildAdded,t);
					_.connect(G.ChildRemoved,x);
					local r=G:GetChildren();
					for x=1,#r,1 do 
						t(r[x]);
					end;
				end;
				f.list=function()
					local t=g;
					return l,t;
				end;
				f.is=function(t)
					return type(t)=="table"and getmetatable(t)==h;
				end;
				f.actor=function(h)
					return h~=nil and s[h]or nil;
				end;
				f.key=function(h)
					if h==nil then 
						return nil;
					end;
					return C[h]or C[tonumber(h)or h];
				end;
				f.on=function(h,t)
					if h then 
						z[#z+1]=h;
					end;
					if t then 
						q[#q+1]=t;
					end;
				end;
				R=N:FindFirstChild("Combatants");
				if R then 
					F(R);
				end;
				_.connect(N.ChildAdded,function(R)
					if R.Name=="Combatants"then 
						if R:IsA("Folder")then 
							F(R);
						end;
					end;
				end);
				_.teardown(function()
					table.clear(u);
					table.clear(s);
					table.clear(C);
					table.clear(z);
					table.clear(q);
					table.clear(l);
					g=0;
				end);
				return f;
			end;
			K.h=function()
				local R,_,N,h=K.load("b"),K.load("f"),K.load("a"),K.load("g");
				local F=R.players;
				local t,f,l,g=_.trim,{},0,true;
				local _=-1;
				local function u()
					g=true;
				end;
				local function s()
					g=true;
					task.defer(u);
				end;
				N.connect(F.PlayerAdded,u);
				N.connect(F.PlayerRemoving,s);
				R={all=function()
					local u,s=g;
					if u then 
						s=u;
					else 
						local C=_;
						s=C~=h.version;
					end;
					if s then 
						g=false;
						_=h.version;
						u=F:GetPlayers();
						local _=#u;
						for F=1,_,1 do 
							f[F]=u[F];
						end;
						local F,u=h.list();
						for h=1,u,1 do 
							_+=1;
							f[_]=F[h];
						end;
						t(f,_);
						l=_;
					end;
					s=l;
					return f,s;
				end,reset=function()
					t(f,0);
					l,g=0,true;
				end};
				N.teardown(R.reset);
				return R;
			end;
			K.i=function()
				return{vis=true,aim=false,mem=30,age=0.3,err=24,ear=90,peek=0.25};
			end;
			K.j=function()
				local R=K.load("b").storage;
				local function _(...)
					local N=R;
					for R=1,select("#",...),1 do 
						local h,F=pcall(N.WaitForChild,N,select(R,...),5);
						if h then 
							if not(F)then 
								return nil;
							end;
						else 
							return nil;
						end;
						N=F;
					end;
					local R,h=pcall(require,N);
					if R then 
						return h;
					end;
					return nil;
				end;
				local R={weapon=_("Components","Weapon"),bullet=_("Components","Weapon","Classes","Bullet"),grenade=_("Components","Grenade"),raycast=_("Shared","Raycast"),ray_ignore=_("Components","Common","GetRayIgnore"),remotes=_("Database","Security","Remotes"),camera=_("Controllers","CameraController"),local_char=_("Controllers","CharacterController","LocalCharacter"),inventory=_("Controllers","InventoryController"),data=_("Controllers","DataController"),hints=_("Controllers","HintController"),spectate=_("Controllers","SpectateController"),runstep=_("Controllers","RunServiceController"),pose=_("Components","Common","CharacterPose"),char_velocity=_("Components","Common","GetCharacterVelocity"),char_resolver=_("Components","Common","CharacterResolver"),skin_info=_("Components","Common","GetResolvedSkinInformation"),weapon_props=_("Components","Common","GetWeaponProperties"),skins=_("Database","Components","Libraries","Skins"),buy_area=_("Database","Components","Common","IsInBuyArea"),buy_menu=_("Interface","Screens","Gameplay","Middle","BuyMenu"),crosshair=_("Interface","Screens","Gameplay","Middle","Crosshair"),mv_runtime=_("MovementV2","Client","Runtime"),constants=_("Database","Custom","Constants"),nade_sim=_("Shared","GrenadeSimulator"),kinematics=_("MovementV2","RuntimeKinematics"),snap_codec=_("MovementV2","RemoteSnapshotCodec"),root_frame=_("MovementV2","RootFrame"),viewmodel=_("Classes","WeaponComponent","Classes","Viewmodel"),character=_("Classes","Character"),flash_fx=_("Components","Common","VFXLibary","FlashEffect"),smoke_fx=_("Components","Common","VFXLibary","CreateVoxelSmoke"),tracer_fx=_("Components","Common","VFXLibary","CreateTracer"),vm_flash=_("Components","Common","VFXLibary","CreateMuzzleFlash","Camera"),emit_fx=_("Components","Common","VFXLibary","CreateMuzzleFlash","EmitParticles"),tp_model=_("Controllers","Observers","Players","Components","CreateWeaponModel")};
				local _,N=R.weapon,R.bullet;
				R.fire_ready=type(_)=="table"and type(_.shoot)=="function";
				R.legit_ready=type(N)=="table"and type(R.raycast)=="table"and type(R.ray_ignore)=="function";
				return R;
			end;
			K.k=function()
				local R,_,N=K.load("b"),K.load("j"),K.load("g");
				local h=K.load("i");
				local F=R.lp;
				local t=R.workspace;
				local f,l=R.storage,_.kinematics;
				local g=Vector3.zero;
				local u=Vector3.new;
				local s=math.min;
				local C=math.max;
				local z,q,r=math.atan2,{["Counter-Terrorists"]=true,Terrorists=true},{run=19.5,walk=0.52,duck=0.34,scope=0.6};
				R=f:FindFirstChild("MovementV2");
				R=R and(R:FindFirstChild("SpeedProfile"));
				if R then 
					if R:IsA("ModuleScript")then 
						f,_=pcall(require,R);
						if f then 
							if type(_)=="table"then 
								if type(_.TopSpeed)=="number"then 
									if _.TopSpeed>0 then 
										r.run=_.TopSpeed;
									end;
								end;
								if type(_.WalkModifier)=="number"then 
									if _.WalkModifier>0 then 
										r.walk=_.WalkModifier;
									end;
								end;
								if type(_.CrouchModifier)=="number"then 
									if _.CrouchModifier>0 then 
										r.duck=_.CrouchModifier;
									end;
								end;
							end;
						end;
					end;
				end;
				local R={spd=r,slots={},loud=false};
				local _=R.slots;
				local function f(x)
					local G=x.LookVector;
					return z(-G.X,-G.Z);
				end;
				local function x(G,a)
					if l then 
						if type(l.getVelocity)=="function"then 
							local m,c=pcall(l.getVelocity,G,a);
							if m then 
								if typeof(c)=="Vector3"then 
									return c;
								end;
							end;
						end;
					end;
					return a.AssemblyLinearVelocity;
				end;
				local function l(G)
					if typeof(G)~="Vector3"then 
						return g;
					end;
					return u(G.X,0,G.Z);
				end;
				R.slot=function(G)
					local a=_[G];
					if a then 
					else 
						a={plr=G,mode="none",pos=nil,at=0,hit=0,vel=g,yaw=0,err=0,gen=nil,live=nil,cur=nil,cerr=0,ghost=nil,stand=nil,duck=nil,snap=0,spos=nil,svel=g,syaw=0,dk=0,void=false,seen=nil,peek=0};
						_[G]=a;
					end;
					return a;
				end;
				R.drop=function(G)
					_[G]=nil;
				end;
				R.frozen=function()
					return t:GetAttribute("GameState")=="Buy Period";
				end;
				R.who=function(G)
					return typeof(G)=="Instance"or N.is(G);
				end;
				local function N(G)
					return G:GetAttribute("CharacterGeneration")or G:GetAttribute("Generation");
				end;
				R.dead=function(G)
					if G:GetAttribute("Dead")~=false then 
						return true;
					end;
					local a=G:GetAttribute("Health");
					if type(a)=="number"then 
						if a<=0 then 
							return true;
						end;
					end;
					local m=G.Character;
					if m then 
						if m:GetAttribute("Dead")==true then 
							return true;
						end;
						a=m:GetAttribute("Health");
						if type(a)=="number"then 
							if a<=0 then 
								return true;
							end;
						end;
					end;
					a=_[G];
					return a~=nil and a.died~=nil and os.clock()-a.died<2 and a.died_gen==N(G);
				end;
				R.kill=function(_)
					_.died=os.clock();
					_.died_gen=N(_.plr);
					_.mode="none";
					_.live=nil;
				end;
				R.enemy=function(_)
					if _==F then 
						return false;
					elseif not(R.who(_))then 
						return false;
					end;
					local G=_:GetAttribute("Team");
					if not(q[G])then 
						return false;
					end;
					if t:GetAttribute("Gamemode")=="Deathmatch"then 
						return true;
					end;
					return G~=F:GetAttribute("Team");
				end;
				R.shown=function(_)
					local F=_.Character;
					if F then 
						if F.Parent then 
							if not(F:IsDescendantOf(t))then 
								return nil;
							end;
						else 
							return nil;
						end;
					else 
						return nil;
					end;
					if F:GetAttribute("Dead")==true then 
						return nil;
					elseif F:GetAttribute("ClientCharacterPresentationVisible")==false then 
						return nil;
					end;
					_=F:FindFirstChild("HumanoidRootPart");
					if _ then 
						if not(_:IsA("BasePart"))then 
							return nil;
						end;
					else 
						return nil;
					end;
					return F,_;
				end;
				R.spawn=function(_,F,t)
					local q=_.plr;
					local G,a,m=q:GetAttribute("PresentationSpawnPosition"),q:GetAttribute("PresentationSpawnYaw"),1;
					_.stand=nil;
					_.duck=nil;
					_.void=false;
					_.seen=nil;
					if t then 
						if F-_.snap<1 and _.spos then 
							G,a,m=_.spos,_.syaw,0.3;
						else 
							G=if R.frozen()then G else nil;
						end;
					else 
					end;
					if typeof(G)~="Vector3"then 
						_.mode="none";
						_.live=nil;
						return;
					end;
					_.pos=G;
					_.at=F;
					_.hit=0;
					_.vel=g;
					_.err=m;
					_.yaw=type(a)=="number"and a or 0;
					_.mode="est";
				end;
				R.snap=function(_,F,t,q,G,a)
					_.snap=a;
					_.spos=F;
					_.svel=l(t);
					_.syaw=type(q)=="number"and q or _.syaw;
					_.dk=type(G)=="number"and G or 0;
					if _.mode=="live"then 
						return;
					elseif R.dead(_.plr)then 
						return;
					end;
					_.pos=F;
					_.vel=_.svel;
					_.yaw=_.syaw;
					_.at=a;
					_.hit=a;
					_.err=0.3;
					_.mode="est";
					_.void=false;
					_.seen=nil;
				end;
				R.sync=function(_,F,t)
					local q=_.plr;
					if R.dead(q)then 
						_.mode="none";
						_.live=nil;
						return;
					end;
					local G=N(q);
					if G~=_.gen then 
						local N=_.gen==nil;
						_.gen=G;
						R.spawn(_,F,N);
					end;
					local N,G=R.shown(q);
					if N then 
						q=G.CFrame;
						_.pos=q.Position;
						_.vel=l(x(N,G));
						_.yaw=f(q);
						_.at=F;
						_.hit=F;
						_.err=0.5;
						_.mode="live";
						_.live=N;
						_.void=false;
						_.seen=nil;
						return;
					end;
					if _.mode=="live"then 
						_.mode="est";
						_.live=nil;
						_.void=false;
						_.seen=nil;
						if _.spos then 
							if F-_.snap<0.25 then 
								_.pos=_.spos;
								_.vel=_.svel;
								_.yaw=_.syaw;
								_.at=_.snap;
								_.hit=_.snap;
								_.err=0.3;
							else 
								_.at=F;
							end;
						else 
							_.at=F;
						end;
					end;
					if t then 
						if _.mode=="est"then 
							_.at=F;
							_.vel=g;
						end;
					end;
				end;
				R.feed=function(_,N,F,t,f)
					if _.mode=="live"then 
						return;
					end;
					local l,q=_.pos,F-_.at;
					if l then 
						if q>0.08 then 
							if q<1.2 then 
								local x,G=(N.X-l.X)/q,(N.Z-l.Z)/q;
								local l,a=(x*x+G*G)^0.5,r.run*1.15;
								if l>a then 
									x,G=x*a/l,G*a/l;
								else 
								end;
								_.vel=u(x,0,G);
							elseif q>=1.2 then 
								_.vel=g;
							end;
						elseif q>=1.2 then 
							_.vel=g;
						end;
					elseif q>=1.2 then 
						_.vel=g;
					end;
					_.pos=N;
					_.at=F;
					_.hit=F;
					_.err=t;
					if f then 
						_.yaw=f;
					elseif _.vel.Magnitude>2 then 
						_.yaw=z(-_.vel.X,-_.vel.Z);
					end;
					_.mode="est";
					_.void=false;
					_.seen=nil;
				end;
				R.crouched=function(_,N)
					if N-_.snap<0.5 then 
						return _.dk>=0.5;
					end;
					return _.plr:GetAttribute("IsCrouching")==true;
				end;
				R.guess=function(_,N,F)
					local t,f=_.pos,N-_.at;
					if t then 
						if f<=0 then 
							return t,_.err;
						end;
					else 
						return t,_.err;
					end;
					local l=_.plr;
					local g,u=if R.crouched(_,N)then r.run*r.duck else if l:GetAttribute("IsWalking")==true then r.run*r.walk else if l:GetAttribute("IsSniperScoped")==true then r.run*r.scope else if R.loud then if F then if(t-F).Magnitude>h.ear then r.run else 0 else 0 else r.run,_.vel;
					N,F,l=u.Magnitude,t+u*s(f,0.3),f-0.3;
					if l<=0 then 
						return F,_.err;
					end;
					return if N>0.5 then if g>0 then F+u*(s(N,g)/N*s(l,1.5))else F else F,_.err+l*C(g,3);
				end;
				return R;
			end;
			K.l=function()
				local R,_=K.load("b"),K.load("a");
				local N=R.storage;
				local h=math.clamp;
				local F=Vector3.new;
				local t,f=Vector3.one,{"Head","UpperTorso","LowerTorso","LeftUpperArm","LeftLowerArm","LeftHand","RightUpperArm","RightLowerArm","RightHand","LeftUpperLeg","LeftLowerLeg","LeftFoot","RightUpperLeg","RightLowerLeg","RightFoot"};
				local l=Instance.new("Folder");
				_.own(l);
				local g={};
				local u=R.weak();
				local R={names=f,owners=u};
				local function s(C)
					local z=C:FindFirstChild("HumanoidRootPart");
					if z then 
						if not(z:IsA("BasePart"))then 
							return nil;
						end;
					else 
						return nil;
					end;
					local q,r,x,G=z.CFrame:Inverse(),{},{},0;
					for a=1,#f,1 do 
						local m=f[a];
						a=C:FindFirstChild(m);
						if a then 
							if a:IsA("BasePart")then 
								r[m]=q*a.CFrame;
								x[m]=a.Size;
								G+=1;
							else 
							end;
						else 
						end;
					end;
					if G<8 then 
						return nil;
					end;
					return{off=r,size=x,root=z.Size};
				end;
				R.grab=s;
				local function C(z)
					local q={};
					for r,x in z.off,nil,nil do 
						q[r]=x-F(0,1.35*h((x.Position.Y+3)/4.4,0,1),0);
					end;
					return{off=q,size=z.size,root=z.root};
				end;
				R.kit=function(h)
					if type(h)~="string"then 
						return nil;
					end;
					local z=g[h];
					if z~=nil then 
						return z or nil;
					end;
					z=N:FindFirstChild("Assets");
					z=z and(z:FindFirstChild("Characters"));
					local N=z and(z:FindFirstChild(h));
					z=N and s(N)or nil;
					g[h]=z or false;
					return z;
				end;
				R.learn=function(N,h,z,q)
					local r=z and"duck"or"stand";
					if N.stance~=r then 
						N.stance=r;
						N.since=q;
						return;
					end;
					if q-(N.since or 0)<0.35 then 
						return;
					elseif q-(N.learnt or 0)<0.25 then 
						return;
					end;
					z=s(h);
					if z then 
						N.learnt=q;
						N[r]=z;
					end;
				end;
				R.pick=function(N,h)
					if h then 
						if N.duck then 
							return N.duck;
						end;
					end;
					local z=N.stand;
					if z==nil then 
						local q=N.plr.Character;
						z=q and q.Parent and q:GetAttribute("Dead")~=true and s(q)or false;
						N.stand=z;
					else 
					end;
					z=z or R.kit(R.look(N.plr));
					if not(z)then 
						return N.duck;
					end;
					if not(h)then 
						return z;
					end;
					h=z.low;
					if h then 
					else 
						h=C(z);
						z.low=h;
					end;
					return h;
				end;
				local function N(h,s,C)
					local z=Instance.new("Part");
					z.Name=h;
					z.Size=s;
					z.Anchored=true;
					z.CanCollide=false;
					z.CanQuery=false;
					z.CanTouch=false;
					z.CastShadow=false;
					z.Massless=true;
					z.Transparency=1;
					z.Parent=C;
					return z;
				end;
				R.look=function(h)
					return h:GetAttribute("PresentationCharacterName")or h:GetAttribute("CharacterName");
				end;
				R.ghost=function(h,s)
					local C,z=R.look(h.plr)or"?",h.ghost;
					if z and z.key==C and z.model.Parent==l then 
						if z.src~=s.size then 
							z.src=s.size;
							for q,r in z.parts,nil,nil do 
								local x=s.size[q];
								if x then 
									if r.Size~=x then 
										r.Size=x;
									end;
								end;
							end;
						end;
						return z;
					end;
					if z then 
						u[z.model]=nil;
						pcall(z.model.Destroy,z.model);
					end;
					local q=Instance.new("Model");
					q.Name=h.plr.Name;
					local r,x=N("HumanoidRootPart",s.root or F(2,2,1),q),{};
					for F=1,#f,1 do 
						local G=f[F];
						x[G]=N(G,s.size[G]or t,q);
					end;
					q.PrimaryPart=r;
					q:SetAttribute("CharacterType","PlayerCustomCharacter");
					q:SetAttribute("Dead",false);
					q.Parent=l;
					z={model=q,root=r,parts=x,key=C,src=s.size};
					h.ghost=z;
					u[q]=h.plr;
					return z;
				end;
				R.place=function(N,h,F)
					N.root.CFrame=F;
					local t=h.off;
					for f,l in N.parts,nil,nil do 
						h=t[f];
						if h then 
							l.CFrame=F*h;
						end;
					end;
				end;
				R.mirror=function(N,h)
					local F,t=N.model,h:GetAttribute("Health");
					if N.hp~=t then 
						N.hp=t;
						F:SetAttribute("Health",t);
					end;
					t=h:GetAttribute("MaxHealth");
					if N.cap~=t then 
						N.cap=t;
						F:SetAttribute("MaxHealth",t);
					end;
				end;
				R.drop=function(N)
					local h=N.ghost;
					N.ghost=nil;
					if h then 
						u[h.model]=nil;
						pcall(h.model.Destroy,h.model);
					end;
				end;
				_.teardown(function()
					table.clear(g);
				end);
				return R;
			end;
			K.m=function()
				local R,_=K.load("b"),K.load("a");
				local N=R.workspace;
				local h=R.collection;
				local F=R.lp;
				local R=os.clock;
				local t=string.lower;
				local f,l,g,u,s=string.sub,{barriers=true,pvscells=true,pvsvolumes=true,pvsstaticocclusion=true,pvsvisibilitygeometry=true},{"BreakableDoor","BreakableGlass","Ceiling Fan","Flag","Flower Pot","Garage","Market Window","Snowman","Television","TugBoat","Vent","VertigoCar","VertigoCrane","VertigoGenerator","Water"},{"BreakableDoor","BreakableGlass","Garage","Market Window","Vent"},{};
				s[Enum.Material.Glass]=true;
				s[Enum.Material.ForceField]=true;
				local C={["Counter-Terrorists"]=true,Terrorists=true};
				local z=Enum.AlphaMode.Transparency;
				local q=RaycastParams.new();
				q.FilterType=Enum.RaycastFilterType.Include;
				q.IgnoreWater=true;
				q.RespectCanCollide=false;
				local r,x={ready=false};
				local G=0;
				local function a(m,c)
					return m:GetAttribute(c)==true or h:HasTag(m,c);
				end;
				local function m(c,n)
					for O=1,#n,1 do 
						if h:HasTag(c,n[O])then 
							return true;
						end;
					end;
					return false;
				end;
				local function h(c)
					return a(c,"PVSIgnore")or a(c,"PVSDynamic")or m(c,g);
				end;
				local function g(c)
					local n=t(c);
					return l[n]==true or f(n,1,24)=="__pvsvisibilityobjstage_";
				end;
				local function t(f)
					if f.Anchored then 
						if s[f.Material]then 
							return false;
						elseif f.Transparency>0.01 then 
							return false;
						end;
					else 
						return false;
					end;
					local l=f:GetChildren();
					for s=1,#l,1 do 
						f=l[s];
						if f:IsA("SurfaceAppearance")then 
							if f.AlphaMode==z then 
								return false;
							end;
						end;
					end;
					return true;
				end;
				local function f(l)
					return l:GetAttribute("PVSNegativeAuthority")~=nil or l:GetAttribute("PVSVisibilityGeometryVersion")~=nil or l:GetAttribute("PVSVisibilityGeometryComplete")~=nil or l:GetAttribute("PVSVisibilityGeometryFingerprint")~=nil;
				end;
				local function l(s,z,c)
					if g(s.Name)then 
						return 0;
					end;
					local n,O,j,E,P,T,Y={s},{a(s,"PVSOccluder")},{h(s)},1,0,0,(R());
					while E>0 do 
						local v,Z,L=n[E],O[E],j[E];
						n[E]=nil;
						O[E]=nil;
						j[E]=nil;
						E-=1;
						if Z then 
							if L then 
							else 
								if v:IsA("BasePart")then 
									if t(v)then 
										s=P+1;
										z[s]=v;
										P=s;
									else 
									end;
								else 
								end;
							end;
						else 
						end;
						local t=v:GetChildren();
						for s=1,#t,1 do 
							v=t[s];
							if g(v.Name)then 
							else 
								E+=1;
								n[E]=v;
								O[E]=Z or a(v,"PVSOccluder");
								j[E]=L or h(v);
							end;
						end;
						T+=1;
						if T%64==0 then 
							if R()-Y>0.004 then 
								task.wait();
								if not(c())then 
									return nil;
								end;
								Y=(R());
							else 
							end;
						else 
						end;
					end;
					return P;
				end;
				local function h(t,g,s)
					local z=t:FindFirstChild("Barriers")or t:FindFirstChild("Barriers",true);
					if not(z)then 
						return 0;
					end;
					t=z:GetDescendants();
					t[#t+1]=z;
					local a,c=0,(R());
					for n=1,#t,1 do 
						local O=t[n];
						if O:IsA("BasePart")and O.CanQuery and(O:IsA("Part")or O:IsA("WedgePart")or O:IsA("CornerWedgePart"))then 
							local t,j=O,false;
							while t do 
								local E=j;
								if t:GetAttribute("PVSIgnore")==true or m(t,u)then 
									j=true;
									break;
								end;
								if t==z then 
									j=E;
									break;
								end;
								t=t.Parent;
							end;
							if j then 
							else 
								a+=1;
								g[a]=O;
							end;
						else 
						end;
						if n%64==0 then 
							if R()-c>0.004 then 
								task.wait();
								if not(s())then 
									return nil;
								end;
								c=(R());
							else 
							end;
						else 
						end;
					end;
					return a;
				end;
				local function R(t)
					G+=1;
					local g=G;
					x=t;
					r.ready=false;
					q.FilterDescendantsInstances={};
					if not t then 
						return;
					end;
					_.spawn(function()
						local function u()
							local s=G==g and t.Parent~=nil;
							return s;
						end;
						for g=1,5,1 do 
							if not(u())then 
								return;
							end;
							local s,z={},f(t);
							local f=(z and l or h)(t,s,u);
							if f then 
								if not(u())then 
									return;
								end;
							else 
								return;
							end;
							local h=z and tonumber(t:GetAttribute("PVSVisibilityExportExpectedParts"))or nil;
							if f>0 and((if h then f>=h*0.9 else not h)or g==5)then 
								z=N:FindFirstChildOfClass("Terrain");
								if z then 
									s[f+1]=z;
								end;
								q.FilterDescendantsInstances=s;
								r.ready=true;
								return;
							end;
							task.wait(2);
						end;
					end);
				end;
				local function h()
					local t=N:FindFirstChild("Map");
					if t then 
						if t:GetAttribute("MapName")~=nil then 
							return t;
						end;
					end;
					return nil;
				end;
				r.sync=function()
					local t=h();
					if t~=x then 
						R(t);
					end;
					return r.ready;
				end;
				r.eye=function()
					if r.ready then 
						if not(C[F:GetAttribute("Team")])then 
							return nil;
						end;
					else 
						return nil;
					end;
					local R=F.Character;
					if R then 
						if R:GetAttribute("Dead")~=false then 
							return nil;
						elseif not(R:IsDescendantOf(N))then 
							return nil;
						end;
					else 
						return nil;
					end;
					local h=R:FindFirstChild("CameraPart")or R:FindFirstChild("Head");
					if h then 
						if h:IsA("BasePart")then 
							return h.Position;
						end;
					end;
					return nil;
				end;
				r.clear=function(R,h)
					return N:Raycast(R,h-R,q)==nil;
				end;
				_.teardown(function()
					G+=1;
					x=nil;
					r.ready=false;
					q.FilterDescendantsInstances={};
				end);
				return r;
			end;
			K.n=function()
				local R,_=K.load("b"),K.load("a");
				local N,h=K.load("j"),K.load("g");
				local F=K.load("i");
				local t=K.load("k");
				local f=K.load("m");
				local l=R.http;
				local g=R.workspace;
				local u=R.players;
				local s=R.collection;
				local C=N.remotes;
				local N=os.clock;
				local z=t.slots;
				local q=t.spd;
				local r=Vector3.new;
				local x=math.abs;
				local G=math.atan2;
				local a,m=math.huge,{Shoot=true,Tap=true,Bolt=true,BoltBack=true,BoltForward=true,MagOut=true,MagIn=true,MagIn2=true,Hammer=true,Prepare=true,SideIn=true,SideRelease=true,Zoom=true,Draw=true,Equip=true,Deploy=true,Inspect=true,Inspect2=true,SecondInspect=true,Handling1=true,Handling2=true,HitOne=true,HitTwo=true,HitThree=true,BackStab=true,Swing=true,Stab=true,Clip=true,Start=true,Pin=true,Throw=true,Planting=true,Defusing=true,["7"]=true,["73"]=true,["735"]=true,["7355"]=true,["73556"]=true,["735560"]=true,["7355608"]=true,["Scope In"]=true,["Scope Out"]=true,["Toggle Scope"]=true,["Switch Fire Mode"]=true,["No Ammo"]=true,["Low Ammo Fire"]=true,["Fall Damage"]=true,["Character Damaged"]=true};
				local c=R.weak();
				local n=R.weak();
				local O,j,E=R.weak(),{t=0,uid=nil,w=nil},{};
				local function R(P)
					local T=P:GetAttribute("CurrentEquipped");
					if c[P]==T then 
						return n[P];
					end;
					c[P]=T;
					local c;
					if type(T)=="string"then 
						if T~=""then 
							local Y,v=pcall(l.JSONDecode,l,T);
							c=if Y then if type(v)=="table"then if type(v.Name)=="string"then v.Name else c else c else c;
						else 
						end;
					else 
					end;
					if c then 
					else 
						if h.is(P)then 
							T=P:GetAttribute("WeaponName");
							c=type(T)=="string"and T~=""and T or nil;
						else 
						end;
					end;
					n[P]=c;
					return c;
				end;
				E.held=R;
				local function l()
					local c=g.CurrentCamera;
					return c and c.CFrame.Position or nil;
				end;
				E.ear=l;
				local function c(n)
					local P=g:FindFirstChild("Characters");
					if not(P)then 
						return false;
					end;
					local g=P:GetChildren();
					for T=1,#g,1 do 
						P=g[T]:FindFirstChild("HumanoidRootPart");
						if P then 
							if P:IsA("BasePart")then 
								if(P.Position-n).Magnitude<=5 then 
									return true;
								end;
							end;
						end;
					end;
					return false;
				end;
				local function g(n,P,T)
					local Y,v,Z=l(),a;
					local l,L,o=a,a;
					for a,X in z,nil,nil do 
						if X.mode=="est"and a.Parent==u and t.enemy(a)and(if T then R(a)==T else not T)then 
							local R,a=t.guess(X,P,Y);
							if R then 
								local P,T=R.X-n.X,R.Z-n.Z;
								local Y=((P*P+T*T)^0.5+x(R.Y-n.Y)*0.5)/(a+q.run*0.4+4);
								if Y<=1 then 
									if Y<v then 
										v,Z=Y,X;
									else 
									end;
								else 
									if Y<l then 
										l,L,o=Y,l,X;
									else 
										L=if Y<L then Y else L;
									end;
								end;
							else 
							end;
						else 
						end;
					end;
					if Z then 
						return Z;
					end;
					if o then 
						if l<=3 then 
							if L>l*1.5 then 
								return o;
							end;
						end;
					end;
					return nil;
				end;
				local function R(l,q,x)
					if l then 
						if q-j.t>0.2 then 
							return nil;
						elseif j.uid~=l then 
							return nil;
						end;
					else 
						return nil;
					end;
					if x then 
						if j.w~=x then 
							return nil;
						end;
					end;
					q=l>0 and u:GetPlayerByUserId(l)or h.key(l)or h.actor(j.actor);
					x=q and z[q];
					if x then 
						if x.mode=="est"then 
							return x;
						end;
					end;
					return nil;
				end;
				local function l(q,x)
					for a,n in O,nil,nil do 
						if x-n>3 then 
							O[a]=nil;
						elseif a.Parent then 
							local x,n=pcall(a.GetPivot,a);
							if x then 
								if(n.Position-q).Magnitude<=4 then 
									return true;
								end;
							end;
						else 
							O[a]=nil;
						end;
					end;
					return false;
				end;
				local function q(x)
					local a=f.eye();
					return a~=nil and f.clear(a,x);
				end;
				local function f(x)
					if F.vis or F.aim then 
						if type(x)~="table"then 
							return;
						end;
					else 
						return;
					end;
					local a,n,P=x.Position,x.Class,x.Name;
					if typeof(a)~="Vector3"then 
						return;
					elseif type(n)~="string"then 
						return;
					elseif c(a)then 
						return;
					end;
					x=n=="FloorSounds";
					if not x then 
						if not(m[P])then 
							return;
						end;
					end;
					local m=N();
					if l(a,m)then 
						return;
					elseif q(a)then 
						return;
					end;
					if x then 
						t.loud=true;
						local l=g(a,m,nil);
						if l then 
							t.feed(l,a,m,0.6);
						end;
						return;
					end;
					x=(if P=="Shoot"then R(j.uid,m,n)else nil)or g(a,m,n)or g(a,m,nil);
					if x then 
						t.feed(x,a,m,0.8);
					end;
				end;
				local function l(g)
					if type(g)~="table"then 
						return;
					end;
					local q=tonumber(g.UserId);
					if not(q)then 
						return;
					end;
					j.t=N();
					j.uid=q;
					j.w=g.WeaponName;
					j.actor=tonumber(g.ActorId);
				end;
				local function g(q)
					if F.vis or F.aim then 
						if type(q)~="table"then 
							return;
						end;
					else 
						return;
					end;
					local F,x=q.Origin,q.Target;
					if typeof(F)~="Vector3"then 
						return;
					elseif typeof(x)~="Vector3"then 
						return;
					end;
					q=N();
					if q-j.t>0.02 then 
						return;
					end;
					local a=R(j.uid,q);
					if not(a)then 
						return;
					end;
					local R=x-F;
					x=r(R.X,0,R.Z);
					local R,m,c=x.Magnitude,F-r(0,1.5,0);
					if R>0.01 then 
						x/=R;
						m,c=m-x*0.9,G(-x.X,-x.Z);
					else 
					end;
					t.feed(a,m,q,1,c);
				end;
				local function R(F)
					if type(F)~="table"then 
						return;
					end;
					local q=tonumber(F.Victim);
					if not(q)then 
						return;
					end;
					F=q>0 and u:GetPlayerByUserId(q)or h.key(q);
					q=F and z[F];
					if q then 
						t.kill(q);
					end;
				end;
				local function h(F,u,z)
					local q=C and C[F];
					F=type(q)=="table"and q[u]or nil;
					if type(F)~="table"then 
						return;
					elseif type(F.Listen)~="function"then 
						return;
					end;
					q,u=pcall(F.Listen,function(F)
						pcall(z,F);
					end);
					if q then 
						if type(u)=="function"then 
							_.adopt(u);
						end;
					end;
				end;
				local F=false;
				E.start=function()
					if F then 
						return;
					end;
					F=true;
					_.connect(s:GetInstanceAddedSignal("WeaponDropped"),function(F)
						O[F]=N();
					end);
					_.spawn(function()
						h("Sound","ReplicateSound",f);
						h("VFX","CreateCharacterMuzzleFlash",l);
						h("VFX","CreateTracer",g);
						h("UI","UIPlayerKilled",R);
					end);
				end;
				_.teardown(function()
					j.t=0;
					j.uid=nil;
					j.w=nil;
					t.loud=false;
					table.clear(O);
				end);
				return E;
			end;
			K.o=function()
				local R,_=K.load("b"),K.load("a");
				local N,h=K.load("j"),K.load("g");
				local F=K.load("i");
				local t=K.load("k");
				local f=R.lp;
				local l=R.players;
				local g=R.storage;
				local R,u,s=N.snap_codec,N.root_frame,os.clock;
				local N=Vector3.new;
				local C=type(R)=="table"and R.decode or nil;
				local z=type(R)=="table"and R.applyDeltaToCanonicalBaseline or nil;
				local R,q,r=type(u)=="table"and u.simulationToVisualRootPosition or nil,{};
				local u,x={};
				local G={};
				local a,m,c=-1,{},{tick=-1,at=0};
				local function n(O)
					local j,E=O.Position,O.DuckAmount or 0;
					if R then 
						local O,P=pcall(R,j,E);
						if O then 
							if typeof(P)=="Vector3"then 
								return P;
							end;
						end;
					end;
					return j-N(0,(E>=0.999 and 4.05 or 5.4)*0.5-3,0);
				end;
				local function R(N)
					if type(N)~="number"then 
						return nil;
					elseif N<=0 then 
						return nil;
					end;
					local O=m[N];
					if O==nil or O.Parent~=l then 
						O=l:GetPlayerByUserId(N)or false;
						m[N]=O;
					else 
					end;
					return O or nil;
				end;
				local function N(O,j)
					for E,P in O,nil,nil do 
						E=R(P.UserId)or h.actor(P.ActorId);
						if E then 
							if E~=f then 
								if t.enemy(E)then 
									t.snap(t.slot(E),n(P),P.Velocity,P.LookYaw,P.DuckAmount,j);
								end;
							end;
						end;
					end;
				end;
				local function R(h,t)
					local f=h.Sequence;
					if f==r then 
						return;
					end;
					if f~=x then 
						x,u=f,{};
						table.clear(G);
					end;
					local n=h.ChunkIndex or 0;
					if G[n]then 
						return;
					end;
					G[n]=true;
					n=h.Actors or{};
					for O,j in n,nil,nil do 
						O=u;
						O[j.ActorId]=j;
					end;
					local O=h.ServerTick;
					if type(O)=="number"then 
						if O>=a then 
							a=O;
							c.tick=O;
							c.at=t;
							N(n,t);
						end;
					end;
					n,O=h.ChunkCount or 1,0;
					for h in G,nil,nil do 
						O+=1;
					end;
					if O>=n then 
						q,r,u,x=u,f,{},nil;
						table.clear(G);
					end;
				end;
				local function h(t,f)
					local n=t.ServerTick;
					if type(n)~="number"then 
						return;
					elseif n<=a then 
						return;
					end;
					a=n;
					c.tick=n;
					c.at=f;
					local a,O={},0;
					if t.BaselineSequence==r then 
						n={};
						for j,j in t.RemovedActorIds or{},nil,nil do 
							n[j]=true;
						end;
						local j={};
						if z then 
							local E=t.Deltas or{};
							for P,T in E,nil,nil do 
								P=q;
								local E=P[T.ActorId];
								if E then 
									if not(n[T.ActorId])then 
										local P,Y=pcall(z,E,T);
										if P then 
											if type(Y)=="table"then 
												j[T.ActorId]=Y;
											end;
										end;
									end;
								end;
							end;
						end;
						local z=q;
						for E,P in z,nil,nil do 
							if n[E]then 
							else 
								O+=1;
								a[O]=j[E]or P;
							end;
						end;
					else 
					end;
					for z,z in t.Actors or{},nil,nil do 
						O+=1;
						a[O]=z;
					end;
					N(a,f);
				end;
				local function N(t)
					if F.vis then 
						if not(C)then 
							return;
						end;
					elseif F.aim then 
						if not(C)then 
							return;
						end;
					else 
						return;
					end;
					local F,f=pcall(C,t);
					if F then 
						if type(f)~="table"then 
							return;
						end;
					else 
						return;
					end;
					F=s();
					if f.Kind=="Baseline"then 
						R(f,F);
					elseif f.Kind=="Delta"then 
						h(f,F);
					end;
				end;
				local R=false;
				c.start=function()
					if R then 
						return;
					elseif not(C)then 
						return;
					end;
					R=true;
					_.spawn(function()
						local R=g:WaitForChild("MovementV2Remotes",30);
						local h=R and(R:WaitForChild("RemoteSnapshot",30));
						if not(h)then 
							return;
						end;
						_.connect(h.OnClientEvent,function(R)
							pcall(N,R);
						end);
					end);
				end;
				_.connect(l.PlayerRemoving,function(R)
					m[R.UserId]=nil;
				end);
				_.teardown(function()
					table.clear(q);
					table.clear(u);
					table.clear(G);
					table.clear(m);
					r,x=nil,nil;
				end);
				return c;
			end;
			K.p=function()
				local R,_,N=K.load("b"),K.load("a"),K.load("h");
				local h,F=K.load("g"),K.load("i");
				local t=K.load("k");
				local f=K.load("l");
				local l=K.load("n");
				local g,u=K.load("o"),K.load("m");
				local s,C=R.players,R.lp;
				local R=os.clock;
				local z=t.slots;
				local q=f.owners;
				local r=math.clamp;
				local x=math.min;
				local G=CFrame.new;
				local a,m=CFrame.Angles,{cfg=F,state=t,snap=g,sight=u};
				local function c(n)
					local O=z[n];
					if O then 
						f.drop(O);
						t.drop(n);
					end;
				end;
				local function n(O,j)
					return O.mode=="est"and not O.void and O.ghost~=nil and O.cur~=nil and j-O.at<=F.mem and O.cerr<=F.err;
				end;
				local function O(j,E,P,T,Y)
					if T-j.peek<0.05 then 
						return;
					end;
					j.peek=T;
					local v=E.parts;
					local Z,L=v.Head,v.UpperTorso;
					if Z and u.clear(P,Z.Position)or L and u.clear(P,L.Position)then 
						E=j.seen;
						if E then 
							if T-E>=Y then 
								j.void=true;
							end;
						else 
							j.seen=T;
						end;
					else 
						j.seen=nil;
					end;
				end;
				m.step=function()
					if not(F.vis)then 
						if not(F.aim)then 
							return;
						end;
					end;
					local j,E,P,T,Y,v,Z=R(),l.ear(),t.frozen(),u.sync()and u.eye()or nil,F.peek+r(tonumber(C:GetAttribute("Ping"))or 100,0,500)/1000,N.all();
					for N=1,Z,1 do 
						local u=v[N];
						if t.enemy(u)then 
							N=t.slot(u);
							t.sync(N,j,P);
							if N.mode=="live"then 
								f.learn(N,N.live,t.crouched(N,j),j);
							elseif N.mode=="est"then 
								local C,P=t.guess(N,j,E);
								N.cur=C;
								N.cerr=P;
								if C then 
									P=f.pick(N,t.crouched(N,j));
									if P then 
										local E=f.ghost(N,P);
										f.place(E,P,G(C)*a(0,N.yaw,0));
										f.mirror(E,u);
										if T then 
											if n(N,j)then 
												O(N,E,T,j,Y);
											end;
										end;
									end;
								end;
							end;
						elseif z[u]then 
							c(u);
						end;
					end;
				end;
				m.char=function(N)
					if F.vis then 
						if not(t.who(N))then 
							return nil;
						end;
					else 
						return nil;
					end;
					local u=z[N];
					if not(u)then 
						return nil;
					end;
					if u.mode=="live"then 
						return u.live;
					end;
					if n(u,R())then 
						return u.ghost.model;
					end;
					return false;
				end;
				m.armed=function(N,u)
					if not(F.aim)then 
						return false;
					end;
					local C=z[N];
					return C~=nil and C.mode=="est"and not C.void and C.ghost~=nil and C.ghost.model==u and R()-C.hit<=F.age;
				end;
				m.target=function(N)
					local u=F.aim and z[N];
					if u then 
						if u.mode=="est"then 
							if not(u.void)then 
								if u.ghost then 
									if R()-u.hit<=F.age then 
										return u.ghost.model;
									end;
								end;
							end;
						end;
					end;
					return N.Character;
				end;
				m.ghost=function(N)
					return N~=nil and q[N]~=nil;
				end;
				m.fade=function(N)
					local u=t.who(N)and z[N];
					if u then 
						if u.mode~="est"then 
							return 1;
						end;
					else 
						return 1;
					end;
					N=R();
					if N-u.hit<0.25 then 
						local t=u.cerr;
						if t then 
							if t<=1 then 
								return 1;
							end;
						else 
							return 1;
						end;
					end;
					return r(x(1-(u.cerr or 0)/F.err,1-(N-u.at)/(F.mem>0 and F.mem or 1))*0.85,0.2,0.85);
				end;
				m.info=function(N)
					local F=z[N];
					if not(F)then 
						return nil;
					end;
					return F.mode,F.cur or F.pos,F.cerr,R()-F.at,R()-F.snap,F.void;
				end;
				_.connect(s.PlayerRemoving,c);
				h.on(nil,c);
				_.teardown(function()
					for R,_ in z,nil,nil do 
						f.drop(_);
						z[R]=nil;
					end;
				end);
				l.start();
				g.start();
				return m;
			end;
			K.q=function()
				local R=Color3.new(1,1,1);
				local _={white=R};
				_.black=Color3.new();
				_.world={fog=false,fog_col=R,fog_start=0,fog_end=500,time=false,time_hour=12,bloom=false,bloom_power=100,bloom_size=24,bloom_limit=200,hands=false,hands_x=0,hands_y=0,hands_z=0,sky=false,sky_preset="jungle",fx=false,fx_type="snow",fx_col=R,fx_rate=250,ambient=false,ambient_col=R,exposure=false,exposure_val=0,fullbright=false,fb_col=R,fb_power=200,no_shadows=false,xhair=false,xhair_col=R,xhair_size=100,xhair_gap=6,force_xhair=false,pen=false,pen_yes=Color3.fromRGB(50,255,115),pen_no=Color3.fromRGB(255,65,75),pen_size=12,third=false,third_dist=10,cc=false,cc_tint=R,cc_sat=0,cc_bright=0,cc_contrast=0,body_chams=false,body_chams_col=R,body_chams_mat="forcefield",tool_chams=false,tool_chams_col=R,tool_chams_mat="forcefield",tool_chams_kinds=nil,hand_chams=false,hand_chams_col=R,hand_chams_mat="forcefield",tracers=false,tracers_col=R,tracers_width=0.05,tracers_life=1.2,impacts=false,impacts_col=R,impacts_life=3,bomb_esp=false,bomb_icon_col=R,bomb_timer_col=R,bomb_timer_grad=false,bomb_timer_grad_col=R,nade_path=false,nade_path_col=R,nade_radius_col=R,nade_path_width=2,nade_zones=false,smoke_zone_col=R,smoke_zone_icon=R,fire_zone_col=R,fire_zone_icon=R,nades_live=false,nade_icon_col=R,nade_dmg_col=R,esp_set=nil,view=nil,zonefill=nil};
				_.misc={scope=false,flash=false,smoke=false,hands=false,bullets=false,auto_plant=false,auto_defuse=false,knife=false,knife_heavy=true,knife_range=3.5,zeus=false,zeus_range=12,auto_reload=false,auto_reload_min=1,auto_buy=false,buy_primary="AK-47",buy_secondary="USP-S",buy_zeus=false,buy_nades={},buy_dirty=true};
				local N=Color3.fromRGB(133,220,255);
				_.notify={master={hit=false,kill=false},log={hit=false,kill=false},fx={hit={on=false,col=N},kill={on=false,col=N}},screen={hit={on=false,col=N,power=100},kill={on=false,col=N,power=100}},marks={hit={on=false,col=R,size=18,fade=1},kill={on=false,col=R,size=18,fade=1}},sounds={hit={on=false,name="mc bow",vol=1},kill={on=false,name="skeet",vol=1}},list={"primordial","neverlose","sparkle","mc bow","skeet","break","rust","applepay","bubble","combobreak","killcard","xp","na naxuy","stony","hentai"}};
				_.attach=function(R)
					_.world.esp_set=R.shSet;
					_.world.view=R.ViewResolver;
				end;
				return _;
			end;
			K.r=function()
				return"iVBORw0KGgoAAAANSUhEUgAAAycAAAMnCAYAAAAkqS2pAAABN2lDQ1BBZG9iZSBSR0IgKDE5OTgpAAAokZWPv0rDUBSHvxtFxaFWCOLgcCdRUGzVwYxJW4ogWKtDkq1JQ5ViEm6uf/oQjm4dXNx9AidHwUHxCXwDxamDQ4QMBYvf9J3fORzOAaNi152GUYbzWKt205Gu58vZF2aYAoBOmKV2q3UAECdxxBjf7wiA10277jTG+38yH6ZKAyNguxtlIYgK0L/SqQYxBMygn2oQD4CpTto1EE9AqZf7G1AKcv8ASsr1fBBfgNlzPR+MOcAMcl8BTB1da4Bakg7UWe9Uy6plWdLuJkEkjweZjs4zuR+HiUoT1dFRF8jvA2AxH2w3HblWtay99X/+PRHX82Vun0cIQCw9F1lBeKEuf1UYO5PrYsdwGQ7vYXpUZLs3cLcBC7dFtlqF8hY8Dn8AwMZP/fNTP8gAAAAJcEhZcwAACxMAAAsTAQCanBgAAAXJaVRYdFhNTDpjb20uYWRvYmUueG1wAAAAAAA8P3hwYWNrZXQgYmVnaW49Iu+7vyIgaWQ9Ilc1TTBNcENlaGlIenJlU3pOVGN6a2M5ZCI/PiA8eDp4bXBtZXRhIHhtbG5zOng9ImFkb2JlOm5zOm1ldGEvIiB4OnhtcHRrPSJBZG9iZSBYTVAgQ29yZSA3LjEtYzAwMCA3OS5hODczMWI5LCAyMDIxLzA5LzA5LTAwOjM3OjM4ICAgICAgICAiPiA8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMiPiA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtbG5zOmRjPSJodHRwOi8vcHVybC5vcmcvZGMvZWxlbWVudHMvMS4xLyIgeG1sbnM6cGhvdG9zaG9wPSJodHRwOi8vbnMuYWRvYmUuY29tL3Bob3Rvc2hvcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RFdnQ9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZUV2ZW50IyIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgMjIuNSAoV2luZG93cykiIHhtcDpDcmVhdGVEYXRlPSIyMDI0LTExLTE3VDIxOjI5OjQ2KzAzOjAwIiB4bXA6TW9kaWZ5RGF0ZT0iMjAyNC0xMS0xN1QyMTozMDoxNSswMzowMCIgeG1wOk1ldGFkYXRhRGF0ZT0iMjAyNC0xMS0xN1QyMTozMDoxNSswMzowMCIgZGM6Zm9ybWF0PSJpbWFnZS9wbmciIHBob3Rvc2hvcDpDb2xvck1vZGU9IjMiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6OTM0NWQ3YWUtNWQ0Zi1lYjQyLTgzZGMtNDViOWQ2Njc5Zjg4IiB4bXBNTTpEb2N1bWVudElEPSJhZG9iZTpkb2NpZDpwaG90b3Nob3A6NGI4NjYxZjYtYWE0NC1iYTQxLTk2NmEtNzYyYTFiYjZmYTc3IiB4bXBNTTpPcmlnaW5hbERvY3VtZW50SUQ9InhtcC5kaWQ6ZDdjZDdhOTAtYmIyYS1hMjQxLTkyNTctZGRiZTc2ZjA3ZmE2Ij4gPHhtcE1NOkhpc3Rvcnk+IDxyZGY6U2VxPiA8cmRmOmxpIHN0RXZ0OmFjdGlvbj0iY3JlYXRlZCIgc3RFdnQ6aW5zdGFuY2VJRD0ieG1wLmlpZDpkN2NkN2E5MC1iYjJhLWEyNDEtOTI1Ny1kZGJlNzZmMDdmYTYiIHN0RXZ0OndoZW49IjIwMjQtMTEtMTdUMjE6Mjk6NDYrMDM6MDAiIHN0RXZ0OnNvZnR3YXJlQWdlbnQ9IkFkb2JlIFBob3Rvc2hvcCAyMi41IChXaW5kb3dzKSIvPiA8cmRmOmxpIHN0RXZ0OmFjdGlvbj0ic2F2ZWQiIHN0RXZ0Omluc3RhbmNlSUQ9InhtcC5paWQ6OTM0NWQ3YWUtNWQ0Zi1lYjQyLTgzZGMtNDViOWQ2Njc5Zjg4IiBzdEV2dDp3aGVuPSIyMDI0LTExLTE3VDIxOjMwOjE1KzAzOjAwIiBzdEV2dDpzb2Z0d2FyZUFnZW50PSJBZG9iZSBQaG90b3Nob3AgMjIuNSAoV2luZG93cykiIHN0RXZ0OmNoYW5nZWQ9Ii8iLz4gPC9yZGY6U2VxPiA8L3htcE1NOkhpc3Rv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XCBOAAAAALhAnAAAAABwgTgBAAAA4AJxAgAAAMAF4gQAAACAC8QJAAAAABeIEwAAAAAuECcAAAAAXCBOAAAAALhAnAAAAABwgTgBAAAA4AJxAgAAAMAF4gQAAACAC8QJAAAAABeIEwAAAAAuECcAAAAAXCBOAAAAALhAnAAAAABwgTgBAAAA4AJxAgAAAMAF4gQAAACAC8QJAAAAABeIEwAAAAAuECcAAAAAXCBOAAAAALhAnAAAAABwgTgBAAAA4AJxAgAAAMAF4gQAAACAC8QJAAAAABeIEwAAAAAuECcAAAAAXCBOAAAAALhAnAAAAABwgTgBAAAA4AJxAgAAAMAF4gQAAACAC8QJAAAAABeIEwAAAAAuECcAAAAAXCBOAAAAALhAnAAAAABwgTgBAAAA4AJxAgAAAMAF4gQAAACAC8QJAAAAABeIEwAAAAAuECcAAAAAXCBOAAAAALhAnAAAAABwgTgBAAAA4AJxAgAAAMAF4gQAAACAC8QJAAAAABeIEwAAAAAuECcAAAAAXCBOAAAAALhAnAAAAABwgTgBAAAA4AJxAgAAAMAF4gQAAACAC8QJAAAAABeIEwAAAAAuECcAAAAAXCBOAAAAALjwP3rJhYpbpOZJAAAAAElFTkSuQmCC";
			end;
			K.s=function()
				local R=K.load("b");
				local _,N=K.load("a"),R.workspace;
				local h=R.storage;
				local F=R.guiservice;
				local t=R.custom_asset;
				local f=math.floor;
				local l,l=math.round,math.sin;
				local g=math.cos;
				local u=math.tan;
				local s=math.rad;
				local C=math.huge;
				local z=math.max;
				local q=table.create;
				local r=Color3.new(1,1,1);
				local x={white=r};
				x.hb_off=Vector2.new(5,0);
				x.ht_off=Vector2.new(3,0);
				x.ho_off=Vector2.new(0,1);
				x.bb_off=Vector2.new(0,5);
				x.bo_off=Vector2.new(1,0);
				x.bt_off=Vector2.new(0,3);
				x.n_off=Vector2.new(0,2);
				x.d_off=Vector2.new(0,2);
				x.ab_off=Vector2.new(5,0);
				x.at_off=Vector2.new(12,0);
				x.ao_off=Vector2.new(0,1);
				local G={};
				U:ds(G,0,Vector3.new(-1,-1,-1),Vector3.new(-1,1,-1),Vector3.new(-1,1,1),Vector3.new(-1,-1,1),Vector3.new(1,-1,-1),Vector3.new(1,1,-1),Vector3.new(1,1,1),Vector3.new(1,-1,1));
				x.verts=G;
				local a={Head=true,UpperTorso=true,LowerTorso=true,LeftUpperArm=true,LeftLowerArm=true,LeftHand=true,RightUpperArm=true,RightLowerArm=true,RightHand=true,LeftUpperLeg=true,LeftLowerLeg=true,LeftFoot=true,RightUpperLeg=true,RightLowerLeg=true,RightFoot=true,Torso=true,["Left Arm"]=true,["Right Arm"]=true,["Left Leg"]=true,["Right Leg"]=true};
				x.body_parts=a;
				local m=protect_gui or syn and syn.protect_gui;
				local function c(n)
					if type(m)=="function"then 
						pcall(m,n);
					end;
				end;
				local m=Instance.new("Folder");
				c(m);
				m.Parent=R.host;
				_.own(m);
				local n=Instance.new("ScreenGui");
				n.ResetOnSpawn=false;
				n.IgnoreGuiInset=true;
				n.DisplayOrder=100;
				c(n);
				pcall(function()
					n.Parent=R.host;
				end);
				_.own(n);
				x.holder=m;
				x.av_gui=n;
				local _,m={},"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
				for c=1,64,1 do 
					_[m:sub(c,c)]=c-1;
				end;
				local function m(c)
					c=c:gsub("^data:[^,]+,",""):gsub("%s",""):gsub("%-","+"):gsub("_","/");
					local n,O={},0;
					for j=1,#c,4 do 
						local E,P,T,Y=_[c:sub(j,j)]or 0,_[c:sub(j+1,j+1)]or 0,c:sub(j+2,j+2),c:sub(j+3,j+3);
						local c,v=_[T]or 0,_[Y]or 0;
						j=E*262144+P*4096+c*64+v;
						O+=1;
						n[O]=string.char(f(j/65536)%256);
						if T~="="then 
							O+=1;
							n[O]=string.char(f(j/256)%256);
						else 
						end;
						if Y~="="then 
							O+=1;
							n[O]=string.char(j%256);
						else 
						end;
					end;
					return table.concat(n);
				end;
				x.from_base64=m;
				local _=K.load("r");
				local c;
				x.arrow=function()
					if c~=nil then 
						local n=c;
						return n;
					end;
					if type(_)~="string"then 
						c="";
						local n=c;
						return n;
					elseif _==""then 
						c="";
						local n=c;
						return n;
					end;
					if _:sub(1,13)=="rbxassetid://"then 
						c=_;
						local n=c;
						return n;
					elseif _:sub(1,8)=="https://"then 
						c=_;
						local n=c;
						return n;
					elseif _:sub(1,7)=="http://"then 
						c=_;
						local n=c;
						return n;
					end;
					if type(writefile)~="function"then 
						c="";
						local n=c;
						return n;
					elseif type(t)~="function"then 
						c="";
						local n=c;
						return n;
					end;
					local n=m(_);
					local _="bs_arrow."..(n:sub(1,3)=="\255\216\255"and"jpg"or"png");
					if not(pcall(writefile,_,n))then 
						c="";
						local m=c;
						return m;
					end;
					local m,n=pcall(t,_);
					c=m and n or"";
					_=c;
					return _;
				end;
				local _=R.weak();
				local function t(m,c)
					m.ZIndex=c;
				end;
				x.set_depth=function(m,c)
					if _[m]~=c then 
						_[m]=c;
						pcall(t,m,c);
					end;
				end;
				x.is_body=function(_)
					return a[_]==true;
				end;
				x.is_char_part=function(_)
					return _:IsA("BasePart")and _.Name~="HumanoidRootPart"and _.Name~="GlowShell";
				end;
				local function _(t)
					return t.HasSkinnedMesh;
				end;
				x.is_deformable=function(t)
					if t:FindFirstChildWhichIsA("WrapLayer")then 
						return true;
					end;
					if a[t.Name]==true then 
						return false;
					end;
					if t:FindFirstChildWhichIsA("Bone")then 
						return true;
					end;
					local m,c=pcall(_,t);
					return m and c==true;
				end;
				local function _(t,m)
					t.Archivable=m;
				end;
				x.safe_clone=function(t)
					local m=t.Archivable;
					if not(m)then 
						if not(pcall(_,t,true))then 
							return nil;
						end;
					end;
					local c,n=pcall(t.Clone,t);
					if not(m)then 
						pcall(_,t,m);
					end;
					if not(c)then 
						return nil;
					end;
					return n;
				end;
				x.is_valid_part=function(_)
					if _ then 
						if _.Parent then 
							if not(_:IsA("BasePart"))then 
								return false;
							end;
						else 
							return false;
						end;
					else 
						return false;
					end;
					if _.Name=="HumanoidRootPart"then 
						return false;
					elseif _.Name=="GlowShell"then 
						return false;
					end;
					local t=_.Size;
					return t.X~=0 or t.Y~=0 or t.Z~=0;
				end;
				x.char_parts=function(_,t)
					local m,c=t or{},0;
					if _ then 
						if _.Parent then 
							local n,O=_:GetChildren(),c;
							for _=1,#n,1 do 
								t=n[_];
								if a[t.Name]then 
									if t:IsA("BasePart")then 
										if x.is_valid_part(t)then 
											_=O+1;
											m[_]=t;
											O=_;
										else 
										end;
									else 
									end;
								else 
								end;
							end;
							c=O;
						else 
						end;
					else 
					end;
					for _=#m,c+1,-1 do 
						m[_]=nil;
					end;
					return m,c;
				end;
				x.bounds=function(_,t)
					t=t or _ and#_ or 0;
					if t==0 then 
						return nil,nil;
					end;
					local a,m,c,n,O,j,E=1000000000,1000000000,1000000000,-1000000000,-1000000000,-1000000000,0;
					for P=1,t,1 do 
						local t=_[P];
						if t then 
							if t.Parent then 
								P=t.Size;
								local _,T,Y=P.X,P.Y,P.Z;
								if _~=0 or T~=0 or Y~=0 then 
									local P,v,Z,L=t.Position,_*0.5,T*0.5,Y*0.5;
									local _,t,T,Y,o,X=P.X-v,P.X+v,P.Y-Z,P.Y+Z,P.Z-L,P.Z+L;
									a,m,c,n,O,j=if _<a then _ else a,if T<m then T else m,if o<c then o else c,if t>n then t else n,if Y>O then Y else O,if X>j then X else j;
									v=E+1;
									E=v;
								else 
								end;
							else 
							end;
						else 
						end;
					end;
					if E==0 then 
						return nil,nil;
					end;
					local _,t,E=(a+n)*0.5,(m+O)*0.5,(c+j)*0.5;
					return CFrame.new(Vector3.new(_,t,E),Vector3.new(_,t,j)),Vector3.new(n-a,O-m,j-c);
				end;
				local _;
				local function t()
					return require(h.Controllers.SpectateController);
				end;
				local function h()
					if _~=nil then 
						local a=_;
						return a;
					end;
					local a,m=pcall(t);
					_=if a then if type(m)=="table"then if type(m.GetCurrentSpectateInstance)=="function"then m else false else false else false;
					a=_;
					return a;
				end;
				local _=N.CurrentCamera;
				local t=_ and _.ViewportSize or Vector2.new(1920,1080);
				local a=_ and _.CFrame or CFrame.new();
				local m,c,n,O=_ and _.FieldOfView or 70,false,0,{vs=t,foc=0};
				x.rt=O;
				local function j(E)
					return E:getPosition();
				end;
				local function E()
					local P=N.CurrentCamera;
					if not(P)then 
						return;
					end;
					_=P;
					a=P.CFrame;
					m,c=P.FieldOfView,false;
					local N=h();
					if not(N)then 
						return;
					end;
					local h,T=pcall(N.GetCurrentSpectateInstance);
					if h then 
						if type(T)~="table"then 
							return;
						elseif T.PerspectiveState~="First-Person"then 
							return;
						end;
					else 
						return;
					end;
					N,h=T.CameraPositionSpring,T.CameraRotationSpring;
					if N then 
						if not h then 
							return;
						end;
					else 
						return;
					end;
					local Y,v=pcall(j,N);
					if Y then 
						if typeof(v)~="Vector3"then 
							return;
						end;
					else 
						return;
					end;
					Y,T=pcall(j,h);
					if Y then 
						if typeof(T)~="Vector3"then 
							return;
						elseif T.Magnitude<1.0E-4 then 
							return;
						end;
					else 
						return;
					end;
					if(P.CFrame.Position-v).Magnitude<=2 then 
						return;
					end;
					a,c=CFrame.lookAt(v,v+T),true;
				end;
				x.resolve_view=E;
				local function N(h,j,P,T,Y,v)
					if not(j)then 
						return nil,false,-C;
					end;
					if v then 
						local Z=P:PointToObjectSpace(h);
						local L=-Z.Z;
						local o,X,Q,S=if L>-1.0E-4 then if L<1.0E-4 then L<0 and-1.0E-4 or 1.0E-4 else L else L,z(Y.X,1),z(Y.Y,1),u(s((T or 70)*0.5));
						local T,Y=Z.X/(o*S*(X/Q)),Z.Y/(o*S);
						S,Z=X*(0.5+T*0.5),Q*(0.5-Y*0.5);
						Y=L>0.05 and S>=0 and S<=X and Z>=0 and Z<=Q;
						return Vector2.new(S,Z),Y,L;
					end;
					P,v=j:WorldToViewportPoint(h);
					return Vector2.new(P.X,P.Y),v,P.Z;
				end;
				x.project_resolved=N;
				x.project_view=function(h)
					local j,P,T,Y=_,a,m,t;
					return N(h,j,P,T,Y,true);
				end;
				local h,j,P,T,Y,v,Z,L,o,X,Q,S,A,J,y,e=0,0,0,1,0,0,0,1,0,0,0,1,1,1,1,1;
				local function M()
					h,j,P,T,Y,v,Z,L,o,X,Q,S=a:GetComponents();
					local I,i,k=z(t.X,1),z(t.Y,1),u(s((m or 70)*0.5));
					A=I*0.5;
					J,e=i*0.5,k;
					y=k*(I/i);
				end;
				x.to_screen=function(z)
					local I,i,k=z.X-h,z.Y-j,z.Z-P;
					local h,j,P=I*T+i*Z+k*X,I*Y+i*L+k*Q,-(I*v+i*o+k*S);
					k,i,z=if P>-1.0E-4 then if P<1.0E-4 then P<0 and-1.0E-4 or 1.0E-4 else P else P,A,A;
					local T,Y,v=i+z*(h/(k*y)),J,J;
					z=Y-v*(j/(k*e));
					I=P>0.05 and T>=0 and T<=t.X and z>=0 and z<=t.Y;
					return Vector2.new(T,z),I,P;
				end;
				local h={Camera=nil,CFrame=a,ViewportSize=t,FieldOfView=m,Override=false};
				local function z()
					E();
					if _ then 
						t=_.ViewportSize;
					end;
					O.vs=t;
					O.foc=t.Y*0.5/u(s((m or 70)*0.5));
					M();
					h.Camera=_;
					h.CFrame=a;
					h.ViewportSize=t;
					h.FieldOfView=m;
					h.Override=c;
				end;
				local O={};
				x.resolver=O;
				O.Resolve=function()
					z();
					if not(_)then 
						return nil;
					end;
					return h;
				end;
				O.Project=function(h,j)
					local E=j or O.Resolve();
					if type(E)~="table"then 
						return nil,false,-C;
					end;
					return N(h,E.Camera,E.CFrame,E.FieldOfView,E.ViewportSize,E.Override==true);
				end;
				x.begin_frame=function()
					n+=1;
					z();
					local N=n;
					return N;
				end;
				x.frame=function()
					local N=n;
					return N;
				end;
				x.camera=function()
					local N=_;
					return N;
				end;
				x.viewport=function()
					local _=t;
					return _;
				end;
				x.view_frame=function()
					local _=a;
					return _;
				end;
				x.fov=function()
					local _=m;
					return _;
				end;
				x.overridden=function()
					local _=c;
					return _;
				end;
				x.calc_corners=function(_,N,h,C)
					local z,a,m,c=C or(q(8)),t.X,t.Y,_.Position;
					local t,q,O,j,E,P=c.X,c.Y,c.Z,N.X*0.5,N.Y*0.5,N.Z*0.5;
					N,C=0,0;
					for T=1,8,1 do 
						_=G[T];
						c=x.to_screen(Vector3.new(t+j*_.X,q+E*_.Y,O+P*_.Z));
						z[T]=c;
						local t,q=c.X,c.Y;
						a,m,N,C=if t<a then t else a,if q<m then q else m,if t>N then t else N,if q>C then q else C;
					end;
					c,j,P,_,O=f(a),f(m),f(N),f(C),h or{};
					O.corners=z;
					O.tl=Vector2.new(c,j);
					O.tr=Vector2.new(P,j);
					O.bl=Vector2.new(c,_);
					O.br=Vector2.new(P,_);
					return O;
				end;
				x.calc_corners_viewport=function(_,N,h,t)
					local C,z=t.AbsoluteSize,t.AbsolutePosition;
					if C.X<=0 or C.Y<=0 then 
						return{corners={},tl=Vector2.zero,tr=Vector2.zero,bl=Vector2.zero,br=Vector2.zero};
					end;
					local t,q=(h.CFrame.Position-_.Position).Magnitude,u(s((h.FieldOfView or 70)/2));
					h,_=C.Y/(2*t*q),C.X/(2*t*q*(C.X/C.Y));
					local u,s,G,a,m=N.Y*h*1.15,N.X*_,F:GetGuiInset().Y,z.X+C.X/2,z.Y+C.Y/2;
					q,t,N,h=a-s/2,m-u/2+G,a+s/2,m+u/2+G;
					return{corners={Vector2.new(q,t),Vector2.new(N,t),Vector2.new(N,h),Vector2.new(q,h),Vector2.new(q,t),Vector2.new(N,t),Vector2.new(N,h),Vector2.new(q,h)},tl=Vector2.new(f(q),f(t)),tr=Vector2.new(f(N),f(t)),bl=Vector2.new(f(q),f(h)),br=Vector2.new(f(N),f(h))};
				end;
				x.rotate=function(_,N)
					local h,F,t,f=_.X,_.Y,g(N),l(N);
					return Vector2.new(h*t-F*f,h*f+F*t);
				end;
				local _=R.weak();
				x.parse_col=function(R,N,h)
					local F=N=="Team Color"or R.itf.shSet.useTeam and not h;
					if F then 
						h=R.plr;
						local F=_[h];
						if F then 
							if F.frame==n then 
								return F.col;
							end;
						end;
						local t=R.itf.getTC(h)or r;
						if F then 
							F.frame=n;
							F.col=t;
						else 
							_[h]={frame=n,col=t};
						end;
						return t;
					end;
					return N;
				end;
				return x;
			end;
			K.t=function()
				local R=K.load("b");
				local _,N=K.load("a"),R.guiservice;
				local h=math.min;
				local F=math.max;
				local t,f,l=Vector2.new,{Line={"From","To"},Square={"Position","Size"},Image={"Position","Size"},Text={"Position"},Circle={"Position"},Triangle={"PointA","PointB","PointC"}},{};
				for g,u in f,nil,nil do 
					local s={Visible=true};
					for C=1,#u,1 do 
						s[u[C]]=true;
					end;
					l[g]=s;
				end;
				local g,u,s,C,z,q,r,x,G={},0,0,{},0,{},0,{},{};
				local function a(m,c,n,O,j)
					local E=u;
					for P=1,E,1 do 
						local E=g[P];
						if m<E[3]+j then 
							if n>E[1]-j then 
								if c<E[4]+j then 
									if O>E[2]-j then 
										return true;
									end;
								end;
							end;
						end;
					end;
					return false;
				end;
				local function m()
					u=0;
					local c=R.drawmask();
					if not(c)then 
						return;
					end;
					local R=#c;
					if R==0 then 
						return;
					end;
					local n=N:GetGuiInset();
					for N=1,R,1 do 
						local R=c[N];
						if typeof(R)=="Instance"then 
							if R.Parent then 
								if R.Visible then 
									local c,O=R.AbsolutePosition,R.AbsoluteSize;
									if O.X>0.5 then 
										if O.Y>0.5 then 
											u+=1;
											N=g[u];
											if N then 
											else 
												N={};
												g[u]=N;
											end;
											N[1]=c.X+n.X;
											N[2]=c.Y+n.Y;
											N[3]=N[1]+O.X;
											N[4]=N[2]+O.Y;
										end;
									end;
								end;
							end;
						end;
					end;
				end;
				local function R(N,c)
					local n,O,j,E,P=N.X,N.Y,c.X,c.Y,u;
					local T=false;
					for Y=1,P,1 do 
						local P,v,Z,L,o,X=g[Y],j-n,E-O,0,1,true;
						if v==0 then 
							X=if n<P[1]then false else if n>P[3]then false else X;
						else 
							local Q,S=(P[1]-n)/v,(P[3]-n)/v;
							if Q>S then 
								Q,S=S,Q;
							else 
							end;
							L,o=if Q>L then Q else L,if S<o then S else o;
						end;
						if X then 
							if Z==0 then 
								X=if O<P[2]then false else if O>P[4]then false else X;
							else 
								local Q,S=(P[2]-O)/Z,(P[4]-O)/Z;
								if Q>S then 
									Q,S=S,Q;
								else 
								end;
								L,o=if Q>L then Q else L,if S<o then S else o;
							end;
						else 
						end;
						if X then 
							if L<=o then 
								Y=(v*v+Z*Z)^0.5;
								if L*Y<1 then 
									if(1-o)*Y<1 then 
										return nil;
									end;
								end;
								if L>=1-o then 
									local Y,X=n+v*L,O+Z*L;
									j,E=Y,X;
								else 
									local Y,L=n+v*o,O+Z*o;
									n,O=Y,L;
								end;
								P=true;
								T=P;
							else 
							end;
						else 
						end;
					end;
					if not(T)then 
						return N,c;
					end;
					return t(n,O),t(j,E);
				end;
				local function N(c,n)
					local O,j=c.X,c.Y;
					local E,P,T=O+n.X,j+n.Y,u;
					local Y=false;
					for v=1,T,1 do 
						local T=g[v];
						if O<T[3]then 
							if E>T[1]then 
								if j<T[4]then 
									if P>T[2]then 
										local Z,L,o,X,Q=0;
										if T[2]>j then 
											v=h(P,T[2]);
											local S=(E-O)*(v-j);
											if S>Z then 
												Z,L,o,X,Q=S,O,j,E,v;
											else 
											end;
										else 
										end;
										if T[4]<P then 
											local v=F(j,T[4]);
											local S=(E-O)*(P-v);
											if S>Z then 
												Z,L,o,X,Q=S,O,v,E,P;
											else 
											end;
										else 
										end;
										if T[1]>O then 
											local v=h(E,T[1]);
											local S=(v-O)*(P-j);
											if S>Z then 
												Z,L,o,X,Q=S,O,j,v,P;
											else 
											end;
										else 
										end;
										if T[3]<E then 
											local v=F(O,T[3]);
											local T=(E-v)*(P-j);
											if T>Z then 
												Z,O=T,v;
											else 
												O,j,E,P=L,o,X,Q;
											end;
										else 
											O,j,E,P=L,o,X,Q;
										end;
										if Z<=1 then 
											return nil;
										end;
										local T=true;
										Y=T;
									else 
									end;
								else 
								end;
							else 
							end;
						else 
						end;
					end;
					if not(Y)then 
						return c,n;
					end;
					return t(O,j),t(E-O,P-j);
				end;
				local function c(n)
					local O,j,E=n.d,n.w,n.keys;
					for P=1,#E,1 do 
						local T=E[P];
						O[T]=j[T];
					end;
					n.hid=false;
					O.Visible=true;
				end;
				local function n(O)
					local j,E,P=O.d,O.w,O.cls;
					if not(E.Visible)then 
						j.Visible=false;
						O.hid=false;
						return;
					end;
					if u==0 then 
						c(O);
						return;
					end;
					if P=="Line"then 
						local T,Y=R(E.From,E.To);
						if not(T)then 
							j.Visible=false;
							O.hid=true;
							return;
						end;
						j.From=T;
						j.To=Y;
						O.hid=false;
						j.Visible=true;
						return;
					end;
					if P=="Square"then 
						if j.Filled then 
							local R,T=N(E.Position,E.Size);
							if not(R)then 
								j.Visible=false;
								O.hid=true;
								return;
							end;
							j.Position=R;
							j.Size=T;
							O.hid=false;
							j.Visible=true;
							return;
						end;
					end;
					local R,N,T,Y;
					if P=="Text"then 
						local v,Z=E.Position,j.TextBounds;
						R=j.Center and v.X-Z.X*0.5 or v.X;
						N=R+Z.X;
						T,Y=v.Y,v.Y+Z.Y;
					else 
						if P=="Circle"then 
							local v,Z=E.Position,j.Radius;
							R,T,N,Y=v.X-Z,v.Y-Z,v.X+Z,v.Y+Z;
						else 
							if P=="Triangle"then 
								local P,v,Z=E.PointA,E.PointB,E.PointC;
								R,N,T=h(P.X,v.X,Z.X),F(P.X,v.X,Z.X),h(P.Y,v.Y,Z.Y);
								Y=F(P.Y,v.Y,Z.Y);
							else 
								local h,F=E.Position,E.Size;
								R,T,N,Y=h.X,h.Y,h.X+F.X,h.Y+F.Y;
							end;
						end;
					end;
					if a(R,T,N,Y,O.hid and 6 or 0)then 
						j.Visible=false;
						O.hid=true;
						return;
					end;
					c(O);
				end;
				local function R(N)
					local h=x[N];
					if not(h)then 
						return;
					end;
					local F=C[z];
					local c=x[F];
					C[h.i]=F;
					if c then 
						c.i=h.i;
					end;
					C[z]=nil;
					z-=1;
					if h.mi>0 then 
						F=q[r];
						c=x[F];
						q[h.mi]=F;
						if c then 
							c.mi=h.mi;
						end;
						q[r]=nil;
						r-=1;
					end;
					x[N]=nil;
				end;
				local function N(h)
					local F=x[h];
					if not(F)then 
						return;
					end;
					R(h);
					pcall(F.d.Remove,F.d);
				end;
				local h={__index=function(F,c)
					local O=x[F];
					if not(O)then 
						return nil;
					end;
					if c=="Remove"then 
						return N;
					elseif c=="Destroy"then 
						return N;
					end;
					if O.tr[c]then 
						return O.w[c];
					end;
					return O.d[c];
				end,__newindex=function(N,F,c)
					local O=x[N];
					if not(O)then 
						return;
					end;
					if not(O.tr[F])then 
						N=O.u;
						if N[F]~=c then 
							N[F]=c;
							O.d[F]=c;
						end;
						return;
					end;
					N=O.w[F];
					if N~=c then 
						O.w[F]=c;
						if u==0 then 
							O.d[F]=c;
						elseif O.mi==0 then 
							O.d[F]=c;
						else 
							n(O);
						end;
					end;
				end};
				local function N(F,c)
					return F[c];
				end;
				G.new=function(F,c)
					local O,j,E,P=Drawing.new(F),l[F]or l.Square,f[F]or f.Square,{};
					for f in j,nil,nil do 
						local l,T=pcall(N,O,f);
						if l then 
							P[f]=T;
						end;
					end;
					if P.Visible==nil then 
						P.Visible=false;
					end;
					for N=1,#E,1 do 
						local f=E[N];
						if P[f]==nil then 
							P[f]=t();
						end;
					end;
					local N=setmetatable({},h);
					z+=1;
					C[z]=N;
					local h={d=O,cls=F,tr=j,keys=E,w=P,u={},hid=false,i=z,mi=0};
					x[N]=h;
					if c then 
						r+=1;
						q[r]=N;
						h.mi=r;
					end;
					return N;
				end;
				G.mask_step=function()
					if not(pcall(m))then 
						u=0;
					end;
					local N=r>0 and(u>0 or s>0);
					if N then 
						local N=r;
						for h=N,1,-1 do 
							local N=q[h];
							h=x[N];
							if h then 
								if not(pcall(n,h))then 
									R(N);
								end;
							end;
						end;
					end;
					s=u;
				end;
				G.count=function()
					local R=z;
					return R;
				end;
				G.mask_active=function()
					local R=u;
					return R>0;
				end;
				G.mask_test=function(R,N,h,F)
					if u==0 then 
						return false;
					end;
					return a(R,N,h,F,0);
				end;
				G.purge=function()
					local R=z;
					for N=R,1,-1 do 
						local h=C[N];
						if h then 
							local F=x[h];
							if F then 
								pcall(F.d.Remove,F.d);
								x[h]=nil;
							end;
						end;
						C[N]=nil;
					end;
					R=r;
					for N=R,1,-1 do 
						q[N]=nil;
					end;
					z,r,u,s=0,0,0,0;
					table.clear(x);
					table.clear(g);
				end;
				_.teardown(G.purge);
				return G;
			end;
			K.u=function()
				local R=K.load("a");
				local _=string.byte;
				local N=string.char;
				local h,F,t,f=string.sub,{},3,3;
				local l,g=Drawing and rawget(Drawing,"Fonts");
				if type(l)=="table"then 
					if type(rawget(l,"Monospace"))=="number"then 
						t=l.Monospace;
					else 
					end;
					for u,u in l,nil,nil do 
						if type(u)=="number"and u>f then 
							f=u;
						else 
						end;
					end;
					g=t;
				else 
					g=t;
				end;
				F.numeric=g;
				local t,l,u=g,0.5;
				F.face=function()
					local s=t;
					return s;
				end;
				F.bounds=function(s,C)
					local z=u;
					if not(z)then 
						local q,r=#C*s,l;
						return q*r,s;
					end;
					local q=0;
					for r=1,#C,1 do 
						q+=z[_(C,r)];
					end;
					return q*s,s;
				end;
				F.advance=function(_)
					local s=l;
					return _*s;
				end;
				local function _(s)
					return type(s)=="string"and#s>20000 and h(s,1,4)=="\0\1\0\0";
				end;
				local function h()
					if type(isfile)=="function"then 
						if type(readfile)=="function"then 
							local s,C=pcall(isfile,"bs_inter_600.ttf");
							if s then 
								if C then 
									local s,C=pcall(readfile,"bs_inter_600.ttf");
									if s then 
										if _(C)then 
											return C;
										end;
									end;
								end;
							end;
						end;
					end;
					local s,C=pcall(game.HttpGet,game,"https://fonts.gstatic.com/s/inter/v20/UcCO3FwrK3iLTeHuS_nVMrMxCp50SjIw2boKoduKmMEVuGKYMZg.ttf");
					if s then 
						if not(_(C))then 
							return nil;
						end;
					else 
						return nil;
					end;
					if type(writefile)=="function"then 
						pcall(writefile,"bs_inter_600.ttf",C);
					end;
					return C;
				end;
				local function _()
					local s=R.shared.font;
					if type(s)=="table"then 
						if s.src=="https://fonts.gstatic.com/s/inter/v20/UcCO3FwrK3iLTeHuS_nVMrMxCp50SjIw2boKoduKmMEVuGKYMZg.ttf"then 
							local C,z=pcall(function()
								return s.item.Font;
							end);
							if C then 
								if z==s.id then 
									return z;
								end;
							end;
						end;
					end;
					local s=h();
					if not s then 
						return nil;
					end;
					local h,C=pcall(Drawing.new,"Font");
					if h then 
						if not C then 
							return nil;
						end;
					else 
						return nil;
					end;
					local h,z=pcall(function()
						C.Data=s;
						return C.Font;
					end);
					if(if h then type(z)~="number"else not h)or z<=f then 
						pcall(C.Remove,C);
						return nil;
					end;
					R.shared.font={item=C,id=z,src="https://fonts.gstatic.com/s/inter/v20/UcCO3FwrK3iLTeHuS_nVMrMxCp50SjIw2boKoduKmMEVuGKYMZg.ttf"};
					return z;
				end;
				local function h(f)
					local s,C=pcall(Drawing.new,"Text");
					if s then 
						if not C then 
							return nil;
						end;
					else 
						return nil;
					end;
					local z,q,r={},0,0;
					s=pcall(function()
						C.Visible=false;
						C.Center=false;
						C.Outline=false;
						C.Font=f;
						C.Size=64;
						for f=32,126,1 do 
							C.Text=N(f);
							local N=C.TextBounds;
							local x=typeof(N)=="Vector2"and N.X/64 or 0;
							z[f]=x;
							if f>32 then 
								q+=x;
								r+=1;
							end;
						end;
					end);
					pcall(C.Remove,C);
					if s then 
						if r==0 then 
							return nil;
						elseif z[87]>z[105]then 
							if not(z[105]>0)then 
								return nil;
							end;
						else 
							return nil;
						end;
					else 
						return nil;
					end;
					s=q/r;
					for N=0,31,1 do 
						z[N]=s;
					end;
					z[127]=s;
					for N=128,191,1 do 
						z[N]=0;
					end;
					for N=192,255,1 do 
						z[N]=s;
					end;
					return z,s;
				end;
				local function N()
					local f=Drawing.new("Text");
					f.Visible=false;
					f.Center=false;
					f.Outline=false;
					f.Font=g;
					f.Size=16;
					f.Text="ABCDEFGHIJKLMNOPQRST";
					local g=game:GetService("RunService");
					g.RenderStepped:Wait();
					g.RenderStepped:Wait();
					g=f.TextBounds;
					if typeof(g)=="Vector2"then 
						if g.X>1 then 
							local s=g.X/20/16;
							if s>0.2 then 
								if s<2 then 
									l=s;
								end;
							end;
						end;
					end;
					pcall(f.Remove,f);
				end;
				local function f()
					local g=_();
					if g then 
						local _,s=h(g);
						if _ then 
							u,l,t=_,s,g;
							return;
						end;
					end;
					N();
				end;
				R.spawn(f);
				return F;
			end;
			K.v=function()
				local R=K.load("a");
				local _=K.load("t");
				local N,h,F=K.load("u"),{},1;
				h.scale=function(t)
					F=t or 1;
				end;
				h.k=function()
					local t=F;
					return t;
				end;
				local t=type(DrawingImmediate)=="table"and type(DrawingImmediate.GetPaint)=="function"and type(DrawingImmediate.FilledRectangle)=="function";
				h.immediate=t;
				if t then 
					local t=DrawingImmediate.Line;
					local f=DrawingImmediate.Rectangle;
					local l=DrawingImmediate.FilledRectangle;
					local g=DrawingImmediate.Triangle;
					local u=DrawingImmediate.FilledTriangle;
					local s=DrawingImmediate.Quad;
					local C=DrawingImmediate.FilledQuad;
					local z=DrawingImmediate.Circle;
					local q=DrawingImmediate.FilledCircle;
					local r=DrawingImmediate.Text;
					local x=DrawingImmediate.OutlinedText;
					h.line=function(G,a,m,c,n)
						t(G,a,m,c*F,n);
					end;
					h.rect=function(t,G,a,m,c,n)
						f(t,G,a,m*F,n or 0,c);
					end;
					h.filled_rect=function(t,f,G,a,m)
						l(t,f,G,a*F,m or 0);
					end;
					h.tri=function(t,f,l,G,a,m)
						g(t,f,l,G,a*F,m);
					end;
					h.filled_tri=function(t,f,l,g,G)
						u(t,f,l,g,G*F);
					end;
					h.quad=function(t,f,l,g,u,G,a)
						s(t,f,l,g,u,G*F,a);
					end;
					h.filled_quad=function(t,f,l,g,u,s)
						C(t,f,l,g,u,s*F);
					end;
					h.circle=function(t,f,l,g,u,s)
						z(t,f,l,g*F,u or 24,s);
					end;
					h.filled_circle=function(t,f,l,g,u)
						q(t,f,l,g*F,u or 24);
					end;
					h.text=function(t,f,l,g,u,s)
						r(t,N.face(f),f,l,g*F,u,s);
					end;
					h.outlined_text=function(t,f,l,g,u,s,C,z)
						x(t,N.face(f),f,l,g*F,u,s*F,C,z);
					end;
					local t;
					h.run=function(f)
						if t then 
							return;
						end;
						local l=DrawingImmediate.GetPaint(0);
						t=l:Connect(f);
						R.adopt(t);
					end;
					h.pump=function()
					end;
					return h;
				end;
				local t,f,l,g={Line={},Square={},Triangle={},Circle={},Text={}},{Line=0,Square=0,Triangle=0,Circle=0,Text=0},{Line=0,Square=0,Triangle=0,Circle=0,Text=0},0;
				local function u(s)
					local C=l[s]+1;
					l[s]=C;
					local z=t[s];
					local q=z[C];
					if q then 
					else 
						q=_.new(s,true);
						z[C]=q;
						if C>f[s]then 
							f[s]=C;
						end;
					end;
					g+=1;
					q.ZIndex=g;
					return q;
				end;
				h.line=function(_,s,C,z,q)
					local r=u("Line");
					r.From=_;
					r.To=s;
					r.Color=C;
					r.Transparency=z*F;
					r.Thickness=q;
					r.Visible=true;
				end;
				h.rect=function(_,s,C,z,q)
					local r=u("Square");
					r.Position=_;
					r.Size=s;
					r.Color=C;
					r.Transparency=z*F;
					r.Thickness=q;
					r.Filled=false;
					r.Visible=true;
				end;
				h.filled_rect=function(_,s,C,z)
					local q=u("Square");
					q.Position=_;
					q.Size=s;
					q.Color=C;
					q.Transparency=z*F;
					q.Thickness=1;
					q.Filled=true;
					q.Visible=true;
				end;
				h.tri=function(_,s,C,z,q,r)
					local x=u("Triangle");
					x.PointA=_;
					x.PointB=s;
					x.PointC=C;
					x.Color=z;
					x.Transparency=q*F;
					x.Thickness=r;
					x.Filled=false;
					x.Visible=true;
				end;
				h.filled_tri=function(_,s,C,z,q)
					local r=u("Triangle");
					r.PointA=_;
					r.PointB=s;
					r.PointC=C;
					r.Color=z;
					r.Transparency=q*F;
					r.Filled=true;
					r.Visible=true;
				end;
				h.quad=function(_,s,C,z,q,r,x)
					h.line(_,s,q,r,x);
					h.line(s,C,q,r,x);
					h.line(C,z,q,r,x);
					h.line(z,_,q,r,x);
				end;
				h.filled_quad=function(_,s,C,z,q,r)
					h.filled_tri(_,s,C,q,r);
					h.filled_tri(_,C,z,q,r);
				end;
				h.circle=function(_,s,C,z,q,r)
					local x=u("Circle");
					x.Position=_;
					x.Radius=s;
					x.Color=C;
					x.Transparency=z*F;
					x.NumSides=q or 24;
					x.Thickness=r;
					x.Filled=false;
					x.Visible=true;
				end;
				h.filled_circle=function(_,s,C,z,q)
					local r=u("Circle");
					r.Position=_;
					r.Radius=s;
					r.Color=C;
					r.Transparency=z*F;
					r.NumSides=q or 24;
					r.Filled=true;
					r.Visible=true;
				end;
				h.text=function(_,s,C,z,q,r)
					local x=u("Text");
					x.Font=N.face(s);
					x.Size=s;
					x.Text=q;
					x.Position=_;
					x.Color=C;
					x.Transparency=z*F;
					x.Center=r;
					x.Outline=false;
					x.Visible=true;
				end;
				h.outlined_text=function(_,s,C,z,q,r,x,G)
					r=u("Text");
					r.Font=N.face(s);
					r.Size=s;
					r.Text=x;
					r.Position=_;
					r.Color=C;
					r.Transparency=z*F;
					r.Center=G;
					r.Outline=true;
					r.OutlineColor=q;
					r.Visible=true;
				end;
				local function _(N)
					local u=t[N];
					for s=l[N]+1,f[N],1 do 
						local C=u[s];
						if C then 
							C.Visible=false;
						end;
					end;
					l[N]=0;
				end;
				local function N()
					_("Line");
					_("Square");
					_("Triangle");
					_("Circle");
					_("Text");
					g=0;
				end;
				local _;
				h.run=function(u)
					_=u;
				end;
				h.pump=function()
					if not(_)then 
						return;
					end;
					pcall(_);
					N();
				end;
				R.teardown(function()
					for R,_ in t,nil,nil do 
						for N=f[R],1,-1 do 
							_[N]=nil;
						end;
						f[R]=0;
						l[R]=0;
					end;
					g,F=0,1;
				end);
				return h;
			end;
			K.w=function()
				local R,_=K.load("a"),K.load("s");
				local N,h,F,t,f=_.av_gui,{},{},0,0;
				local function l()
					local g=Instance.new("ImageLabel");
					g.AnchorPoint=Vector2.new(0.5,0.5);
					g.BackgroundTransparency=1;
					g.BorderSizePixel=0;
					g.ScaleType=Enum.ScaleType.Fit;
					g.Image=_.arrow();
					g.Visible=false;
					g.ZIndex=40;
					g.Parent=N;
					return{image=g,shown=false};
				end;
				local _,g,u={},0,0;
				h.open=function()
					f,u=0,0;
				end;
				local function s()
					local C=Instance.new("ImageLabel");
					C.AnchorPoint=Vector2.new(0.5,0.5);
					C.BackgroundTransparency=1;
					C.BorderSizePixel=0;
					C.ScaleType=Enum.ScaleType.Fit;
					C.Visible=false;
					C.ZIndex=42;
					C.Parent=N;
					return{image=C,shown=false};
				end;
				h.icon=function(C,z,q,r,x,G)
					u+=1;
					local a=_[u];
					if a then 
					else 
						a=s();
						g+=1;
						_[g]=a;
					end;
					local s=a.image;
					if a.asset~=r then 
						a.asset=r;
						s.Image=r;
					end;
					if a.x~=C or a.y~=z then 
						a.x=C;
						a.y=z;
						s.Position=UDim2.fromOffset(C,z);
					end;
					if a.size~=q then 
						a.size=q;
						s.Size=UDim2.fromOffset(q,q);
					end;
					if a.col~=x then 
						a.col=x;
						s.ImageColor3=x;
					end;
					q=1-(G or 1);
					if a.alpha~=q then 
						a.alpha=q;
						s.ImageTransparency=q;
					end;
					if not(a.shown)then 
						a.shown=true;
						s.Visible=true;
					end;
				end;
				h.put=function(s,C,z,q,r,x)
					f+=1;
					local G=F[f];
					if G then 
					else 
						G=l();
						t+=1;
						F[t]=G;
					end;
					local l=G.image;
					if G.x~=s or G.y~=C then 
						G.x=s;
						G.y=C;
						l.Position=UDim2.fromOffset(s,C);
					end;
					if G.size~=z then 
						G.size=z;
						l.Size=UDim2.fromOffset(z,z);
					end;
					if G.rotation~=q then 
						G.rotation=q;
						l.Rotation=q;
					end;
					if G.col~=r then 
						G.col=r;
						l.ImageColor3=r;
					end;
					r=1-(x or 1);
					if G.alpha~=r then 
						G.alpha=r;
						l.ImageTransparency=r;
					end;
					if not(G.shown)then 
						G.shown=true;
						l.Visible=true;
					end;
				end;
				local l,s,C={},0,0;
				local function z()
					local q=Instance.new("ImageLabel");
					q.AnchorPoint=Vector2.new(0.5,0.5);
					q.BackgroundTransparency=1;
					q.BorderSizePixel=0;
					q.ScaleType=Enum.ScaleType.Fit;
					q.Visible=false;
					q.ZIndex=41;
					q.Parent=N;
					return{image=q,shown=false};
				end;
				h.avatar=function(N,q,r,x)
					C+=1;
					local G=l[C];
					if G then 
					else 
						G=z();
						s+=1;
						l[s]=G;
					end;
					local z=G.image;
					if G.uid~=x then 
						G.uid=x;
						z.Image="rbxthumb://type=AvatarHeadShot&id="..tostring(x).."&w=48&h=48";
					end;
					if G.x~=N or G.y~=q then 
						G.x=N;
						G.y=q;
						z.Position=UDim2.fromOffset(N,q);
					end;
					if G.size~=r then 
						G.size=r;
						z.Size=UDim2.fromOffset(r,r);
					end;
					if not(G.shown)then 
						G.shown=true;
						z.Visible=true;
					end;
				end;
				h.close=function()
					local N,z=f+1,t;
					for q=N,z,1 do 
						local r=F[q];
						if r then 
							if r.shown then 
								r.shown=false;
								r.image.Visible=false;
							end;
						end;
					end;
					N,z=C+1,s;
					for q=N,z,1 do 
						local r=l[q];
						if r then 
							if r.shown then 
								r.shown=false;
								r.image.Visible=false;
							end;
						end;
					end;
					z,N=u+1,g;
					for q=z,N,1 do 
						local N=_[q];
						if N then 
							if N.shown then 
								N.shown=false;
								N.image.Visible=false;
							end;
						end;
					end;
					C=0;
				end;
				h.purge=function()
					local N=t;
					for z=N,1,-1 do 
						local q=F[z];
						F[z]=nil;
						if q then 
							pcall(q.image.Destroy,q.image);
						end;
					end;
					N=s;
					for F=N,1,-1 do 
						local z=l[F];
						l[F]=nil;
						if z then 
							pcall(z.image.Destroy,z.image);
						end;
					end;
					N=g;
					for F=N,1,-1 do 
						local N=_[F];
						_[F]=nil;
						if N then 
							pcall(N.image.Destroy,N.image);
						end;
					end;
					t,f,s,C,g,u=0,0,0,0,0,0;
				end;
				R.teardown(h.purge);
				return h;
			end;
			K.x=function()
				local R,_=K.load("b"),K.load("s");
				local N=R.lp;
				local h=table.find;
				local F=os.clock;
				local t=Color3.new().Lerp;
				local f,l=math.sin,{};
				local g=R.weak();
				local u=R.weak();
				l.char_info=function(s)
					local C=u[s];
					if C then 
					else 
						C={};
						u[s]=C;
					end;
					return C;
				end;
				l.shared_for=function(u,s)
					local C=g[s];
					if C then 
					else 
						C={};
						g[s]=C;
					end;
					local g=_.frame();
					if C.frame~=g then 
						C.frame=g;
						C.vis=false;
						local g=u.isFr(s);
						C.fr=g;
						local z=u.tSet[g and"fr"or"en"];
						C.opt=z;
						C.clone=u._clones[s];
						g=z.en;
						if(if g then s==N and not u.allowlocal else not g)or s.UserId~=nil and#u.wlist>0 and not h(u.wlist,s.UserId)then 
							C.en=false;
							C.char=nil;
						else 
							z=u.getChar(s);
							C.char=z;
							C.en=z~=nil;
						end;
					end;
					return C;
				end;
				local N=R.weak();
				l.opt_flags=function(R,h)
					R=N[h];
					if R then 
					else 
						R={};
						N[h]=R;
					end;
					local N=_.frame();
					if R.frame~=N then 
						R.frame=N;
						local N,g,u=(h.hb or h.ht)and true or false,(h.ab or h.at)and true or false,(h.bomb or h.scope or h.flashed or h.defuse)and true or false;
						R.hp=N;
						R.arm=g;
						R.wep=(h.wep or h.wepIcon)and true or false;
						R.mon=h.mon and true or false;
						R.pn=h.pn and true or false;
						R.ind=u;
						R.corn=(N or g or u or h.box or h.name or h.av or h.dis or h.wep or h.wepIcon or h.mon or h.pn or h.tr or h.b3d)and true or false;
					end;
					return R;
				end;
				l.grad=function(R,N,h,g)
					return t(R,N,f(h*3.1416+F()*2+(g or 0)*6.283)*0.5+0.5);
				end;
				l.box_col=function(R,N,h,F,f,g)
					return R and t(N,h,(F-f)/g)or N;
				end;
				l.find_part=function(R,N)
					local h=R:FindFirstChild(N);
					if h then 
						if h.Parent==R then 
							if h:IsA("BasePart")then 
								return h;
							end;
						end;
					end;
					return nil;
				end;
				l.draw_line=function(R,N,h,F,t,f)
					if t then 
						if f then 
							local g,u=h(t);
							local t,s=h(f);
							if u then 
								if s then 
									F.From=g;
									F.To=t;
									F.Visible=true;
									F.Color=_.parse_col(R,N.skelCol[1]);
									F.Transparency=N.skelCol[2];
									return true;
								end;
							end;
						end;
					end;
					F.Visible=false;
					return false;
				end;
				return l;
			end;
			K.y=function()
				local R,_,N=K.load("b"),{},{};
				local h=R.storage:FindFirstChild("Database");
				R=h and(h:FindFirstChild("Custom"));
				h=R and(R:FindFirstChild("Weapons"));
				if h then 
					R=h:GetChildren();
					for h=1,#R,1 do 
						local F=R[h];
						if F:IsA("ModuleScript")then 
							local R,t=pcall(require,F);
							if R then 
								if type(t)=="table"then 
									h=t.Icon;
									if type(h)=="string"then 
										if h~=""then 
											_[F.Name]=h;
										end;
									end;
								end;
							end;
						end;
					end;
				end;
				N.map=_;
				N.of=function(R)
					if type(R)~="string"then 
						return nil;
					elseif R==""then 
						return nil;
					end;
					return _[R];
				end;
				return N;
			end;
			K.z=function()
				local R=K.load("s");
				local _=K.load("x");
				local N=K.load("v");
				local h=K.load("u");
				local F=K.load("w");
				local t=K.load("y");
				local f=math.floor;
				local l=math.round;
				local g=math.min;
				local u=math.clamp;
				local s=Color3.new().Lerp;
				local C=Vector2.zero.Lerp;
				local z=string.sub;
				local q=Vector2.new;
				local r=R.hb_off;
				local x=R.ht_off;
				local G=R.ho_off;
				local a=R.bb_off;
				local m=R.bo_off;
				local c=R.bt_off;
				local n=R.n_off;
				local O,j,E=Color3.new(),{bx=0,by=0,lx=0,ly=0,rx=0,ry=0,sb=0,sl=0,sr=0},{bone=function(P,T,Y,v,Z)
					if v then 
						if not(Z)then 
							return;
						end;
					else 
						return;
					end;
					local L,o=P:project(v);
					local v,X=P:project(Z);
					if o then 
						if X then 
							N.line(L,v,T,Y,1);
						end;
					end;
				end};
				local function P(T,Y,v)
					v=v or 0;
					if Y=="right"then 
						local Z=v*7;
						local L=q(r.X+Z,0);
						return T.tr+L,T.br+L,G,q(x.X+Z,0),"v";
					elseif Y=="bottom"then 
						local Z=v*22;
						local L=q(0,a.Y+Z);
						return T.bl+L,T.br+L,m,q(0,c.Y+Z),"h";
					end;
					Y=v*7;
					local m=q(r.X+Y,0);
					return T.tl-m,T.bl-m,G,q(x.X+Y,0),"v";
				end;
				E.bar_geom=P;
				local function G(m,c,T,Y,v,Z)
					for L=1,10,1 do 
						local o,X=(L-1)/10,L/10;
						N.line(C(m,c,o),C(m,c,X),s(T,Y,(o+X)*0.5),v,Z);
					end;
				end;
				local function m(c,T,Y,v,Z,L,o,X,Q)
					local S=#c;
					if S==0 then 
						return 0;
					end;
					local A=h.bounds(v,c);
					local J=T-A*0.5;
					for T=1,S,1 do 
						local y,e=z(c,T,T),S>1 and(T-1)/(S-1)or 0;
						T=_.grad(o,X,e,Q);
						if Z then 
							N.outlined_text(q(J,Y),v,T,L,Z,L,y,false);
						else 
							N.text(q(J,Y),v,T,L,y,false);
						end;
						J+=h.bounds(v,y);
					end;
					return A;
				end;
				E.grad_text=m;
				E.place=function(z,c,T,Y,v,Z,L,o,X,Q)
					local S,A=h.bounds(Y,c);
					local J,y;
					if T=="left"then 
						J,y=j.lx-S*0.5,j.ly+j.sl+A*0.5;
						j.sl=j.sl+(A+2);
					else 
						if T=="right"then 
							J,y=j.rx+S*0.5,j.ry+j.sr+A*0.5;
							j.sr=j.sr+(A+2);
						else 
							J,y=j.bx,j.by+j.sb+A*0.5;
							j.sb=j.sb+(A+2);
						end;
					end;
					if o then 
						m(c,J,y-A*0.5,Y,L,Z,X,Q,z.ph);
					elseif L then 
						N.outlined_text(q(J,y),Y,v,Z,L,Z,c,true);
					else 
						N.text(q(J,y),Y,v,Z,c,true);
					end;
				end;
				E.place_icon=function(z,z,c,T,Y,v)
					local Z,L;
					if c=="left"then 
						Z,L=j.lx-T*0.5,j.ly+j.sl+T*0.5;
						j.sl=j.sl+(T+2);
					else 
						if c=="right"then 
							Z,L=j.rx+T*0.5,j.ry+j.sr+T*0.5;
							j.sr=j.sr+(T+2);
						else 
							Z,L=j.bx,j.by+j.sb+T*0.5;
							j.sb=j.sb+(T+2);
						end;
					end;
					F.icon(f(Z),f(L),T,z,Y,(v or 1)*N.k());
				end;
				local function z(c,T,Y,v,Z,L,o,X,Q)
					local S,A=T.tl,T.br;
					local J,y,e,M=S.X,S.Y,A.X-1,A.Y-1;
					S,A=e-J+1,M-y+1;
					if S<=0 then 
						return;
					elseif A<=0 then 
						return;
					end;
					T,c=f(S*0.25),f(A*0.25);
					T,c=if T<1 then 1 else T,if c<1 then 1 else c;
					S=M-y;
					S=if S<=0 then 1 else S;
					if X then 
						N.filled_rect(q(J-1,y-1),q(T+2,3),o,Q);
						N.filled_rect(q(e-T,y-1),q(T+2,3),o,Q);
						N.filled_rect(q(J-1,M-1),q(T+2,3),o,Q);
						N.filled_rect(q(e-T,M-1),q(T+2,3),o,Q);
						N.filled_rect(q(J-1,y-1),q(3,c+2),o,Q);
						N.filled_rect(q(e-1,y-1),q(3,c+2),o,Q);
						N.filled_rect(q(J-1,M-c),q(3,c+2),o,Q);
						N.filled_rect(q(e-1,M-c),q(3,c+2),o,Q);
					end;
					o,X=_.box_col(Z,Y,v,y,y,S),_.box_col(Z,Y,v,M,y,S);
					N.filled_rect(q(J,y),q(T,1),o,L);
					N.filled_rect(q(e-T+1,y),q(T,1),o,L);
					N.filled_rect(q(J,M),q(T,1),X,L);
					N.filled_rect(q(e-T+1,M),q(T,1),X,L);
					A=Z and g(6,c)or 1;
					for o=1,A,1 do 
						X,T=f(c*(o-1)/A),f(c*o/A);
						T=if T<=X then X+1 else T;
						local c,A,I,i=y+X,y+T,M-T+1,M-X+1;
						Q,o=_.box_col(Z,Y,v,(c+A)*0.5,y,S),_.box_col(Z,Y,v,(I+i)*0.5,y,S);
						N.filled_rect(q(J,c),q(1,A-c),Q,L);
						N.filled_rect(q(e,c),q(1,A-c),Q,L);
						N.filled_rect(q(J,I),q(1,i-I),o,L);
						N.filled_rect(q(e,I),q(1,i-I),o,L);
					end;
				end;
				local function _(c,T,Y,v,Z)
					local L,o=T.tl,T.br;
					local X,Q,S,A=L.X,L.Y,o.X-1,o.Y-1;
					L,o=S-X+1,A-Q+1;
					if L<=0 then 
						return;
					elseif o<=0 then 
						return;
					end;
					N.filled_rect(q(X,Q),q(L,1),Y,Z);
					N.filled_rect(q(X,A),q(L,1),v,Z);
					T=g(24,o);
					for L=1,T,1 do 
						A,c=f(o*(L-1)/T),f(o*L/T);
						c=if c<=A then A+1 else c;
						local T,L,J=Q+A,Q+c,s(Y,v,(A+c)*0.5/o);
						N.filled_rect(q(X,T),q(1,L-T),J,Z);
						N.filled_rect(q(S,T),q(1,L-T),J,Z);
					end;
				end;
				local function c(T,Y,v,Z,L)
					local o=Y.Y;
					if o<=0 then 
						return;
					elseif Y.X<=0 then 
						return;
					end;
					local X,Q,S=g(24,o),T.tl.X,T.tl.Y;
					for A=1,X,1 do 
						local J,y=f(o*(A-1)/X),f(o*A/X);
						y=if y<=J then J+1 else y;
						T=s(v,Z,(J+y)*0.5/o);
						N.filled_rect(q(Q,S+J),q(Y.X,y-J),T,L);
					end;
				end;
				E.draw=function(T)
					if not(T.en)then 
						return;
					end;
					if T._quiet then 
						return;
					end;
					local Y,v,Z,L=T.itf,T.opt,T.corn,T.onSc or false;
					local o,X=Y.shSet.tSz,Y._clones[T.plr];
					if not(L)then 
						if v.offAr then 
							if T.dir then 
								if not(X)then 
									local Q,S=R.viewport(),v.offArPad or 18;
									local A,J=Q*0.5,T.dir;
									local Q,y,e=A+J*g((A.X-S)/math.max(math.abs(J.X),1.0E-4),(A.Y-S)/math.max(math.abs(J.Y),1.0E-4)),v.offArCol,math.deg(math.atan2(J.Y,J.X))+90;
									F.put(f(Q.X),f(Q.Y),v.offArSz or 22,e,y[1],(y[2]or 1)*N.k());
								end;
							end;
						end;
						return;
					end;
					if not(Z)then 
						return;
					end;
					local g,Q,S,A,J=Z.br-Z.tl,v.box,v.boxType=="Corners",v.boxGrd,R.parse_col(T,v.boxOCol[1],true);
					if Q then 
						if v.boxF then 
							if v.boxFGrd then 
								c(Z,g,v.boxFGrdCol[1],v.boxFGrdCol[2],v.boxFCol[2]);
							else 
								N.filled_rect(Z.tl,g,R.parse_col(T,v.boxFCol[1]),v.boxFCol[2]);
							end;
						end;
					end;
					if Q then 
						if S then 
							z(T,Z,A and v.boxGrdCol[1]or R.parse_col(T,v.boxCol[1]),v.boxGrdCol[2],A,v.boxCol[2],J,v.boxO,v.boxOCol[2]);
						elseif A then 
							if v.boxO then 
								N.rect(Z.tl,g,J,v.boxOCol[2],3);
							end;
							_(T,Z,v.boxGrdCol[1],v.boxGrdCol[2],v.boxCol[2]);
						else 
							if v.boxO then 
								N.rect(Z.tl,g,J,v.boxOCol[2],3);
							end;
							N.rect(Z.tl,g,R.parse_col(T,v.boxCol[1]),v.boxCol[2],1);
						end;
					end;
					A,L,J,Y,g=v.hbSide or"left",v.abSide or"right",v.hb,v.ab,0;
					local _,z,c,y,e=if J then if Y then if A==L then 1 else 0 else 0 else 0,0,0,0,0;
					if J then 
						local M,I,i,k,B=P(Z,A,g);
						X=T.maxHp>0 and T.hp/T.maxHp or 0;
						Q=C(I,M,X);
						if v.hbo then 
							N.line(M-i,I+i,R.parse_col(T,v.hboCol[1],true),v.hboCol[2],3);
						end;
						if v.hbGrd then 
							G(Q,I,v.hbGrdCol[1],v.hbGrdCol[2],1,1);
						elseif v.hbCol and v.hbCol[1]then 
							N.line(Q,I,R.parse_col(T,v.hbCol[1]),v.hbCol[2]or 1,1);
						else 
							N.line(Q,I,s(v.dyCol,v.hlCol,X),1,1);
						end;
						if v.ht then 
							S=l(T.hp).."hp";
							local s,d=h.bounds(o,S);
							i=C(I,M,X);
							local M,I;
							if B=="h"then 
								M,I=i.X-s*0.5,i.Y+k.Y;
							else 
								if A=="right"then 
									M,I=i.X+k.X,i.Y-d*0.5;
								else 
									M,I=i.X-k.X-s,i.Y-d*0.5;
								end;
							end;
							local i=v.htOut and R.parse_col(T,v.htOCol,true)or nil;
							if v.htGrd then 
								m(S,M+s*0.5,I,o,i,v.htCol[2],v.htGrdCol[1],v.htGrdCol[2],T.ph);
							elseif i then 
								N.outlined_text(q(M,I),o,R.parse_col(T,v.htCol[1]),v.htCol[2],i,v.htCol[2],S,false);
							else 
								N.text(q(M,I),o,R.parse_col(T,v.htCol[1]),v.htCol[2],S,false);
							end;
							z,c=s,d;
						else 
						end;
					else 
					end;
					if Y then 
						local s,M,I,i,k=P(Z,L,_);
						Q=v.armMax or 100;
						X=u(T.arm/Q,0,1);
						g=C(M,s,X);
						if v.abo then 
							N.line(s-I,M+I,R.parse_col(T,v.aboCol[1],true),v.aboCol[2],3);
						end;
						if v.abGrd then 
							G(g,M,v.abGrdCol[1],v.abGrdCol[2],1,1);
						else 
							N.line(g,M,R.parse_col(T,v.abCol[1]),v.abCol[2]or 1,1);
						end;
						if v.at then 
							S=l(T.arm).."ap";
							local u,G=h.bounds(o,S);
							I=C(M,s,X);
							local s,C;
							if k=="h"then 
								s,C=I.X-u*0.5,I.Y+i.Y;
							else 
								if L=="left"then 
									s,C=I.X-i.X-u,I.Y-G*0.5;
								else 
									s,C=I.X+i.X,I.Y-G*0.5;
								end;
							end;
							local P=v.atOut and R.parse_col(T,v.atOCol,true)or nil;
							if P then 
								N.outlined_text(q(s,C),o,R.parse_col(T,v.atCol[1]),v.atCol[2],P,v.atCol[2],S,false);
							else 
								N.text(q(s,C),o,R.parse_col(T,v.atCol[1]),v.atCol[2],S,false);
							end;
							y,e=u,G;
						else 
						end;
					else 
					end;
					S,X=0,0;
					if v.name then 
						g=T.plr.DisplayName;
						local u,s=h.bounds(o,g);
						local h,C,G=(Z.tl.X+Z.tr.X)*0.5,(Z.tl.Y+Z.tr.Y)*0.5-s-n.Y,v.nOut and R.parse_col(T,v.nOCol,true)or nil;
						if v.nGrd then 
							m(g,h,C,o,G,v.nCol[2],v.nGrdCol[1],v.nGrdCol[2],T.ph);
						elseif G then 
							N.outlined_text(q(h,C),o,R.parse_col(T,v.nCol[1]),v.nCol[2],G,v.nCol[2],g,true);
						else 
							N.text(q(h,C),o,R.parse_col(T,v.nCol[1]),v.nCol[2],g,true);
						end;
						S,X=u,s;
					else 
					end;
					if v.av then 
						local N,h,u,s,C=o+6,(Z.tl.X+Z.tr.X)*0.5,(Z.tl.Y+Z.tr.Y)*0.5;
						if v.name and S>0 then 
							s,C=h+S*0.5+N*0.5+4,u-X*0.5-n.Y;
						else 
							s,C=h,u-N*0.5-n.Y;
						end;
						h=T.plr;
						F.avatar(f(s),f(C),N,type(h)=="table"and h.avatar or h.UserId);
					end;
					g,Q,X=6,6,0;
					if J then 
						if A=="left"then 
							g+=r.X+3+0;
							g=if v.ht then g+(x.X+math.max(z,24))else g;
						else 
							if A=="right"then 
								Q+=r.X+3+0;
								Q=if v.ht then Q+(x.X+math.max(z,24))else Q;
							else 
								S=a.Y+4+0;
								S=if v.ht then S+c else S;
								X=if S>X then S else X;
							end;
						end;
					else 
					end;
					if Y then 
						if L=="left"then 
							g+=r.X+3+_*7;
							g=if v.at then g+(x.X+math.max(y,24))else g;
						else 
							if L=="right"then 
								Q+=r.X+3+_*7;
								Q=if v.at then Q+(x.X+math.max(y,24))else Q;
							else 
								S=a.Y+4+_*22;
								S=if v.at then S+e else S;
								X=if S>X then S else X;
							end;
						end;
					else 
					end;
					j.bx=(Z.bl.X+Z.br.X)*0.5;
					j.by=(Z.bl.Y+Z.br.Y)*0.5+R.d_off.Y+X;
					j.lx=Z.tl.X-g;
					j.rx=Z.tr.X+Q;
					j.ly=Z.tl.Y;
					j.ry=Z.tr.Y;
					j.sb=0;
					j.sl=0;
					j.sr=0;
					X,J,Y=T.indicators,T.fr or false,E.place;
					if X then 
						if v.bomb then 
							if not J then 
								if X.bomb==true then 
									Y(T,"bomb",v.bombPos or"right",o,R.parse_col(T,v.bombCol[1]),v.bombCol[2],O,v.bombGrd,v.bombGrdCol[1],v.bombGrdCol[2]);
								end;
							end;
						end;
						if v.scope then 
							if not J then 
								if X.scope==true then 
									Y(T,"scope",v.scopePos or"right",o,R.parse_col(T,v.scopeCol[1]),v.scopeCol[2],O,v.scopeGrd,v.scopeGrdCol[1],v.scopeGrdCol[2]);
								end;
							end;
						end;
						if v.flashed then 
							if X.flashed==true then 
								Y(T,"flashed",v.flashedPos or"right",o,R.parse_col(T,v.flashedCol[1]),v.flashedCol[2],O,v.flashedGrd,v.flashedGrdCol[1],v.flashedGrdCol[2]);
							end;
						end;
						if v.defuse then 
							if not J then 
								if X.defuse==true then 
									Y(T,"defuse",v.defusePos or"right",o,R.parse_col(T,v.defuseCol[1]),v.defuseCol[2],O,v.defuseGrd,v.defuseGrdCol[1],v.defuseGrdCol[2]);
								end;
							end;
						end;
					end;
					if v.dis then 
						Y(T,l(T.dis).." studs",v.dPos or"bottom",o,R.parse_col(T,v.dCol[1]),v.dCol[2],v.dOut and R.parse_col(T,v.dOCol,true)or nil,v.dGrd,v.dGrdCol[1],v.dGrdCol[2]);
					end;
					if v.wep then 
						X=T.wep;
						if type(X)=="string"then 
							if X~=""then 
								Y(T,X,v.wPos or"bottom",o,R.parse_col(T,v.wCol[1]),v.wCol[2],v.wOut and R.parse_col(T,v.wOCol,true)or nil,v.wGrd,v.wGrdCol[1],v.wGrdCol[2]);
							end;
						end;
					end;
					if v.wepIcon then 
						J=t.of(T.wep);
						if J then 
							Q=v.wepIconCol;
							E.place_icon(T,J,v.wepIconPos or"bottom",v.wepIconSz or 16,R.parse_col(T,Q[1]),Q[2]);
						end;
					end;
					if v.mon then 
						Y(T,"$"..f(T.mon),v.monPos or"right",o,R.parse_col(T,v.monCol[1]),v.monCol[2],O,v.monGrd,v.monGrdCol[1],v.monGrdCol[2]);
					end;
					if v.pn then 
						Y(T,f(T.pn).."ms",v.pnPos or"right",o,R.parse_col(T,v.pnCol[1]),v.pnCol[2],O,v.pnGrd,v.pnGrdCol[1],v.pnGrdCol[2]);
					end;
					if v.skel then 
						if T.skpts then 
							A,Q,X,g=T.skpts,R.parse_col(T,v.skelCol[1]),v.skelCol[2],E.bone;
							g(T,Q,X,A.hd,A.ur);
							g(T,Q,X,A.ur,A.lr);
							g(T,Q,X,A.ur,A.lua);
							g(T,Q,X,A.lua,A.lfa);
							g(T,Q,X,A.ur,A.rua);
							g(T,Q,X,A.rua,A.rfa);
							g(T,Q,X,A.lr,A.lul);
							g(T,Q,X,A.lul,A.lll);
							g(T,Q,X,A.lr,A.rul);
							g(T,Q,X,A.rul,A.rll);
						end;
					end;
				end;
				return E;
			end;
			K.A=function()
				local R,_=K.load("b"),K.load("s");
				local N=K.load("x");
				local h=R.guiservice;
				local R=getgenv();
				local F=math.tan;
				local t=math.rad;
				local f=math.min;
				local l=table.clear;
				local g=CFrame.fromMatrix;
				local u,s=CFrame.identity.PointToObjectSpace,{};
				s.__index=s;
				s.new=function(C,z)
					return setmetatable({plr=C,itf=z,ph=math.random(),char=nil,en=false,fr=false,onSc=false,dis=0,corn=nil,charCache={},cacheValid=false,links={},skpts=nil,dir=nil,viewport=nil,activeCam=nil,indicators=nil,hp=0,maxHp=100,arm=0,wep="",mon=0,pn=0,_hd=nil,_quiet=false,_cornT={},_cornPts={},_arSnap=true},s);
				end;
				s.project=function(C,z)
					local q,r=C.viewport,C.activeCam;
					if q then 
						C=q.AbsoluteSize;
						if C.X<1 then 
							return Vector2.zero,false,0;
						elseif C.Y<1 then 
							return Vector2.zero,false,0;
						end;
						local x=r.CFrame:PointToObjectSpace(z);
						if x.Z>-0.05 then 
							return Vector2.zero,false,0;
						end;
						local G,a=F(t((r.FieldOfView or 70)*0.5)),-x.Z;
						local F,t,m=x.X/(a*G*(C.X/C.Y)),x.Y/(a*G),q.AbsolutePosition+h:GetGuiInset();
						return Vector2.new(m.X+C.X*(0.5+F*0.5),m.Y+C.Y*(0.5-t*0.5)),true,a;
					end;
					if _.overridden()then 
						return _.project_view(z);
					end;
					local h,F=r:WorldToViewportPoint(z);
					return Vector2.new(h.X,h.Y),F,h.Z;
				end;
				s.drop_events=function(h)
					local F=h.links;
					local h,t=F.added,F.removed;
					if h then 
						pcall(h.Disconnect,h);
						F.added=nil;
					end;
					if t then 
						pcall(t.Disconnect,t);
						F.removed=nil;
					end;
				end;
				local function h(F,t)
					if _.body_parts[t.Name]then 
						F.cacheValid=false;
					end;
				end;
				s.watch=function(F,t)
					F:drop_events();
					if not(t)then 
						return;
					end;
					local C=F.links;
					C.added=t.ChildAdded:Connect(function(z)
						h(F,z);
					end);
					C.removed=t.ChildRemoved:Connect(function(t)
						h(F,t);
					end);
				end;
				s.validate=function(h)
					local F=h.char;
					if F then 
						if F.Parent then 
							if h.cacheValid==false then 
								return false;
							end;
						else 
							return false;
						end;
					else 
						return false;
					end;
					local t=h.charCache;
					h=#t;
					if h==0 then 
						return false;
					end;
					for C=1,f(3,h),1 do 
						local h=t[C];
						if h then 
							if h.Parent then 
								if h.Parent~=F then 
									return false;
								end;
							else 
								return false;
							end;
						else 
							return false;
						end;
					end;
					return true;
				end;
				s.rebuild=function(h)
					local F=h.charCache;
					if h.char then 
						if not(h.char.Parent)then 
							l(F);
							return;
						end;
					else 
						l(F);
						return;
					end;
					_.char_parts(h.char,F);
					h.cacheValid=true;
				end;
				s.update=function(h)
					local F=h.itf;
					local t=N.shared_for(F,h.plr);
					local f=t.opt;
					h.opt=f;
					h.indicators=nil;
					h._quiet=false;
					local C=h.plr;
					if if C then not h.plr.Parent else not C then 
						h.en=false;
						h.char=nil;
						h.onSc=false;
						l(h.charCache);
						h.cacheValid=false;
						h.skpts=nil;
						h._hd=nil;
						h:drop_events();
						return;
					end;
					C=t.char;
					if C~=h.char then 
						h.char=C;
						l(h.charCache);
						h.cacheValid=false;
						h.cacheChar=nil;
						h.skpts=nil;
						h.dir=nil;
						h._hd=nil;
						h._arSnap=true;
						h:watch(C);
					end;
					h.en=t.en;
					h.fr=t.fr;
					if not(h.en)then 
						h.onSc=false;
						h.cacheValid=false;
						h.skpts=nil;
						return;
					end;
					C=h._hd;
					if if C then C.Parent~=h.char else not C then 
						C=h.char and h.char:FindFirstChild("Head")or nil;
						h._hd=C;
					else 
					end;
					if if C then not C.Parent else not C then 
						l(h.charCache);
						h.cacheValid=false;
						h.skpts=nil;
						h.onSc=false;
						return;
					end;
					local z,q=_.camera(),t.clone;
					local r=q and q.viewport;
					if r then 
						if not(rawget(R,"VISUALS_TAB_OPEN"))then 
							h.onSc=false;
							return;
						end;
						z=r.CurrentCamera or z;
					else 
					end;
					h.viewport=r;
					h.activeCam=z;
					local R,x,G=h:project(C.Position);
					local a=F.shSet;
					local m=a.limDis and G>a.maxDis;
					h.onSc=x and not m;
					h.dis=((_.overridden()and _.view_frame().Position or z.CFrame.Position)-C.Position).Magnitude;
					x=_.viewport();
					if r then 
					elseif m then 
					elseif G>0.05 then 
						a=(_.rt.foc or 800)*8/G;
						if R.X>-a then 
							if R.Y>-a then 
								if R.X<x.X+a then 
									if R.Y<x.Y+a then 
										t.vis=true;
									end;
								end;
							end;
						end;
					end;
					if h.onSc then 
						a=N.opt_flags(F,f);
						if a.hp then 
							h.hp,h.maxHp=F.getHp(h.plr,h.char);
						end;
						if a.arm then 
							h.arm=F.getArm(h.plr);
						end;
						if a.wep then 
							h.wep=F.getWep(h.plr);
						end;
						if a.mon then 
							h.mon=F.getMoney and F.getMoney(h.plr)or 0;
						end;
						if a.pn then 
							h.pn=F.getPing and F.getPing(h.plr)or 0;
						end;
						if a.ind then 
							if type(F.getIndicators)=="function"then 
								h.indicators=F.getIndicators(h.plr,h.char,f.flashed==true);
							end;
						end;
						if f.skel then 
							h:skeleton();
						else 
							h.skpts=nil;
						end;
						if not(a.corn)then 
							h.corn=nil;
							h._quiet=not f.skel;
							return;
						end;
						if#h.charCache==0 then 
							h:rebuild();
						elseif not(h.cacheValid)then 
							h:rebuild();
						end;
						if#h.charCache==0 then 
							h.onSc=false;
							return;
						end;
						m,x=_.bounds(h.charCache);
						if m then 
							if not x then 
								h.onSc=false;
								h.cacheValid=false;
								return;
							end;
						else 
							h.onSc=false;
							h.cacheValid=false;
							return;
						end;
						if r then 
							h.corn=_.calc_corners_viewport(m,x,z,r);
						else 
							h.corn=_.calc_corners(m,x,h._cornT,h._cornPts);
						end;
						return;
					end;
					if f.offAr then 
						if not(q)then 
							x=R-_.viewport()*0.5;
							x=if G<=0 then-x else x;
							a=x.Magnitude;
							if a>0.001 then 
								h.dir=x/a;
								return;
							end;
							t=_.overridden()and _.view_frame()or z.CFrame;
							F=u(g(t.Position,t.RightVector,Vector3.yAxis),C.Position);
							m=Vector2.new(F.X,F.Z);
							r=m.Magnitude;
							h.dir=r>0.001 and m/r or h.dir or Vector2.new(0,-1);
						end;
					end;
				end;
				s.skeleton=function(R)
					local _=R.char;
					if _ then 
						if not(R.onSc)then 
							R.skpts=nil;
							return;
						end;
					else 
						R.skpts=nil;
						return;
					end;
					local h=R._skparts;
					if h then 
					else 
						h={};
						R._skparts=h;
					end;
					if R._skchar~=_ or not R.cacheValid then 
						local F=N.find_part;
						R._skchar=_;
						h.hd=F(_,"Head");
						h.ur=F(_,"UpperTorso")or F(_,"Torso");
						h.lr=F(_,"LowerTorso")or F(_,"Torso");
						h.lua=F(_,"LeftUpperArm")or F(_,"Left Arm");
						h.rua=F(_,"RightUpperArm")or F(_,"Right Arm");
						h.lfa=F(_,"LeftLowerArm")or F(_,"LeftHand");
						h.rfa=F(_,"RightLowerArm")or F(_,"RightHand");
						h.lul=F(_,"LeftUpperLeg")or F(_,"Left Leg");
						h.rul=F(_,"RightUpperLeg")or F(_,"Right Leg");
						h.lll=F(_,"LeftLowerLeg")or F(_,"LeftFoot");
						h.rll=F(_,"RightLowerLeg")or F(_,"RightFoot");
					end;
					_=h.hd;
					if _ then 
						if not(_.Parent)then 
							R.skpts=nil;
							return;
						end;
					else 
						R.skpts=nil;
						return;
					end;
					local N=R._skpts;
					if N then 
					else 
						N={};
						R._skpts=N;
					end;
					l(N);
					N.hd=_.Position;
					local _,F,t,f,g,u,C,z,q,r=h.ur,h.lr,h.lua,h.rua,h.lfa,h.rfa,h.lul,h.rul,h.lll,h.rll;
					if _ then 
						if _.Parent then 
							N.ur=_.Position;
						end;
					end;
					if F then 
						if F.Parent then 
							N.lr=F.Position;
						end;
					end;
					if t then 
						if t.Parent then 
							N.lua=t.Position;
						end;
					end;
					if f then 
						if f.Parent then 
							N.rua=f.Position;
						end;
					end;
					if g then 
						if g.Parent then 
							N.lfa=g.Position;
						end;
					end;
					if u then 
						if u.Parent then 
							N.rfa=u.Position;
						end;
					end;
					if C then 
						if C.Parent then 
							N.lul=C.Position;
						end;
					end;
					if z then 
						if z.Parent then 
							N.rul=z.Position;
						end;
					end;
					if q then 
						if q.Parent then 
							N.lll=q.Position;
						end;
					end;
					if r then 
						if r.Parent then 
							N.rll=r.Position;
						end;
					end;
					R.skpts=N;
				end;
				s.destroy=function(R)
					R:drop_events();
					if R.av then 
						pcall(R.av.Destroy,R.av);
						R.av=nil;
					end;
					l(R.charCache);
					R.corn=nil;
					R.skpts=nil;
					R.char=nil;
					R._hd=nil;
					R.viewport=nil;
					R.activeCam=nil;
					R.indicators=nil;
				end;
				return s;
			end;
			K.B=function()
				local R=K.load("b");
				local _=K.load("a");
				local N=K.load("s");
				local h=K.load("x");
				local F=K.load("p");
				local t=R.workspace;
				local f=R.lp;
				local l=N.white;
				local g=math.min;
				local u=math.max;
				local s,C,z=Vector3.new,{["Counter-Terrorists"]=true,CT=true},{};
				z.UpperTorso=s(1,1.04,1);
				z.LowerTorso=s(0.95,1.5,1);
				z.Torso=s(1,1,1);
				local q=Enum.AdornShading and Enum.AdornShading.XRay or nil;
				local r=Enum.AdornCullingMode and Enum.AdornCullingMode.Never or nil;
				if type(setfflag)=="function"then 
					pcall(setfflag,"AdornShadingAPI","True");
				end;
				local x,G;
				local function a()
					local m=t.CurrentCamera;
					if not(m)then 
						return nil;
					end;
					if if x then not x.Parent else not x then 
						x=Instance.new("Folder");
						x.Parent=m;
						_.own(x);
						G=Instance.new("Part");
						local _=G;
						_.Size=Vector3.one;
						G.Anchored=true;
						G.CanCollide=false;
						G.CanQuery=false;
						G.CanTouch=false;
						G.CastShadow=false;
						G.Massless=true;
						G.Locked=true;
						G.Transparency=1;
						G.Parent=x;
					elseif x.Parent~=m then 
						x.Parent=m;
					end;
					m=x;
					return m;
				end;
				local _=Vector3.one*0.004;
				local m=CFrame.new();
				local c,n,O,j=Vector3.zero,false,0,{};
				j.__index=j;
				j.begin_frame=function(E)
					local P=t.CurrentCamera;
					if not(P)then 
						return false;
					end;
					if not(a())then 
						return false;
					end;
					local t=P.CFrame;
					G.CFrame=t;
					m=t:Inverse();
					c=t.Position;
					O+=E or 0;
					n=O>=0.6;
					if n then 
						O=0;
					end;
					return true;
				end;
				local function t(a)
					local O=tonumber(a.chamsGlow)or 4;
					return if O<1 then 1 else O;
				end;
				local function a(O,E)
					return Color3.new(O.R*E,O.G*E,O.B*E);
				end;
				local O=N.body_parts;
				local function E(P,T)
					if P.Parent~=T then 
						return false;
					elseif not(O[P.Name])then 
						return false;
					end;
					if not(P:IsA("BasePart"))then 
						return false;
					end;
					T=P.Size;
					return T.X>0.05 and T.Y>0.05 and T.Z>0.05;
				end;
				local function O(P)
					local T=P:FindFirstChildOfClass("SpecialMesh");
					if T then 
						P=T.Scale;
						if typeof(P)=="Vector3"then 
							return P;
						end;
					end;
					return nil;
				end;
				local function P(T,Y)
					local v,Z=T.Size,T.Name;
					local L=v;
					if Z=="Head"then 
						local o=O(T);
						v=if o then L*o else L;
						return if Y~=1 then v*Y else v;
					end;
					Y=O(T);
					if Y then 
						return L*Y;
					end;
					T=z[Z];
					if T then 
						return L*T;
					end;
					v,Z,T=L.X,L.Y,L.Z;
					if Z>=v then 
						if Z>=T then 
							return s(v*1,Z*1.08,T*1);
						end;
					end;
					if v>=Z then 
						if v>=T then 
							return s(v*1.08,Z*1,T*1);
						end;
					end;
					return s(v*1,Z*1,T*1.08);
				end;
				j.new=function(s,z)
					return setmetatable({plr=s,itf=z,parts={},slots=R.weak(),links={},charRef=nil,shown=false,armed=false,fill_col=nil,glow_col=nil,head_trim=1},j);
				end;
				j.drop_part=function(R,s)
					local z=R.slots[s];
					if not(z)then 
						return;
					end;
					R.slots[s]=nil;
					if z.glow then 
						pcall(z.glow.Destroy,z.glow);
					end;
					if z.fill then 
						pcall(z.fill.Destroy,z.fill);
					end;
				end;
				local function R(s)
					local z=Instance.new("BoxHandleAdornment");
					z.Adornee=G;
					z.Transparency=0;
					z.ZIndex=s;
					z.Visible=false;
					if q then 
						z.Shading=q;
					end;
					if r then 
						z.AdornCullingMode=r;
					end;
					z.Parent=x;
					return z;
				end;
				j.add_part=function(s,z)
					if s.slots[z]then 
						return;
					elseif not(E(z,s.charRef))then 
						return;
					end;
					local q={glow=nil,fill=nil,base=P(z,s.head_trim),size=z.Size};
					if s.armed then 
						local r,G=R(0),R(1);
						r.Color3=s.glow_col or l;
						G.Color3=s.fill_col or l;
						r.Visible=s.shown;
						G.Visible=s.shown;
						q.glow=r;
						q.fill=G;
						s.fade=nil;
					end;
					local r=#s.parts+1;
					s.parts[r]=z;
					s.slots[z]=q;
				end;
				j.arm=function(s)
					if s.armed then 
						return;
					end;
					s.armed=true;
					local z,q,r,G=s.parts,s.slots,s.fill_col or l,s.glow_col or l;
					for O=1,#z,1 do 
						s=q[z[O]];
						if s then 
							if not(s.fill)then 
								local z,q=R(0),R(1);
								z.Color3=G;
								q.Color3=r;
								z.Visible=false;
								q.Visible=false;
								s.glow=z;
								s.fill=q;
							end;
						end;
					end;
				end;
				j.clear=function(R)
					local s=R.links;
					for z=#s,1,-1 do 
						pcall(s[z].Disconnect,s[z]);
						s[z]=nil;
					end;
					s=R.parts;
					for z=#s,1,-1 do 
						R:drop_part(s[z]);
						s[z]=nil;
					end;
					table.clear(R.slots);
					R.charRef=nil;
					R.shown=false;
					R.armed=false;
					R.fade=nil;
				end;
				j.bind=function(R,s)
					R:clear();
					if not s or not s.Parent then 
						return;
					end;
					R.charRef=s;
					R.head_trim=C[R.itf.getTeam(R.plr)]and 0.88 or 1;
					local C=s:GetChildren();
					for z=1,#C,1 do 
						R:add_part(C[z]);
					end;
					C=R.links;
					C[#C+1]=s.ChildAdded:Connect(function(z)
						if R.charRef==s then 
							R:add_part(z);
						end;
					end);
					C[#C+1]=s.ChildRemoved:Connect(function(C)
						if R.charRef==s then 
							R:drop_part(C);
						end;
					end);
				end;
				j.rescan=function(R)
					if not(R.charRef)then 
						return;
					end;
					local s,C,z=R.parts,R.slots,0;
					for q=1,#s,1 do 
						local r=s[q];
						q=r and C[r];
						if r then 
							if r.Parent then 
								if q then 
									local C=z+1;
									s[C]=r;
									local G=r.Size;
									if q.size~=G then 
										q.size=G;
										q.base=P(r,R.head_trim);
									end;
									z=C;
								else 
									if r then 
										R:drop_part(r);
									end;
								end;
							else 
								if r then 
									R:drop_part(r);
								end;
							end;
						else 
							if r then 
								R:drop_part(r);
							end;
						end;
					end;
					for R=#s,z+1,-1 do 
						s[R]=nil;
					end;
				end;
				j.set_shown=function(R,s)
					R.shown=s;
					local C,z=R.parts,R.slots;
					for q=1,#C,1 do 
						R=z[C[q]];
						if R then 
							if R.fill then 
								R.glow.Visible=s;
								R.fill.Visible=s;
							end;
						end;
					end;
				end;
				j.recolor=function(R,s,C)
					R.fill_col=s;
					R.glow_col=C;
					local z,q=R.parts,R.slots;
					for r=1,#z,1 do 
						R=q[z[r]];
						if R then 
							if R.fill then 
								R.fill.Color3=s;
								R.glow.Color3=C;
							end;
						end;
					end;
				end;
				j.update=function(R)
					local s=R.itf;
					local C=h.shared_for(s,R.plr);
					local h,z=C.opt,C.char;
					local q=C.en and h and h.chams and z and z.Parent and R.plr~=f;
					if if q then not x else not q then 
						if R.charRef then 
							R:clear();
						end;
						return;
					end;
					if R.charRef~=z then 
						R:bind(z);
					end;
					if n then 
						R:rescan();
					end;
					z,q=R.parts,R.slots;
					local f,r=#z;
					for x=1,f,1 do 
						C=z[x];
						if C then 
							if C.Parent then 
								r=C;
								break;
							end;
						end;
					end;
					C=r~=nil;
					if C then 
						local x=s.shSet;
						local G=tonumber(x.maxDis);
						if G then 
							if x.limDis then 
								local x=c;
								C=if(x-r.Position).Magnitude>G then false else C;
							else 
							end;
						else 
						end;
					else 
					end;
					if not C then 
						if R.shown then 
							R:set_shown(false);
						end;
						return;
					end;
					if not(R.armed)then 
						R:arm();
					end;
					if not(R.shown)then 
						R:set_shown(true);
					end;
					C=N.parse_col(R,h.chamsOCol[1])or l;
					s=a(C,t(h));
					if R.fill_col~=C then 
						R:recolor(C,s);
					elseif R.glow_col~=s then 
						R:recolor(C,s);
					end;
					C=F.fade(R.plr);
					if R.fade~=C then 
						R.fade=C;
						s=1-C;
						for N=1,f,1 do 
							h=q[z[N]];
							if h then 
								if h.fill then 
									h.fill.Transparency=s;
									h.glow.Transparency=s;
								end;
							end;
						end;
					end;
					for N=1,f,1 do 
						R=z[N];
						C=R and q[R];
						if C then 
							if R.Parent then 
								h=m;
								s=h*R.CFrame;
								N=s.Position;
								local R=g(0.6/u(N.Magnitude,0.001),1);
								local h,F,t=CFrame.new(N*R)*(s-N),(C.base*R):Max(_),C.fill;
								t.CFrame=h;
								t.Size=F;
								R=C.glow;
								R.CFrame=h;
								R.Size=F*1.12;
							end;
						end;
					end;
				end;
				j.destroy=function(R)
					R:clear();
				end;
				return j;
			end;
			K.C=function()
				local R,_=K.load("b"),K.load("s");
				local N=K.load("x");
				local h=R.lp;
				local R=_.white;
				local F,t=Enum.HighlightDepthMode.AlwaysOnTop,{};
				t.__index=t;
				t.new=function(f,l)
					return setmetatable({plr=f,itf=l,inst=nil,char=nil,root=nil,links={},dirty=false,on=false,fc=nil,oc=nil,ft=nil,ot=nil},t);
				end;
				t.drop_links=function(f)
					local l=f.links;
					for g=#l,1,-1 do 
						f=l[g];
						l[g]=nil;
						pcall(f.Disconnect,f);
					end;
				end;
				t.watch=function(f,l)
					f:drop_links();
					if not(l)then 
						return;
					end;
					local g=f.links;
					local function u()
						f.dirty=true;
					end;
					g[1]=l.ChildAdded:Connect(u);
					g[2]=l.ChildRemoved:Connect(u);
				end;
				t.hide=function(f)
					local l=f.inst;
					if f.on then 
						f.on=false;
						if l then 
							l.Enabled=false;
						end;
					elseif l then 
						if l.Enabled then 
							f.on=false;
							if l then 
								l.Enabled=false;
							end;
						end;
					end;
				end;
				t.unbind=function(f)
					f:hide();
					f:drop_links();
					f.char=nil;
					f.root=nil;
					f.dirty=false;
					local l=f.inst;
					if l then 
						l.Adornee=nil;
					end;
				end;
				t.ensure=function(f)
					local l,g=f.inst,_.holder;
					if l then 
						if l.Parent==g then 
							return l;
						end;
					end;
					if l then 
						pcall(l.Destroy,l);
					end;
					l=Instance.new("Highlight");
					l.Enabled=false;
					l.DepthMode=F;
					l.Parent=g;
					f.inst=l;
					f.char=nil;
					f.on=false;
					f.fc=nil;
					f.oc=nil;
					f.ft=nil;
					f.ot=nil;
					return l;
				end;
				t.update=function(F)
					local f=F.itf;
					local l=N.shared_for(f,F.plr);
					local N,g,u=l.opt,l.char,l.en;
					if(if u then not N else not u)or not N.hlt or not g or not g.Parent or F.plr==h then 
						if F.char then 
							F:unbind();
						end;
						return;
					end;
					u,l=F:ensure(),F.root;
					if F.char~=g then 
						F.char=g;
						l=g:FindFirstChild("HumanoidRootPart")or g:FindFirstChild("Head");
						F.root=l;
						F.dirty=false;
						F:watch(g);
						u.Adornee=g;
					else 
						if if l then l.Parent~=g else not l then 
							l=g:FindFirstChild("HumanoidRootPart")or g:FindFirstChild("Head");
							F.root=l;
							F.dirty=l~=nil;
						else 
						end;
						if F.dirty or u.Adornee~=g then 
							F.dirty=false;
							u.Adornee=nil;
							u.Adornee=g;
							F.on=false;
						end;
					end;
					if not l then 
						F:hide();
						return;
					end;
					g=f.shSet;
					if g.limDis then 
						f=tonumber(g.maxDis);
						if f then 
							if(_.view_frame().Position-l.Position).Magnitude>f then 
								F:hide();
								return;
							end;
						end;
					end;
					l,g=N.hltFCol,N.hltOCol;
					local N,h,f,s=_.parse_col(F,l[1])or R,_.parse_col(F,g[1])or R,1-(tonumber(l[2])or 0.5),1-(tonumber(g[2])or 1);
					if F.fc~=N then 
						F.fc=N;
						u.FillColor=N;
					end;
					if F.oc~=h then 
						F.oc=h;
						u.OutlineColor=h;
					end;
					if F.ft~=f then 
						F.ft=f;
						u.FillTransparency=f;
					end;
					if F.ot~=s then 
						F.ot=s;
						u.OutlineTransparency=s;
					end;
					if F.on then 
						if not(u.Enabled)then 
							F.on=true;
							u.Enabled=true;
						end;
					else 
						F.on=true;
						u.Enabled=true;
					end;
				end;
				t.destroy=function(R)
					R:drop_links();
					local _=R.inst;
					R.inst=nil;
					R.char=nil;
					R.root=nil;
					R.dirty=false;
					R.on=false;
					if _ then 
						pcall(_.Destroy,_);
					end;
				end;
				return t;
			end;
			K.D=function()
				local R=K.load("s");
				local _=K.load("v");
				local N=K.load("z");
				local h=R.white;
				local F=Color3.new();
				local t,f=math.round,{};
				f.__index=f;
				f.new=function(l,g)
					g=assert(g,"No options");
					g.en=g.en==nil and true or g.en;
					g.txt=g.txt or"{name}";
					g.txtCol=g.txtCol or{h,1};
					g.txtOut=g.txtOut==nil and true or g.txtOut;
					g.txtOCol=g.txtOCol or F;
					g.txtSz=g.txtSz or 13;
					g.txtFnt=g.txtFnt or 3;
					g.limDis=g.limDis or false;
					g.maxDis=g.maxDis or 150;
					g.txtGrd=g.txtGrd or false;
					g.txtGrdCol=g.txtGrdCol or{h,Color3.new(1,0,0)};
					return setmetatable({inst=assert(l,"No instance"),opt=g,ph=math.random(),dead=false},f);
				end;
				f.update=function(h)
				end;
				f.draw=function(h)
					if h.dead then 
						return;
					end;
					local F=h.inst;
					if F then 
						if not(F.Parent)then 
							h.dead=true;
							return;
						end;
					else 
						h.dead=true;
						return;
					end;
					local l=h.opt;
					if not(l.en)then 
						return;
					end;
					local g,u=pcall(F.GetPivot,F);
					if not(g)then 
						return;
					end;
					g=u.Position;
					local u,s,C=R.to_screen(g);
					if u then 
						if not(s)then 
							return;
						end;
					else 
						return;
					end;
					if l.limDis then 
						if C>l.maxDis then 
							return;
						end;
					end;
					local R,s,z=l.txt:gsub("{name}",F.Name):gsub("{distance}",t(C)):gsub("{position}",tostring(g)),l.txtSz,l.txtOut and l.txtOCol or nil;
					if l.txtGrd then 
						N.grad_text(R,u.X,u.Y,s,z,l.txtCol[2],l.txtGrdCol[1],l.txtGrdCol[2],h.ph);
					elseif z then 
						_.outlined_text(u,s,l.txtCol[1],l.txtCol[2],z,l.txtCol[2],R,true);
					else 
						_.text(u,s,l.txtCol[1],l.txtCol[2],R,true);
					end;
				end;
				f.destroy=function(R)
					R.dead=true;
					R.inst=nil;
				end;
				return f;
			end;
			K.E=function()
				return{shSet={tSz=13,tFnt=3,limDis=false,maxDis=150,useTeam=false},allowlocal=false,tSet={en={en=false,dPos="bottom",wPos="bottom",monPos="right",pnPos="right",armMax=100,box=false,boxType="Static",boxCol={Color3.new(1,0,0),1},boxO=true,boxOCol={Color3.new(),1},boxF=false,boxFCol={Color3.new(1,0,0),0.5},boxGrd=false,boxGrdCol={Color3.new(1,0,0),Color3.new(0,0,1)},boxFGrd=false,boxFGrdCol={Color3.new(1,0,0),Color3.new(0,0,1)},hb=false,hbSide="left",hlCol=Color3.new(0,1,0),dyCol=Color3.new(1,0,0),hbo=true,hboCol={Color3.new(),0.5},hbCol={Color3.new(0,1,0),1},hbGrd=false,hbGrdCol={Color3.new(0,1,0),Color3.new(1,0,0)},ht=false,htCol={Color3.new(1,1,1),1},htOut=true,htOCol=Color3.new(),htGrd=false,htGrdCol={Color3.new(1,1,1),Color3.new(1,0,0)},ab=false,abSide="right",abCol={Color3.fromRGB(0,150,255),1},abo=true,aboCol={Color3.new(),0.5},abGrd=false,abGrdCol={Color3.fromRGB(0,150,255),Color3.fromRGB(0,60,200)},at=false,atCol={Color3.new(1,1,1),1},atOut=true,atOCol=Color3.new(),b3d=false,b3dCol={Color3.new(1,0,0),1},name=false,nCol={Color3.new(1,1,1),1},nOut=true,nOCol=Color3.new(),nGrd=false,nGrdCol={Color3.new(1,1,1),Color3.new(1,0,0)},av=false,wep=false,wCol={Color3.new(1,1,1),1},wOut=true,wOCol=Color3.new(),wGrd=false,wGrdCol={Color3.new(1,1,1),Color3.new(1,0,0)},wepIcon=false,wepIconCol={Color3.new(1,1,1),1},wepIconPos="bottom",wepIconSz=16,mon=false,monCol={Color3.new(1,1,1),1},monOut=true,monOCol=Color3.new(),monGrd=false,monGrdCol={Color3.new(1,1,1),Color3.new(1,0,0)},pn=false,pnCol={Color3.new(1,1,1),1},pnOut=true,pnOCol=Color3.new(),pnGrd=false,pnGrdCol={Color3.new(1,1,1),Color3.new(1,0,0)},bomb=false,bombCol={Color3.fromRGB(255,95,70),1},bombGrd=false,bombGrdCol={Color3.fromRGB(255,95,70),Color3.fromRGB(255,95,70)},bombPos="right",scope=false,scopeCol={Color3.fromRGB(90,170,255),1},scopeGrd=false,scopeGrdCol={Color3.fromRGB(90,170,255),Color3.fromRGB(90,170,255)},scopePos="right",flashed=false,flashedCol={Color3.fromRGB(255,220,70),1},flashedGrd=false,flashedGrdCol={Color3.fromRGB(255,220,70),Color3.fromRGB(255,220,70)},flashedPos="right",defuse=false,defuseCol={Color3.fromRGB(90,220,255),1},defuseGrd=false,defuseGrdCol={Color3.fromRGB(90,220,255),Color3.fromRGB(90,220,255)},defusePos="right",dis=false,dCol={Color3.new(1,1,1),1},dOut=true,dOCol=Color3.new(),dGrd=false,dGrdCol={Color3.new(1,1,1),Color3.new(1,0,0)},tr=false,trOrg="Bottom",trCol={Color3.new(1,0,0),1},tro=true,troCol={Color3.new(),1},offAr=false,offArCol={Color3.new(1,1,1),1},offArSz=22,offArPad=18,offArSmooth=0.08,chams=false,chamsGlow=4,chamsFCol={Color3.new(1,1,1),0.5},chamsOCol={Color3.new(1,1,1),0},chamsWall=false,chamsFWCol={Color3.fromRGB(20,20,20),0.5},chamsOWCol={Color3.new(),0},matChams=false,matChamsType="ForceField",matChamsStyle="Chromatic",matChamsCol=Color3.new(1,1,1),matChamsVisCol={Color3.new(1,1,1),0},matChamsOccCol={Color3.new(0.3,0.3,0.3),0},hlt=false,hltFCol={Color3.new(1,1,1),0.5},hltOCol={Color3.new(1,1,1),1},skel=false,skelCol={Color3.new(1,1,1),1},gskel=false,gskelCol={Color3.new(1,0,0),0.5}},fr={en=false,box=false,boxCol={Color3.new(0,1,0),1},boxO=true,boxOCol={Color3.new(),1},boxF=false,boxFCol={Color3.new(0,1,0),0.5},hb=false,hlCol=Color3.new(0,1,0),dyCol=Color3.new(1,0,0),hbo=true,hboCol={Color3.new(),0.5},ht=false,htCol={Color3.new(1,1,1),1},htOut=true,htOCol=Color3.new(),b3d=false,b3dCol={Color3.new(0,1,0),1},name=false,nCol={Color3.new(1,1,1),1},nOut=true,nOCol=Color3.new(),wep=false,wCol={Color3.new(1,1,1),1},wOut=true,wOCol=Color3.new(),wepIcon=false,wepIconCol={Color3.new(1,1,1),1},wepIconPos="bottom",wepIconSz=16,bomb=false,bombCol={Color3.fromRGB(255,95,70),1},bombGrd=false,bombGrdCol={Color3.fromRGB(255,95,70),Color3.fromRGB(255,95,70)},bombPos="right",scope=false,scopeCol={Color3.fromRGB(90,170,255),1},scopeGrd=false,scopeGrdCol={Color3.fromRGB(90,170,255),Color3.fromRGB(90,170,255)},scopePos="right",flashed=false,flashedCol={Color3.fromRGB(255,220,70),1},flashedGrd=false,flashedGrdCol={Color3.fromRGB(255,220,70),Color3.fromRGB(255,220,70)},flashedPos="right",defuse=false,defuseCol={Color3.fromRGB(90,220,255),1},defuseGrd=false,defuseGrdCol={Color3.fromRGB(90,220,255),Color3.fromRGB(90,220,255)},defusePos="right",dis=false,dCol={Color3.new(1,1,1),1},dOut=true,dOCol=Color3.new(),tr=false,trOrg="Bottom",trCol={Color3.new(0,1,0),1},tro=true,troCol={Color3.new(),1},offAr=false,offArCol={Color3.new(1,1,1),1},offArSz=22,offArPad=18,offArSmooth=0.08,chams=false,chamsGlow=4,chamsFCol={Color3.new(1,1,1),0.5},chamsOCol={Color3.new(1,1,1),0},chamsWall=false,chamsFWCol={Color3.fromRGB(20,20,20),0.5},chamsOWCol={Color3.new(),0},matChams=false,matChamsType="ForceField",matChamsStyle="Chromatic",matChamsCol=Color3.new(1,1,1),matChamsVisCol={Color3.new(1,1,1),0},matChamsOccCol={Color3.new(0.3,0.3,0.3),0},hlt=false,hltFCol={Color3.new(1,1,1),0.5},hltOCol={Color3.new(1,1,1),1}}}};
			end;
			K.F=function()
				local R=K.load("b");
				local _=K.load("a");
				local N=K.load("s");
				local h=K.load("t");
				local F=K.load("v");
				local t=K.load("w");
				local f=K.load("z");
				local l=K.load("A");
				local g=K.load("B");
				local u=K.load("C");
				local s=K.load("D");
				local C,z=K.load("E"),K.load("p");
				local q=K.load("g");
				local r=R.players;
				local x=R.workspace;
				local G=R.http;
				local a=R.lp;
				local m=math.floor;
				local c,n=os.clock,{};
				n["Counter-Terrorists"]=Color3.fromRGB(120,170,255);
				n.Terrorists=Color3.fromRGB(230,170,60);
				n.CT=Color3.fromRGB(120,170,255);
				n.T=Color3.fromRGB(230,170,60);
				local O={};
				O.ViewResolver=N.resolver;
				O._loaded=false;
				O._objCache={};
				O._clones={};
				O.wlist=C.wlist or{};
				O.shSet=C.shSet;
				O.allowlocal=C.allowlocal==true;
				O.tSet=C.tSet;
				local C,j,E={},0,0;
				local function P()
					return x:FindFirstChild("Characters");
				end;
				local function T(Y)
					return Y.Character;
				end;
				local function Y(v)
					return typeof(v)=="Instance"and v.Parent~=nil and v:IsDescendantOf(x)and v:GetAttribute("ClientCharacterPresentationVisible")~=false;
				end;
				local function x(v)
					if not(v)then 
						return nil;
					end;
					local Z,L=pcall(T,v);
					if Z then 
						if Y(L)then 
							return L;
						end;
					end;
					L=v.Name;
					if type(L)=="string"then 
						Z=P();
						if Z then 
							v=Z:FindFirstChild(L);
							if Y(v)then 
								return v;
							end;
						end;
					end;
					return nil;
				end;
				local function P(T)
					if not(T)then 
						return nil;
					end;
					local v,Z=pcall(T.GetAttribute,T,"Team");
					if v then 
						if type(Z)=="string"then 
							if Z~=""then 
								return Z;
							end;
						end;
					end;
					return nil;
				end;
				local T,v={},0;
				local function Z(L)
					return G:JSONDecode(L);
				end;
				local function G(L)
					if type(L)~="string"then 
						return nil;
					elseif L==""then 
						return nil;
					end;
					local o=T[L];
					if o~=nil then 
						return o or nil;
					end;
					local o,X=pcall(Z,L);
					if v>500 then 
						table.clear(T);
						v=0;
					end;
					v+=1;
					if o then 
						if type(X)=="table"then 
							T[L]=X;
							return X;
						end;
					end;
					T[L]=false;
					return nil;
				end;
				local Z=R.weak();
				O.getIndicators=function(L,o,X)
					local Q=Z[L];
					if Q then 
					else 
						Q={bomb=false,scope=false,flashed=false,defuse=false};
						Z[L]=Q;
					end;
					if typeof(L)~="Instance"then 
						if not(q.is(L))then 
							Q.bomb=false;
							Q.scope=false;
							Q.flashed=false;
							Q.defuse=false;
							return Q;
						end;
					end;
					local Z=L:GetAttribute("Slot5");
					if Q.slot5~=Z then 
						Q.slot5=Z;
						local S=G(Z);
						Q.bomb=S~=nil and S.Weapon=="C4";
					end;
					Q.scope=(tonumber(L:GetAttribute("ScopeIncrement"))or 0)>0;
					Q.defuse=L:GetAttribute("IsDefusingBomb")==true;
					if not(X)then 
						Q.flashed=false;
						return Q;
					end;
					X=c();
					if Q.char~=o or X>=(Q.refresh or 0)then 
						Q.char=o;
						Q.refresh=X+0.05;
						Q.flashed=false;
						Z=Q.animator;
						if if Z then Z.Parent==nil else not Z then 
							Z=o and(o:FindFirstChildWhichIsA("Animator",true));
							Q.animator=Z;
						else 
						end;
						if Z then 
							local o,X=pcall(Z.GetPlayingAnimationTracks,Z);
							if o then 
								for Z=1,#X,1 do 
									L=X[Z];
									Z=L.Animation;
									if L.IsPlaying then 
										if Z then 
											if Z.AnimationId=="rbxassetid://101513162753523"then 
												Q.flashed=true;
												break;
											end;
										end;
									end;
								end;
							end;
						end;
					end;
					return Q;
				end;
				O.getChar=function(Z)
					local L=z.char(Z);
					if L==false then 
						return nil;
					end;
					local o=O._clones[Z];
					if o then 
						L=o.model;
						if L then 
							if not(L.Parent)then 
								return nil;
							end;
						else 
							return nil;
						end;
					else 
						if L==nil then 
							L=(x(Z));
						else 
							if not(z.ghost(L))then 
								if not(Y(L))then 
									return nil;
								end;
							end;
						end;
					end;
					if L then 
						if L:GetAttribute("CharacterType")~="PlayerCustomCharacter"then 
							return nil;
						end;
					else 
						return nil;
					end;
					o,Z=pcall(L.GetAttribute,L,"Dead");
					if o then 
						if Z==true then 
							return nil;
						end;
					end;
					return L;
				end;
				O.isFr=function(Y)
					if not(Y)then 
						return false;
					end;
					if Y==a then 
						return true;
					end;
					local Z=N.frame();
					if O._mtFrame~=Z then 
						O._mtFrame=Z;
						O._mt=P(a);
					end;
					local a,Z=O._mt,P(Y);
					if a then 
						if not(Z)then 
							return false;
						end;
					else 
						return false;
					end;
					return a==Z;
				end;
				O.getTC=function(a)
					local Y=P(a);
					return Y and n[Y]or nil;
				end;
				O.getTeam=function(a)
					return P(a);
				end;
				O.getHp=function(a,n)
					n=n or a and(x(a));
					if not(n)then 
						return 0,100;
					end;
					if n:GetAttribute("Dead")==true then 
						return 0,n:GetAttribute("MaxHealth")or 100;
					end;
					local x,a=n:GetAttribute("Health"),n:GetAttribute("MaxHealth");
					return if type(x)~="number"then 100 else x,if type(a)~="number"then 100 else if a<=0 then 100 else a;
				end;
				O.getArm=function(x)
					if not(x)then 
						return 0;
					end;
					local a=G(x:GetAttribute("Armor"));
					if a then 
						if type(a.Health)=="number"then 
							return a.Health;
						end;
					end;
					return 0;
				end;
				O.getWep=function(x)
					if not(x)then 
						return"";
					end;
					local a=G(x:GetAttribute("CurrentEquipped"));
					if a then 
						if type(a.Name)=="string"then 
							return a.Name;
						end;
					end;
					return"";
				end;
				O.getPing=function(x)
					if not(x)then 
						return 0;
					end;
					local G=x:GetAttribute("Ping");
					return type(G)=="number"and m(G+0.5)or 0;
				end;
				O.getMoney=function(x)
					if not(x)then 
						return 0;
					end;
					local G=x:GetAttribute("Money");
					return type(G)=="number"and m(G+0.5)or 0;
				end;
				local function x(G,a,m,n,P)
					local Y={key=G,state=a,cham=m,kind=n,hl=P};
					C[#C+1]=Y;
					O._objCache[G]=Y;
					return Y;
				end;
				local function G(a)
					local m=O._objCache[a];
					if not(m)then 
						return;
					end;
					O._objCache[a]=nil;
					for n=1,#C,1 do 
						if C[n]==m then 
							a=#C;
							C[n]=C[a];
							C[a]=nil;
							break;
						end;
					end;
					if m.state then 
						if m.state.destroy then 
							pcall(m.state.destroy,m.state);
						end;
					end;
					if m.cham then 
						pcall(m.cham.destroy,m.cham);
					end;
					if m.hl then 
						pcall(m.hl.destroy,m.hl);
					end;
				end;
				local function a(m)
					if O._objCache[m]then 
						return;
					end;
					x(m,l.new(m,O),g.new(m,O),"player",u.new(m,O));
				end;
				local function u(m)
					G(m);
				end;
				O.AddInst=function(m,n)
					if O._objCache[m]then 
						return O._objCache[m].state;
					end;
					local P=s.new(m,n);
					x(m,P,nil,"inst");
					return P;
				end;
				O.AddClone=function(s,m,n)
					if O._loaded then 
						if s then 
							if not(m)then 
								return nil;
							end;
						else 
							return nil;
						end;
					else 
						return nil;
					end;
					local P={Name=m.Name,DisplayName=m.DisplayName,UserId=m.UserId,Character=s,Parent=r};
					O._clones[P]={model=s,real=m,viewport=n};
					j+=1;
					x(P,l.new(P,O),nil,"clone");
					return P;
				end;
				O.RemoveClone=function(l)
					if l then 
						if not(O._clones[l])then 
							return;
						end;
					else 
						return;
					end;
					O._clones[l]=nil;
					j-=1;
					if j<0 then 
						j=0;
					end;
					G(l);
				end;
				O.UpdateClone=function(l,s)
					local x=l and O._clones[l];
					if not(x)then 
						return;
					end;
					x.model=s;
					l.Character=s;
				end;
				local l,s=false,false;
				local function x(G)
					F.scale(1);
					G:draw();
				end;
				local function G(m)
					local n=m.state;
					n:update();
					F.scale(z.fade(n.plr));
					f.draw(n);
					F.scale(1);
					n=m.cham;
					if n then 
						if l then 
							n:update();
						end;
					end;
					n=m.hl;
					if n then 
						if s then 
							n:update();
						end;
					end;
				end;
				local function f()
					for z=1,#C,1 do 
						local m=C[z];
						if m.kind=="inst"then 
							pcall(x,m.state);
						else 
							pcall(G,m);
						end;
					end;
				end;
				local function z()
					for x=1,#C,1 do 
						local G=C[x].hl;
						if G then 
							pcall(G.unbind,G);
						end;
					end;
				end;
				local function x()
					for G=1,#C,1 do 
						local m=C[G].cham;
						if m then 
							pcall(m.clear,m);
						end;
					end;
				end;
				local function G()
					if not(O._loaded)then 
						return;
					end;
					local m,n=O.tSet.en,O.tSet.fr;
					local P,Y=m.en,n.en;
					if P then 
					elseif Y then 
					elseif j==0 then 
						if s then 
							s=false;
							z();
						end;
						if l then 
							l=false;
							x();
						end;
						return;
					end;
					local Z,L=(P and m.chams or Y and n.chams)and true or false,(P and m.hlt or Y and n.hlt)and true or false;
					if l then 
						if not(Z)then 
							x();
						end;
					end;
					if s then 
						if not(L)then 
							z();
						end;
					end;
					l,s=Z,L;
					Z=c();
					L=E>0 and Z-E or 0;
					E=Z;
					N.begin_frame();
					h.mask_step();
					t.open();
					if l then 
						g.begin_frame(L);
					end;
					f();
					F.scale(1);
					t.close();
				end;
				O.step=G;
				local function N()
					for f=1,#C,1 do 
						local g=C[f];
						f=g.state;
						if g.kind~="inst"then 
							if f.validate then 
								if not(f:validate())then 
									f.cacheValid=false;
								end;
							end;
						end;
					end;
				end;
				O.Load=function()
					if O._loaded then 
						return;
					end;
					O._loaded=true;
					local f=r:GetPlayers();
					for g=1,#f,1 do 
						a(f[g]);
					end;
					local f,g=q.list();
					for z=1,g,1 do 
						a(f[z]);
					end;
					_.connect(r.PlayerAdded,a);
					_.connect(r.PlayerRemoving,u);
					q.on(function(f)
						if O._loaded then 
							a(f);
						end;
					end,u);
					F.run(G);
					local F=0;
					_.connect(R.run.Heartbeat,function(R)
						F+=R;
						if F<0.1 then 
							return;
						end;
						F=0;
						N();
					end);
				end;
				O.Unload=function()
					if not(O._loaded)then 
						return;
					end;
					O._loaded=false;
					for R=#C,1,-1 do 
						local N=C[R];
						C[R]=nil;
						if N.state then 
							if N.state.destroy then 
								pcall(N.state.destroy,N.state);
							end;
						end;
						if N.cham then 
							pcall(N.cham.destroy,N.cham);
						end;
						if N.hl then 
							pcall(N.hl.destroy,N.hl);
						end;
					end;
					l,s=false,false;
					table.clear(O._objCache);
					table.clear(O._clones);
					table.clear(T);
					v,j=0,0;
					for R=#O.wlist,1,-1 do 
						O.wlist[R]=nil;
					end;
					t.purge();
					h.purge();
				end;
				_.teardown(O.Unload);
				return O;
			end;
			K.G=function()
				local R,_,N=K.load("q"),K.load("e"),K.load("F");
				local h=K.load("i");
				local F=R.white;
				local t=R.black;
				local f=N.tSet.en;
				local l,g,u=N.tSet.fr,{"bottom","left","right"},{"left","right","top","bottom"};
				local function s(C)
					local z={"box","hb","ab","n","w","d","mon","pn","bomb","scope","flashed","defuse","ht"};
					for q,q in z,nil,nil do 
						C[q.."Col"]={F,1};
						C[q.."GrdCol"]={F,F};
					end;
					C.boxOCol={t,1};
					C.boxFCol={F,0.3};
					C.boxFGrdCol={F,F};
					C.hboCol={t,0.5};
					C.aboCol={t,0.5};
					C.wepIconCol={F,1};
					C.skelCol={F,1};
					C.chamsFCol={F,0};
					C.chamsOCol={t,0};
					C.hlCol=F;
					C.dyCol=F;
				end;
				s(f);
				s(l);
				l.bomb=nil;
				l.defuse=nil;
				l.scope=nil;
				local C={bomb=true,defuse=true,scope=true};
				setmetatable(l,{__index=function(z,z)
					if C[z]then 
						return false;
					end;
					return nil;
				end,__newindex=function(z,q,r)
					if not(C[q])then 
						rawset(z,q,r);
					end;
				end});
				N.shSet.useTeam=false;
				local function C(z)
					return function(q)
						f[z]=q;
					end;
				end;
				local function z(q)
					return function(r)
						f[q][1]=r;
					end;
				end;
				local function q(r)
					return function(x)
						f[r.."Col"][1]=x;
						f[r.."GrdCol"][1]=x;
					end;
				end;
				local function r(x)
					return function(G)
						f[x.."GrdCol"][2]=G;
					end;
				end;
				s=_.tabs.visuals:page({name="players",cols=3});
				local x,G,a=s:section({name="esp"}),s:section({name="player",side=2}),s:section({name="flags",side=3});
				local m=x:toggle({name="enable",flag="vis.on",cb=function(c)
					f.en=c;
					if c then 
						if not(N._loaded)then 
							N.Load();
						end;
					end;
				end});
				s=x:toggle({name="tracker",flag="vis.track",default=true,cb=function(c)
					h.vis=c;
				end});
				s:slider({flag="vis.trackmem",min=2,max=120,default=30,suffix="s",sw=56,cb=function(c)
					h.mem=c;
				end}):dep(s);
				_=x:toggle({name="arrows",flag="vis.arrow",cb=C("offAr")}):dep(m);
				_:color({flag="vis.arrowcol",default=F,cb=z("offArCol")});
				_:settings():slider({name="size",flag="vis.arrowsz",min=16,max=64,default=22,suffix="px",cb=C("offArSz")});
				_=x:toggle({name="chams",flag="vis.chams",cb=C("chams")}):dep(m);
				_:color({flag="vis.chamscol",default=F,cb=function(h)
					f.chamsOCol[1]=h;
					f.chamsFCol[1]=h;
				end});
				_:settings():slider({name="brightness",flag="vis.chamsglow",min=1,max=12,dec=1,default=4,cb=C("chamsGlow")});
				_=x:toggle({name="highlight",flag="vis.hlt",cb=C("hlt")}):dep(m):settings();
				_:colorpicker({name="fill",flag="vis.hltfcol",default=F,alpha=0.5,cb=function(h,c)
					f.hltFCol[1],f.hltFCol[2]=h,c;
				end});
				_:colorpicker({name="outline",flag="vis.hltocol",default=F,cb=function(h,c)
					f.hltOCol[1],f.hltOCol[2]=h,c;
				end});
				local function h(c,n,O,j,E,P,T)
					local Y=c:toggle({name=n,flag=O,cb=C(j)}):dep(m);
					Y:color({flag=O.."col",default=F,cb=q(E)});
					n=Y:settings();
					if P then 
						n:dropdown({name="side",flag=O..P,values=P=="pos"and g or u,default=T,cb=C(E..(P=="pos"and"Pos"or"Side"))});
					end;
					n:toggle({name="gradient",flag=O.."grd",cb=C(E.."Grd")}):color({flag=O.."col2",default=F,cb=r(E)});
					return Y,n;
				end;
				x=G:toggle({name="box",flag="vis.box",cb=C("box")}):dep(m);
				x:color({flag="vis.boxcol",default=F,cb=q("box")});
				_=x:settings();
				_:dropdown({name="style",flag="vis.boxstyle",values={"static","corners"},default="static",cb=function(u)
					f.boxType=u=="corners"and"Corners"or"Static";
				end});
				_:toggle({name="gradient",flag="vis.boxgrd",cb=C("boxGrd")}):color({flag="vis.boxcol2",default=F,cb=r("box")});
				_:toggle({name="outline",flag="vis.boxout",default=true,cb=C("boxO")}):color({flag="vis.boxoutcol",default=t,cb=z("boxOCol")});
				_:toggle({name="fill",flag="vis.boxfill",cb=C("boxF")}):color({flag="vis.boxfillcol",default=F,cb=q("boxF")});
				_:toggle({name="fill gradient",flag="vis.boxfillgrd",cb=C("boxFGrd")}):color({flag="vis.boxfillcol2",default=F,cb=r("boxF")});
				G:toggle({name="skeleton",flag="vis.skel",cb=C("skel")}):dep(m):color({flag="vis.skelcol",default=F,cb=z("skelCol")});
				h(G,"name","vis.name","name","n");
				s,x=h(G,"health","vis.hp","hb","hb","side","left");
				x:toggle({name="text",flag="vis.ht",cb=C("ht")}):color({flag="vis.htcol",default=F,cb=q("ht")});
				x:toggle({name="text gradient",flag="vis.htgrd",cb=C("htGrd")}):color({flag="vis.htcol2",default=F,cb=r("ht")});
				h(G,"armor","vis.arm","ab","ab","side","right");
				h(G,"weapon","vis.wep","wep","w","pos","bottom");
				_=G:toggle({name="weapon icon",flag="vis.wepicon",cb=C("wepIcon")}):dep(m);
				_:color({flag="vis.wepiconcol",default=F,cb=z("wepIconCol")});
				z=_:settings();
				z:slider({name="size",flag="vis.wepiconsize",min=8,max=32,default=16,suffix="px",cb=C("wepIconSz")});
				z:dropdown({name="side",flag="vis.wepiconpos",values=g,default="bottom",cb=C("wepIconPos")});
				G:toggle({name="avatar",flag="vis.av",cb=C("av")}):dep(m);
				h(a,"distance","vis.dis","dis","d","pos","bottom");
				h(a,"money","vis.mon","mon","mon","pos","right");
				h(a,"ping","vis.pn","pn","pn","pos","right");
				local function _(h,t,u)
					local s=t.."Col";
					local C=t.."GrdCol";
					local z=t.."Pos";
					local q=t.."Grd";
					if u then 
						l[t]=false;
					end;
					local r=a:toggle({name=h,flag="vis."..t,cb=function(x)
						f[t]=x;
						l[t]=(if u then not u else x)or false;
					end}):dep(m);
					r:color({flag="vis."..t.."col",default=F,cb=function(u)
						f[s][1],l[s][1]=u,u;
						f[C][1],l[C][1]=u,u;
					end});
					h=r:settings();
					h:dropdown({name="side",flag="vis."..t.."pos",values=g,default="right",cb=function(g)
						f[z]=g;
						l[z]=g;
					end});
					h:toggle({name="gradient",flag="vis."..t.."grd",cb=function(h)
						f[q]=h;
						l[q]=h;
					end}):color({flag="vis."..t.."col2",default=F,cb=function(h)
						f[C][2],l[C][2]=h,h;
					end});
				end;
				_("bomb","bomb",true);
				_("scope","scope",true);
				_("flashed","flashed");
				_("defuse","defuse",true);
				R.attach(N);
				return N;
			end;
			K.H=function()
				local R,_,N,h=K.load("b"),K.load("q"),K.load("a"),K.load("j");
				local F=_.world;
				local t=R.lp;
				local f=R.http;
				local l=R.workspace;
				local g=h.tp_model;
				local u=h.char_resolver;
				local s=h.inventory;
				local C,z=h.remotes,h.vm_flash;
				local q=h.emit_fx;
				local r=Enum.CameraMode.LockFirstPerson;
				local x=Enum.CameraMode.Classic;
				local G=Enum.CameraType.Custom;
				local a=table.concat;
				local m=math.max;
				local c,n,O,j,E,P=type(g)=="table"and type(rawget(g,"ClearPlayerCache"))=="function",{},false,false,false;
				local T={};
				local function Y(v)
					if type(v)~="string"then 
						return nil;
					elseif v==""then 
						return nil;
					end;
					local Z,L=pcall(f.JSONDecode,f,v);
					if Z then 
						if type(L)=="table"then 
							return L;
						end;
					end;
					return nil;
				end;
				local function f(v)
					if type(v)~="table"then 
						return"";
					end;
					local Z={};
					for L,o in v,nil,nil do 
						local v=type(o)=="table"and o.Position or nil;
						if type(v)=="table"then 
							Z[L]=tostring(o.Sticker).."@"..tostring(v.Rotation)..","..tostring(v.X)..","..tostring(v.Y);
						else 
							Z[L]=tostring(type(o)=="table"and o.Sticker or o);
						end;
					end;
					return a(Z,";");
				end;
				local function v(Z)
					return a({tostring(Z.Identifier),tostring(Z.Name),tostring(Z.Skin),tostring(Z.Float),tostring(Z.StatTrack),tostring(Z.NameTag),f(Z.Stickers)},"|");
				end;
				local function f()
					local a={};
					for Z=1,3,1 do 
						local L=Y(t:GetAttribute("Slot"..Z));
						if L then 
							a[Z]=L;
						end;
					end;
					return a;
				end;
				local function a()
					local Z;
					if type(u)=="table"then 
						if type(u.getPlayerCharacter)=="function"then 
							local L,o=pcall(u.getPlayerCharacter,t);
							Z=if L then if typeof(o)=="Instance"then o else Z else Z;
						else 
						end;
					else 
					end;
					Z=Z or t.Character;
					if Z then 
						if Z.Parent then 
							if Z:GetAttribute("Dead")~=true then 
								return Z;
							end;
						end;
					end;
					return nil;
				end;
				local u=R.plain;
				local function Z(L,...)
					task.spawn(u,L,...);
				end;
				local function L()
					if O then 
						O=false;
						u(g.ClearPlayerCache,t);
					end;
					table.clear(n);
				end;
				local function o(X)
					local Q,S,A,J,y,e,M=t:GetAttribute("CurrentEquipped"),t:GetAttribute("Slot1"),t:GetAttribute("Slot2"),t:GetAttribute("Slot3"),t:GetAttribute("Slot5"),t:GetAttribute("HasDefuseKit")==true or t:GetAttribute("HasRescueKit")==true,t:GetAttribute("Team");
					local I=X==n.char and S==n.s1 and A==n.s2 and J==n.s3 and y==n.s5 and e==n.kit and M==n.team;
					if I then 
						if Q==n.raw then 
							return;
						end;
					end;
					n.char=X;
					n.raw=Q;
					n.s1=S;
					n.s2=A;
					n.s3=J;
					n.s5=y;
					n.kit=e;
					n.team=M;
					S=Y(Q);
					J,A=S and v(S)or nil,S~=nil and S.IsSuppressed==true;
					if I then 
						if O then 
							if J==n.sig then 
								if A==n.sup then 
									return;
								end;
								n.sup=A;
								y,e=u(g.RefreshSuppressorState,t,S);
								if y then 
									if e then 
										return;
									end;
								end;
							end;
						end;
					end;
					n.sig=J;
					n.sup=A;
					n.name=S and S.Name or nil;
					O=true;
					if S then 
						Z(g,t,S,f());
					else 
						Z(g.ClearPlayerCache,t);
						Z(g.RefreshObjectiveKitHolster,t);
						Z(g.RefreshBombHolster,t);
					end;
				end;
				local function f(g)
					local u,Y=t.Character,l.CurrentCamera;
					if u then 
						if Y then 
							if u:GetAttribute("Dead")==true then 
								return;
							elseif t:GetAttribute("IsSpectating")==true then 
								return;
							end;
						else 
							return;
						end;
					else 
						return;
					end;
					local l=Y.CameraSubject;
					if Y.CameraType~=G then 
						return;
					elseif typeof(l)~="Instance"then 
						return;
					elseif not(l:IsDescendantOf(u))then 
						return;
					end;
					l=g and m(tonumber(F.third_dist)or 10,0.5)or 0.5;
					if t.CameraMaxZoomDistance~=l then 
						t.CameraMaxZoomDistance=l;
						t.CameraMinZoomDistance=l;
					elseif t.CameraMinZoomDistance~=l then 
						t.CameraMaxZoomDistance=l;
						t.CameraMinZoomDistance=l;
					end;
					Y=g and x or r;
					if t.CameraMode~=Y then 
						t.CameraMode=Y;
					end;
				end;
				local function l()
					local g=type(s)=="table"and rawget(s,"peekCurrentEquippedForMovement")or nil;
					if type(g)~="function"then 
						return"MuzzlePart";
					end;
					local u,s=pcall(g);
					g=u and type(s)=="table"and s.Properties or nil;
					if type(g)=="table"then 
						if g.ShootingOptions=="Dual"then 
							return s.ShootingHand=="Left"and"MuzzlePartL"or"MuzzlePartR";
						end;
					end;
					return"MuzzlePart";
				end;
				T.on=function()
					local g=O and F.third==true;
					return g;
				end;
				T.name=function()
					if O then 
						if F.third then 
							return n.name;
						end;
					end;
					return nil;
				end;
				T.model=function()
					if O then 
						if not(F.third)then 
							return nil;
						end;
					else 
						return nil;
					end;
					local g=n.char;
					local u=g and(g:FindFirstChild("WeaponModel"));
					g=u and(u:FindFirstChild("Equipped"));
					if g then 
						if g:IsA("Model")then 
							return g;
						end;
					end;
					return nil;
				end;
				T.muzzle=function(g)
					local u=T.model();
					local s=u and(u:FindFirstChild("Interactables"));
					if not(s)then 
						return nil;
					end;
					u=s:FindFirstChild(g or l());
					if u then 
						if u:IsA("BasePart")then 
							return u;
						end;
					end;
					u=s:FindFirstChild("MuzzlePart");
					if u then 
						if u:IsA("BasePart")then 
							return u;
						end;
					end;
					return nil;
				end;
				T.step=function()
					local l=F.third==true;
					local g=l~=E or l and F.third_dist~=P;
					if g then 
						local u;
						u,E=F.third_dist,l;
						P=u;
						f(l);
					end;
					if not(c)then 
						return;
					end;
					g=l and a()or nil;
					if not g then 
						if O then 
							L();
						elseif next(n)~=nil then 
							L();
						end;
						return;
					end;
					o(g);
				end;
				_=h.weapon;
				h=type(_)=="table"and N.shared.fields[_]or nil;
				local l,g=h and h.shoot or(type(_)=="table"and rawget(_,"shoot")or nil),R.getups;
				if type(z)=="function"and type(q)=="function"and type(l)=="function"and type(g)=="function"then 
					_,h=pcall(g,l);
					if _ and type(h)=="table"then 
						for R,_ in h,nil,nil do 
							if _==z then 
								N.upvalue(l,R,function(R,_,...)
									if not(j)then 
										if O then 
											if F.third then 
												if typeof(R)=="Instance"then 
													if type(_)=="string"then 
														local F=T.muzzle(R.Name);
														local u=F and(F:FindFirstChild(_));
														if u then 
															pcall(q,u);
														end;
													end;
												end;
											end;
										end;
									end;
									return z(R,_,...);
								end);
								break;
							end;
						end;
					end;
				end;
				l=type(C)=="table"and C.VFX or nil;
				g=type(l)=="table"and l.CreateCharacterMuzzleFlash or nil;
				if type(g)=="table"then 
					if type(g.Listen)=="function"then 
						h,l=pcall(g.Listen,function(R)
							if type(R)=="table"then 
								if R.UserId==t.UserId then 
									j=true;
								end;
							end;
						end);
						if h then 
							if type(l)=="function"then 
								N.adopt(l);
							end;
						end;
					end;
				end;
				N.teardown(function()
					if c then 
						L();
					end;
					if E then 
						E=false;
						f(false);
					end;
				end);
				return T;
			end;
			K.I=function()
				local R=K.load("b");
				local _,N,h,F,t=K.load("q"),K.load("f"),K.load("a"),K.load("j"),K.load("H");
				local f=_.world;
				local l=_.misc;
				local g=R.workspace;
				local u=R.host;
				local s=F.local_char;
				local C=F.weapon_props;
				local F=N.trim;
				local N=table.clear;
				local z=Enum.Material.ForceField;
				local q=Enum.HighlightDepthMode.Occluded;
				local r,x=_.white,{forcefield=z};
				x.neon=Enum.Material.Neon;
				x.metal=Enum.Material.Metal;
				x.chrome=Enum.Material.Glass;
				local _,G,a,m={HumanoidRootPart=true,Camera=true,ViewmodelLight=true,MuzzlePart=true},{SurfaceGui=1,BillboardGui=1,Beam=1,Trail=1,Highlight=1,PointLight=1,SpotLight=1,SurfaceLight=1,Smoke=1,Fire=1,Sparkles=1,ParticleEmitter=2,Decal=3},{Shirt="ShirtTemplate",Pants="PantsTemplate"},{WeaponModel=true,WeaponAttachments=true};
				local c=NumberSequence.new(1);
				local n=R.weak();
				local O=R.weak();
				local j=R.weak();
				local E=R.weak();
				local P=R.weak();
				local T=R.weak();
				local Y,v,Z,L,o=R.weak(),{},{},{};
				local X,Q,S=true,0,{};
				local function A(J)
					local y=S[J];
					if y then 
						return y;
					end;
					y=nil;
					if type(C)=="function"then 
						local e,M=pcall(C,J);
						y=if e then if type(M)=="table"then M else y else y;
					else 
					end;
					if y then 
					else 
						local C=R.module(R.storage,"Database","Custom","Weapons",J);
						y=if type(C)=="table"then C else y;
					end;
					local R="other";
					if y then 
						local C,e,M=y.Class,y.MuzzleType,y.Type;
						R=if C=="Melee"then"knife"else if C=="Grenade"then"grenades"else if C=="C4"then"bomb"else if C=="Weapon"then if e=="Sniper"then"snipers"else if e=="ShotGun"then"shotguns"else if e=="MachineGun"then"machine guns"else if M=="Pistol"and e~="Zeus x27"then"pistols"else if M=="Rifle"then"rifles"else if M=="SMG"then"smgs"else R else R;
					else 
					end;
					if y then 
						S[J]=R;
					end;
					return R;
				end;
				local function R(C,S)
					local J=C.Name;
					if J=="Left Arm"then 
						return true;
					elseif J=="Right Arm"then 
						return true;
					elseif J=="Glove"then 
						return true;
					elseif J=="Sleeve"then 
						return true;
					end;
					local y=C.Parent;
					while y and y~=S do 
						J=y.Name;
						if J=="Left Arm"then 
							return true;
						elseif J=="Right Arm"then 
							return true;
						elseif J=="Arms"then 
							return true;
						end;
						y=y.Parent;
					end;
					return false;
				end;
				local function C(S,J)
					local y=S.Parent;
					while y and y~=J do 
						if m[y.Name]then 
							if y.Parent==J then 
								return true;
							end;
						end;
						y=y.Parent;
					end;
					return false;
				end;
				local function m()
					local S=g.CurrentCamera;
					if S~=o then 
						for g=#L,1,-1 do 
							L[g]:Disconnect();
							L[g]=nil;
						end;
						o,X=S,true;
						if S then 
							local function g()
								X=true;
							end;
							L[1]=S.ChildAdded:Connect(g);
							L[2]=S.ChildRemoved:Connect(g);
						end;
					end;
					if X then 
						X=false;
						local g=0;
						if S then 
							local J=S:GetChildren();
							for S=1,#J,1 do 
								local y=J[S];
								if y:IsA("Model")then 
									g+=1;
									Z[g]=y;
								else 
								end;
							end;
						else 
						end;
						F(Z,g);
					end;
					return Z;
				end;
				local function g(S,J)
					local y,e=Y[S];
					if y then 
						e=y;
					else 
						e={parts={},texs={},arms={},vis={},cloth={},dirty=true};
						Y[S]=e;
						local function y()
							e.dirty=true;
						end;
						e.added=S.DescendantAdded:Connect(y);
						e.gone=S.DescendantRemoving:Connect(y);
					end;
					if e.dirty then 
						e.dirty=false;
						e.arm_tops=nil;
						e.tool_tops=nil;
						local y,M,I,i,k=e.parts,e.texs,e.arms,e.vis,e.cloth;
						N(I);
						local N,B,d,b,p=S:GetDescendants(),0,0,0,0;
						for D=1,#N,1 do 
							local V=N[D];
							if not(J)then 
								if C(V,S)then 
									continue;
								end;
							end;
							if V:IsA("BasePart")then 
								D=V.Name;
								if J then 
									if _[D]then 
									else 
										B+=1;
										y[B]=V;
										I[V]=R(V,S);
									end;
								else 
									if D~="HumanoidRootPart"then 
										if D~="CameraPart"then 
											local R=B+1;
											y[R]=V;
											B=R;
										else 
										end;
									else 
									end;
								end;
							else 
								if V:IsA("Texture")then 
									d+=1;
									M[d]=V;
								else 
									if J then 
										if G[V.ClassName]then 
											b+=1;
											i[b]=V;
										else 
										end;
									else 
										if V.ClassName=="Decal"then 
											b+=1;
											i[b]=V;
										else 
											if a[V.ClassName]then 
												p+=1;
												k[p]=V;
											else 
											end;
										end;
									end;
								end;
							end;
						end;
						F(y,B);
						F(M,d);
						F(i,b);
						F(k,p);
					end;
					return e;
				end;
				local function R()
					for _,N in Y,nil,nil do 
						if not(_.Parent)then 
							if N.added then 
								N.added:Disconnect();
							end;
							if N.gone then 
								N.gone:Disconnect();
							end;
							Y[_]=nil;
						end;
					end;
				end;
				local function _(N,C,S,J,y)
					local e,M=S or z,n[N];
					if M then 
					else 
						M={mat=N.Material,col=N.Color,refl=N.Reflectance};
						if N:IsA("MeshPart")then 
							M.tex=N.TextureID;
						end;
						n[N]=M;
						S=N:GetChildren();
						for I=1,#S,1 do 
							local i=S[I];
							if i:IsA("SurfaceAppearance")then 
								if O[i]==nil then 
									O[i]=N;
									I=M.sa;
									if I then 
									else 
										I={};
										M.sa=I;
									end;
									I[#I+1]=i;
									i.Parent=nil;
								end;
							end;
						end;
					end;
					M.gen=y;
					if N.Material~=e then 
						N.Material=e;
					end;
					if N.Color~=C then 
						N.Color=C;
					end;
					if J then 
						if N.Reflectance~=J then 
							N.Reflectance=J;
						end;
						M.lit=true;
					elseif M.lit then 
						M.lit=nil;
						N.Reflectance=M.refl;
					end;
					if M.tex then 
						if N.TextureID~=""then 
							N.TextureID="";
						end;
					end;
				end;
				local function N(C,S,J,y,e)
					if not(y)then 
						_(C,S,J,nil,e);
						return false;
					end;
					if C.Transparency<1 then 
						if C.LocalTransparencyModifier<1 then 
							_(C,S,J,1,e);
							return true;
						end;
					end;
					return false;
				end;
				local function _(C)
					local S=n[C];
					if not(S)then 
						return;
					end;
					n[C]=nil;
					local J=C.Parent~=nil;
					if J then 
						C.Material=S.mat;
						C.Color=S.col;
						if S.lit then 
							C.Reflectance=S.refl;
						end;
						if S.tex then 
							C.TextureID=S.tex;
						end;
					end;
					local y=S.sa;
					if y then 
						for e=1,#y,1 do 
							S=y[e];
							O[S]=nil;
							if J then 
								S.Parent=C;
							end;
						end;
					end;
				end;
				local function C(S,J)
					local y=j[S];
					if y then 
						y.gen=J;
					else 
						j[S]={t=S.Transparency,gen=J};
					end;
					if S.Transparency~=1 then 
						S.Transparency=1;
					end;
				end;
				local function S(J)
					local y=j[J];
					if not(y)then 
						return;
					end;
					j[J]=nil;
					if J.Parent then 
						J.Transparency=y.t;
					end;
				end;
				local function J(y,e)
					local M=E[y];
					if M then 
						M.gen=e;
					else 
						E[y]={t=y.Transparency,gen=e};
					end;
					if y.Transparency<1 then 
						y.Transparency=1;
					end;
				end;
				local function y(e)
					local M=E[e];
					if not(M)then 
						return;
					end;
					E[e]=nil;
					if e.Parent then 
						e.Transparency=M.t;
					end;
				end;
				local function e(M,I)
					local i=G[M.ClassName];
					if not(i)then 
						return;
					end;
					local G=P[M];
					if G then 
						G.gen=I;
					else 
						G={k=i,gen=I};
						if i==3 then 
							G.t=M.Transparency;
						else 
							G.e=M.Enabled;
							if i==2 then 
								G.t=M.Transparency;
							end;
						end;
						P[M]=G;
					end;
					if i==3 then 
						if M.Transparency<1 then 
							M.Transparency=1;
						end;
					else 
						if M.Enabled then 
							M.Enabled=false;
						end;
						if i==2 then 
							if M.Transparency~=c then 
								M.Transparency=c;
							end;
						end;
					end;
				end;
				local function G(c)
					local M=P[c];
					if not(M)then 
						return;
					end;
					P[c]=nil;
					if not(c.Parent)then 
						return;
					end;
					if M.k==3 then 
						c.Transparency=M.t;
					else 
						if M.k==2 then 
							c.Transparency=M.t;
						end;
						c.Enabled=M.e;
					end;
				end;
				local function c(M,I)
					local i=T[M];
					local k=i and i.k or a[M.ClassName];
					local a=M[k];
					if i then 
						if a~=""then 
							i.t=a;
						end;
					else 
						i={k=k,t=a};
						T[M]=i;
					end;
					i.gen=I;
					if a~=""then 
						M[k]="";
					end;
				end;
				local function a(M)
					local I=T[M];
					if not(I)then 
						return;
					end;
					T[M]=nil;
					if M.Parent then 
						M[I.k]=I.t;
					end;
				end;
				local function M(I,i,k)
					local B=k and"arm_tops"or"tool_tops";
					local d=I[B];
					if d~=nil then 
						return d;
					end;
					local b,p,D=I.parts,I.arms,{};
					for V=1,#b,1 do 
						local W=b[V];
						if p[W]~=k then 
							while W and W~=i and not D[W]do 
								D[W]=true;
								W=W.Parent;
							end;
						end;
					end;
					local V,W={},0;
					d={};
					for H=1,#b,1 do 
						local w=b[H];
						if p[w]==k then 
							local k,b=w.Parent,w;
							while k and k~=i and not D[k]do 
								b=if k:IsA("Model")then k else b;
								k=k.Parent;
							end;
							if V[b]then 
							else 
								V[b]=true;
								W+=1;
								H=d;
								if W>8 then 
									d=false;
									break;
								end;
								H[W]=b;
							end;
						else 
						end;
					end;
					I[B]=d;
					return d;
				end;
				local function I(i,k,B)
					local d=v[i];
					if d then 
					else 
						local b=Instance.new("Highlight");
						b.FillTransparency=1;
						b.OutlineTransparency=0.2;
						b.DepthMode=q;
						b.Adornee=i;
						b.Parent=u;
						d={inst=b};
						v[i]=d;
					end;
					d.gen=B;
					if d.col~=k then 
						d.col=k;
						d.inst.OutlineColor=k:Lerp(r,0.6);
					end;
				end;
				local function u()
					for q,r in v,nil,nil do 
						v[q]=nil;
						pcall(r.inst.Destroy,r.inst);
					end;
				end;
				local q={restore_all=function()
					for r in n,nil,nil do 
						_(r);
					end;
					for r,i in O,nil,nil do 
						O[r]=nil;
						if i then 
							if i.Parent then 
								r.Parent=i;
							end;
						end;
					end;
				end,show_all=function()
					for r in j,nil,nil do 
						S(r);
					end;
					for r in E,nil,nil do 
						y(r);
					end;
					for r in P,nil,nil do 
						G(r);
					end;
					for r in T,nil,nil do 
						a(r);
					end;
				end,drop_cache=function()
					for r,O in Y,nil,nil do 
						if O.added then 
							O.added:Disconnect();
						end;
						if O.gone then 
							O.gone:Disconnect();
						end;
						Y[r]=nil;
					end;
					for r=#L,1,-1 do 
						L[r]:Disconnect();
						L[r]=nil;
					end;
					F(Z,0);
					o,X=nil,true;
				end,sync=function()
					local F,r,O,Y=f.body_chams,f.tool_chams,f.third,f.hand_chams;
					if F then 
					elseif r then 
					elseif O then 
					elseif Y then 
					elseif next(n)==nil then 
						if next(j)==nil then 
							if next(E)==nil then 
								if next(P)==nil then 
									if next(T)==nil then 
										if next(v)==nil then 
											return;
										end;
									end;
								end;
							end;
						end;
					end;
					local Z=s and s.getCurrentCharacter()or nil;
					local s,L=Z and not Z.IsDestroyed and Z.Character or nil,m();
					Q+=1;
					Z=Q;
					if s and F then 
						local m=g(s,false);
						local o,X,Q=m.parts,f.body_chams_col,f.body_chams_mat;
						local i,k,B=x[Q]or z,Q=="chrome",false;
						for d=1,#o,1 do 
							B=if N(o[d],X,i,k,Z)then true else B;
						end;
						if B then 
							i,Q,o=m.texs,m.vis,m.cloth;
							for m=1,#i,1 do 
								J(i[m],Z);
							end;
							for m=1,#Q,1 do 
								e(Q[m],Z);
							end;
							for m=1,#o,1 do 
								c(o[m],Z);
							end;
							I(s,X,Z);
						end;
					end;
					F,s=f.hand_chams_mat,f.tool_chams_mat;
					local m,c,o,X,Q,i,k=x[F]or z,x[s]or z,F=="chrome",s=="chrome",f.hand_chams_col,f.tool_chams_col,l.hands;
					F,s=k or Y and(o or m==z),f.tool_chams_kinds;
					for f=1,#L,1 do 
						local l=L[f];
						f=g(l,true);
						local x,L,B,d,b=f.parts,f.texs,f.arms,f.vis,r and(s==nil or s[A(l.Name)]==true);
						local p,D,V=b and(X or c==z),false,false;
						for z=1,#x,1 do 
							local W=x[z];
							z=B[W];
							if O or k and z then 
								C(W,Z);
							else 
								if z then 
									D=if Y then if N(W,Q,m,o,Z)then true else D else D;
								else 
									V=if b then if N(W,i,c,X,Z)then true else V else V;
								end;
							end;
						end;
						if O then 
							for C=1,#L,1 do 
								J(L[C],Z);
							end;
							for C=1,#d,1 do 
								e(d[C],Z);
							end;
						elseif D or V then 
							if F and p then 
								I(l,V and i or Q,Z);
							else 
								B=M(f,l,D);
								if B then 
									x=D and Q or i;
									for f=1,#B,1 do 
										I(B[f],x,Z);
									end;
								end;
							end;
						end;
					end;
					if O and r then 
						F=t.model();
						if F and(s==nil or s[A(t.name()or"")]==true)then 
							Y,m=g(F,true).parts,false;
							for t=1,#Y,1 do 
								m=if N(Y[t],i,c,X,Z)then true else m;
							end;
							if m then 
								I(F,i,Z);
							end;
						end;
					end;
					for N,F in n,nil,nil do 
						if F.gen~=Z then 
							_(N);
						end;
					end;
					for _,N in j,nil,nil do 
						if N.gen~=Z then 
							S(_);
						end;
					end;
					for _,N in E,nil,nil do 
						if N.gen~=Z then 
							y(_);
						end;
					end;
					for _,N in P,nil,nil do 
						if N.gen~=Z then 
							G(_);
						end;
					end;
					for _,N in T,nil,nil do 
						if N.gen~=Z then 
							a(_);
						end;
					end;
					for _,N in v,nil,nil do 
						if N.gen~=Z then 
							v[_]=nil;
							N.inst:Destroy();
						end;
					end;
					R();
				end};
				q.unload=function()
					u();
					q.restore_all();
					q.show_all();
					q.drop_cache();
				end;
				h.teardown(q.unload);
				return q;
			end;
			K.J=function()
				local R,_,N=K.load("b"),K.load("q"),K.load("a");
				local h,F=K.load("j"),_.world;
				local _=R.lighting;
				local t=R.workspace;
				local f=R.lp;
				local l=math.floor;
				local g=math.clamp;
				local u=math.max;
				local s,C=math.abs,{};
				C.ambient=_.Ambient;
				C.outdoor=_.OutdoorAmbient;
				C.bright=_.Brightness;
				C.exposure=_.ExposureCompensation;
				C.clock=_.ClockTime;
				C.fog_col=_.FogColor;
				C.fog_start=_.FogStart;
				C.fog_end=_.FogEnd;
				C.shadows=_.GlobalShadows;
				local z;
				local q,r=true;
				local function x()
					if q then 
						q=false;
						z=_:FindFirstChildOfClass("Atmosphere");
					end;
					if z then 
						if not(z.Parent)then 
							z=nil;
						end;
					end;
					local G=z;
					return G;
				end;
				local function z()
					q=true;
				end;
				N.connect(_.ChildAdded,z);
				N.connect(_.ChildRemoved,z);
				local function z()
					if r then 
						return;
					end;
					local q=x();
					if not(q)then 
						return;
					end;
					r={density=q.Density,col=q.Color,offset=q.Offset};
				end;
				local function q()
					local G=x();
					if G then 
						if not(r)then 
							return;
						end;
					else 
						return;
					end;
					G.Density=r.density;
					G.Color=r.col;
					G.Offset=r.offset;
				end;
				local r,G;
				local function a()
					if r then 
						if r.Parent then 
							local m=r;
							return m;
						end;
						r:Destroy();
					end;
					r=Instance.new("ColorCorrectionEffect");
					r.Parent=_;
					local m=r;
					return m;
				end;
				local function m()
					if G then 
						if G.Parent then 
							local c=G;
							return c;
						end;
						G:Destroy();
					end;
					G=Instance.new("BloomEffect");
					G.Parent=_;
					local c=G;
					return c;
				end;
				local c,n,O,j,E={jungle={SkyboxBk="rbxassetid://214399891",SkyboxDn="rbxassetid://214399887",SkyboxFt="rbxassetid://214399894",SkyboxLf="rbxassetid://214405668",SkyboxRt="rbxassetid://214399899",SkyboxUp="rbxassetid://214399889"},blossom={SkyboxBk="rbxassetid://271042516",SkyboxDn="rbxassetid://271077243",SkyboxFt="rbxassetid://271042556",SkyboxLf="rbxassetid://271042310",SkyboxRt="rbxassetid://271042467",SkyboxUp="rbxassetid://271077958"},["red night"]={SkyboxBk="rbxassetid://401664839",SkyboxDn="rbxassetid://401664862",SkyboxFt="rbxassetid://401664960",SkyboxLf="rbxassetid://401664881",SkyboxRt="rbxassetid://401664901",SkyboxUp="rbxassetid://401664936"},purple={SkyboxBk="rbxassetid://13694952867",SkyboxDn="rbxassetid://13694968325",SkyboxFt="rbxassetid://13694980654",SkyboxLf="rbxassetid://13694998113",SkyboxRt="rbxassetid://13695002700",SkyboxUp="rbxassetid://13695007103"},foggy={SkyboxBk="rbxassetid://1370717244",SkyboxDn="rbxassetid://1370717336",SkyboxFt="rbxassetid://1370717438",SkyboxLf="rbxassetid://1370717567",SkyboxRt="rbxassetid://1370717698",SkyboxUp="rbxassetid://1370717782"}},{galaxy=15983996673,anime=13107361022,minecraft=2758029221};
				local function P()
					if j then 
						return;
					end;
					local T=_:FindFirstChildOfClass("Sky");
					if T then 
						if T~=O then 
							j=T;
							E=T.Parent;
							T.Parent=nil;
						end;
					end;
				end;
				local function T(Y)
					local v=c[Y];
					if v then 
						P();
						if O then 
							O:Destroy();
						end;
						local c=Instance.new("Sky");
						for Z,L in v,nil,nil do 
							c[Z]=L;
						end;
						c.Parent=_;
						O=c;
						return;
					end;
					local c=n[Y];
					if not c then 
						return;
					end;
					N.spawn(function()
						local n,Y=pcall(game.GetObjects,game,"rbxassetid://"..c);
						if n then 
							if type(Y)~="table"then 
								return;
							end;
						else 
							return;
						end;
						n=nil;
						for c=1,#Y,1 do 
							local v=Y[c];
							n=n or(if v:IsA("Sky")then v else(v:FindFirstChildWhichIsA("Sky",true)));
						end;
						for c=1,#Y,1 do 
							local v=Y[c];
							if v~=n then 
								if n then 
									if not(n:IsDescendantOf(v))then 
										v:Destroy();
									end;
								else 
									v:Destroy();
								end;
							end;
						end;
						if n then 
							if N.alive()then 
								if not(F.sky)then 
									if n then 
										n:Destroy();
									end;
									return;
								end;
							else 
								if n then 
									n:Destroy();
								end;
								return;
							end;
						else 
							if n then 
								n:Destroy();
							end;
							return;
						end;
						P();
						if O then 
							O:Destroy();
						end;
						n.Parent=_;
						O=n;
					end);
				end;
				local function c()
					if O then 
						O:Destroy();
						O=nil;
					end;
					if j then 
						j.Parent=E or _;
						j,E=nil,nil;
					end;
				end;
				local n,O,j,E;
				local function P(Y)
					Y.Orientation=Enum.ParticleOrientation.FacingCamera;
					Y.Brightness=1;
				end;
				local function Y(v)
					v.Brightness=2;
				end;
				local function v(Z)
					Z.Shape=Enum.ParticleEmitterShape.Box;
					Z.ShapeStyle=Enum.ParticleEmitterShapeStyle.Volume;
				end;
				local function Z(L,o,X)
					local Q=O;
					if not(Q)then 
						return;
					end;
					j,E=nil,nil;
					Q.Texture=L=="stars"and"rbxasset://textures/particles/sparkles_main.dds"or"rbxasset://textures/particles/smoke_main.dds";
					Q.LightInfluence=0;
					Q.LightEmission=0.4;
					Q.ZOffset=0;
					Q.Drag=0;
					Q.EmissionDirection=Enum.NormalId.Bottom;
					Q.Rate=X;
					Q.Color=ColorSequence.new(o);
					pcall(P,Q);
					if L=="stars"then 
						Q.LightEmission=0.15;
						Q.Rate=u(10,X*0.4);
						Q.Lifetime=NumberRange.new(6,9);
						Q.Speed=NumberRange.new(4,8);
						Q.Acceleration=Vector3.new(1,-3,0.6);
						Q.SpreadAngle=Vector2.new(16,16);
						Q.Rotation=NumberRange.new(0,360);
						Q.RotSpeed=NumberRange.new(-14,14);
						Q.Squash=NumberSequence.new(0);
						Q.Size=NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(0.1,0.5,0.14),NumberSequenceKeypoint.new(0.5,0.62,0.16),NumberSequenceKeypoint.new(0.9,0.44,0.12),NumberSequenceKeypoint.new(1,0,0)});
						Q.Transparency=NumberSequence.new(0);
						pcall(Y,Q);
					elseif L=="snow"then 
						Q.Lifetime=NumberRange.new(4,6);
						Q.Speed=NumberRange.new(6,12);
						Q.Acceleration=Vector3.new(2,-6,1);
						Q.SpreadAngle=Vector2.new(35,35);
						Q.Rotation=NumberRange.new(0,360);
						Q.RotSpeed=NumberRange.new(-40,40);
						Q.Squash=NumberSequence.new(0);
						Q.Size=NumberSequence.new(0.55);
						Q.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0,0.2),NumberSequenceKeypoint.new(0.8,0.3),NumberSequenceKeypoint.new(1,1)});
					else 
						Q.Lifetime=NumberRange.new(5,7);
						Q.Speed=NumberRange.new(5,10);
						Q.Acceleration=Vector3.new(4,-5,2);
						Q.SpreadAngle=Vector2.new(40,40);
						Q.Rotation=NumberRange.new(0,360);
						Q.RotSpeed=NumberRange.new(-80,80);
						Q.Squash=NumberSequence.new(1.4);
						Q.Size=NumberSequence.new(0.5);
						Q.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0,0.15),NumberSequenceKeypoint.new(0.85,0.25),NumberSequenceKeypoint.new(1,1)});
					end;
				end;
				local function P()
					if n then 
						n:Destroy();
					end;
					n,O,j,E=nil,nil,nil,nil;
				end;
				local function Y()
					if n then 
						if n.Parent then 
							return;
						end;
					end;
					n=Instance.new("Part");
					n.Anchored=true;
					n.CanCollide=false;
					n.CanQuery=false;
					n.CanTouch=false;
					n.Transparency=1;
					local L=n;
					L.Size=Vector3.new(260,140,260);
					n.Parent=t;
					O=Instance.new("ParticleEmitter");
					pcall(v,O);
					O.Parent=n;
					Z(F.fx_type,F.fx_col,F.fx_rate);
					L=O;
					L:Emit(g(l(F.fx_rate*0.16),30,140));
				end;
				local v,L=h.data;
				local function o()
					if not(v)then 
						return nil;
					end;
					local X,Q=pcall(v.Get,f,"Settings.Game.Viewmodel");
					if X then 
						if type(Q)=="table"then 
							return Q;
						end;
					end;
					return nil;
				end;
				local function f()
					if not(L)then 
						return;
					end;
					local v=o();
					if v then 
						v["X Offset"]=L.x;
						v["Y Offset"]=L.y;
						v["Z Offset"]=L.z;
					end;
					L=nil;
				end;
				local function v()
					if not(F.hands)then 
						f();
						return;
					end;
					local X=o();
					if not(X)then 
						return;
					end;
					L=L or{x=tonumber(X["X Offset"])or 0,y=tonumber(X["Y Offset"])or 0,z=tonumber(X["Z Offset"])or 0};
					if X["X Offset"]~=F.hands_x then 
						X["X Offset"]=F.hands_x;
					end;
					if X["Y Offset"]~=F.hands_y then 
						X["Y Offset"]=F.hands_y;
					end;
					if X["Z Offset"]~=F.hands_z then 
						X["Z Offset"]=F.hands_z;
					end;
				end;
				R=h.camera;
				if type(R)=="table"then 
					if type(R.setPerspective)=="function"then 
						N.field(R,"setPerspective",function(R)
							return function(L,o,X)
								if F.third then 
									return R(false,o,F.third_dist);
								end;
								return R(L,o,X);
							end;
						end);
					end;
				end;
				local R,L,o,X,Q,S;
				h={sync=function()
					v();
					if F.fullbright then 
						if _.Ambient~=F.fb_col then 
							_.Ambient=F.fb_col;
						end;
						if _.OutdoorAmbient~=F.fb_col then 
							_.OutdoorAmbient=F.fb_col;
						end;
						local v=F.fb_power/100*u(C.bright,1);
						if s(_.Brightness-v)>0.001 then 
							_.Brightness=v;
						end;
					elseif F.ambient then 
						if _.Ambient~=F.ambient_col then 
							_.Ambient=F.ambient_col;
						end;
						if _.OutdoorAmbient~=F.ambient_col then 
							_.OutdoorAmbient=F.ambient_col;
						end;
						if _.Brightness~=C.bright then 
							_.Brightness=C.bright;
						end;
					else 
						if _.Ambient~=C.ambient then 
							_.Ambient=C.ambient;
						end;
						if _.OutdoorAmbient~=C.outdoor then 
							_.OutdoorAmbient=C.outdoor;
						end;
						if _.Brightness~=C.bright then 
							_.Brightness=C.bright;
						end;
					end;
					if F.no_shadows then 
						if _.GlobalShadows then 
							_.GlobalShadows=false;
						end;
					elseif _.GlobalShadows~=C.shadows then 
						_.GlobalShadows=C.shadows;
					end;
					if F.exposure then 
						local v=F.exposure_val/100;
						if s(_.ExposureCompensation-v)>0.001 then 
							_.ExposureCompensation=v;
						end;
					elseif _.ExposureCompensation~=C.exposure then 
						_.ExposureCompensation=C.exposure;
					end;
					if F.time then 
						if s(_.ClockTime-F.time_hour)>0.001 then 
							_.ClockTime=F.time_hour;
						end;
					elseif s(_.ClockTime-C.clock)>0.001 then 
						_.ClockTime=C.clock;
					end;
					if F.fog then 
						z();
						local z=x();
						if z then 
							local x=g(100/u(F.fog_end,1),0,1);
							if s(z.Density-x)>0.001 then 
								z.Density=x;
							end;
							if z.Color~=F.fog_col then 
								z.Color=F.fog_col;
							end;
						end;
						if _.FogStart~=F.fog_start then 
							_.FogStart=F.fog_start;
						end;
						if _.FogEnd~=F.fog_end then 
							_.FogEnd=F.fog_end;
						end;
						if _.FogColor~=F.fog_col then 
							_.FogColor=F.fog_col;
						end;
					else 
						q();
						if _.FogStart~=C.fog_start then 
							_.FogStart=C.fog_start;
						end;
						if _.FogEnd~=C.fog_end then 
							_.FogEnd=C.fog_end;
						end;
						if _.FogColor~=C.fog_col then 
							_.FogColor=C.fog_col;
						end;
					end;
					if F.cc then 
						local u=a();
						u.Enabled=true;
						local s,z,x=F.cc_sat/100,F.cc_bright/100,F.cc_contrast/100;
						if u.Saturation~=s then 
							u.Saturation=s;
						end;
						if u.Brightness~=z then 
							u.Brightness=z;
						end;
						if u.Contrast~=x then 
							u.Contrast=x;
						end;
						if u.TintColor~=F.cc_tint then 
							u.TintColor=F.cc_tint;
						end;
					elseif r then 
						if r.Parent then 
							r.Enabled=false;
						end;
					end;
					if F.bloom then 
						local u=m();
						u.Enabled=true;
						local s,z=F.bloom_power/100,F.bloom_limit/100;
						if u.Intensity~=s then 
							u.Intensity=s;
						end;
						if u.Size~=F.bloom_size then 
							u.Size=F.bloom_size;
						end;
						if u.Threshold~=z then 
							u.Threshold=z;
						end;
					elseif G then 
						if G.Parent then 
							G.Enabled=false;
						end;
					end;
					if F.sky~=R or F.sky_preset~=L then 
						local u,s=F.sky,F.sky_preset;
						R,L=u,s;
						if F.sky then 
							T(F.sky_preset);
						else 
							c();
						end;
					end;
					if F.fx~=o then 
						o=F.fx;
						if F.fx then 
							Y();
						else 
							P();
						end;
					end;
					local R=F.fx and(F.fx_type~=X or F.fx_col~=Q or F.fx_rate~=S);
					if R then 
						Z(F.fx_type,F.fx_col,F.fx_rate);
						if O then 
							local R=O;
							R:Emit(g(l(F.fx_rate*0.16),30,140));
						end;
					end;
					local R,l,g=F.fx_type,F.fx_col,F.fx_rate;
					X,Q,S=R,l,g;
				end,step_fx=function()
					if n then 
						if not(n.Parent)then 
							return;
						end;
					else 
						return;
					end;
					local R=t.CurrentCamera;
					if not(R)then 
						return;
					end;
					local t=R.CFrame;
					local R,l=t.Position,t.LookVector;
					t=Vector3.new(l.X,0,l.Z);
					t=if t.Magnitude<0.05 then Vector3.new(0,0,-1)else t.Unit;
					if j then 
						if E then 
							if(R-j).Magnitude<10 then 
								if t:Dot(E)>0.95 then 
									return;
								end;
							end;
						end;
					end;
					j,E=R,t;
					l=n;
					l.CFrame=CFrame.new(R+t*57.2+Vector3.new(0,44,0));
				end,unload=function()
					F.third=false;
					F.body_chams=false;
					F.body_chams_mat="forcefield";
					F.tool_chams=false;
					F.tool_chams_mat="forcefield";
					F.hand_chams=false;
					F.hand_chams_mat="forcefield";
					F.tracers=false;
					F.impacts=false;
					F.hands=false;
					F.xhair=false;
					F.pen=false;
					F.nade_path=false;
					P();
					c();
					if r then 
						r:Destroy();
						r=nil;
					end;
					if G then 
						G:Destroy();
						G=nil;
					end;
					q();
					f();
					_.Ambient=C.ambient;
					_.OutdoorAmbient=C.outdoor;
					_.Brightness=C.bright;
					_.ExposureCompensation=C.exposure;
					_.ClockTime=C.clock;
					_.FogColor=C.fog_col;
					_.FogStart=C.fog_start;
					_.FogEnd=C.fog_end;
					_.GlobalShadows=C.shadows;
				end};
				N.teardown(h.unload);
				return h;
			end;
			K.K=function()
				local R,_,N,h=K.load("b"),K.load("q"),K.load("a"),K.load("j");
				local F=_.world;
				local t=_.misc;
				local _=R.lp;
				local f=R.workspace;
				local l=h.inventory;
				local g=h.spectate;
				local u=math.floor;
				local s=math.min;
				local C,z,q,r=math.max,{AWP=true,["SSG 08"]=true};
				local x=R.screen(2147483647);
				if not x then 
					return{step=function()
					end};
				end;
				x.Enabled=false;
				N.own(x);
				local R=Instance.new("Frame");
				R.Size=UDim2.fromScale(1,1);
				R.BackgroundTransparency=1;
				R.BorderSizePixel=0;
				R.Parent=x;
				local G=NumberSequence.new({NumberSequenceKeypoint.new(0,1),NumberSequenceKeypoint.new(0.06,0.957),NumberSequenceKeypoint.new(0.12,0.844),NumberSequenceKeypoint.new(0.18,0.684),NumberSequenceKeypoint.new(0.24,0.5),NumberSequenceKeypoint.new(0.3,0.316),NumberSequenceKeypoint.new(0.36,0.156),NumberSequenceKeypoint.new(0.42,0.043),NumberSequenceKeypoint.new(0.48,0),NumberSequenceKeypoint.new(1,0)});
				local a=NumberSequence.new({NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(0.52,0),NumberSequenceKeypoint.new(0.58,0.043),NumberSequenceKeypoint.new(0.64,0.156),NumberSequenceKeypoint.new(0.7,0.316),NumberSequenceKeypoint.new(0.76,0.5),NumberSequenceKeypoint.new(0.82,0.684),NumberSequenceKeypoint.new(0.88,0.844),NumberSequenceKeypoint.new(0.94,0.957),NumberSequenceKeypoint.new(1,1)});
				local function m(c,n)
					local O=Instance.new("Frame");
					O.BackgroundTransparency=1;
					O.BorderSizePixel=0;
					O.Parent=R;
					local R=Instance.new("Frame");
					R.BorderSizePixel=0;
					R.BackgroundColor3=F.xhair_col;
					R.BackgroundTransparency=0;
					R.ZIndex=3;
					R.AnchorPoint=Vector2.new(0.5,0.5);
					R.Position=UDim2.fromScale(0.5,0.5);
					R.Size=c and UDim2.new(0,3,1,0)or UDim2.new(1,0,0,3);
					R.Parent=O;
					local j=Instance.new("UICorner");
					j.CornerRadius=UDim.new(1,0);
					j.Parent=R;
					j=Instance.new("UIGradient");
					j.Rotation=c and 90 or 0;
					j.Transparency=n and a or G;
					j.Parent=R;
					return{holder=O,core=R};
				end;
				local R={};
				U:ds(R,0,m(false,false),m(false,true),m(true,false),(m(true,true)));
				R[1].holder.AnchorPoint=Vector2.new(1,0.5);
				R[2].holder.AnchorPoint=Vector2.new(0,0.5);
				R[3].holder.AnchorPoint=Vector2.new(0.5,1);
				R[4].holder.AnchorPoint=Vector2.new(0.5,0);
				local G,a,m,c;
				local function n()
					if not(r and r.Parent and q and q.Parent)then 
						local O=_:FindFirstChildOfClass("PlayerGui");
						q=O and O:FindFirstChild("MainGui");
						O=q and q:FindFirstChild("Gameplay");
						r=O and O:FindFirstChild("Middle");
						if not(r)then 
							return false;
						end;
					end;
					local O=q.Enabled and r.Visible and r.Parent.Visible;
					return O;
				end;
				local function O()
					local j=_.Character;
					if j then 
						if j:IsDescendantOf(f)then 
							if j:GetAttribute("Dead")~=false then 
								return false;
							end;
						else 
							return false;
						end;
					else 
						return false;
					end;
					local E=j:GetAttribute("Health");
					return typeof(E)=="number"and E>0;
				end;
				local function j()
					local E=g.GetCurrentSpectateInstance();
					if not(E)then 
						return nil;
					end;
					local g,P=E.CurrentEquipped,E.Player;
					return g~=nil and z[g.Name]==true and E.PerspectiveState=="First-Person"and P~=nil and(tonumber(P:GetAttribute("ScopeIncrement"))or 0)>0;
				end;
				local function g()
					if F.xhair then 
						if t.scope then 
							if not(n())then 
								return false;
							end;
						else 
							return false;
						end;
					else 
						return false;
					end;
					if _:GetAttribute("IsSpectating")==true then 
						local _=j();
						if _~=nil then 
							return _;
						end;
					end;
					if not(O())then 
						return false;
					end;
					local _=l.peekCurrentEquippedForMovement();
					local t=type(_)=="table"and _.Properties;
					return type(t)=="table"and not _.IsDestroyed and _.IsEquipped==true and _.IsAiming==true and t.HasScope==true;
				end;
				h={step=function()
					local _,t=pcall(g);
					t=_ and t==true;
					if t~=c then 
						x.Enabled=t;
						c=t;
					end;
					if not(t)then 
						return;
					end;
					_=f.CurrentCamera;
					if not _ then 
						return;
					end;
					local t=_.ViewportSize;
					local f,l=C(24,u(s(t.X,t.Y)*0.36*F.xhair_size/100)),C(0,F.xhair_gap);
					if f~=G or l~=a then 
						R[1].holder.Position=UDim2.new(0.5,-l,0.5,0);
						R[1].holder.Size=UDim2.fromOffset(f,10);
						R[2].holder.Position=UDim2.new(0.5,l,0.5,0);
						R[2].holder.Size=UDim2.fromOffset(f,10);
						R[3].holder.Position=UDim2.new(0.5,0,0.5,-l);
						R[3].holder.Size=UDim2.fromOffset(10,f);
						R[4].holder.Position=UDim2.new(0.5,0,0.5,l);
						R[4].holder.Size=UDim2.fromOffset(10,f);
						G,a=f,l;
					end;
					_=F.xhair_col;
					if _~=m then 
						for F=1,4,1 do 
							R[F].core.BackgroundColor3=_;
						end;
						m=_;
					end;
				end};
				N.teardown(function()
					q,r=nil,nil;
				end);
				return h;
			end;
			K.L=function()
				local R=K.load("b");
				local _=K.load("a");
				local N,h=K.load("j"),R.workspace;
				local F=N.raycast;
				local t=Enum.Material;
				local f=t.Metal;
				local l=table.clear;
				local g,u,s=math.max,{},{};
				s[t.Cardboard]=10;
				s[t.Fabric]=25;
				s[t.Glass]=25;
				s[t.Plastic]=10;
				s[t.SmoothPlastic]=10;
				s[t.Wood]=10;
				s[t.WoodPlanks]=10;
				local C,z,q={["Sandy Brick"]=0,IndoorWall=0},{Reactor=-1};
				local function r()
					local x=h:FindFirstChild("Debris");
					q=x and x:FindFirstChild("RaycastVisualizers")or nil;
					return x;
				end;
				t=r();
				if t then 
					_.connect(t.ChildAdded,function(x)
						if x.Name=="RaycastVisualizers"then 
							q=x;
						end;
					end);
					_.connect(t.ChildRemoved,function(x)
						if x==q then 
							q=nil;
						end;
					end);
				else 
					_.connect(h.ChildAdded,function(x)
						if x.Name=="Debris"then 
							r();
						end;
					end);
				end;
				local r,x={ready=true},RaycastParams.new();
				x.FilterType=Enum.RaycastFilterType.Exclude;
				x.IgnoreWater=false;
				x.CollisionGroup="Bullet";
				local G=RaycastParams.new();
				G.CollisionGroup="Bullet";
				local a=RaycastParams.new();
				a.FilterType=Enum.RaycastFilterType.Include;
				a.CollisionGroup="Bullet";
				local m,c,n={},{},{};
				local O,j=R.weak(),{instance=nil,position=nil,normal=nil,material=nil};
				local function E(P)
					local T=O[P];
					if T~=nil then 
						return T;
					end;
					T=P.Name=="CollisionCapsule"or P.Name=="HumanoidRootPart"or P:HasTag("CharacterAccessory")or P:FindFirstAncestorWhichIsA("Accessory")~=nil or q~=nil and P:IsDescendantOf(q);
					O[P]=T;
					return T;
				end;
				local function O(P)
					local T=P.Parent;
					if T then 
						if T:HasTag("BreakableDoor")then 
							return f;
						end;
					end;
					return P.Material;
				end;
				local function f(P)
					if P~=0 then 
						return P;
					end;
					local T=h:GetAttribute("Map");
					if typeof(T)~="string"then 
						return P;
					end;
					return z[T]or P;
				end;
				local function z(P,T,Y,v)
					Y=Y or x;
					Y.FilterDescendantsInstances=v or u;
					local x=(h:Raycast(P,T,Y));
					while x do 
						local v=x.Instance;
						if not(E(v))then 
							j.instance=v;
							j.position=x.Position;
							j.normal=x.Normal;
							j.material=x.Material;
							return j;
						end;
						Y:AddToFilter(v);
						x=(h:Raycast(P,T,Y));
					end;
					j.instance=nil;
					j.position=P+T;
					j.normal=nil;
					j.material=nil;
					return j;
				end;
				local function x(P,T,Y,v)
					local Z=z(P,T,Y,v);
					return{instance=Z.instance,position=Z.position,normal=Z.normal,material=Z.material};
				end;
				local function P(T,Y,v,Z,L,o)
					G.FilterDescendantsInstances=Z or u;
					l(c);
					l(n);
					Z=Y.Unit;
					local u,X,Q,S,A=Z*1000,{},false,T,0;
					for J=1,100,1 do 
						if Q then 
							break;
						end;
						Y=1000;
						if o then 
							Y=o+8-g((S-T):Dot(Z),0);
							if Y<=0 then 
								break;
							end;
						else 
						end;
						J=h:Raycast(S,Z*Y,G);
						if not J then 
							break;
						end;
						local g=J.Instance;
						G:AddToFilter(g);
						if E(g)then 
						else 
							local G=J.Position;
							A+=1;
							X[A]={instance=g,position=G,normal=J.Normal,material=O(g)};
							local E=L~=nil and(g.Parent==L or g:IsDescendantOf(L));
							Q=if E then true else if o then if(G-T):Dot(Z)>=o then true else Q else Q;
							m[1]=g;
							a.FilterDescendantsInstances=m;
							local g=G+u;
							local u=h:Raycast(g,G-g,a);
							if not(u)then 
								break;
							end;
							local h,a=u.Instance,(G-u.Position).Magnitude;
							g=h.MaterialVariant;
							local T,Y=g~=""and C[g]or nil;
							if T~=nil then 
								if not(E)then 
									G=(n[g]or 0)+a;
									n[g]=G;
									if G>f(T)+v then 
										break;
									end;
								end;
								Y=(O(h));
							else 
								local g=O(h);
								if not(E)then 
									local C=(c[g]or 0)+a;
									c[g]=C;
									if C>f(s[g]or 0)+v then 
										break;
									end;
								end;
								Y=u.Material;
							end;
							A+=1;
							X[A]={instance=h,position=u.Position,normal=u.Normal,material=Y};
							S=u.Position;
						end;
					end;
					return X;
				end;
				r.cast=x;
				r.probe=z;
				r.through=P;
				r.patch=function(h)
					if type(F)~="table"then 
						return;
					elseif type(h)~="function"then 
						return;
					end;
					local f=R.getups;
					if type(f)~="function"then 
						return;
					end;
					local R,g=pcall(f,h);
					if R then 
						if type(g)~="table"then 
							return;
						end;
					else 
						return;
					end;
					for R,f in g,nil,nil do 
						if f==F.cast then 
							_.upvalue(h,R,x);
						elseif f==F.castThrough then 
							_.upvalue(h,R,P);
						end;
					end;
				end;
				t=N.bullet;
				if type(t)=="table"then 
					r.patch(rawget(t,"_performRaycast"));
				end;
				_.teardown(function()
					l(m);
					l(c);
					l(n);
					j.instance=nil;
					j.position=nil;
					j.normal=nil;
					j.material=nil;
					q=nil;
				end);
				return r;
			end;
			K.M=function()
				local R=K.load("b").lp;
				return{origin=function(_)
					local N=_.ViewportSize;
					local h,F=_:ViewportPointToRay(N.X*0.5,N.Y*0.5).Origin,R.Character;
					if not(F)then 
						return h,false;
					end;
					N=nil;
					_=F:FindFirstChild("CameraPart");
					if _ and(_:IsA("BasePart"))then 
						N=_.Position;
					else 
						local R=F:FindFirstChild("Head");
						if R and(R:IsA("BasePart"))then 
							N=R.Position;
						else 
							local R=F:FindFirstChild("HumanoidRootPart");
							N=if R then if R:IsA("BasePart")then R.Position+Vector3.new(0,1.6,0)else N else N;
						end;
					end;
					if not N then 
						return h,false;
					end;
					if(N-h).Magnitude>1 then 
						return N,true;
					end;
					return N,false;
				end};
			end;
			K.N=function()
				local R,_,N,h,F,t=K.load("b"),K.load("q"),K.load("a"),K.load("j"),K.load("L"),K.load("M");
				local f=_.world;
				local l=_.white;
				local _=R.workspace;
				local R=F.cast;
				local g=F.through;
				local F=h.ray_ignore;
				local u=h.inventory;
				local s=h.legit_ready;
				local C=math.clamp;
				local z=math.floor;
				local q=math.abs;
				local r=math.tan;
				local x=math.rad;
				local G=math.max;
				local a=Instance.new("Part");
				a.Anchored=true;
				a.CanCollide=false;
				a.CanQuery=false;
				a.CanTouch=false;
				a.CastShadow=false;
				a.Massless=true;
				a.Transparency=1;
				a.Size=Vector3.new(0.01,0.01,0.001);
				a.CFrame=CFrame.new(0,-100000,0);
				a.Parent=_;
				N.own(a);
				local m=Instance.new("SurfaceGui");
				m.Adornee=a;
				m.AlwaysOnTop=true;
				m.LightInfluence=0;
				m.Face=Enum.NormalId.Front;
				m.CanvasSize=Vector2.new(64,64);
				m.Enabled=false;
				m.Parent=a;
				local c=Instance.new("Frame");
				c.Size=UDim2.fromScale(1,1);
				c.BackgroundColor3=f.pen_no;
				c.BackgroundTransparency=0.58;
				c.BorderSizePixel=0;
				c.Parent=m;
				local n=Instance.new("UIStroke");
				n.ApplyStrokeMode=Enum.ApplyStrokeMode.Border;
				n.LineJoinMode=Enum.LineJoinMode.Miter;
				n.Thickness=7;
				n.Color=f.pen_no:Lerp(l,0.18);
				n.Transparency=0.04;
				n.Parent=c;
				local O=RaycastParams.new();
				O.FilterType=Enum.RaycastFilterType.Exclude;
				O.IgnoreWater=false;
				O.CollisionGroup="Bullet";
				local j,E,P,T,Y;
				local v,Z,L,o=false,0;
				local function X()
					j,E,P,T,Y,v=nil,nil,nil,nil,nil,false;
					if m.Enabled then 
						m.Enabled=false;
					end;
				end;
				local function Q(S,A,J,y)
					local e=F();
					local M=R(S,A*J,O,e);
					if M then 
						if M.instance then 
							if typeof(M.position)~="Vector3"then 
								return M,false;
							end;
						else 
							return M,false;
						end;
					else 
						return M,false;
					end;
					J=g(S,A,y,e,nil,G((M.position-S):Dot(A)-0.05,0));
					y,S=J and J[1],J and J[2];
					return M,y~=nil and S~=nil and y.instance==M.instance and S.instance==M.instance;
				end;
				h={step=function()
					if not(f.pen)then 
						if E then 
							X();
						elseif m.Enabled then 
							X();
						end;
						return;
					end;
					if not(a.Parent)then 
						return;
					end;
					local G=_.CurrentCamera;
					if not(G)then 
						X();
						return;
					end;
					local O=os.clock();
					if O-Z>=0.033 then 
						Z=O;
						local Z=u and u.peekCurrentEquippedForMovement();
						local u=Z and Z.Properties;
						if s and type(R)=="function"and type(g)=="function"and type(F)=="function"and Z~=nil and not Z.IsDestroyed and Z.IsEquipped~=false then 
							if u~=nil then 
								if u.Class=="Weapon"then 
									local R=G.ViewportSize;
									local F,g,s=G:ViewportPointToRay(R.X*0.5,R.Y*0.5).Direction,tonumber(u.Range)or 500,tonumber(u.Penetration)or 0;
									if F.Magnitude<=0 then 
										X();
									elseif g<=0 then 
										X();
									else 
										R=F.Unit;
										local F,u,Z=pcall(Q,t.origin(G),R,g,s);
										if if F then not u else not F then 
											X();
										elseif u.instance then 
											if typeof(u.position)~="Vector3"then 
												X();
											else 
												local F=typeof(u.normal)=="Vector3"and u.normal or-R;
												F,j,T,Y=F.Magnitude<=0 and-R or F.Unit,nil,nil,nil;
												E,P=u.position,F;
												v=Z==true;
												if u.instance:IsA("BasePart")then 
													local R=u.instance.CFrame;
													j=u.instance;
													T=R:PointToObjectSpace(u.position);
													Y=R:VectorToObjectSpace(F);
												end;
											end;
										else 
											X();
										end;
									end;
								else 
									X();
								end;
							else 
								X();
							end;
						else 
							X();
						end;
					end;
					if not(E)then 
						return;
					end;
					local R,F=E,P;
					if j then 
						if not(j:IsDescendantOf(_))then 
							X();
							return;
						end;
						O=j.CFrame;
						R,F=O:PointToWorldSpace(T),O:VectorToWorldSpace(Y);
						if F.Magnitude<=0 then 
							X();
							return;
						end;
						F=F.Unit;
					else 
					end;
					O=G.ViewportSize;
					local _=G:ViewportPointToRay(O.X*0.5,O.Y*0.5);
					local t=_.Direction;
					if t.Magnitude>0 then 
						t=t.Unit;
						local g=F:Dot(t);
						if q(g)>0.001 then 
							local u=F:Dot(R-_.Origin)/g;
							R=if u>0 then _.Origin+t*u else R;
						else 
						end;
					else 
					end;
					t=G.CFrame;
					_=(R-t.Position):Dot(t.LookVector);
					if _<=0 then 
						m.Enabled=false;
						return;
					end;
					local g=t.UpVector;
					g-=F*g:Dot(F);
					if g.Magnitude<=0.001 then 
						g=t.RightVector;
						g-=F*g:Dot(F);
					else 
					end;
					if g.Magnitude<=0.001 then 
						m.Enabled=false;
						return;
					end;
					g=g.Unit;
					local u,s,q=z(C(tonumber(f.pen_size)or 12,6,36)+0.5),math.max(O.Y,1),1+C((16-_)/16,0,1)*0.6;
					t=math.max(0.004,2*_*r(x(G.FieldOfView*0.5))*u*q/s);
					O=C(t*0.015,0.002,0.025);
					a.Size=Vector3.new(t,t,0.001);
					a.CFrame=CFrame.lookAt(R+F*O,R+F*(O+1),g);
					q=v and f.pen_yes or f.pen_no;
					if q~=L then 
						L=q;
						c.BackgroundColor3=q;
						n.Color=q:Lerp(l,0.18);
					end;
					if u~=o then 
						o=u;
						n.Thickness=C(64/u,3,16);
					end;
					if not(m.Enabled)then 
						m.Enabled=true;
					end;
				end};
				N.teardown(X);
				return h;
			end;
			K.O=function()
				local R=bit32.bxor;
				local _=bit32.band;
				local N=bit32.rshift;
				local h=math.floor;
				local F=math.ceil;
				local t=math.min;
				local f,l=math.clamp,{};
				for g=0,255,1 do 
					local u=g;
					for s=1,8,1 do 
						u=if u%2==1 then R(3988292384,N(u,1))else N(u,1);
					end;
					l[g]=u;
				end;
				local function g(u,s,C)
					local z=4294967295;
					for q=s,s+C-1,1 do 
						z=R(l[_(R(z,buffer.readu8(u,q)),255)],N(z,8));
					end;
					return R(z,4294967295);
				end;
				local function R(l,u,s)
					buffer.writeu8(l,u,_(N(s,24),255));
					buffer.writeu8(l,u+1,_(N(s,16),255));
					buffer.writeu8(l,u+2,_(N(s,8),255));
					buffer.writeu8(l,u+3,_(s,255));
				end;
				local l={137,80,78,71,13,10,26,10};
				local u={mask=function(s,C,z)
					if not(buffer)then 
						return nil;
					end;
					local q=C*(1+s*4);
					local r,x,G=buffer.create(q),1,0;
					local function a(m)
						x=(x+m)%65521;
						G=(G+x)%65521;
					end;
					local m=0;
					for c=0,C-1,1 do 
						local n=(c+0.5)/C;
						buffer.writeu8(r,m,0);
						a(0);
						m+=1;
						for O=0,s-1,1 do 
							c=h(f(z(math.abs((O+0.5)/s*2-1),n),0,1)*255+0.5);
							buffer.writeu8(r,m,255);
							buffer.writeu8(r,m+1,255);
							buffer.writeu8(r,m+2,255);
							buffer.writeu8(r,m+3,c);
							a(255);
							a(255);
							a(255);
							a(c);
							m+=4;
						end;
					end;
					z=2+math.max(1,F(q/65535))*5+q+4;
					local h,F=buffer.create(45+z+12),0;
					for f=1,#l,1 do 
						buffer.writeu8(h,F,l[f]);
						F+=1;
					end;
					R(h,F,13);
					F+=4;
					buffer.writestring(h,F,"IHDR");
					a=F;
					F=a+4;
					R(h,F,s);
					F+=4;
					R(h,F,C);
					F+=4;
					buffer.writeu8(h,F,8);
					F+=1;
					buffer.writeu8(h,F,6);
					F+=1;
					buffer.writeu8(h,F,0);
					F+=1;
					buffer.writeu8(h,F,0);
					F+=1;
					buffer.writeu8(h,F,0);
					F+=1;
					R(h,F,g(h,a,17));
					F+=4;
					R(h,F,z);
					F+=4;
					buffer.writestring(h,F,"IDAT");
					C=F;
					F=C+4;
					buffer.writeu8(h,F,120);
					F+=1;
					buffer.writeu8(h,F,1);
					a=q;
					F+=1;
					s=0;
					while a>0 do 
						q=t(65535,a);
						buffer.writeu8(h,F,a-q==0 and 1 or 0);
						F+=1;
						buffer.writeu8(h,F,_(q,255));
						F+=1;
						buffer.writeu8(h,F,_(N(q,8),255));
						F+=1;
						local t=_(bit32.bnot(q),65535);
						buffer.writeu8(h,F,_(t,255));
						F+=1;
						buffer.writeu8(h,F,_(N(t,8),255));
						F+=1;
						buffer.copy(h,F,r,s,q);
						F+=q;
						s+=q;
						a=a-q;
					end;
					R(h,F,G*65536+x);
					F+=4;
					R(h,F,g(h,C,4+z));
					F+=4;
					R(h,F,0);
					F+=4;
					buffer.writestring(h,F,"IEND");
					R(h,F+4,g(h,F,4));
					return buffer.tostring(h);
				end};
				return u;
			end;
			K.P=function()
				local R=K.load("b");
				local _,N=K.load("q"),K.load("f");
				local h=K.load("a");
				local F=K.load("j");
				local t,tp=K.load("O"),K.load("H");
				local l=_.world;
				local g=R.workspace;
				local u=R.tween;
				local s=R.debris;
				local C,z=R.custom_asset,math.clamp;
				local q=math.max;
				local r=math.min;
				local x=math.abs;
				local G=math.exp;
				local a=math.tan;
				local m=math.rad;
				local c,c,n=math.floor,Color3.new(1,1,1),true;
				local function O(j)
					return z(tonumber(j)or 0,0,1);
				end;
				local function j(E)
					E=O(E);
					return E*E*(3-2*E);
				end;
				local function E(P,T)
					local Y=j(r(T,1-T)/0.18);
					local j,v=0.004+Y^2.6*0.996,Y^1.25;
					T,Y=P/(0.26*j),P/(0.8*j);
					j=O(v*G(-(T*T)*2.66))*0.98;
					return j+O(v*G(-(Y*Y)*2.66))*0.4*(1-j);
				end;
				local G;
				_=h.shared;
				local j,P=_.beam_uri,false;
				if type(isfile)=="function"then 
					local T,Y=pcall(isfile,"bs_beam_profile_v2.png");
					P=T and Y==true;
				else 
				end;
				local T;
				if type(j)=="string"and#j>0 and P then 
					T=j;
				else 
					if type(writefile)=="function"then 
						if type(C)=="function"then 
							if buffer then 
								local j=t.mask(128,512,E);
								if j then 
									if pcall(writefile,"bs_beam_profile_v2.png",j)then 
										local j,P=pcall(C,"bs_beam_profile_v2.png");
										if j then 
											if type(P)=="string"then 
												if#P>0 then 
													_.beam_uri=P;
													G=P;
												else 
												end;
											else 
											end;
										else 
										end;
									else 
									end;
								else 
								end;
							else 
							end;
						else 
						end;
					else 
					end;
					T=G;
				end;
				local _,G={},{0,0.02,0.05,0.09,0.13,0.18,0.5,0.82,0.87,0.91,0.95,0.98,1};
				for j=1,#G,1 do 
					_[j]={G[j],1-E(0,G[j])};
				end;
				local function j(P)
					if T then 
						return NumberSequence.new(O(P));
					end;
					local Y,v={},1-O(P);
					for Z=1,#_,1 do 
						P=_[Z];
						Y[Z]=NumberSequenceKeypoint.new(P[1],O(1-(1-P[2])*v));
					end;
					return NumberSequence.new(Y);
				end;
				local _=Instance.new("Part");
				_.Anchored=true;
				_.CanCollide=false;
				_.CanQuery=false;
				_.CanTouch=false;
				_.CastShadow=false;
				_.Transparency=1;
				_.Size=Vector3.one;
				_.CFrame=CFrame.new();
				_.Parent=g.CurrentCamera or g;
				h.own(_);
				h.connect(g:GetPropertyChangedSignal("CurrentCamera"),function()
					if not(n)then 
						return;
					end;
					local O=g.CurrentCamera;
					if O then 
						if _.Parent~=O then 
							_.Parent=O;
						end;
					end;
				end);
				local O,P,Y={},{},0;
				local function v()
					local Z=Instance.new("Attachment");
					Z.Parent=_;
					local L=Instance.new("Attachment");
					L.Parent=_;
					local o=Instance.new("Beam");
					o.Attachment0=Z;
					o.Attachment1=L;
					o.FaceCamera=true;
					o.TextureMode=Enum.TextureMode.Stretch;
					o.TextureSpeed=0;
					o.TextureLength=1;
					o.LightEmission=0;
					o.LightInfluence=0;
					o.Segments=2;
					o.CurveSize0=0;
					o.CurveSize1=0;
					o.ZOffset=0;
					o.Width0=0;
					o.Width1=0;
					o.Color=ColorSequence.new(c);
					o.Transparency=NumberSequence.new(1);
					o.Enabled=false;
					if T then 
						o.Texture=T;
					end;
					o.Parent=_;
					local _=Instance.new("NumberValue");
					_.Value=1;
					_.Parent=o;
					local T={beam=o,first=Z,second=L,driver=_,conn=_:GetPropertyChangedSignal("Value"):Connect(function()
						o.Transparency=j(_.Value);
					end)};
					Y+=1;
					return T;
				end;
				local function _(T)
					local Z=T.tween;
					if not(Z)then 
						return;
					end;
					T.tween=nil;
					pcall(Z.Cancel,Z);
				end;
				local function T(Z)
					_(Z);
					Z.beam.Enabled=false;
				end;
				local function Z(L)
					_(L);
					if L.conn then 
						L.conn:Disconnect();
						L.conn=nil;
					end;
					pcall(L.beam.Destroy,L.beam);
					pcall(L.first.Destroy,L.first);
					pcall(L.second.Destroy,L.second);
				end;
				local function L(o)
					T(o);
					O[#O+1]=o;
				end;
				local function T()
					local o=table.remove(O);
					if o then 
						return o;
					end;
					if Y<96 then 
						return v();
					end;
					o=table.remove(P,1);
					if o then 
						_(o);
					end;
					return o;
				end;
				local function _(Y,v,o)
					local X=Y.ViewportSize;
					if X.Y<=0 then 
						return 0;
					end;
					return v*(2*o*a(m(Y.FieldOfView)*0.5))/X.Y;
				end;
				local function a(m,Y)
					if n then 
						if m.tween~=Y then 
							return;
						end;
					else 
						return;
					end;
					for Y=#P,1,-1 do 
						if P[Y]==m then 
							N.drop(P,Y);
							break;
						end;
					end;
					L(m);
				end;
				local function m(Y,v,o,X,Q)
					if n then 
						if typeof(Y)~="Vector3"then 
							return;
						elseif typeof(v)~="Vector3"then 
							return;
						end;
					else 
						return;
					end;
					if(v-Y).Magnitude<0.05 then 
						return;
					end;
					local S=g.CurrentCamera;
					if not(S)then 
						return;
					end;
					local A=T();
					if not(A)then 
						return;
					end;
					local T=tonumber(X)or 5;
					T=z(if T<=0.25 then T*100 else T,1,20)*1.25;
					local J,y,e=z(tonumber(Q)or 1.2,0.05,10),(typeof(o)=="Color3"and o or c):Lerp(c,0.15),S.CFrame;
					o,Q=q(-e:PointToObjectSpace(Y).Z,0.25),q(-e:PointToObjectSpace(v).Z,0.25);
					X,e=_(S,T,o),_(S,T,Q);
					if X<=0 then 
						L(A);
						return;
					elseif e<=0 then 
						L(A);
						return;
					end;
					o=r(0.08,J*0.2);
					local _,r,c=q(J-o,0.01),A.beam,A.driver;
					A.first.Position=Y;
					A.second.Position=v;
					r.Color=ColorSequence.new(y);
					r.Width0=X;
					r.Width1=e;
					c.Value=0;
					r.Transparency=j(0);
					r.Enabled=true;
					y=u:Create(c,TweenInfo.new(_,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,0,false,o),{Value=1});
					A.tween=y;
					P[#P+1]=A;
					y:Play();
					task.delay(J+0.02,a,A,y);
				end;
				local _={};
				local function u(q,r,a)
					local c=Instance.new("Part");
					c.Size=Vector3.new(0.05,0.05,0.05);
					c.CFrame=CFrame.new(q);
					c.Anchored=true;
					c.CanCollide=false;
					c.CanQuery=false;
					c.CanTouch=false;
					c.CastShadow=false;
					c.Transparency=1;
					c.Parent=g:FindFirstChild("Debris")or g;
					q=Instance.new("BoxHandleAdornment");
					q.Adornee=c;
					q.Size=Vector3.new(0.35,0.35,0.35);
					q.CFrame=CFrame.new();
					q.AlwaysOnTop=true;
					q.ZIndex=10;
					q.Color3=r;
					q.Transparency=0;
					q.Visible=true;
					q.Parent=c;
					local g,r=#_+1,{part=c,box=q};
					r.born,r.life,_[g]=os.clock(),a,r;
					s:AddItem(c,a+0.5);
				end;
				local g=N.queue.new(16);
				local function s(q)
					while true do 
						local r=g:peek();
						if r then 
							if q-r.time<=0.75 then 
								break;
							end;
						else 
							break;
						end;
						g:shift();
					end;
					while g:count()>64 do 
						g:shift();
					end;
				end;
				local function q(r,a)
					s((os.clock()));
					local c=g.items;
					for j=g.head,g.tail,1 do 
						local T=c[j].packet;
						if type(T)=="table"then 
							if type(T.Distance)=="number"then 
								if typeof(T.Direction)=="Vector3"then 
									if x(T.Distance-r)<=0.001 then 
										if(T.Direction-a).Magnitude<=1.0E-5 then 
											g:remove(j);
											return T;
										end;
									end;
								end;
							end;
						end;
					end;
					return nil;
				end;
				local r={};
				local function a(c,j)
					local T=1;
					r[1]=c;
					c=j.Hits;
					if type(c)=="table"then 
						for Y=1,#c,1 do 
							local v=c[Y];
							if v then 
								if typeof(v.Position)=="Vector3"then 
									Y=T+1;
									r[Y]=v.Position;
									T=Y;
								else 
								end;
							else 
							end;
						end;
					else 
					end;
					if T==1 then 
						if typeof(j.Origin)~="Vector3"then 
							return;
						elseif typeof(j.Direction)~="Vector3"then 
							return;
						elseif type(j.Distance)~="number"then 
							return;
						elseif j.Distance<=0 then 
							return;
						end;
						r[2]=j.Origin+j.Direction*j.Distance;
						T=2;
					else 
					end;
					N.trim(r,T);
					for c=1,T-1,1 do 
						m(r[c],r[c+1],l.tracers_col,l.tracers_width,l.tracers_life);
					end;
				end;
				local m={impacts=function(c)
					if l.impacts then 
						if type(c)~="table"then 
							return;
						end;
					else 
						return;
					end;
					local j=c.Hits;
					if type(j)~="table"then 
						return;
					end;
					c=z(tonumber(l.impacts_life)or 3,1,30);
					for z=1,#j,1 do 
						local T=j[z];
						z=T and T.Position;
						if typeof(z)=="Vector3"then 
							u(z,l.impacts_col,c);
						end;
					end;
				end,step=function()
					local u=#_;
					if u==0 then 
						return;
					end;
					local z=os.clock();
					for c=u,1,-1 do 
						local u=_[c];
						local j=u.part;
						if j.Parent then 
							local T=(z-u.born)/u.life;
							if T>=1 then 
								N.drop(_,c);
								j:Destroy();
							else 
								u.box.Transparency=T;
							end;
						else 
							N.drop(_,c);
						end;
					end;
				end};
				local function u(z,c)
					local j=z.Hits;
					if type(j)~="table"then 
						return nil,nil;
					end;
					local T;
					for Y=#j,1,-1 do 
						local v=j[Y];
						if v and typeof(v.Position)=="Vector3"then 
							T=v.Position;
							break;
						end;
					end;
					T=T or(if typeof(z.Origin)=="Vector3"then if typeof(z.Direction)=="Vector3"then if type(z.Distance)=="number"then if z.Distance>0 then z.Origin+z.Direction*z.Distance else T else T else T else T);
					if not(T)then 
						return nil,nil;
					end;
					j=T-c;
					z=j.Magnitude;
					if z<0.05 then 
						return nil,nil;
					end;
					return z,j/z;
				end;
				local z;
				do 
				local c=F.tracer_fx;
				if type(c)=="function"then 
					local function j(T,Y,v,...)
						if tp.on()then 
							local L=tp.muzzle();
							Y=if L then L.Position else Y;
						else 
						end;
						if typeof(T)=="number"then 
							if T>0 then 
								if typeof(Y)=="Vector3"then 
									if typeof(v)=="Vector3"then 
										if x(v.Magnitude-1)<=0.02 then 
											local f=q(T,v);
											if f then 
												if l.tracers then 
													pcall(a,Y,f);
												end;
												local q,x=u(f,Y);
												if q then 
													if x then 
														return c(q,Y,x,...);
													end;
												end;
											end;
										end;
									end;
								end;
							end;
						end;
						return c(T,Y,v,...);
					end;
					t=F.weapon;
					C=type(t)=="table"and rawget(t,"shoot")or nil;
					if type(C)=="function"and type(R.getups)=="function"then 
						E,G=pcall(R.getups,C);
						if E and type(G)=="table"then 
							for t,f in G,nil,nil do 
								if f==c then 
									if h.upvalue(C,t,j)then 
										z=C;
									else 
									end;
									break;
								end;
							end;
						else 
						end;
					else 
					end;
				else 
				end;end;
			m.attach=function(t)
					local f=F.bullet;
					if type(f)~="table"then 
						return;
					elseif type(f.create)~="function"then 
						return;
					end;
					h.field(f,"create",function(F)
						return function(f,u,C)
							local q=F(f,u,C);
							if z and(l.tracers or(tp and tp.on and tp.on()))then 
								s(os.clock());
								if type(q)=="table"then 
									if typeof(q.Origin)=="Vector3"then 
										if typeof(q.Direction)=="Vector3"then 
											if type(q.Distance)=="number"then 
												if q.Distance>0 then 
													g:push({packet=q,time=os.clock()});
												end;
											end;
										end;
									end;
								end;
							end;
							if l.impacts then 
								R.elevate(m.impacts,q);
							end;
							if t then 
								R.elevate(t,f,q);
							end;
							return q;
						end;
					end);
				end;
				m.unload=function()
					n=false;
					l.tracers=false;
					l.impacts=false;
					for R=#_,1,-1 do 
						local F=_[R];
						_[R]=nil;
						if F.part.Parent then 
							pcall(F.part.Destroy,F.part);
						end;
					end;
					for R=#P,1,-1 do 
						Z(P[R]);
						P[R]=nil;
					end;
					for R=#O,1,-1 do 
						Z(O[R]);
						O[R]=nil;
					end;
					g:reset();
					N.trim(r,0);
				end;
				h.teardown(m.unload);
				return m;
			end;
			K.Q=function()
				local R,_,N=K.load("b"),K.load("q"),K.load("a");
				local h=R.assets;
				local F=math.clamp;
				local t=math.min;
				local f=math.max;
				local l=math.floor;
				local g=math.ceil;
				local u=math.abs;
				local s=string.sub;
				local C=Color3.new(1,1,1);
				local z=Color3.new();
				local q,r=Vector2.zero,{alive=true,available=false,resolution=256,owners={}};
				local x=R.screen(2147479999);
				r.gui=x;
				r.available=x~=nil;
				local R=Enum.ImageCombineType.Overwrite;
				local G,a=r.owners,{};
				local function m(c)
					local n=G[c];
					if n then 
					else 
						n={open=false,ready=false,failed=false,expect=false,fill_used=0,fills={},stroke_used=0,strokes={},point_used=0,points={}};
						G[c]=n;
						a[#a+1]=c;
					end;
					return n;
				end;
				local function c(n)
					if not(n)then 
						return;
					end;
					local O=n.banks;
					for j=1,#O,1 do 
						n=O[j];
						if n then 
							if n.label then 
								pcall(n.label.Destroy,n.label);
							end;
							if n.image then 
								pcall(n.image.Destroy,n.image);
							end;
						end;
					end;
				end;
				local function n(O)
					if not(O)then 
						return;
					end;
					local j=O.banks;
					for E=1,#j,1 do 
						O=j[E];
						if O then 
							E=O.groups;
							for O=1,#E,1 do 
								local j=E[O];
								if j then 
									pcall(j.Destroy,j);
								end;
							end;
						end;
					end;
				end;
				local function O(j)
					if not(j)then 
						return;
					end;
					local E=j.banks;
					for P=1,#E,1 do 
						j=E[P];
						if j then 
							P=j.frames;
							for j=1,#P,1 do 
								local E=P[j];
								if E then 
									pcall(E.Destroy,E);
								end;
							end;
						end;
					end;
				end;
				local j;
				local function E()
					local P,T=j,Vector2.new(r.resolution,r.resolution);
					for Y=1,2,1 do 
						local v=h:CreateEditableImage({Size=T});
						if not(v)then 
							error("image");
						end;
						local h={image=v};
						P.banks[Y]=h;
						Y=Instance.new("ImageLabel");
						h.label=Y;
						Y.BackgroundTransparency=1;
						Y.BorderSizePixel=0;
						Y.ImageColor3=C;
						Y.ImageTransparency=0.72;
						Y.ScaleType=Enum.ScaleType.Stretch;
						Y.Visible=false;
						Y.ZIndex=1;
						Y.ImageContent=Content.fromObject(v);
						Y.Parent=x;
					end;
				end;
				local function h()
					local P=j;
					for T=1,2,1 do 
						local Y={groups={},paths={}};
						P.banks[T]=Y;
						for P=1,3,1 do 
							T=Instance.new("CanvasGroup");
							Y.groups[P]=T;
							T.BackgroundTransparency=1;
							T.BorderSizePixel=0;
							T.Position=UDim2.fromOffset(0,0);
							T.Size=UDim2.fromScale(1,1);
							T.GroupTransparency=1;
							T.Visible=false;
							T.ZIndex=P+2;
							T.Parent=x;
							local v=Instance.new("Path2D");
							Y.paths[P]=v;
							v.Visible=false;
							v.ZIndex=P+2;
							v.Parent=T;
						end;
					end;
				end;
				local function P()
					local T=j;
					for Y=1,2,1 do 
						local v={frames={}};
						T.banks[Y]=v;
						for T=1,3,1 do 
							Y=Instance.new("Frame");
							v.frames[T]=Y;
							Y.AnchorPoint=Vector2.new(0.5,0.5);
							Y.BackgroundTransparency=1;
							Y.BorderSizePixel=0;
							Y.Visible=false;
							Y.ZIndex=T+11;
							Y.Parent=x;
							T=Instance.new("UICorner");
							T.CornerRadius=UDim.new(1,0);
							T.Parent=Y;
						end;
					end;
				end;
				local function T(Y,v)
					if r.alive then 
						if not(r.available)then 
							return nil;
						end;
					else 
						return nil;
					end;
					local Z={banks={},active=0};
					j=Z;
					local L=pcall(Y);
					j=nil;
					if not(L)then 
						v(Z);
						return nil;
					end;
					return Z;
				end;
				local function j(Y)
					return typeof(Y)=="Vector2"and Y.X==Y.X and Y.Y==Y.Y and u(Y.X)<100000000 and u(Y.Y)<100000000;
				end;
				local function Y(v,Z,L,o)
					if type(L)~="table"then 
						return false;
					end;
					local X,Q,S,A,J=typeof(o)=="Vector2"and o or q,t(v.X,Z.X),t(v.Y,Z.Y),f(v.X,Z.X),f(v.Y,Z.Y);
					for y=1,#L,1 do 
						o=L[y];
						if typeof(o)=="Instance"then 
							if o.Parent then 
								if o.Visible then 
									Z,v=o.AbsolutePosition+X,o.AbsoluteSize;
									if v.X>0 then 
										if v.Y>0 then 
											if Q<Z.X+v.X then 
												if A>Z.X then 
													if S<Z.Y+v.Y then 
														if J>Z.Y then 
															return true;
														end;
													end;
												end;
											end;
										end;
									end;
								end;
							end;
						end;
					end;
					return false;
				end;
				local v,Z,L={},{},{};
				local function o(X,Q)
					local S=0;
					for A=1,#X,1 do 
						local J=X[A];
						if j(J)then 
							A=S>0 and v[S]or nil;
							if A then 
								if(J-A).Magnitude>0.2 then 
									local A=S+1;
									v[A]=J;
									S=A;
								else 
								end;
							else 
								local A=S+1;
								v[A]=J;
								S=A;
							end;
						else 
						end;
					end;
					S=if Q then if S>2 then if(v[1]-v[S]).Magnitude<=0.2 then S-1 else S else S else S;
					if S<=96 then 
						return v,S;
					end;
					X=Q and S or S-1;
					L[1]=0;
					for A=1,X,1 do 
						local J=A==S and 1 or A+1;
						L[A+1]=L[A]+(v[J]-v[A]).Magnitude;
					end;
					local A=L[X+1];
					if A<=0.2 then 
						return v,0;
					end;
					local J=1;
					for y=1,96,1 do 
						local e=A*(Q and(y-1)/96 or(y-1)/95);
						while J<X and L[J+1]<e do 
							J+=1;
						end;
						local X,Q=J==S and 1 or J+1,L[J+1]-L[J];
						local S=Q>0 and(e-L[J])/Q or 0;
						Z[y]=v[J]:Lerp(v[X],F(S,0,1));
					end;
					return Z,96;
				end;
				local v={};
				local function Z(L,X,Q)
					for S=1,X,1 do 
						local A,J,y=L[S];
						if Q then 
							local Q,e=L[S==1 and X or S-1],L[S==X and 1 or S+1];
							local M,I=(e-Q)/6,t((A-Q).Magnitude,(e-A).Magnitude)*0.42;
							M=if M.Magnitude>I then if M.Magnitude>0 then M.Unit*I else M else M;
							J,y=-M,M;
						else 
							if S==1 and X>1 then 
								J,y=q,(L[2]-A)/3;
							else 
								if S==X and X>1 then 
									J,y=(L[X-1]-A)/3,q;
								else 
									if X>2 then 
										local Q,e=L[S-1],L[S+1];
										local L,M=(e-Q)/6,t((A-Q).Magnitude,(e-A).Magnitude)*0.42;
										L=if L.Magnitude>M then if L.Magnitude>0 then L.Unit*M else L else L;
										J,y=-L,L;
									else 
										J,y=q,q;
									end;
								end;
							end;
						end;
						v[S]=Path2DControlPoint.new(UDim2.fromOffset(A.X,A.Y),UDim2.fromOffset(J.X,J.Y),UDim2.fromOffset(y.X,y.Y));
					end;
					for L=#v,X+1,-1 do 
						v[L]=nil;
					end;
					return v;
				end;
				local function L(X)
					if X then 
						if not(X.label)then 
							return true;
						end;
					else 
						return true;
					end;
					X.label.Visible=false;
					return true;
				end;
				local function X(Q)
					if not(Q)then 
						return true;
					end;
					local S=Q.banks;
					for Q=1,#S,1 do 
						L(S[Q]);
					end;
					return true;
				end;
				local function Q(S)
					if not(S)then 
						return true;
					end;
					local A,J=S.groups,S.paths;
					for y=1,#A,1 do 
						S=J[y];
						if S then 
							S.Visible=false;
						end;
						local S=A[y];
						if S then 
							S.Visible=false;
						end;
					end;
					return true;
				end;
				local function S(A)
					if not(A)then 
						return true;
					end;
					local J=A.banks;
					for A=1,#J,1 do 
						Q(J[A]);
					end;
					return true;
				end;
				local function A(J)
					if not(J)then 
						return true;
					end;
					local y=J.frames;
					for e=1,#y,1 do 
						J=y[e];
						if J then 
							J.Visible=false;
						end;
					end;
					return true;
				end;
				local function J(y)
					if not(y)then 
						return true;
					end;
					local e=y.banks;
					for y=1,#e,1 do 
						A(e[y]);
					end;
					return true;
				end;
				local function y(e)
					if e then 
						if not(e.label)then 
							return false;
						end;
					else 
						return false;
					end;
					e.label.Visible=true;
					return true;
				end;
				local function e(M)
					local I=M and M.groups;
					if I then 
						if#I<3 then 
							return false;
						end;
					else 
						return false;
					end;
					for M=1,3,1 do 
						I[M].Visible=true;
					end;
					return true;
				end;
				local function M(I)
					local i=I and I.frames;
					if i then 
						if#i<3 then 
							return false;
						end;
					else 
						return false;
					end;
					for I=1,3,1 do 
						i[I].Visible=true;
					end;
					return true;
				end;
				local function I(i,k)
					if not(i)then 
						return;
					end;
					local B=i.pending;
					i.pending=nil;
					if type(B)=="number"then 
						if B>0 then 
							if B~=i.active then 
								k(i.banks[B]);
							end;
						end;
					end;
				end;
				local function i(k)
					local B,d,b=k.fills,k.strokes,k.points;
					for p=1,#B,1 do 
						I(B[p],L);
					end;
					for B=1,#d,1 do 
						I(d[B],Q);
					end;
					for B=1,#b,1 do 
						I(b[B],A);
					end;
					k.ready=false;
				end;
				local function I(k,B,d)
					local b=k.pending;
					if b==nil then 
						return;
					end;
					if b==0 then 
						d(k);
						k.active=0;
					else 
						local d,p=k.banks[b],k.banks[k.active];
						if p then 
							if p~=d then 
								B(p);
							end;
						end;
						k.active=b;
					end;
					k.pending=nil;
				end;
				local function k(B)
					local d,b,p,D=B.fills,B.strokes,B.points,true;
					for V=1,#d,1 do 
						local W=d[V];
						V=W.pending;
						if type(V)=="number"and V>0 and not y(W.banks[V])then 
							D=false;
							break;
						end;
					end;
					if D then 
						for y=1,#b,1 do 
							local V=b[y];
							y=V.pending;
							if type(y)=="number"and y>0 and not e(V.banks[y])then 
								D=false;
								break;
							end;
						end;
					else 
					end;
					if D then 
						for y=1,#p,1 do 
							local e=p[y];
							y=e.pending;
							if type(y)=="number"and y>0 and not M(e.banks[y])then 
								D=false;
								break;
							end;
						end;
						if not(D)then 
							i(B);
							return false;
						end;
					else 
						i(B);
						return false;
					end;
					for y=1,#d,1 do 
						I(d[y],L,X);
					end;
					for y=1,#b,1 do 
						I(b[y],Q,S);
					end;
					for y=1,#p,1 do 
						I(p[y],A,J);
					end;
					B.ready=false;
					return true;
				end;
				local y={};
				local function e()
					local M,I,B,d,b,p,D,V=y.bank,y.style,y.color,y.closed,y.width,y.opacity,y.base,y.controls;
					local W,H=M.groups,M.paths;
					for w=1,3,1 do 
						local UQ,KQ,RQ;
						if I=="trail"then 
							UQ,KQ=w==1 and 5.4 or w==2 and 2.7 or 1.25,w==1 and 0.26 or w==2 and 0.72 or 1;
							M=w==1 and 0.12 or w==2 and 0.42;
							RQ=M or 0.78;
						else 
							if I=="wave"then 
								UQ,KQ=w==1 and 5 or w==2 and 2.45 or 0.95,w==1 and 0.22 or w==2 and 0.62 or 1;
								local M=w==1 and 0.08 or w==2 and 0.34;
								RQ=M or 0.68;
							else 
								UQ,KQ=w==1 and 4.8 or w==2 and 2.35 or 1,w==1 and 0.14 or w==2 and 0.46 or 0.94;
								local M=w==1 and 0 or w==2 and 0.22;
								RQ=M or 0.58;
							end;
						end;
						local M,I,_Q=D+w,W[w],H[w];
						I.ZIndex=M;
						I.GroupTransparency=1-p*KQ;
						_Q.ZIndex=M;
						_Q.Color3=B:Lerp(C,RQ);
						_Q.Thickness=b*UQ;
						_Q.Closed=d;
						_Q:SetControlPoints(V);
						_Q.Visible=true;
					end;
				end;
				local function M(I,B,d,b,p,D,V,W)
					if I then 
						if d<(b and 3 or 2)then 
							return false;
						end;
					else 
						return false;
					end;
					local H=I.active~=0 and I.active or 1;
					local w=I.banks and I.banks[H];
					if not(w)then 
						return false;
					end;
					if H~=I.active then 
						Q(w);
					end;
					y.bank=w;
					y.style=V;
					y.color=p;
					y.closed=b;
					y.width=f(0.65,tonumber(D)or 1.5);
					y.opacity=F(tonumber(W)or 1,0,1);
					y.base=V=="trail"and 8 or V=="wave"and 5 or 2;
					y.controls=Z(B,d,b);
					if not(pcall(e))then 
						if H~=I.active then 
							Q(w);
						end;
						return false;
					end;
					I.pending=H;
					return true;
				end;
				local function Z(Q,y,e,I,B,d,b,p)
					local D=m(Q);
					Q=D.stroke_used+1;
					D.stroke_used=Q;
					local V=D.strokes[Q];
					if V then 
					else 
						V=T(h,n);
						if not(V)then 
							D.failed=true;
							return false;
						end;
						D.strokes[Q]=V;
					end;
					Q=M(V,y,e,I,B,d,b,p);
					if not Q then 
						D.failed=true;
					end;
					return Q;
				end;
				local h={};
				local function Q(y,e,M,I,B,d,b,p,D)
					local V,W=o(e,M);
					if W<(M and 3 or 2)then 
						return true;
					end;
					if type(d)~="table"then 
						return Z(y,V,W,M,I,B,p,D);
					elseif#d==0 then 
						return Z(y,V,W,M,I,B,p,D);
					end;
					local H,w=0;
					if not(M)then 
						w=H;
						for UQ=1,W-1,1 do 
							local KQ,RQ=V[UQ],V[UQ+1];
							if Y(KQ,RQ,d,b)then 
								if w>=2 then 
									Z(y,h,w,false,I,B,p,D);
								end;
								w=0;
							else 
								if w==0 then 
									e=w+1;
									h[e]=KQ;
									w=e;
								else 
									if(KQ-h[w]).Magnitude>0.1 then 
										UQ=w+1;
										h[UQ]=KQ;
										w=UQ;
									else 
									end;
								end;
								if(RQ-h[w]).Magnitude>0.1 then 
									w+=1;
									h[w]=RQ;
								else 
								end;
							end;
						end;
						if w>=2 then 
							Z(y,h,w,false,I,B,p,D);
						end;
						return true;
					end;
					M=nil;
					for UQ=1,W,1 do 
						e=UQ==W and 1 or UQ+1;
						if Y(V[UQ],V[e],d,b)then 
							M=UQ;
							break;
						end;
					end;
					if not M then 
						return Z(y,V,W,true,I,B,p,D);
					end;
					w=H;
					for UQ=1,W,1 do 
						e=(M+UQ-1)%W+1;
						H,UQ=e==W and 1 or e+1,V[e];
						local e=V[H];
						if Y(UQ,e,d,b)then 
							if w>=2 then 
								Z(y,h,w,false,I,B,p,D);
							end;
							w=0;
						else 
							if w==0 then 
								local M=w+1;
								h[M]=UQ;
								w=M;
							else 
								if(UQ-h[w]).Magnitude>0.1 then 
									local M=w+1;
									h[M]=UQ;
									w=M;
								else 
								end;
							end;
							if(e-h[w]).Magnitude>0.1 then 
								w+=1;
								h[w]=e;
							else 
							end;
						end;
					end;
					if w>=2 then 
						Z(y,h,w,false,I,B,p,D);
					end;
					return true;
				end;
				local h={};
				local function Z()
					local y,e,M,I,B=h.bank,h.at,h.color,h.core,h.opacity;
					local d=y.frames;
					for y=1,3,1 do 
						local b,p,D=y==1 and 3.4 or y==2 and 1.9 or 1,y==1 and 0.13 or y==2 and 0.52 or 1,y==1 and 0.08 or y==2 and 0.36 or 0.78;
						local V,W=I*2*b,d[y];
						W.Position=UDim2.fromOffset(e.X,e.Y);
						W.Size=UDim2.fromOffset(V,V);
						W.BackgroundColor3=M:Lerp(C,D);
						W.BackgroundTransparency=1-B*p;
					end;
				end;
				local function y(e,M,I,B,d,b,p)
					if j(M)then 
						if typeof(I)~="Color3"then 
							return false;
						end;
					else 
						return false;
					end;
					local D=F(tonumber(p)or 1,0,1);
					if D<=0 then 
						return true;
					elseif Y(M,M,d,b)then 
						return true;
					end;
					d=m(e);
					e=d.point_used+1;
					d.point_used=e;
					p=d.points[e];
					if p then 
					else 
						p=T(P,O);
						if not p then 
							d.failed=true;
							return false;
						end;
						d.points[e]=p;
					end;
					e=p.active==1 and 2 or 1;
					b=p.banks and p.banks[e];
					if not b then 
						d.failed=true;
						return false;
					end;
					A(b);
					h.bank=b;
					h.at=M;
					h.color=I;
					h.core=f(1,tonumber(B)or 3);
					h.opacity=D;
					if not(pcall(Z))then 
						A(b);
						d.failed=true;
						return false;
					end;
					p.pending=e;
					return true;
				end;
				local h,P={begin=function(Y)
					if not(r.alive)then 
						return false;
					end;
					local Z=m(Y);
					if Z.ready then 
						k(Z);
					else 
						i(Z);
					end;
					Z.open=true;
					Z.failed=false;
					Z.expect=false;
					Z.fill_used=0;
					Z.stroke_used=0;
					Z.point_used=0;
					return r.available;
				end,expectFill=function(Y)
					if r.alive then 
						if not(r.available)then 
							return false;
						end;
					else 
						return false;
					end;
					m(Y).expect=true;
					return true;
				end,stroke=function(Y,Z,A,e,M,I,B,d,b)
					if r.alive then 
						if not(r.available)then 
							return false;
						end;
					else 
						return false;
					end;
					if type(Z)~="table"then 
						return false;
					elseif typeof(e)~="Color3"then 
						return false;
					end;
					return Q(Y,Z,A==true,e,M,I,B,d,b);
				end,point=function(Y,Z,A,e,M,I,B)
					if r.alive then 
						if not(r.available)then 
							return false;
						end;
					else 
						return false;
					end;
					return y(Y,Z,A,e,M,I,B);
				end,trail=function(Y,Z,A,e,M,I,B)
					if r.alive then 
						if not(r.available)then 
							return false;
						end;
					else 
						return false;
					end;
					if type(Z)~="table"then 
						return false;
					elseif#Z<2 then 
						return false;
					elseif typeof(A)~="Color3"then 
						return false;
					end;
					local d,b,p=Q(Y,Z,false,A,e,M,I,"trail",B),o(Z,false);
					if p>0 then 
						y(Y,b[p],A,f(2.5,(tonumber(e)or 2)*1.45),M,I,B);
					end;
					return d;
				end},{};
				h.pulse=function(Y,Z,o,A,y,e,M,I,B)
					if r.alive then 
						if not(r.available)then 
							return false;
						end;
					else 
						return false;
					end;
					if j(Z)then 
						if type(o)~="table"then 
							return false;
						elseif#o<3 then 
							return false;
						elseif typeof(y)~="Color3"then 
							return false;
						end;
					else 
						return false;
					end;
					local d=F(tonumber(A)or 0,0,1);
					if d<=0.01 then 
						return true;
					end;
					A=#o;
					for b=1,A,1 do 
						P[b]=Z:Lerp(o[b],d);
					end;
					for Z=#P,A+1,-1 do 
						P[Z]=nil;
					end;
					return Q(Y,P,true,y,e,M,I,"wave",B);
				end;
				local P=table.create(32);
				h.circle=function(Y,Z,o,A,y,e,M,I)
					if r.alive then 
						if not(r.available)then 
							return false;
						end;
					else 
						return false;
					end;
					if j(Z)then 
						if typeof(A)~="Color3"then 
							return false;
						end;
					else 
						return false;
					end;
					local B=f(0,tonumber(o)or 0);
					if B<=0.2 then 
						return true;
					end;
					for d=1,32,1 do 
						o=6.283185307179586*(d-1)/32;
						P[d]=Z+Vector2.new(math.cos(o),math.sin(o))*B;
					end;
					return Q(Y,P,true,A,y,e,M,"wave",I);
				end;
				local P,Y,Z,o={},{},{},{};
				local Q=Vector2.new(r.resolution,r.resolution);
				local function A(y,e,M,I,B,d)
					if e==0 then 
						return 0;
					end;
					local b=y[e];
					local p=M and b.X or b.Y;
					local D=B and p>=I or(if B then not B else p<=I);
					local V=0;
					for W=1,e,1 do 
						local e=y[W];
						W=M and e.X or e.Y;
						local y=B and W>=I or(if B then not B else W<=I);
						if y~=D then 
							local M=W-p;
							local B=M~=0 and(I-p)/M or 0;
							V+=1;
							d[V]=b+(e-b)*F(B,0,1);
						else 
						end;
						if y then 
							V+=1;
							d[V]=e;
						else 
						end;
						D,p,b=y,W,e;
					end;
					return V;
				end;
				local function y(e,M,I,B,d,b)
					P[1]=e;
					P[2]=M;
					P[3]=I;
					return A(Y,A(P,A(Y,A(P,3,true,0,true,Y),true,B,false,P),false,0,true,Y),false,d,false,b);
				end;
				local P={};
				local function Y()
					local A,e,M,I,B,d,b,p=P.image,P.color,P.left,P.top,P.width,P.height,P.scale,P.used;
					A:DrawRectangle(q,Q,z,1,R);
					for Q=1,p,1 do 
						local D,V=Z[Q],o[Q];
						Q=D[1];
						local W=Vector2.new((Q.X-M)/B*b,(Q.Y-I)/d*b);
						for H=2,V-1,1 do 
							local V,w=D[H],D[H+1];
							H,Q=Vector2.new((V.X-M)/B*b,(V.Y-I)/d*b),Vector2.new((w.X-M)/B*b,(w.Y-I)/d*b);
							if u((H.X-W.X)*(Q.Y-W.Y)-(H.Y-W.Y)*(Q.X-W.X))>0.001 then 
								A:DrawTriangle(W,H,Q,e,0,R);
								A:DrawLine(W,H,e,0,R);
								A:DrawLine(H,Q,e,0,R);
								A:DrawLine(Q,W,e,0,R);
							end;
						end;
					end;
					p=P.masks;
					if type(p)~="table"then 
						return;
					end;
					local u,Q,D,V=P.resolution,P.right,P.bottom,typeof(P.inset)=="Vector2"and P.inset or q;
					for q=1,#p,1 do 
						e=p[q];
						if typeof(e)=="Instance"then 
							if e.Parent then 
								if e.Visible then 
									local q,p=e.AbsolutePosition+V,e.AbsoluteSize;
									local e,V,W,H=f(M,q.X),f(I,q.Y),t(Q,q.X+p.X),t(D,q.Y+p.Y);
									if W>e then 
										if H>V then 
											local q,Q,p,D=F(l((e-M)/B*b)-1,0,u),F(l((V-I)/d*b)-1,0,u),F(g((W-M)/B*b)+1,0,u),F(g((H-I)/d*b)+1,0,u);
											if p>q then 
												if D>Q then 
													A:DrawRectangle(Vector2.new(q,Q),Vector2.new(p-q,D-Q),z,1,R);
												end;
											end;
										end;
									end;
								end;
							end;
						end;
					end;
				end;
				h.draw=function(R,F,u,z,q,Q,A)
					if r.alive then 
						if not(r.available)then 
							return false;
						end;
					else 
						return false;
					end;
					if j(F)then 
						if type(u)~="table"then 
							return false;
						elseif#u<3 then 
							return false;
						end;
					else 
						return false;
					end;
					if typeof(z)~="Color3"then 
						return false;
					elseif typeof(A)~="Vector2"then 
						return false;
					elseif A.X<=1 then 
						return false;
					elseif A.Y<=1 then 
						return false;
					end;
					local e,M,I,B,d,b,p,D=A.X,A.Y,math.huge,math.huge,-math.huge,-math.huge,#u,0;
					for V=1,p,1 do 
						local W,H=u[V],u[V==p and 1 or V+1];
						if j(W)then 
							if j(H)then 
								A=Z[D+1];
								if A then 
								else 
									A={};
									Z[D+1]=A;
								end;
								V=y(F,W,H,e,M,A);
								if V>=3 then 
									local j=D+1;
									o[j]=V;
									local y,W,H,w=I,B,d,b;
									for UQ=1,V,1 do 
										local V=A[UQ];
										y,W,H=t(y,V.X),t(W,V.Y),f(H,V.X);
										w=f(w,V.Y);
									end;
									D,I,B,d,b=j,y,W,H,w;
								else 
								end;
							else 
							end;
						else 
						end;
					end;
					if D==0 then 
						return true;
					end;
					A,F,p,u=f(0,l(I)-2),f(0,l(B)-2),t(e,g(d)+2),t(M,g(b)+2);
					M,e=p-A,u-F;
					if M<=0 then 
						return true;
					elseif e<=0 then 
						return true;
					end;
					local t=m(R);
					R=t.fill_used+1;
					t.fill_used=R;
					local f=t.fills[R];
					if f then 
					else 
						f=T(E,c);
						if not(f)then 
							return false;
						end;
						t.fills[R]=f;
					end;
					R=f.active~=0 and f.active or 1;
					local l,g=R==1 and 2 or 1,f.banks and f.banks[R];
					t=f.banks and f.banks[l];
					if g then 
						if g.image then 
							if g.label then 
								if t then 
									if t.image then 
										if not(t.label)then 
											return false;
										end;
									else 
										return false;
									end;
								else 
									return false;
								end;
							else 
								return false;
							end;
						else 
							return false;
						end;
					else 
						return false;
					end;
					t.label.Visible=false;
					R=r.resolution;
					P.image=t.image;
					P.color=z;
					P.masks=q;
					P.inset=Q;
					P.left=A;
					P.top=F;
					P.right=p;
					P.bottom=u;
					P.width=M;
					P.height=e;
					P.resolution=R;
					P.scale=R-1;
					P.used=D;
					if not(pcall(Y))then 
						L(t);
						return false;
					end;
					R=t.label;
					R.Position=UDim2.fromOffset(A,F);
					R.Size=UDim2.fromOffset(M,e);
					R.ImageColor3=C;
					R.ImageTransparency=0.72;
					R.Visible=true;
					if g~=t then 
						L(g);
					end;
					f.active=l;
					f.pending=nil;
					f.misses=0;
					return true;
				end;
				h.finish=function(R)
					local F=G[R];
					if F then 
						if not(F.open)then 
							return;
						end;
					else 
						return;
					end;
					F.open=false;
					if F.failed then 
						i(F);
						F.failed=false;
						return;
					end;
					local t,f,l=F.fills,F.strokes,F.points;
					if R=="prediction"and F.expect and F.fill_used==0 then 
						local g=t[1];
						if g then 
							if g.active~=0 then 
								g.misses=(g.misses or 0)+1;
								if g.misses>=3 then 
									g.pending=0;
								else 
									g.pending=nil;
								end;
							end;
						end;
						for g=2,#t,1 do 
							t[g].pending=0;
						end;
					else 
						for g=F.fill_used+1,#t,1 do 
							t[g].pending=0;
						end;
					end;
					t=s(R,1,10)=="prediction";
					for g=1,F.stroke_used,1 do 
						local u=f[g];
						if u then 
							u.missed=0;
						end;
					end;
					for g=F.stroke_used+1,#f,1 do 
						local u=f[g];
						if t then 
							if u.active~=0 then 
								u.missed=(u.missed or 0)+1;
								if u.missed>=2 then 
									u.pending=0;
								else 
									u.pending=nil;
								end;
							else 
								u.pending=0;
							end;
						else 
							u.pending=0;
						end;
					end;
					for t=F.point_used+1,#l,1 do 
						l[t].pending=0;
					end;
					F.ready=true;
					if R~="prediction"then 
						k(F);
					end;
				end;
				h.clear=function(R)
					local F=G[R];
					if not(F)then 
						return;
					end;
					F.open=false;
					F.ready=false;
					F.failed=false;
					F.expect=false;
					F.fill_used=0;
					F.stroke_used=0;
					F.point_used=0;
					local t,f,l=F.fills,F.strokes,F.points;
					for F=1,#t,1 do 
						R=t[F];
						R.pending=nil;
						R.active=0;
						X(R);
					end;
					for R=1,#f,1 do 
						t=f[R];
						t.pending=nil;
						t.active=0;
						S(t);
					end;
					for R=1,#l,1 do 
						t=l[R];
						t.pending=nil;
						t.active=0;
						J(t);
					end;
				end;
				local R,F=r.available and Instance.new("BindableFunction")or nil,{};
				local function t()
					local f=F.fn;
					if not(f)then 
						return false;
					end;
					return f(F[1],F[2],F[3],F[4],F[5],F[6],F[7],F[8],F[9]);
				end;
				local function f()
					F.fn=nil;
					F[1]=nil;
					F[2]=nil;
					F[3]=nil;
					F[4]=nil;
					F[5]=nil;
					F[6]=nil;
					F[7]=nil;
					F[8]=nil;
					F[9]=nil;
				end;
				local function l(g)
					g.OnInvoke=nil;
					pcall(g.Destroy,g);
				end;
				h.destroy=function()
					if not(r.alive)then 
						return;
					end;
					r.alive=false;
					r.available=false;
					for g=1,#a,1 do 
						local u=G[a[g]];
						if u then 
							local s,C,z=u.fills,u.strokes,u.points;
							for u=1,#s,1 do 
								c(s[u]);
							end;
							for u=1,#C,1 do 
								n(C[u]);
							end;
							for u=1,#z,1 do 
								O(z[u]);
							end;
							table.clear(s);
							table.clear(C);
							table.clear(z);
						end;
						a[g]=nil;
					end;
					table.clear(G);
					table.clear(Z);
					table.clear(o);
					table.clear(v);
					f();
					if r.gui then 
						pcall(r.gui.Destroy,r.gui);
						r.gui=nil;
					end;
					local g=R;
					R=nil;
					if g then 
						task.defer(l,g);
					end;
				end;
				if not R then 
					local function l()
						return false;
					end;
					r.begin=l;
					r.expectFill=l;
					r.stroke=l;
					r.point=l;
					r.trail=l;
					r.pulse=l;
					r.circle=l;
					r.draw=l;
					r.finish=l;
					r.clear=l;
					r.destroy=h.destroy;
					N.teardown(h.destroy);
					_.world.zonefill=r;
					return r;
				end;
				R.OnInvoke=t;
				local t=R.Invoke;
				local function l(g,u,s,C,z,q,G,a,m,c)
					F.fn=g;
					F[1]=u;
					F[2]=s;
					F[3]=C;
					F[4]=z;
					F[5]=q;
					F[6]=G;
					F[7]=a;
					F[8]=m;
					F[9]=c;
					C,u=pcall(t,R);
					f();
					if not C then 
						r.last_error=tostring(u);
						return false;
					end;
					r.last_error=nil;
					return u;
				end;
				local function F(t)
					return function(f,g,u,s,C,z,q,G,a)
						if not(r.alive)then 
							return false;
						end;
						return l(t,f,g,u,s,C,z,q,G,a);
					end;
				end;
				r.begin=F(h.begin);
				r.expectFill=F(h.expectFill);
				r.stroke=F(h.stroke);
				r.point=F(h.point);
				r.trail=F(h.trail);
				r.pulse=F(h.pulse);
				r.circle=F(h.circle);
				r.draw=F(h.draw);
				r.finish=F(h.finish);
				r.clear=F(h.clear);
				r.destroy=function()
					if not(r.alive)then 
						return;
					end;
					if R then 
						l(h.destroy);
					else 
						h.destroy();
					end;
				end;
				N.own(x);
				N.teardown(r.destroy);
				_.world.zonefill=r;
				return r;
			end;
			K.R=function()
				local R=K.load("b");
				local _,N=K.load("q"),K.load("a");
				local h,F,t=K.load("j"),K.load("f"),_.world;
				local f=R.workspace;
				local l=R.guiservice;
				local g=R.input;
				local u=R.lp;
				local s=_.white;
				local _=math.clamp;
				local C=math.min;
				local z=math.max;
				local q=math.abs;
				local r=math.floor;
				local x=math.ceil;
				local G,a=math.sqrt,3.141592653589793;
				local m=math.cos;
				local c=math.sin;
				local n,O=F.trim,{step=function()
				end};
				local F=h.nade_sim;
				local j=h.inventory;
				local E=h.char_velocity;
				local P=h.remotes;
				if type(F)~="table"then 
					return O;
				elseif type(F.calculateThrowParameters)~="function"then 
					return O;
				elseif type(F.createInitialState)~="function"then 
					return O;
				elseif type(F.createConfig)~="function"then 
					return O;
				elseif type(F.step)~="function"then 
					return O;
				end;
				local h,T,Y,v={["HE Grenade"]=true,Flashbang=true,["Smoke Grenade"]=true,["Decoy Grenade"]=true,["Incendiary Grenade"]=true,Molotov=true},{["HE Grenade"]={radius=0.497488707304,fuse=1.6,restitution=0.4,maxBounces=20},Flashbang={radius=0.61398953199387,fuse=1.5,restitution=0.4,maxBounces=20},["Smoke Grenade"]={radius=0.56614202260971,fuse=0,restitution=0.4,maxBounces=20},["Decoy Grenade"]={radius=0.61398953199387,fuse=1.5,restitution=0.4,maxBounces=20},["Incendiary Grenade"]={radius=0.56614208221436,fuse=2.4,restitution=0.4,maxBounces=20},Molotov={radius=0.92103540897369,fuse=2.4,restitution=0.4,maxBounces=20}},{["Smoke Grenade"]="smoke",["Incendiary Grenade"]="fire",Molotov="fire"},{smoke=14.7,fire=17.6};
				local Z=RaycastParams.new();
				Z.FilterType=Enum.RaycastFilterType.Exclude;
				Z.RespectCanCollide=false;
				Z.IgnoreWater=true;
				local function L(o,X)
					o.CollisionGroup=X;
				end;
				local o=Vector3.new(0,-20,0);
				local X=Vector3.new(0,7,0);
				local Q=Vector3.new(0,1.25,0);
				local S=Vector3.new(0,0.08,0);
				local A=Vector3.new(0,1,0);
				local J=Vector3.new(0,0,1);
				local y;
				local e,M,I,i=0,false,0;
				local k,B,d,b=0,0,0,{points={},bounces={},ring={},center=nil,key=nil,started=nil};
				local function p()
					local D=t.zonefill;
					if type(D)=="table"then 
						D.clear("prediction");
						D.clear("prediction_path");
						D.clear("prediction_fx");
					end;
				end;
				local function D(V,W)
					local H=V:WorldToViewportPoint(W);
					if H.Z<=0.05 then 
						return nil;
					end;
					return Vector2.new(H.X,H.Y);
				end;
				local function V(W,H,w,UQ)
					local KQ,RQ=-H:PointToObjectSpace(w).Z,-H:PointToObjectSpace(UQ).Z;
					if KQ<=0.05 then 
						if RQ<=0.05 then 
							return nil;
						end;
					end;
					if KQ<=0.05 then 
						w=(w:Lerp(UQ,_((0.05-KQ)/(RQ-KQ),0,1)));
					else 
						UQ=if RQ<=0.05 then UQ:Lerp(w,_((0.05-RQ)/(KQ-RQ),0,1))else UQ;
					end;
					KQ,H=W:WorldToViewportPoint(w),W:WorldToViewportPoint(UQ);
					if KQ.Z<=0 then 
						return nil;
					elseif H.Z<=0 then 
						return nil;
					end;
					return Vector2.new(KQ.X,KQ.Y),Vector2.new(H.X,H.Y);
				end;
				local function W(H,w)
					if typeof(H)~="Vector3"then 
						return nil;
					elseif typeof(w)~="Vector3"then 
						return nil;
					elseif w.Magnitude<0.001 then 
						return nil;
					end;
					local UQ=w.Unit;
					return CFrame.lookAt(H,H+UQ,q(UQ.Y)>0.98 and J or A);
				end;
				local function A(J,H,w,UQ)
					local KQ=#H;
					for RQ=1,KQ,1 do 
						J[RQ]=UQ:PointToWorldSpace(w:PointToObjectSpace(H[RQ]));
					end;
					n(J,KQ);
				end;
				local function J(H,w,UQ)
					local KQ=#w;
					for RQ=1,KQ,1 do 
						H[RQ]=w[RQ]+UQ;
					end;
					n(H,KQ);
				end;
				local H,w={},0;
				local function UQ(KQ)
					if w==0 then 
						w+=1;
						H[w]=KQ;
					elseif(KQ-H[w]).Magnitude>0.1 then 
						w+=1;
						H[w]=KQ;
					end;
				end;
				local function KQ(RQ,_Q,NQ,hQ,FQ,tQ,fQ,lQ)
					local gQ,uQ=t.zonefill,#tQ;
					if type(gQ)~="table"then 
						return;
					elseif uQ<2 then 
						return;
					end;
					w=0;
					local sQ=uQ-1;
					for uQ=1,sQ,1 do 
						local sQ,CQ=V(_Q,NQ,tQ[uQ],tQ[uQ+1]);
						if sQ and CQ then 
							if w>0 then 
								if(H[w]-sQ).Magnitude>1.5 then 
									if w>=2 then 
										n(H,w);
										gQ.stroke(RQ,H,false,fQ,lQ,hQ,FQ,"base",0.98);
									end;
									w=0;
								end;
							end;
							UQ(sQ);
							UQ(CQ);
						elseif w>=2 then 
							n(H,w);
							gQ.stroke(RQ,H,false,fQ,lQ,hQ,FQ,"base",0.98);
							w=0;
						else 
							w=0;
						end;
					end;
					if w>=2 then 
						n(H,w);
						gQ.stroke(RQ,H,false,fQ,lQ,hQ,FQ,"base",0.98);
					end;
					w=0;
				end;
				local RQ={};
				local function _Q(NQ,hQ,FQ,tQ,fQ,lQ,gQ,uQ,sQ,CQ)
					local zQ,qQ=t.zonefill,#lQ;
					if type(zQ)~="table"then 
						return;
					elseif qQ<2 then 
						return;
					end;
					local rQ,xQ=_(tonumber(sQ)or 0,0,1),_(tonumber(CQ)or 0,0,1);
					if rQ<=0 then 
						return;
					elseif xQ<=0 then 
						return;
					end;
					RQ[1]=0;
					for GQ=1,qQ-1,1 do 
						RQ[GQ+1]=RQ[GQ]+(lQ[GQ+1]-lQ[GQ]).Magnitude;
					end;
					sQ=RQ[qQ];
					if sQ<=0.01 then 
						return;
					end;
					CQ=sQ*rQ;
					rQ=z(0,CQ-sQ*0.135);
					w=0;
					sQ=qQ-1;
					for GQ=1,sQ,1 do 
						local sQ,aQ=RQ[GQ],RQ[GQ+1];
						qQ=aQ-sQ;
						if qQ>0 then 
							if aQ>=rQ then 
								if sQ<=CQ then 
									local aQ,mQ=_((rQ-sQ)/qQ,0,1),_((CQ-sQ)/qQ,0,1);
									if mQ>=aQ then 
										local sQ,CQ=V(hQ,FQ,lQ[GQ]:Lerp(lQ[GQ+1],aQ),lQ[GQ]:Lerp(lQ[GQ+1],mQ));
										if sQ and CQ then 
											if w>0 then 
												if(H[w]-sQ).Magnitude>1.5 then 
													if w>=2 then 
														n(H,w);
														zQ.trail(NQ,H,gQ,uQ,tQ,fQ,xQ);
													end;
													w=0;
												end;
											end;
											UQ(sQ);
											UQ(CQ);
										elseif w>=2 then 
											n(H,w);
											zQ.trail(NQ,H,gQ,uQ,tQ,fQ,xQ);
											w=0;
										else 
											w=0;
										end;
									end;
								end;
							end;
						end;
					end;
					if w>=2 then 
						n(H,w);
						zQ.trail(NQ,H,gQ,uQ,tQ,fQ,xQ);
					end;
					w=0;
				end;
				local function V(w,UQ,NQ,hQ,FQ,tQ)
					local fQ=t.zonefill;
					if type(fQ)~="table"then 
						return;
					end;
					for lQ=1,#FQ,1 do 
						local gQ=D(UQ,FQ[lQ]);
						if gQ then 
							fQ.point(w,gQ,tQ,1.7,NQ,hQ,0.82);
						end;
					end;
				end;
				local function w(UQ,NQ,hQ,FQ,tQ,fQ)
					local lQ,gQ=D(NQ,tQ),t.zonefill;
					if lQ then 
						if type(gQ)=="table"then 
							gQ.point(UQ,lQ,fQ,3.4,hQ,FQ,0.98);
						end;
					end;
					return lQ;
				end;
				local function D(UQ,NQ)
					if typeof(UQ)~="CFrame"then 
						return-math.huge;
					elseif typeof(NQ)~="Vector3"then 
						return-math.huge;
					end;
					return-UQ:PointToObjectSpace(NQ).Z;
				end;
				local function UQ(NQ,hQ,FQ,tQ)
					if typeof(FQ)~="Vector3"then 
						return nil;
					end;
					local fQ=D(hQ,FQ);
					if fQ>0.15 then 
						local lQ=NQ:WorldToViewportPoint(FQ);
						if lQ.Z>0 then 
							return Vector2.new(lQ.X,lQ.Y);
						end;
						return nil;
					end;
					if typeof(tQ)~="Vector3"then 
						return nil;
					end;
					local lQ=D(hQ,tQ);
					if lQ<=0.15 then 
						return nil;
					end;
					hQ=NQ:WorldToViewportPoint(FQ:Lerp(tQ,_((0.15-fQ)/(lQ-fQ),0,1)));
					if hQ.Z>0 then 
						return Vector2.new(hQ.X,hQ.Y);
					end;
					return nil;
				end;
				local function NQ(hQ,FQ,tQ)
					if D(hQ,FQ)>0.15 then 
						return FQ;
					end;
					local fQ,lQ;
					for gQ=1,#tQ,1 do 
						FQ=tQ[gQ];
						if typeof(FQ)=="Vector3"then 
							gQ=D(hQ,FQ);
							if gQ>0.15 then 
								if fQ then 
									if gQ>fQ then 
										fQ,lQ=gQ,FQ;
									else 
									end;
								else 
									fQ,lQ=gQ,FQ;
								end;
							else 
							end;
						else 
						end;
					end;
					return lQ;
				end;
				local D={};
				local function hQ(FQ,tQ,fQ,lQ,gQ,uQ,sQ,CQ)
					local zQ,qQ=t.zonefill,#sQ;
					if type(zQ)~="table"then 
						return;
					elseif qQ<3 then 
						return;
					end;
					zQ.expectFill(FQ);
					local rQ=NQ(fQ,uQ,sQ);
					if not(rQ)then 
						return;
					end;
					local NQ,xQ=UQ(tQ,fQ,uQ,rQ),0;
					for GQ=1,qQ,1 do 
						uQ=UQ(tQ,fQ,sQ[GQ],rQ);
						if uQ then 
						else 
							local UQ=tQ:WorldToViewportPoint(sQ[GQ]:Lerp(rQ,0.5));
							uQ=if UQ.Z>0 then Vector2.new(UQ.X,UQ.Y)else uQ;
						end;
						if uQ then 
							xQ+=1;
							D[xQ]=uQ;
						else 
						end;
					end;
					if xQ<3 then 
						return;
					end;
					n(D,xQ);
					zQ.stroke(FQ,D,true,CQ,1.5,lQ,gQ,"base",0.94);
					if NQ then 
						zQ.draw(FQ,NQ,D,CQ,lQ,gQ,tQ.ViewportSize);
					end;
					return NQ,D;
				end;
				local function UQ(NQ,FQ,tQ,fQ,lQ,gQ)
					local uQ=y;
					if if uQ then not NQ else not uQ then 
						p();
						return;
					elseif uQ.weapon~=FQ then 
						p();
						return;
					elseif uQ.mode~=tQ then 
						p();
						return;
					elseif q(uQ.rangeScale-fQ)>0.001 then 
						p();
						return;
					end;
					local sQ,CQ=uQ.throwFrame,W(lQ,gQ);
					if sQ then 
						if not(CQ)then 
							p();
							return;
						end;
					else 
						p();
						return;
					end;
					A(b.points,uQ.points,sQ,CQ);
					A(b.bounces,uQ.bounces,sQ,CQ);
					lQ=CQ:PointToWorldSpace(sQ:PointToObjectSpace(uQ.endpoint));
					if uQ.ring and typeof(uQ.ringCenter)=="Vector3"then 
						gQ=lQ-uQ.endpoint;
						J(b.ring,uQ.ring,gQ);
						b.center=uQ.ringCenter+gQ;
					else 
						n(b.ring,0);
						b.center=nil;
					end;
					sQ=R.drawmask();
					local R,A,J,zQ=sQ and l:GetGuiInset()or Vector2.zero,NQ.CFrame,_(tonumber(t.nade_path_width)or 2,1,4),t.nade_path_col or s;
					local l,s,qQ=t.nade_radius_col or zQ,FQ.."|"..tostring(tQ).."|"..tostring(fQ),os.clock();
					if b.key~=s then 
						b.key=s;
						b.started=qQ;
					elseif type(b.started)~="number"then 
						b.key=s;
						b.started=qQ;
					end;
					tQ,gQ,s,fQ,CQ=(qQ-b.started)%2.15;
					if tQ<1.35 then 
						qQ=_(tQ/1.35,0,1);
						gQ,s=qQ*qQ*(3-2*qQ),C(_(qQ/0.06,0,1),_((1-qQ)/0.035,0,1))*0.98;
					else 
						if tQ<1.97 then 
							FQ=_((tQ-1.35)/0.62,0,1);
							fQ,CQ=FQ*FQ*(3-2*FQ),c(a*FQ)^0.78*0.98;
						else 
						end;
					end;
					qQ=t.zonefill;
					FQ=type(qQ)=="table";
					if FQ then 
						qQ.begin("prediction_path");
					end;
					KQ("prediction_path",NQ,A,sQ,R,b.points,zQ,J);
					V("prediction_path",NQ,sQ,R,b.bounces,zQ);
					tQ=w("prediction_path",NQ,sQ,R,lQ,zQ);
					if FQ then 
						qQ.finish("prediction_path");
					end;
					if FQ then 
						qQ.begin("prediction");
					end;
					local C,V;
					if uQ.ring then 
						if b.center then 
							C,V=hQ("prediction",NQ,A,sQ,R,b.center,b.ring,l);
						else 
						end;
					else 
					end;
					if FQ then 
						qQ.finish("prediction");
					end;
					if FQ then 
						qQ.begin("prediction_fx");
					end;
					_Q("prediction_fx",NQ,A,sQ,R,b.points,zQ,J,gQ,s);
					if C and V and fQ then 
						qQ.pulse("prediction_fx",C,V,fQ,l,1.7,sQ,R,CQ);
					elseif b.center then 
					elseif tQ then 
						if fQ then 
							qQ.circle("prediction_fx",tQ,26*fQ,zQ,1.7,sQ,R,CQ);
						end;
					end;
					if FQ then 
						qQ.finish("prediction_fx");
					end;
				end;
				local function R(l,s)
					local C=l[#l];
					if C then 
						if(s-C).Magnitude>0.01 then 
							l[#l+1]=s;
						end;
					else 
						l[#l+1]=s;
					end;
				end;
				local function l(s,C,A)
					local J=f:Raycast(s+X,o,Z);
					s=if J then J.Position+J.Normal*0.06 else s;
					local V,w=table.create(32),s+Q;
					for Q=1,32,1 do 
						J=a*2*(Q-1)/32;
						local a=Vector3.new(m(J),0,c(J));
						local m=f:Raycast(w,a*C,Z);
						local c=s+a*(if m then if q(m.Normal.Y)<0.65 then _(m.Distance-0.12,0.35,C)else C else C);
						a=f:Raycast(c+X,o,Z);
						V[Q]=if a then a.Position+a.Normal*0.06 else c+S;
						if A then 
							if Q%4==0 then 
								if A()then 
									coroutine.yield();
								end;
							end;
						end;
					end;
					return s,V;
				end;
				local function s()
					if type(j)~="table"then 
						return nil;
					elseif type(j.peekCurrentEquippedForMovement)~="function"then 
						return nil;
					end;
					local C,a=pcall(j.peekCurrentEquippedForMovement);
					if C then 
						if a then 
							if a.IsDestroyed then 
								return nil;
							elseif a.IsEquipped==false then 
								return nil;
							end;
						else 
							return nil;
						end;
					else 
						return nil;
					end;
					C=a.Properties;
					if C then 
						if C.Class~="Grenade"then 
							return nil;
						elseif not(h[a.Name])then 
							return nil;
						end;
					else 
						return nil;
					end;
					return a;
				end;
				local function C(a)
					if E then 
						local m,c=pcall(E,a);
						if m then 
							if typeof(c)=="Vector3"then 
								return c;
							end;
						end;
					end;
					local m=a and(a:FindFirstChild("HumanoidRootPart"));
					if m then 
						if m:IsA("BasePart")then 
							return m.AssemblyLinearVelocity;
						end;
					end;
					return Vector3.zero;
				end;
				local function a()
					local m,c,j=s(),f.CurrentCamera,u.Character;
					if m then 
						if c then 
							if j then 
								if j:IsDescendantOf(f)then 
									if j:GetAttribute("Dead")==true then 
										return nil;
									end;
								else 
									return nil;
								end;
							else 
								return nil;
							end;
						else 
							return nil;
						end;
					else 
						return nil;
					end;
					local s=j.PrimaryPart or j:FindFirstChild("HumanoidRootPart");
					if s then 
						if not(s:IsA("BasePart"))then 
							return nil;
						end;
					else 
						return nil;
					end;
					local E,o=g:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)and"Near"or"Far",m.Properties;
					local g=z(0.01,(tonumber(o and o.Range)or 60)/40);
					g=if u:GetAttribute("IsCrouching")==true then g*0.8 else g;
					local X,Q=s.Position,c.CFrame.LookVector;
					s,o=F.calculateThrowParameters(X,Q,E,g);
					if typeof(s)~="Vector3"then 
						return nil;
					elseif typeof(o)~="Vector3"then 
						return nil;
					end;
					return m,c,j,E,g,s,o,Q,X;
				end;
				local g={};
				local function s(m,c,j)
					local E,o,o,X,Q,S,A,J,V=a();
					if not(E)then 
						return nil;
					end;
					local w=T[E.Name];
					if not(w)then 
						return nil;
					end;
					local KQ,_Q=C(o),f:GetServerTimeNow();
					local NQ,hQ,FQ=F.createInitialState(S,A,X,KQ,Q,_Q),E.Name=="Molotov"or E.Name=="Incendiary Grenade",w.fuse and w.fuse>0 and w.fuse or nil;
					_Q=F.createConfig(w.radius,Q,X=="Near",FQ,hQ and 0.1 or nil,hQ or nil);
					_Q.restitution=w.restitution or _Q.restitution;
					_Q.maxBounces=w.maxBounces or _Q.maxBounces;
					FQ,w=f:FindFirstChild("Debris"),0;
					if FQ then 
						w=1;
						g[w]=FQ;
					else 
					end;
					w+=1;
					g[w]=o;
					n(g,w);
					Z.FilterDescendantsInstances=g;
					hQ=u:GetAttribute("Team");
					o,w=pcall,hQ=="Terrorists"and"TGrenade"or hQ=="Counter-Terrorists"and"CTGrenade";
					o(L,Z,w or"Default");
					w=F.Constants or{};
					FQ=tonumber(c)or tonumber(w.FIXED_TIMESTEP)or 0.0078125;
					local f,u,L,tQ,fQ=x((tonumber(w.MAX_SIMULATION_TIME)or 10)/FQ)+2,z(1,r(0.0625/FQ+0.5)),{NQ.position},{},NQ.position;
					w,o=0;
					hQ=0;
					for r=1,f,1 do 
						local f,r=F.step(NQ,_Q,Z,FQ);
						fQ=f.position;
						w+=1;
						if r then 
							if r.type=="bounce"then 
								tQ[#tQ+1]=r.position;
								R(L,r.position);
							else 
								o=r;
							end;
						else 
						end;
						if w>=u or r or f.isAtRest then 
							R(L,f.position);
							w=0;
						else 
						end;
						if o then 
							NQ=f;
							break;
						elseif f.isAtRest then 
							NQ=f;
							break;
						end;
						hQ+=1;
						if hQ>=8 then 
							if m then 
								if m()then 
									coroutine.yield();
								end;
							end;
							hQ=0;
						else 
						end;
						NQ=f;
					end;
					R(L,fQ);
					hQ,u,w=Y[E.Name];
					if hQ then 
						if j~=false then 
							u,w=l(fQ,v[hQ],m);
						else 
						end;
					else 
					end;
					return{points=L,bounces=tQ,endpoint=fQ,ringCenter=u,ring=w,weapon=E.Name,mode=X,rangeScale=Q,rootPosition=V,aimLook=J,velocity=KQ,throwFrame=W(S,A),exact=c==nil,computedAt=os.clock(),reason=o and o.type or"rest"};
				end;
				local function R(F)
					if type(F)~="table"then 
						return;
					elseif h[F.Weapon]then 
						if type(F.Physics)~="table"then 
							return;
						end;
					else 
						return;
					end;
					local h,f=F.Physics,T[F.Weapon]or{};
					local l,u,r,x=tonumber(h.Radius),tonumber(h.FuseTime),tonumber(h.Restitution),tonumber(h.MaxBounces);
					if l then 
						if l>0 then 
							f.radius=l;
						end;
					end;
					if u then 
						if u>=0 then 
							f.fuse=u;
						end;
					end;
					if r then 
						f.restitution=r;
					end;
					if x then 
						f.maxBounces=x;
					end;
					T[F.Weapon]=f;
				end;
				local function h(F)
					if type(F)~="table"then 
						return;
					elseif type(F.Voxels)~="table"then 
						return;
					end;
					local f=F.Voxels;
					F=#f;
					if F==0 then 
						return;
					end;
					local l,u=0,0;
					for r=1,F,1 do 
						local x=f[r].Position;
						l,u=l+x.X,u+x.Z;
					end;
					local r,x,m=l/F,u/F,0;
					for l=1,F,1 do 
						local F=f[l];
						local f,l=F.Position.X-r,F.Position.Z-x;
						m=z(m,G(f*f+l*l)+(tonumber(F.Size)or 0)*0.5);
					end;
					if m>0 then 
						v.smoke=z(v.smoke,_(m,8,24));
					end;
				end;
				local function F(f)
					if type(f)~="table"then 
						return;
					elseif typeof(f.Position)~="Vector3"then 
						return;
					elseif type(f.Voxels)~="table"then 
						return;
					end;
					local l=f.Voxels;
					local u=#l;
					if u<2 then 
						return;
					else 
						local r=tonumber(f.Duration);
						if r then 
							if r<2 then 
								return;
							end;
						else 
							return;
						end;
					end;
					local r,x=f.Position,0;
					for m=1,u,1 do 
						f=l[m];
						local l,u,c=f.Position,(tonumber(f.SizeX)or 0)*0.5,(tonumber(f.SizeZ)or 0)*0.5;
						local f,j=l.X-r.X,l.Z-r.Z;
						for r=-1,1,2 do 
							for E=-1,1,2 do 
								l,m=f+u*r,j+c*E;
								x=z(x,G(l*l+m*m));
							end;
						end;
					end;
					if x>0 then 
						v.fire=z(v.fire,_(x,8,24));
					end;
				end;
				local function _(f,l)
					if type(f)~="table"then 
						return;
					elseif type(f.Listen)~="function"then 
						return;
					end;
					local u,z=pcall(f.Listen,l);
					if u then 
						if type(z)=="function"then 
							N.adopt(z);
						end;
					end;
				end;
				local function f()
					if type(P)~="table"then 
						return;
					elseif not(N.alive())then 
						return;
					end;
					_(P.Projectile and P.Projectile.Spawn,R);
					_(P.VFX and P.VFX.CreateVoxelSmoke,h);
					_(P.VFX and P.VFX.CreateVoxelFire,F);
				end;
				N.spawn(f);
				local function R()
					local _,h=os.clock(),k;
					return _>=h;
				end;
				local function _(h,F,f,l)
					if M then 
						return;
					end;
					M,e=true,h;
					i={generation=I,weapon=F,mode=f,rangeScale=l,thread=coroutine.create(s)};
				end;
				local function h(F,f)
					if type(F)~="table"or F.weapon~=f.weapon or F.mode~=f.mode then 
						return false;
					elseif type(F.rangeScale)~="number"then 
						return false;
					elseif type(f.rangeScale)~="number"then 
						return false;
					elseif q(F.rangeScale-f.rangeScale)>0.001 then 
						return false;
					elseif type(F.points)~="table"then 
						return false;
					elseif#F.points<1 then 
						return false;
					elseif type(F.bounces)~="table"then 
						return false;
					elseif typeof(F.endpoint)~="Vector3"then 
						return false;
					elseif typeof(F.rootPosition)~="Vector3"then 
						return false;
					elseif typeof(F.aimLook)~="Vector3"then 
						return false;
					elseif typeof(F.velocity)~="Vector3"then 
						return false;
					elseif typeof(F.throwFrame)~="CFrame"then 
						return false;
					elseif type(F.computedAt)~="number"then 
						return false;
					elseif F.computedAt~=F.computedAt then 
						return false;
					elseif F.exact~=true then 
						return false;
					end;
					f=F.points;
					for l=1,#f,1 do 
						if typeof(f[l])~="Vector3"then 
							return false;
						end;
					end;
					f=F.bounces;
					for l=1,#f,1 do 
						if typeof(f[l])~="Vector3"then 
							return false;
						end;
					end;
					if F.ring~=nil then 
						f=F.ring;
						if type(f)~="table"then 
							return false;
						elseif#f<3 then 
							return false;
						elseif typeof(F.ringCenter)~="Vector3"then 
							return false;
						end;
						for l=1,#f,1 do 
							if typeof(f[l])~="Vector3"then 
								return false;
							end;
						end;
					elseif F.ringCenter~=nil then 
						return false;
					end;
					return true;
				end;
				local function F()
					local f=i;
					if not(f)then 
						return;
					end;
					k=os.clock()+(y and 7.5E-4 or 0.0015);
					local l,u=coroutine.resume(f.thread,R);
					if not(l)then 
						if i==f then 
							i,M=nil,false;
						end;
						return;
					end;
					if coroutine.status(f.thread)~="dead"then 
						return;
					elseif i~=f then 
						return;
					end;
					i,M=nil,false;
					if h(u,f)then 
						if f.generation==I then 
							if t.nade_path==true then 
								y=u;
							end;
						end;
					end;
				end;
				local function R()
					if M then 
						I+=1;
					end;
					M,i,y,e,B,d=false,nil,nil,0,0,0;
					n(b.points,0);
					n(b.bounces,0);
					n(b.ring,0);
					b.center=nil;
					b.started=nil;
					b.key=nil;
					p();
				end;
				local function h(f,l,u,z)
					return f~=nil and f.weapon==l and f.mode==u and q(f.rangeScale-z)<=0.001;
				end;
				O.step=function()
					if t.nade_path~=true then 
						if y then 
							R();
						elseif M then 
							R();
						else 
							p();
						end;
						return;
					end;
					local t,f,l,u,z,q,r,x,G=a();
					if not(t)then 
						if y then 
							R();
						elseif M then 
							R();
						else 
							p();
						end;
						return;
					end;
					local R,a,m=os.clock(),C(l),t.Name;
					l=h(y,m,u,z);
					t=not l;
					t=if l then(G-y.rootPosition).Magnitude>=0.02 or x:Dot(y.aimLook)<=0.9999995 or(a-y.velocity).Magnitude>=0.2 else t;
					if t then 
						d=R;
						if i then 
							I+=1;
							M,i,e=false,nil,0;
						end;
						if if l then R-B>=0.011111111111111112 else not l then 
							a,G=pcall(s,nil,0.03125,true);
							B=R;
							if a then 
								if G then 
									y=G;
								end;
							end;
						end;
					end;
					if not(M)then 
						if h(y,m,u,z)then 
							a=R-d;
							l=y.exact~=true and a>=0.04 or y.exact==true and a>=0.04 and R-y.computedAt>=0.3;
							if l then 
								if R-e>=0.04 then 
									_(R,m,u,z);
								end;
							end;
						end;
					end;
					F();
					if h(y,m,u,z)then 
						UQ(f,m,u,z,q,r);
					else 
						p();
					end;
				end;
				N.teardown(function()
					I+=1;
					M,i,y=false,nil,nil;
					n(b.points,0);
					n(b.bounces,0);
					n(b.ring,0);
					b.center=nil;
					b.started=nil;
					b.key=nil;
					p();
					table.clear(H);
					table.clear(RQ);
					table.clear(D);
					table.clear(g);
				end);
				return O;
			end;
			K.S=function()
				local R=K.load("b");
				local _,N=K.load("q"),K.load("a");
				local h,F=K.load("j"),K.load("u");
				local t=_.world;
				local f=R.workspace;
				local l=R.guiservice;
				local g=R.http;
				local u=R.collection;
				local s=R.lp;
				local C=_.white;
				local z=_.black;
				local _=math.clamp;
				local q=math.min;
				local r=math.max;
				local x=math.abs;
				local G=math.floor;
				local a,m=math.sqrt,3.141592653589793;
				local c=math.cos;
				local n=math.sin;
				local O=math.exp;
				local j=string.sub;
				local E,P,T=string.format,{step=function()
				end},{["HE Grenade"]="rbxassetid://111110976385167",Flashbang="rbxassetid://132038996524430",["Smoke Grenade"]="rbxassetid://137305344844339",["Decoy Grenade"]="rbxassetid://81385239843859",["Incendiary Grenade"]="rbxassetid://81255981095065",Molotov="rbxassetid://95390644612614",Bomb="rbxassetid://80566367391881"};
				local Y=h.nade_sim;
				local v=h.remotes;
				if type(Y)~="table"then 
					return P;
				elseif type(v)~="table"then 
					return P;
				end;
				local h=f:FindFirstChild("Debris");
				local Z=R.screen(2147480000);
				if not Z then 
					return P;
				end;
				N.own(Z);
				local L=RaycastParams.new();
				L.FilterType=Enum.RaycastFilterType.Exclude;
				L.RespectCanCollide=false;
				L.IgnoreWater=true;
				local function o(X,Q)
					X.CollisionGroup=Q;
				end;
				pcall(o,L,"Default");
				local X,Q,S,A,J={},{},{},{},{};
				local y=Vector3.new(0,-20,0);
				local e=Vector3.new(0,7,0);
				local M=Vector3.new(0,1.25,0);
				local I=Vector3.new(0,0.08,0);
				local i=Vector3.new(0,1.35,0);
				local function k(B)
					if type(Drawing)~="table"then 
						return nil;
					elseif type(Drawing.new)~="function"then 
						return nil;
					end;
					local d,b=pcall(Drawing.new,B);
					if d then 
						if not(b)then 
							return nil;
						end;
					else 
						return nil;
					end;
					b.Visible=false;
					b.Transparency=1;
					if B=="Line"then 
						b.Thickness=1;
					end;
					return b;
				end;
				local function B(d)
					if d then 
						pcall(d.Remove,d);
					end;
				end;
				local function d(b,p,D,V)
					if type(D)~="table"then 
						return false;
					end;
					local W,H,w,UQ=q(b.X,p.X),q(b.Y,p.Y),r(b.X,p.X),r(b.Y,p.Y);
					for KQ=1,#D,1 do 
						p=D[KQ];
						if typeof(p)=="Instance"then 
							if p.Parent then 
								if p.Visible then 
									KQ,b=p.AbsolutePosition+V,p.AbsoluteSize;
									if b.X>0 then 
										if b.Y>0 then 
											if W<KQ.X+b.X then 
												if w>KQ.X then 
													if H<KQ.Y+b.Y then 
														if UQ>KQ.Y then 
															return true;
														end;
													end;
												end;
											end;
										end;
									end;
								end;
							end;
						end;
					end;
					return false;
				end;
				local b={Camera=nil};
				b.CFrame=CFrame.new();
				b.ViewportSize=Vector2.zero;
				b.FieldOfView=70;
				b.Override=false;
				local function p()
					local D=t.view;
					if type(D)=="table"then 
						if type(D.Resolve)=="function"then 
							local V,W=pcall(D.Resolve);
							if V then 
								if type(W)=="table"then 
									if typeof(W.CFrame)=="CFrame"then 
										if typeof(W.ViewportSize)=="Vector2"then 
											return W;
										end;
									end;
								end;
							end;
						end;
					end;
					D=f.CurrentCamera;
					if not D then 
						return nil;
					end;
					b.Camera=D;
					b.CFrame=D.CFrame;
					b.ViewportSize=D.ViewportSize;
					b.FieldOfView=D.FieldOfView;
					return b;
				end;
				local function b(D,V)
					local W=t.view;
					if type(W)=="table"then 
						if type(W.Project)=="function"then 
							local H,w,UQ,KQ=pcall(W.Project,V,D);
							if H then 
								return w,UQ,KQ;
							end;
						end;
					end;
					W=D and D.Camera;
					if not W then 
						return nil,false,-math.huge;
					end;
					local D,H=W:WorldToViewportPoint(V);
					return Vector2.new(D.X,D.Y),H,D.Z;
				end;
				local function D(V,W)
					local H,w,w=b(V,W);
					if typeof(H)~="Vector2"then 
						return nil;
					elseif type(w)~="number"then 
						return nil;
					elseif w<=0.05 then 
						return nil;
					end;
					return H;
				end;
				local function V(W,H)
					if type(W)~="table"then 
						return-math.huge;
					elseif typeof(W.CFrame)~="CFrame"then 
						return-math.huge;
					elseif typeof(H)~="Vector3"then 
						return-math.huge;
					end;
					return-W.CFrame:PointToObjectSpace(H).Z;
				end;
				local function W(H,w,UQ)
					if typeof(w)~="Vector3"then 
						return nil;
					end;
					local KQ=V(H,w);
					if KQ>0.15 then 
						local RQ,_Q,_Q=b(H,w);
						if typeof(RQ)=="Vector2"then 
							if type(_Q)=="number"then 
								if _Q>0 then 
									return RQ;
								end;
							end;
						end;
						return nil;
					end;
					if typeof(UQ)~="Vector3"then 
						return nil;
					end;
					local RQ=V(H,UQ);
					if RQ<=0.15 then 
						return nil;
					end;
					local _Q,NQ,NQ=b(H,w:Lerp(UQ,_((0.15-KQ)/(RQ-KQ),0,1)));
					if typeof(_Q)=="Vector2"then 
						if type(NQ)=="number"then 
							if NQ>0 then 
								return _Q;
							end;
						end;
					end;
					return nil;
				end;
				local function b(H,w,UQ)
					if V(H,w)>0.15 then 
						return w;
					end;
					local KQ,RQ;
					for _Q=1,#UQ,1 do 
						w=UQ[_Q];
						if typeof(w)=="Vector3"then 
							_Q=V(H,w);
							if _Q>0.15 then 
								if KQ then 
									if _Q>KQ then 
										KQ,RQ=_Q,w;
									else 
									end;
								else 
									KQ,RQ=_Q,w;
								end;
							else 
							end;
						else 
						end;
					end;
					return RQ;
				end;
				local V=Instance.new("ImageLabel");
				V.AnchorPoint=Vector2.new(0.5,0.5);
				V.BackgroundTransparency=1;
				V.BorderSizePixel=0;
				V.Size=UDim2.fromOffset(34,34);
				V.ScaleType=Enum.ScaleType.Fit;
				V.Visible=false;
				V.ZIndex=2;
				V.Parent=Z;
				local function H()
					local w=Instance.new("ImageLabel");
					w.AnchorPoint=Vector2.new(0.5,0.5);
					w.BackgroundTransparency=1;
					w.BorderSizePixel=0;
					w.Size=UDim2.fromOffset(30,30);
					w.ScaleType=Enum.ScaleType.Fit;
					w.Visible=false;
					w.ZIndex=2;
					w.Parent=Z;
					local Z=Instance.new("TextLabel");
					Z.AnchorPoint=Vector2.new(0.5,0);
					Z.BackgroundTransparency=1;
					Z.BorderSizePixel=0;
					Z.Position=UDim2.new(0.5,0,1,2);
					Z.Size=UDim2.fromOffset(90,18);
					Z.Font=Enum.Font.GothamBold;
					Z.TextSize=13;
					Z.TextStrokeColor3=z;
					Z.TextStrokeTransparency=0;
					Z.TextXAlignment=Enum.TextXAlignment.Center;
					Z.TextYAlignment=Enum.TextYAlignment.Center;
					Z.Visible=false;
					Z.ZIndex=3;
					Z.Parent=w;
					local UQ=Instance.new("UIGradient");
					UQ.Enabled=false;
					UQ.Rotation=0;
					UQ.Offset=Vector2.zero;
					UQ.Parent=Z;
					return{image=w,text=Z,grad=UQ};
				end;
				local Z,w,UQ,KQ={},0,{},0;
				local function RQ(_Q)
					local NQ=Z[_Q];
					if NQ then 
					else 
						NQ=H();
						Z[_Q]=NQ;
						if _Q>w then 
							w=_Q;
						end;
					end;
					return NQ;
				end;
				local H=NumberSequence.new(0);
				local _Q,NQ,hQ,FQ=ColorSequence.new(C),{},false;
				local tQ,fQ,lQ={},0,{};
				local gQ=math.random();
				local function uQ()
					if FQ then 
						FQ.Visible=false;
					end;
					local sQ=fQ;
					for CQ=1,sQ,1 do 
						local sQ=tQ[CQ];
						if sQ then 
							sQ.Visible=false;
						end;
					end;
				end;
				local function sQ()
					V.Visible=false;
					uQ();
				end;
				local function CQ(zQ)
					local qQ=zQ.text;
					if type(qQ)~="string"then 
						uQ();
						return;
					elseif qQ==""then 
						uQ();
						return;
					end;
					local uQ=t.esp_set;
					local rQ,xQ,GQ,aQ=tonumber(type(uQ)=="table"and uQ.tSz)or 13,F.face(),zQ.position.Y+zQ.size*0.5+2,zQ.textcolor or C;
					uQ=zQ.textgradientcolor or aQ;
					if zQ.textgradient~=true then 
						local F=fQ;
						for mQ=1,F,1 do 
							local cQ=tQ[mQ];
							if cQ then 
								cQ.Visible=false;
							end;
						end;
						FQ=FQ or k("Text");
						F=FQ;
						if F then 
							F.Center=true;
							F.Size=rQ;
							F.Font=xQ;
							F.Text=qQ;
							F.Color=aQ;
							F.Outline=true;
							F.OutlineColor=z;
							F.Transparency=1;
							F.Position=Vector2.new(zQ.position.X,GQ);
							F.Visible=true;
						end;
						return;
					end;
					if FQ then 
						FQ.Visible=false;
					end;
					local F,mQ=#qQ,0;
					for cQ=1,F,1 do 
						local nQ=tQ[cQ];
						if nQ then 
						else 
							nQ=k("Text");
							tQ[cQ]=nQ;
							if cQ>fQ then 
								fQ=cQ;
							end;
						end;
						local k=0;
						if nQ then 
							nQ.Center=false;
							nQ.Size=rQ;
							nQ.Font=xQ;
							nQ.Text=j(qQ,cQ,cQ);
							nQ.Outline=true;
							nQ.OutlineColor=z;
							nQ.Transparency=1;
							k=nQ.TextBounds.X;
						else 
						end;
						lQ[cQ]=k;
						mQ+=k;
					end;
					qQ,xQ=zQ.position.X-mQ*0.5,os.clock();
					for z=1,F,1 do 
						zQ=tQ[z];
						if zQ then 
							rQ=n((F>1 and(z-1)/(F-1)or 0)*m+xQ*2+gQ*m*2)*0.5+0.5;
							zQ.Color=aQ:Lerp(uQ,rQ);
							zQ.Position=Vector2.new(qQ,GQ);
							zQ.Visible=true;
							qQ+=lQ[z];
						else 
						end;
					end;
					GQ,aQ=F+1,fQ;
					for F=GQ,aQ,1 do 
						rQ=tQ[F];
						if rQ then 
							rQ.Visible=false;
						end;
					end;
				end;
				local function F()
					if hQ then 
						if typeof(NQ.position)~="Vector2"then 
							sQ();
							return;
						end;
					else 
						sQ();
						return;
					end;
					V.Position=UDim2.fromOffset(NQ.position.X,NQ.position.Y);
					V.Size=UDim2.fromOffset(NQ.size,NQ.size);
					V.Image=NQ.asset;
					V.ImageColor3=NQ.color;
					V.ImageTransparency=0;
					V.Visible=true;
					CQ(NQ);
				end;
				local function z()
					local k=w;
					for V=1,k,1 do 
						local k=Z[V];
						if k then 
							k.image.Visible=false;
							k.text.Visible=false;
						end;
					end;
				end;
				local function k()
					local V=KQ;
					for gQ=1,V,1 do 
						local uQ=UQ[gQ];
						if uQ then 
							local CQ=RQ(gQ);
							local RQ,gQ,zQ=CQ.image,CQ.text,CQ.grad;
							RQ.Position=UDim2.fromOffset(uQ.position.X,uQ.position.Y);
							RQ.Size=UDim2.fromOffset(uQ.size,uQ.size);
							RQ.Image=uQ.asset;
							RQ.ImageColor3=uQ.color;
							RQ.ImageTransparency=0;
							RQ.Visible=true;
							CQ=uQ.textcolor or C;
							local RQ,qQ=uQ.textgradientcolor or CQ,uQ.text~=nil and uQ.textgradient==true;
							zQ.Enabled=qQ;
							zQ.Rotation=0;
							zQ.Offset=Vector2.zero;
							zQ.Transparency=H;
							zQ.Color=ColorSequence.new(CQ,RQ);
							if uQ.text then 
								gQ.Text=uQ.text;
								gQ.TextColor3=qQ and C or CQ;
								gQ.TextTransparency=0;
								gQ.TextStrokeTransparency=0;
								gQ.Visible=true;
							else 
								gQ.Text="";
								gQ.TextColor3=C;
								gQ.Visible=false;
							end;
						end;
					end;
					local RQ,gQ=KQ+1,w;
					for uQ=RQ,gQ,1 do 
						V=Z[uQ];
						if V then 
							V.image.Visible=false;
							V.text.Text="";
							V.text.Visible=false;
							uQ=V.grad;
							uQ.Enabled=false;
							uQ.Rotation=0;
							uQ.Offset=Vector2.zero;
							uQ.Transparency=H;
							uQ.Color=_Q;
						end;
					end;
				end;
				local function V(H,RQ,_Q,gQ,uQ,CQ,zQ,qQ,rQ,xQ,GQ)
					local aQ=D(H,gQ);
					if aQ then 
						if d(aQ,aQ,RQ,_Q)then 
							return;
						end;
					else 
						return;
					end;
					KQ+=1;
					_Q=UQ[KQ];
					if _Q then 
					else 
						_Q={};
						UQ[KQ]=_Q;
					end;
					_Q.position=aQ;
					_Q.size=rQ;
					_Q.asset=uQ;
					_Q.color=CQ;
					_Q.text=zQ;
					_Q.textcolor=qQ;
					_Q.textgradient=xQ==true;
					_Q.textgradientcolor=GQ;
				end;
				local function H(RQ,_Q,gQ,uQ,CQ)
					local zQ=D(RQ,uQ);
					if zQ then 
						if d(zQ,zQ,_Q,gQ)then 
							return;
						end;
					else 
						return;
					end;
					NQ.position=zQ;
					NQ.size=34;
					NQ.asset=T.Bomb;
					NQ.color=t.bomb_icon_col or C;
					NQ.text=type(CQ)=="number"and E("%.1fs",CQ)or nil;
					NQ.textcolor=t.bomb_timer_col or C;
					NQ.textgradient=t.bomb_timer_grad==true;
					NQ.textgradientcolor=t.bomb_timer_grad_col or NQ.textcolor;
					hQ=true;
				end;
				local function E()
					local d,D={h},s.Character;
					if D then 
						d[2]=D;
					end;
					L.FilterDescendantsInstances=d;
				end;
				local function d(D,RQ)
					E();
					local E=f:Raycast(D+e,y,L);
					D=if E then E.Position+E.Normal*0.06 else D;
					local _Q,NQ=table.create(32),D+M;
					for M=1,32,1 do 
						E=m*2*(M-1)/32;
						local m=Vector3.new(c(E),0,n(E));
						local c=f:Raycast(NQ,m*RQ,L);
						local n=D+m*(if c then if x(c.Normal.Y)<0.65 then _(c.Distance-0.12,0.35,RQ)else RQ else RQ);
						c=f:Raycast(n+e,y,L);
						_Q[M]=if c then c.Position+c.Normal*0.06 else n+I;
					end;
					return D,_Q;
				end;
				local function m(c,n,E)
					if type(c)~="table"then 
						return nil;
					elseif#c==0 then 
						return nil;
					end;
					local L,y=Vector3.zero,0;
					for e=1,#c,1 do 
						local M=c[e];
						if type(M)=="table"then 
							if typeof(M.Position)=="Vector3"then 
								local e,I=L+M.Position,y+1;
								L,y=e,I;
							else 
							end;
						else 
						end;
					end;
					if y==0 then 
						return nil;
					end;
					local e,M=typeof(E)=="Vector3"and E or L/y,0;
					for L=1,#c,1 do 
						E=c[L];
						if type(E)=="table"then 
							if typeof(E.Position)=="Vector3"then 
								local c,y=x(E.Position.X-e.X),x(E.Position.Z-e.Z);
								if n=="smoke"then 
									L=r(0,tonumber(E.Size)or 0)*0.5;
									M=r(M,a(c*c+y*y)+L);
								else 
									local x,L=c+r(0,tonumber(E.SizeX)or 0)*0.5,y+r(0,tonumber(E.SizeZ)or 0)*0.5;
									M=r(M,a(x*x+L*L));
								end;
							else 
							end;
						else 
						end;
					end;
					return e,_(if M<=0 then n=="smoke"and 14.7 or 17.6 else M,2,40);
				end;
				local function x(a)
					if a=="Smoke Grenade"then 
						return"smoke";
					end;
					if a=="Molotov"then 
						return"fire";
					elseif a=="Incendiary Grenade"then 
						return"fire";
					end;
					return nil;
				end;
				local function a(c,n)
					local E,L,y=os.clock(),10;
					for e=#J,1,-1 do 
						local M=J[e];
						if E-M.time>2.5 then 
							table.remove(J,e);
						else 
							if x(M.weapon)==n then 
								local n=(M.position-c).Magnitude;
								if n<L then 
									L,y=n,e;
								else 
								end;
							else 
							end;
						end;
					end;
					if y then 
						return table.remove(J,y).weapon;
					end;
					return nil;
				end;
				local function c(n)
					local E=Q[n];
					if not(E)then 
						return;
					end;
					local L=#X;
					local y=X[L];
					X[E]=y;
					X[L]=nil;
					Q[n]=nil;
					if y then 
						if E~=L then 
							Q[y.key]=E;
						end;
					end;
				end;
				local function n(E,L,y)
					local e=Q[E.key];
					if e then 
						if X[e]==E then 
							local e=h;
							E.instance=e:FindFirstChild(L..y)or E.instance;
						end;
					end;
				end;
				local function E(L,y,e,M,I,D)
					if y==nil then 
						return nil;
					end;
					y=tostring(y);
					local RQ,_Q=m(e,L,M);
					if not(RQ)then 
						return nil;
					end;
					M,e=d(RQ,_Q);
					local m,d=L..":"..y,os.clock();
					RQ=Q[m];
					local NQ=RQ and X[RQ];
					if NQ then 
					else 
						NQ={id=y,key=m,kind=L,created=d};
						X[#X+1]=NQ;
						Q[m]=#X;
					end;
					NQ.center=M;
					NQ.ring=e;
					NQ.radius=_Q;
					NQ.team=D or NQ.team;
					RQ=tonumber(I);
					if RQ then 
						if RQ>0 then 
							NQ.expires=d+RQ;
						elseif not(NQ.expires)then 
							NQ.expires=d+20;
						end;
					elseif not(NQ.expires)then 
						NQ.expires=d+20;
					end;
					D=a(M,L);
					if D then 
						NQ.weapon=D;
					end;
					if not(NQ.weapon)then 
						NQ.weapon=L=="smoke"and"Smoke Grenade"or"Molotov";
					end;
					task.defer(n,NQ,L=="smoke"and"VoxelSmoke_"or"VoxelFire_",y);
					return NQ;
				end;
				local function a(m)
					if m~=nil then 
						c("smoke:"..tostring(m));
					end;
				end;
				local function m(n)
					if n~=nil then 
						c("fire:"..tostring(n));
					end;
				end;
				local function c(n)
					if type(n)=="table"then 
						E("smoke",n.SmokeId,n.Voxels,nil,n.Duration,n.Team);
					end;
				end;
				local function n(L)
					if type(L)=="table"then 
						E("fire",L.FireId,L.Voxels,L.Position,L.Duration,nil);
					end;
				end;
				local function L(y)
					if type(y)~="table"then 
						return;
					elseif y.FireId==nil then 
						return;
					end;
					local e=Q["fire:"..tostring(y.FireId)];
					local M=e and X[e];
					local I,d,D,RQ,_Q=M and M.center or nil,M and M.expires,M and M.weapon,M and M.created,M and M.instance;
					e=E("fire",y.FireId,y.Voxels,I,nil,nil);
					if e then 
						if M then 
							e.expires=d;
							e.weapon=D;
							e.created=RQ;
							e.instance=_Q;
						end;
					end;
				end;
				local function y(e)
					return{simulationTime=e.elapsed or 0,bounceCount=e.bounces or 0,isGrounded=false,isAtRest=false,hasTouched=(e.bounces or 0)>0,accumulatedTime=0,position=e.position,velocity=e.velocity,angularVelocity=Vector3.zero,timestamp=e.starttime,isJumpThrow=e.jump==true};
				end;
				local function e(M)
					local I,d=y(M),M.physics;
					M=tonumber(d.FuseTime);
					M=if M then if M<=0 then nil else M else nil;
					local y=Y.createConfig(tonumber(d.Radius)or 0.5,1,false,M,nil,nil);
					y.restitution=tonumber(d.Restitution)or y.restitution;
					y.maxBounces=tonumber(d.MaxBounces)or y.maxBounces;
					M=RaycastParams.new();
					M.FilterType=Enum.RaycastFilterType.Exclude;
					M.RespectCanCollide=false;
					M.IgnoreWater=true;
					local D,RQ={h},s.Character;
					if RQ then 
						D[2]=RQ;
					end;
					M.FilterDescendantsInstances=D;
					pcall(o,M,d.CollisionGroup or"Default");
					RQ=Y.Constants or{};
					local D,_Q=_(tonumber(d.Step)or tonumber(RQ.FIXED_TIMESTEP)or 0.0078125,0.001,0.05),tonumber(RQ.MAX_SIMULATION_TIME)or 10;
					d=math.ceil(r(0,_Q-I.simulationTime)/D)+2;
					for _=1,q(12000,d),1 do 
						_Q,_=Y.step(I,y,M,D);
						if _Q.isAtRest then 
							I=_Q;
							break;
						elseif _ then 
							if _.type~="bounce"then 
								I=_Q;
								break;
							end;
						end;
						I=_Q;
					end;
					return I.position;
				end;
				local function _(y,M)
					local I,d=pcall(e,y);
					if I then 
						if typeof(d)~="Vector3"then 
							return;
						elseif y.generation~=M then 
							return;
						end;
					else 
						return;
					end;
					M=A[y.id];
					if M then 
						if S[M]==y then 
							y.endpoint=d;
						end;
					end;
				end;
				local function y(e)
					if e.weapon~="HE Grenade"then 
						return;
					end;
					local M=(e.generation or 0)+1;
					e.generation=M;
					if typeof(e.position)~="Vector3"then 
						return;
					elseif typeof(e.velocity)~="Vector3"then 
						return;
					elseif type(e.physics)~="table"then 
						return;
					end;
					task.defer(_,e,M);
				end;
				local function _(e)
					S[#S+1]=e;
					A[e.id]=#S;
				end;
				local function e(M)
					local I=A[M.id];
					if I then 
						if S[I]==M then 
							local I=h;
							M.model=I:FindFirstChild(M.id)or M.model;
							M.modelseen=M.model~=nil or M.modelseen;
						end;
					end;
				end;
				local function M(I)
					if type(I)~="table"then 
						return;
					elseif I.Id==nil then 
						return;
					elseif not(T[I.Weapon])then 
						return;
					end;
					if type(I.State)~="table"then 
						return;
					elseif type(I.Physics)~="table"then 
						return;
					end;
					if typeof(I.State.Position)~="Vector3"then 
						return;
					elseif typeof(I.State.Velocity)~="Vector3"then 
						return;
					end;
					local d,D=tostring(I.Id),os.clock();
					local RQ={id=d,weapon=I.Weapon,position=I.State.Position,velocity=I.State.Velocity,starttime=tonumber(I.State.StartTime)or f:GetServerTimeNow(),elapsed=0,bounces=0,jump=I.State.IsJumpThrow==true,physics=I.Physics,group=I.Physics.CollisionGroup,born=D,expires=D+12,model=h:FindFirstChild(d)};
					RQ.modelseen=RQ.model~=nil;
					D=A[d];
					if D then 
						S[D]=RQ;
					else 
						_(RQ);
					end;
					y(RQ);
					task.defer(e,RQ);
				end;
				local function e(I)
					if type(I)~="table"then 
						return;
					elseif I.Id==nil then 
						return;
					end;
					local d=A[tostring(I.Id)];
					local D=d and S[d];
					if not(D)then 
						return;
					end;
					if typeof(I.Position)=="Vector3"then 
						D.position=I.Position;
					end;
					if typeof(I.Velocity)=="Vector3"then 
						D.velocity=I.Velocity;
					end;
					D.bounces=tonumber(I.BounceIndex)or D.bounces or 0;
					d=tonumber(I.Timestamp);
					if d then 
						I=tonumber(D.starttime)or d;
						D.starttime=I;
						D.elapsed=r(tonumber(D.elapsed)or 0,d-I);
					end;
					y(D);
				end;
				local function y(I)
					local d=S[I];
					if not(d)then 
						return;
					end;
					local D=#S;
					local RQ=S[D];
					S[I]=RQ;
					S[D]=nil;
					A[d.id]=nil;
					if RQ then 
						if I~=D then 
							A[RQ.id]=I;
						end;
					end;
				end;
				local function I(d)
					if type(d)~="table"then 
						return;
					elseif d.Id==nil then 
						return;
					end;
					local D=A[tostring(d.Id)];
					local RQ=D and S[D];
					local _Q,NQ=d.Grenade or RQ and RQ.weapon,typeof(d.Position)=="Vector3"and d.Position or RQ and RQ.position;
					if D then 
						y(D);
					end;
					if _Q then 
						if typeof(NQ)~="Vector3"then 
							return;
						end;
					else 
						return;
					end;
					RQ=os.clock();
					J[#J+1]={weapon=_Q,position=NQ,time=RQ};
					d=x(_Q);
					if not d then 
						return;
					end;
					local x,y=10;
					for gQ=1,#X,1 do 
						D=X[gQ];
						if D.kind==d then 
							if RQ-D.created<1.5 then 
								gQ=(D.center-NQ).Magnitude;
								if gQ<x then 
									x,y=gQ,D;
								else 
								end;
							else 
							end;
						else 
						end;
					end;
					if y then 
						y.weapon=_Q;
					end;
				end;
				local function x(y)
					if typeof(y)~="Instance"then 
						return;
					elseif not(y:IsA("Model"))then 
						return;
					end;
					local d=y:GetAttribute("GrenadeName");
					if not(T[d])then 
						return;
					end;
					local D=y.Name;
					local RQ=A[D];
					local _Q=RQ and S[RQ];
					if _Q then 
						_Q.model=y;
						_Q.modelseen=true;
						return;
					end;
					RQ,_Q=pcall(y.GetPivot,y);
					if not RQ then 
						return;
					end;
					RQ=os.clock();
					_({id=D,weapon=d,position=_Q.Position,model=y,modelseen=true,born=RQ,expires=RQ+12});
				end;
				local function _(y,d,D)
					local RQ,_Q={},y:GetChildren();
					for NQ=1,#_Q,1 do 
						local gQ=_Q[NQ];
						if gQ:IsA("BasePart")then 
							NQ=gQ.Size;
							if d=="smoke"then 
								local uQ,CQ=#RQ+1,{Position=gQ.Position};
								CQ.Size,RQ[uQ]=r(NQ.X,NQ.Z),CQ;
							else 
								RQ[#RQ+1]={Position=gQ.Position,SizeX=NQ.X,SizeZ=NQ.Z};
							end;
						end;
					end;
					_Q=E(d,D,RQ,nil,nil,nil);
					if _Q then 
						_Q.instance=y;
						_Q.expires=math.huge;
					end;
				end;
				local function E()
					local y=u:GetTagged("Grenade");
					for d=1,#y,1 do 
						x(y[d]);
					end;
					y=h:GetChildren();
					for d=1,#y,1 do 
						local D=y[d];
						d=D.Name;
						if j(d,1,11)=="VoxelSmoke_"then 
							local y=j(d,12);
							if not(Q["smoke:"..y])then 
								_(D,"smoke",y);
							end;
						elseif j(d,1,10)=="VoxelFire_"then 
							local y=j(d,11);
							if not(Q["fire:"..y])then 
								_(D,"fire",y);
							end;
						end;
					end;
				end;
				local function _(j,y)
					if type(j)~="table"then 
						return;
					elseif type(j.Listen)~="function"then 
						return;
					end;
					local d,D=pcall(j.Listen,y);
					if d then 
						if type(D)=="function"then 
							N.adopt(D);
						end;
					end;
				end;
				local function j(y)
					local d=y.model;
					if d then 
						if d.Parent then 
							local D=d.PrimaryPart;
							if D then 
								y.position=D.Position;
								return D.Position;
							end;
							local D,RQ=pcall(d.GetPivot,d);
							if D then 
								y.position=RQ.Position;
								return RQ.Position;
							end;
							return y.position;
						end;
					end;
					if not(d)then 
						local d=h;
						local D=d:FindFirstChild(y.id);
						if D then 
							if D:IsA("Model")then 
								y.model=D;
								y.modelseen=true;
								return j(y);
							end;
						end;
					end;
					if y.modelseen then 
						y.expires=0;
					end;
					return y.position;
				end;
				local function y(d)
					if d.weapon~="HE Grenade"then 
						return false;
					elseif not(d.group)then 
						return false;
					end;
					if f:GetAttribute("Gamemode")=="Deathmatch"then 
						return true;
					end;
					if f:GetAttribute("VIPFriendlyFireEnabled")==true then 
						return true;
					end;
					local D=s:GetAttribute("Team");
					if D=="Terrorists"then 
						return d.group~="TGrenade";
					end;
					if D=="Counter-Terrorists"then 
						return d.group~="CTGrenade";
					end;
					return false;
				end;
				local function d(D)
					return g:JSONDecode(D);
				end;
				local function g()
					local D=s:GetAttribute("Armor");
					if type(D)=="number"then 
						return r(0,D);
					end;
					if type(D)=="string"then 
						local RQ,_Q=pcall(d,D);
						if RQ then 
							if type(_Q)=="table"then 
								return r(0,tonumber(_Q.Health)or 0);
							end;
						end;
					end;
					D=s.Character;
					if D then 
						return r(0,tonumber(D:GetAttribute("Armor"))or 0);
					end;
					return 0;
				end;
				local D=RaycastParams.new();
				D.FilterType=Enum.RaycastFilterType.Exclude;
				D.RespectCanCollide=false;
				D.IgnoreWater=true;
				pcall(o,D,"Default");
				local function o(RQ)
					if y(RQ)then 
						if typeof(RQ.endpoint)~="Vector3"then 
							return nil;
						end;
					else 
						return nil;
					end;
					local y=s.Character;
					if y then 
						if y:IsDescendantOf(f)then 
							if y:GetAttribute("Dead")==true then 
								return nil;
							end;
						else 
							return nil;
						end;
					else 
						return nil;
					end;
					local s=y.PrimaryPart or y:FindFirstChild("HumanoidRootPart")or y:FindFirstChild("UpperTorso");
					if s then 
						if not(s:IsA("BasePart"))then 
							return nil;
						end;
					else 
						return nil;
					end;
					local _Q=s.Position-RQ.endpoint;
					local NQ=_Q.Magnitude;
					local gQ=NQ/(tonumber(Y.Constants and Y.Constants.SOURCE_TO_STUDS)or 0.0763888888888889);
					if gQ>350 then 
						return nil;
					end;
					if NQ>0.3 then 
						local Y=RQ.endpoint+_Q.Unit*0.2;
						local _Q,uQ=s.Position-Y,{h,y};
						if RQ.model then 
							uQ[3]=RQ.model;
						end;
						D.FilterDescendantsInstances=uQ;
						uQ=f:Raycast(Y,_Q,D);
						if uQ then 
							if uQ.Distance<_Q.Magnitude-0.2 then 
								return nil;
							end;
						end;
					end;
					RQ=(gQ-25)/140;
					s,y=q(98,105*O(-(RQ*RQ))),g();
					if y>0 then 
						NQ=s*0.5;
						s=if(s-NQ)*0.5>y then s-y/0.5 else NQ;
					else 
					end;
					s=G(s+0.5);
					if s<1 then 
						return nil;
					end;
					return s;
				end;
				local g={};
				local function s(q,G,O,Y)
					local y=Y.ring;
					local D=type(y)=="table"and#y or 0;
					if D<3 then 
						return;
					end;
					local RQ=b(q,Y.center,y);
					if not(RQ)then 
						return;
					end;
					local b=Y.kind=="smoke";
					local _Q,NQ,gQ,uQ=b and(t.smoke_zone_col or C)or(t.fire_zone_col or C),b and(t.smoke_zone_icon or C)or(t.fire_zone_icon or C),W(q,Y.center,RQ),true;
					for CQ=1,D,1 do 
						local zQ=W(q,y[CQ],RQ);
						if not(zQ)then 
							uQ=false;
							break;
						end;
						g[CQ]=zQ;
					end;
					y=t.zonefill;
					if uQ and type(y)=="table"then 
						for W=#g,D+1,-1 do 
							g[W]=nil;
						end;
						y.stroke("active",g,true,_Q,1.5,G,O,"base",0.92);
						if gQ then 
							y.draw("active",gQ,g,_Q,G,O,q.ViewportSize);
						end;
					end;
					RQ=T[Y.weapon]or T[b and"Smoke Grenade"or"Molotov"];
					V(q,G,O,Y.center+i,RQ,NQ,nil,C,32);
				end;
				local function q(G)
					local O=0;
					for Y=1,#S,1 do 
						local y=S[Y];
						Y=y.model;
						if G>=(y.expires or 0)or Y and y.modelseen and not Y.Parent or Y and Y:GetAttribute("SimulationFinished")==true then 
							A[y.id]=nil;
						else 
							O+=1;
							S[O]=y;
							A[y.id]=O;
						end;
					end;
					for Y=#S,O+1,-1 do 
						S[Y]=nil;
					end;
					O=0;
					for Y=1,#X,1 do 
						local y=X[Y];
						if G>=(y.expires or math.huge)or y.instance and not y.instance.Parent then 
							Q[y.key]=nil;
						else 
							O+=1;
							X[O]=y;
							Q[y.key]=O;
						end;
					end;
					for Y=#X,O+1,-1 do 
						X[Y]=nil;
					end;
					for O=#J,1,-1 do 
						if G-J[O].time>2.5 then 
							table.remove(J,O);
						end;
					end;
				end;
				local function G(O)
					if typeof(O)~="Instance"then 
						return nil;
					elseif not(O.Parent)then 
						return nil;
					end;
					if O:IsA("Model")then 
						if O.PrimaryPart then 
							return O.PrimaryPart.Position;
						end;
					end;
					if O:IsA("BasePart")then 
						return O.Position;
					end;
					local Y,y=pcall(O.GetPivot,O);
					if Y then 
						if typeof(y)=="CFrame"then 
							return y.Position;
						end;
					end;
					return nil;
				end;
				local O=R.weak();
				local function Y(y)
					local i,b=y:GetAttribute("BombPlanted"),O[y];
					if b then 
					else 
						b={};
						O[y]=b;
					end;
					if b.raw~=i then 
						b.raw=i;
						b.started=nil;
						b.duration=nil;
						if type(i)=="string"then 
							if i~=""then 
								local O,y=pcall(d,i);
								if O then 
									if type(y)=="table"then 
										if type(y.Time)=="number"then 
											if type(y.TimeUntilExplode)=="number"then 
												b.started=y.Time;
												b.duration=y.TimeUntilExplode;
											end;
										end;
									end;
								end;
							end;
						end;
					end;
					return b.started,b.duration;
				end;
				local function O(y)
					return typeof(y)=="Instance"and y:IsDescendantOf(f)and y:GetAttribute("Defused")~=true and y:GetAttribute("Exploded")~=true and y:GetAttribute("Exploding")~=true and y:GetAttribute("BombPlanted")~=nil;
				end;
				local function y(i)
					return typeof(i)=="Instance"and i:IsDescendantOf(f)and i:GetAttribute("Weapon")=="C4";
				end;
				local i,d;
				local function b(D)
					local W=G(D);
					if not(W)then 
						return nil;
					end;
					local RQ,_Q=Y(D);
					if type(RQ)=="number"then 
						if type(_Q)=="number"then 
							if _Q>0 then 
								D=r(RQ+_Q-f:GetServerTimeNow(),0);
								if D>0 then 
									return W,D;
								end;
							end;
						end;
					end;
					return W,nil;
				end;
				local function r()
					if i then 
						if d then 
							if O(i)then 
								local Y=i;
								return b(Y);
							end;
						elseif y(i)then 
							local Y=i;
							return G(Y),nil;
						end;
						i=nil;
					end;
					local Y=u:GetTagged("Bomb");
					local D=#Y;
					for W=1,D,1 do 
						local RQ=Y[W];
						if O(RQ)then 
							local O,W=b(RQ);
							if O then 
								i,d=RQ,true;
								return O,W;
							end;
						end;
					end;
					D=u:GetTagged("WeaponDropped");
					Y=#D;
					for O=1,Y,1 do 
						local Y=D[O];
						if y(Y)then 
							O=G(Y);
							if O then 
								i,d=Y,false;
								return O,nil;
							end;
						end;
					end;
					return nil,nil;
				end;
				local function G()
					q(os.clock());
					local q=p();
					if q then 
						local O=R.drawmask();
						local Y=O and l:GetGuiInset()or Vector2.zero;
						if t.bomb_esp==true then 
							local l,y=r();
							if typeof(l)=="Vector3"then 
								H(q,O,Y,l,y);
							end;
						end;
						if t.nade_zones==true then 
							for l=1,#X,1 do 
								s(q,O,Y,X[l]);
							end;
						end;
						if t.nades_live==true then 
							for l=1,#S,1 do 
								local s=S[l];
								l=j(s);
								if typeof(l)=="Vector3"then 
									local r=o(s);
									V(q,O,Y,l,T[s.weapon],t.nade_icon_col or C,r and tostring(r).." dmg"or nil,t.nade_dmg_col or C,30);
								end;
							end;
						end;
					end;
				end;
				P.step=function()
					KQ,hQ=0,false;
					if h then 
						local l=t.zonefill;
						local s=type(l)=="table";
						if s then 
							l.begin("active");
						end;
						pcall(G);
						if s then 
							l.finish("active");
						end;
					end;
					if not(pcall(k))then 
						pcall(z);
					end;
					if not(pcall(F))then 
						pcall(sQ);
					end;
				end;
				local function F()
					if not(h)then 
						local l=f:WaitForChild("Debris",60);
						R.reclaim();
						if l then 
							if not(N.alive())then 
								return;
							end;
						else 
							return;
						end;
						h=l;
					end;
					_(v.Projectile and v.Projectile.Spawn,M);
					_(v.Projectile and v.Projectile.Bounce,e);
					_(v.Projectile and v.Projectile.Resolve,I);
					_(v.VFX and v.VFX.CreateVoxelSmoke,c);
					_(v.VFX and v.VFX.DestroyVoxelSmoke,a);
					_(v.VFX and v.VFX.CreateVoxelFire,n);
					_(v.VFX and v.VFX.UpdateVoxelFire,L);
					_(v.VFX and v.VFX.DestroyVoxelFire,m);
					N.connect(u:GetInstanceAddedSignal("Grenade"),x);
					E();
				end;
				N.spawn(F);
				N.teardown(function()
					local R=t.zonefill;
					if type(R)=="table"then 
						R.clear("active");
					end;
					B(FQ);
					FQ=nil;
					R=fQ;
					for _=1,R,1 do 
						B(tQ[_]);
					end;
					fQ=0;
					table.clear(tQ);
					table.clear(lQ);
					table.clear(Z);
					table.clear(UQ);
					table.clear(X);
					table.clear(Q);
					table.clear(S);
					table.clear(A);
					table.clear(J);
					table.clear(g);
					w,KQ,i=0,0,nil;
				end);
				return P;
			end;
			K.T=function()
				local R,_,N=K.load("b"),K.load("a"),K.load("h");
				local h,F=K.load("j"),R.lp;
				local t=R.workspace;
				local f=h.pose;
				local l,g,u=h.grenade,h.inventory,os.clock;
				local h=math.rad;
				local s=math.random;
				local C=math.clamp;
				local z,q,r,x,G,a,m=math.atan2,{["Counter-Terrorists"]=true,Terrorists=true},{on=false,yaw="backward",jitter=45,spin_rate=25,pitch="off",air_spin=false,air_rate=30,air_pitch="off",duck=false,duck_rate=4},0;
				local c,n=0,false;
				local O=type(f)=="table"and type(f.getJoints)=="function"and type(f.applyVerticalLook)=="function";
				local function j()
					if O then 
						if a then 
							pcall(f.applyVerticalLook,a,0,0);
						end;
					end;
				end;
				local function E(P)
					if O then 
						if not(P)then 
							return nil;
						end;
					else 
						return nil;
					end;
					if m==P then 
						if a then 
							local T=a;
							return T;
						end;
					end;
					j();
					a,m=nil,nil;
					local T,Y=pcall(f.getJoints,P);
					if T then 
						if type(Y)=="table"then 
							a,m=Y,P;
						end;
					end;
					Y=a;
					return Y;
				end;
				local function P(T)
					if not(T)then 
						return nil;
					end;
					local Y,v,Z,L,o=F:GetAttribute("Team"),t:GetAttribute("Gamemode")=="Deathmatch",T.Position,N.all();
					local N,t;
					for X=1,o,1 do 
						T=L[X];
						if T~=F then 
							X=T:GetAttribute("Team");
							if v or Y~=nil and X~=nil and q[Y]and q[X]and Y~=X then 
								local q=T.Character;
								if q then 
									if q:GetAttribute("Dead")~=true then 
										local T=q:FindFirstChild("HumanoidRootPart");
										if T then 
											local q=(T.Position-Z).Magnitude;
											if N then 
												if q<N then 
													N,t=q,T;
												else 
												end;
											else 
												N,t=q,T;
											end;
										else 
										end;
									else 
									end;
								else 
								end;
							else 
							end;
						else 
						end;
					end;
					return t;
				end;
				local function N()
					if u()<c then 
						return true;
					end;
					return F:GetAttribute("IsDefusingBomb")==true or F:GetAttribute("IsLocallyDefusingBomb")==true;
				end;
				if type(l)=="table"then 
					if type(rawget(l,"Throw"))=="function"then 
						_.field(l,"Throw",function(F)
							local function t(l,...)
								if r.on then 
									c=u()+1.25;
								end;
								return F(l,...);
							end;
							return t;
						end);
					end;
				end;
				if type(g)=="table"then 
					if type(rawget(g,"PredictGrenadeThrow"))=="function"then 
						_.field(g,"PredictGrenadeThrow",function(F)
							local function t(...)
								local l=F(...);
								if l==true then 
									if r.on then 
										c=u()+0.35;
									end;
								end;
								return l;
							end;
							return t;
						end);
					end;
				end;
				R={cfg=r,reset=function()
					x,G=0,nil;
				end,relax=function()
					j();
				end,apply=function(F,t)
					if not(r.on)then 
						return;
					end;
					if N()then 
						if not(n)then 
							n=true;
							j();
						end;
						return;
					end;
					n=false;
					local N,l,g=tonumber(t.LookYaw)or 0,tonumber(t.VerticalLook)or 0,F and F.MovementState;
					local u,q=g and g.OnGround==false and r.air_spin==true;
					if u then 
						g=x;
						x=g+h(tonumber(r.air_rate)or 30);
						q=N+x;
					else 
						local T=G;
						if T~=r.yaw then 
							x=0;
							G=r.yaw;
						end;
						T=r.yaw;
						if T=="spin"then 
							local G=x;
							x=G+h(tonumber(r.spin_rate)or 25);
							q=N+x;
						else 
							if T=="backward"or T=="jitter"then 
								local x,G=F and F.HumanoidRootPart,N+3.141592653589793;
								if x then 
									local Y=P(x);
									if Y then 
										local P=Y.Position-x.Position;
										G=z(P.X,P.Z);
									else 
									end;
								else 
								end;
								q=if T=="jitter"then G+h((s()*2-1)*(tonumber(r.jitter)or 0))else G;
							else 
								q=N;
							end;
						end;
					end;
					g=u and r.air_pitch or r.pitch;
					u=g~="off";
					l=C(if g=="down"then-1 else if g=="up"then 1 else if g=="jitter"then s()*2-1 else l,-1,1);
					t.LookYaw=q;
					t.VerticalLook=l;
					if typeof(t.Move)=="Vector2"then 
						g=q-N;
						if math.abs(g)>1.0E-6 then 
							local h,s,z=math.cos(g),math.sin(g),t.Move;
							t.Move=Vector2.new(z.X*h-z.Y*s,z.X*s+z.Y*h);
						end;
					end;
					if r.duck then 
						N,g=1/(2*C(tonumber(r.duck_rate)or 4,1,12)),tonumber(t.Buttons)or 0;
						if math.floor(os.clock()/N)%2==1 then 
							t.Buttons=bit32.bor(g,2);
						else 
							t.Buttons=bit32.band(g,bit32.bnot(2));
						end;
					end;
					if u then 
						if O then 
							if F then 
								if F.Character then 
									g=E(F.Character);
									if g then 
										pcall(f.applyVerticalLook,g,l,0);
									end;
								end;
							end;
						end;
					end;
				end,unload=function()
					r.on=false;
					c,n=0,false;
					j();
					a,m=nil,nil;
				end};
				_.teardown(R.unload);
				return R;
			end;
			K.U=function()
				local R={weapon=nil,cframe=nil,yaw=0,pitch=0,expires=0,cmd_samples=0};
				R.cmd_active=function(_)
					_=_ or os.clock();
					if R.cmd_samples<=0 then 
						return false;
					elseif _>R.expires then 
						return false;
					end;
					if type(R.yaw)~="number"then 
						return false;
					elseif type(R.pitch)~="number"then 
						return false;
					end;
					return true;
				end;
				R.cmd_consume=function()
					if R.cmd_samples>0 then 
						R.cmd_samples=R.cmd_samples-1;
					end;
				end;
				R.clear=function()
					R.weapon=nil;
					R.cframe=nil;
					R.yaw=0;
					R.pitch=0;
					R.expires=0;
					R.cmd_samples=0;
				end;
				return R;
			end;
			K.V=function()
				local R,_,N,h=K.load("b"),K.load("a"),K.load("j"),K.load("T");
				local F=K.load("U");
				local t,f,l=R.lp,R.storage,math.clamp;
				local g=math.floor;
				local u=math.sqrt;
				local s=math.abs;
				local C=math.cos;
				local z,q=math.sin,3.141592653589793;
				local r=bit32.bor;
				local x=bit32.band;
				local G,a,m,c,n,O,j=bit32.bnot,{bhop=false,strafe=false,edge_jump=false,jump_bug=false,edge_bug=false,slow_walk=false,pixel_surf=false};
				local E,P,T,Y,v,Z,L=false;
				do 
				local o=f:FindFirstChild("MovementV2");
				if o then 
					local X,Q,S,A,J,y=pcall(function()
						return require(o.Simulation),require(o.Simulation.State),require(o.Simulation.RuntimeSettings),require(o.Serial),require(o.Buttons);
					end);
					if X and type(Q)=="table"then 
						if type(Q.step)=="function"then 
							if type(S)=="table"then 
								if type(A)=="table"then 
									if type(J)=="table"then 
										if type(y)=="table"then 
											local o=true;
											m,c,n,O,j,E=Q,S,A,J,y,o;
										else 
										end;
									else 
									end;
								else 
								end;
							else 
							end;
						else 
						end;
					else 
					end;
				else 
				end;
				P,T,Y,v,Z,L=m,c,n,O,j,E;end;
			local m=Z and Z.Jump or 1;
				local c=Z and Z.Duck or 2;
				local n,O,j=Z and Z.Walk or 4,{char=nil,runtime=nil,bug_pending=false,hz=nil,config=nil,strafe_yaw=nil,strafe_side=1,capture=false,world=nil,world_tick=nil,world_owner=nil},{mode=nil,normal=nil,duck=false,wide=false,ticks=0,check=0,away=0,rest=0,jump=false,air=false};
				local E=math.round;
				local o=math.max;
				local X=math.log;
				local Q,S,A,J=math.exp,6.283185307179586,{1,0.5,0},{};
				for y=0,7,1 do 
					f=y*q/4;
					J[y+1]=Vector3.new(C(f),0,z(f));
				end;
				local y={};
				U:ds(y,0,Vector2.zero);
				for e=0,15,1 do 
					R=e*q/8;
					y[#y+1]=Vector2.new(C(R),z(R));
				end;
				local e,M={},{};
				f=N.mv_runtime;
				if type(f)=="table"then 
					if type(rawget(f,"advance"))=="function"then 
						_.field(f,"advance",function(I)
							return function(i,...)
								O.runtime=i;
								return I(i,...);
							end;
						end);
					end;
				end;
				if type(f)=="table"then 
					if type(rawget(f,"_composeWorld"))=="function"then 
						R=_.field(f,"_composeWorld",function(I)
							return function(i,k,...)
								local B,d=I(i,k,...);
								if B~=nil then 
									O.world=B;
									O.world_tick=k;
									O.world_owner=i;
								end;
								return B,d;
							end;
						end);
						O.capture=rawget(f,"_composeWorld")~=R;
						_.teardown(function()
							O.capture=false;
							O.world=nil;
							O.world_tick=nil;
							O.world_owner=nil;
						end);
					end;
				end;
				local function I(i,k,B)
					if Z then 
						if type(Z.with)=="function"then 
							return Z.with(i,k,B);
						end;
					end;
					if B then 
						return r(i,k);
					end;
					return x(i,G(k));
				end;
				local function Z(i)
					local k=O.runtime;
					if type(k)~="table"then 
						return nil;
					end;
					if rawget(k,"_started")~=true then 
						return nil;
					end;
					if type(i)=="table"then 
						local B=rawget(k,"_mapping");
						if type(B)~="table"then 
							return nil;
						elseif B.Generation~=i.Generation then 
							return nil;
						end;
					end;
					return k;
				end;
				local function i(k)
					local B=type(k)=="table"and tonumber(k.SimulationHz)or nil;
					if not(B)then 
						return nil;
					end;
					if O.hz==B then 
						if O.config then 
							return O.config;
						end;
					end;
					local k,d=pcall(Y.getMovementConfig,B);
					if k then 
						if type(d)~="table"then 
							return nil;
						end;
					else 
						return nil;
					end;
					O.hz=B;
					O.config=d;
					return d;
				end;
				local function Y(k,B)
					if L then 
						if type(k)~="table"then 
							return nil;
						elseif type(B)~="table"then 
							return nil;
						elseif type(k.Support)~="table"then 
							return nil;
						end;
					else 
						return nil;
					end;
					local L=tonumber(k.ServerTick);
					if not(L)then 
						return nil;
					end;
					local d=Z(k.Mapping);
					if not(d)then 
						return nil;
					end;
					local Z=rawget(d,"_commandStream");
					if type(Z)~="table"then 
						return nil;
					end;
					local b=O.world_owner==d and O.world_tick==L and O.world or nil;
					if b then 
					else 
						if O.capture then 
						else 
							local p=rawget(d,"_timeline");
							if type(p)~="table"then 
								return nil;
							end;
							local D,V=pcall(p.resolve,p,L);
							if D then 
								if type(V)~="table"then 
									return nil;
								end;
							else 
								return nil;
							end;
							p,D=pcall(d._composeWorld,d,L,V.Revision,nil,B);
							b=p and D or nil;
						end;
					end;
					if type(b)~="table"then 
						return nil;
					elseif type(b.Composed)~="table"then 
						return nil;
					elseif type(b.Composed.Query)~="table"then 
						return nil;
					end;
					L=i(k.Mapping);
					if not L then 
						return nil;
					end;
					local i,p=pcall(Z.lastSampledCommandNumber,Z);
					if not(i)then 
						return nil;
					end;
					Z,i=pcall(v.addUInt32,p or 4294967295,1);
					if not Z then 
						return nil;
					end;
					return{runtime=d,state=B,support=k.Support,world=b,config=L,step=l(tonumber(k.StepSeconds)or 0.015625,0.001,0.05),number=i};
				end;
				local function v(Z)
					local L,i=pcall(T.clone,Z.state);
					if L then 
						if type(i)~="table"then 
							return nil;
						end;
					else 
						return nil;
					end;
					local L,k=pcall(T.cloneSupport,Z.support);
					if L then 
						if type(k)~="table"then 
							return nil;
						end;
					else 
						return nil;
					end;
					return i,k;
				end;
				local function T(Z)
					local L=E(Z%S/S*65536)%65536/65536*S;
					if L>=q then 
						return L-S;
					end;
					return L;
				end;
				local function q(Z,L,S,i,k,B,d,b)
					local p,D=pcall(Z.runtime._resolveSupportMotion,Z.runtime,Z.world,L,S);
					if not(p)then 
						return nil;
					end;
					local p,V,W,H=pcall(P.step,L,S,{CommandNumber=i,Move=Vector2.new(E(l(k.X,-1,1)*127)/127,E(l(k.Y,-1,1)*127)/127),LookYaw=T(B),VerticalLook=E(l(d,-1,1)*127)/127,Buttons=b},Z.step,Z.world.Composed.Query,D,Z.config,nil);
					if p then 
						if type(V)~="table"then 
							return nil;
						elseif type(W)~="table"then 
							return nil;
						elseif type(H)~="table"then 
							return nil;
						end;
					else 
						return nil;
					end;
					return V,W,H;
				end;
				local function E(P,T,Z,L,S)
					local i,k=v(P);
					if not(i)then 
						return nil;
					end;
					return q(P,i,k,P.number,T,Z,L,S);
				end;
				local function q(P,T,v,Z)
					if Z.Landed then 
						return false;
					elseif Z.StartSolid then 
						return false;
					elseif T.OnGround==true then 
						return false;
					elseif v.OnGround==true then 
						return false;
					end;
					local L,S=T.Velocity,v.Velocity;
					if typeof(L)~="Vector3"then 
						return false;
					elseif typeof(S)~="Vector3"then 
						return false;
					elseif L.Y>=-4 then 
						return false;
					end;
					Z=s(tonumber(P.config.Gravity)or 60);
					local i=math.max(1.25,Z*P.step*1.35);
					if s(S.Y)>i then 
						return false;
					elseif S.Y<=L.Y+4 then 
						return false;
					end;
					return v.Position.Y<=T.Position.Y+0.05;
				end;
				local function P(T,v,Z,L,S)
					local i=I(I(S,m,false),c,false);
					local k,B,B=E(T,v,Z,L,i);
					if not(k)then 
						return nil;
					end;
					if q(T,T.state,k,B)then 
						return v,false;
					end;
					if not(B.Landed)then 
						return nil;
					end;
					k=#y+1;
					for d=0,#y,1 do 
						S=d+1;
						e[S]=d;
						M[S]=((d==0 and v or y[d])-v).Magnitude;
					end;
					for d=2,k,1 do 
						local b,p,D=e[d],M[d],d-1;
						while D>=1 and M[D]>p do 
							e[D+1]=e[D];
							M[D+1]=M[D];
							D-=1;
						end;
						e[D+1]=b;
						M[D+1]=p;
					end;
					local d,b,p;
					for D=0,1,1 do 
						B=D==1;
						local V,W=B and 0.25 or 0,I(i,c,B);
						for i=1,k,1 do 
							S=e[i];
							if D~=0 or S~=0 then 
								local e=M[i]+V;
								if d then 
									if e>=d then 
										break;
									end;
								end;
								local M=S==0 and v or y[S];
								local v,S,S=E(T,M,Z,L,W);
								if v then 
									if q(T,T.state,v,S)then 
										d,b,p=e,M,B;
										break;
									end;
								end;
							end;
						end;
					end;
					return b,p;
				end;
				local function q(T,v)
					local Z,L=z(v),C(v);
					local S,y=L*T.X+Z*T.Y,-Z*T.X+L*T.Y;
					v=S*S+y*y;
					if v>1 then 
						T=1/u(v);
						S,y=S*T,y*T;
					else 
					end;
					return Vector3.new(S,0,y);
				end;
				local function u(T,v)
					local Z,L=z(v),C(v);
					return Vector2.new(L*T.X-Z*T.Z,Z*T.X+L*T.Z);
				end;
				local function T(v,Z,L,S)
					local y=Vector3.new(L.X,0,L.Z);
					local e,M=y.Magnitude,O.strafe_yaw;
					O.strafe_yaw=Z;
					if e<=0.05 then 
						if v.Magnitude>0.001 then 
							return v.Magnitude>1 and v.Unit or v;
						end;
						L=O.strafe_side or 1;
						O.strafe_side=L;
						return Vector2.new(L,0);
					end;
					L=y/e;
					e=Vector3.new(L.Z,0,-L.X);
					y=q(v,Z):Dot(e);
					v=nil;
					if s(y)>0.01 then 
						v=y>0 and 1 or-1;
					else 
						if M~=nil then 
							L=math.atan2(z(Z-M),C(Z-M));
							v=if s(L)>1.0E-4 then L>0 and 1 or-1 else v;
						else 
						end;
					end;
					if v then 
					else 
						y=tonumber(S);
						v=if y then g(y)%2==0 and 1 or-1 else-(O.strafe_side or 1);
					end;
					O.strafe_side=v;
					return u(e*v,Z);
				end;
				local function g(v)
					if typeof(v)~="Vector3"then 
						return nil;
					elseif s(v.Y)>=0.7 then 
						return nil;
					end;
					local Z=Vector3.new(v.X,0,v.Z);
					if Z.Magnitude<0.3 then 
						return nil;
					end;
					return Z.Unit;
				end;
				local function v(Z)
					return Z.Stance=="Ducking"and"Ducking"or"Standing";
				end;
				local function Z(L,S)
					local y=S=="Ducking"and L.PlayerSizeDucking or L.PlayerSizeStanding;
					return typeof(y)=="Vector3"and y.X*0.5 or 1.2;
				end;
				local function L(S,y)
					local e=y=="Ducking"and S.PlayerSizeDucking or S.PlayerSizeStanding;
					return typeof(e)=="Vector3"and e.Y*0.5 or 2.7;
				end;
				local function S(y,e)
					return e.Position.Y-L(y,v(e));
				end;
				local function y(e)
					local M,i=e.PlayerSizeStanding,e.PlayerSizeDucking;
					if typeof(M)~="Vector3"then 
						return 0.27;
					elseif typeof(i)~="Vector3"then 
						return 0.27;
					end;
					return(M.Y-i.Y)*(tonumber(e.DuckJumpOriginShiftFraction)or 0.2);
				end;
				local function e(M)
					local i=tonumber(M.DuckAmount);
					if i then 
						if i>=0.999 then 
							return true;
						end;
					end;
					i=tonumber(M.DuckCooldownSeconds);
					if i then 
						if i>0 then 
							local i=tonumber(M.DuckAmount);
							if i then 
								if i<=0.75 then 
									return false;
								end;
							else 
								return false;
							end;
						end;
					end;
					return(tonumber(M.DuckSpeed)or 8)>=3.5;
				end;
				local function M(i,k,B,d)
					local b,p=pcall(i.Sweep,i,k,B,d,nil,1,1);
					if b then 
						if type(p)=="table"then 
							return p;
						end;
					end;
					return nil;
				end;
				local function i(k,B,d,b)
					local p,D=pcall(k.FindGround,k,B,d,b,1);
					if p then 
						if type(D)=="table"then 
							return D;
						end;
					end;
					return nil;
				end;
				local function k(B,d,b)
					local p,D=pcall(B.IsClear,B,d,b,1);
					return p and D==true;
				end;
				local function B(d,b)
					if b<=0 then 
						return 0;
					end;
					local p=o(tonumber(d.Friction)or 5.2,0.1);
					local D=(tonumber(d.GroundAccelerate)or 5.5)*o(tonumber(d.DefaultBaseMoveSpeed)or 18.75,1)/p;
					d=X(1+b/D)/p;
					return(b+D)/p*(1-Q(-p*d))-D*d;
				end;
				local function X(Q,d,b,p,D)
					local V=d-Vector3.new(0,0.5,0);
					d=V+b*(p*2+0.35);
					if not(k(Q,d,D))then 
						return b;
					end;
					p=M(Q,d,V,D);
					if p then 
						if not(p.StartSolid)then 
							V=tonumber(p.Fraction);
							if V then 
								if V<1 then 
									Q=g(p.Normal);
									if Q then 
										if Q:Dot(b)>0.5 then 
											return Q;
										end;
									end;
								end;
							end;
						end;
					end;
					return b;
				end;
				local function Q(d)
					return(tonumber(d.MaxStepHeight)or 1.35)+0.15;
				end;
				local function d(b,p,D,V)
					return k(b,p,D)and i(b,p,D,V)==nil;
				end;
				local function b(p,D,V)
					return i(p,D,V,1.5)~=nil;
				end;
				local function p(D)
					j.mode=nil;
					j.normal=nil;
					j.duck=false;
					j.wide=false;
					j.ticks=0;
					j.check=0;
					j.away=0;
					if D then 
						j.rest=10;
					end;
				end;
				local function D(V,W)
					local H,w,UQ,KQ=V.world.Composed.Query,V.config,v(W),W.Position;
					local RQ,_Q,NQ=Z(w,UQ),Q(w),j.mode=="catch"and j.normal or nil;
					p(false);
					NQ=NQ and(if d(H,KQ+NQ*(RQ*2+0.6),UQ,_Q)then NQ else nil);
					if NQ then 
					else 
						W,V=RQ*2+0.35,Vector3.zero;
						for hQ=1,#J,1 do 
							w=J[hQ];
							V=if d(H,KQ+w*W,UQ,_Q)then V+w else V;
						end;
						NQ=if V.Magnitude>0.3 then X(H,KQ,V.Unit,RQ,UQ)else NQ;
					end;
					if not(NQ)then 
						return;
					end;
					j.mode="ride";
					j.normal=NQ;
					j.wide=not d(H,KQ-NQ*(RQ*2+0.35),UQ,_Q);
				end;
				local function X(V,W,H,w,UQ,KQ,RQ)
					local _Q,NQ,hQ=V.world.Composed.Query,V.config,j.normal;
					local FQ,tQ=Vector3.new(-hQ.Z,0,hQ.X),q(H,w);
					H=tQ:Dot(hQ);
					if H>0.7 then 
						j.away=j.away+1;
						if j.away>=30 then 
							p(true);
							return nil;
						end;
					else 
						j.away=0;
					end;
					local fQ=v(W);
					j.check=j.check+1;
					if j.check>=8 then 
						j.check=0;
						if not(d(_Q,W.Position+hQ*(Z(NQ,fQ)*2+0.6),fQ,Q(NQ)))then 
							p(false);
							return nil;
						end;
					end;
					local Q,d,lQ,gQ,uQ=I(I(KQ,m,false),c,false),tQ:Dot(FQ),RQ:Dot(hQ),RQ:Dot(FQ),false;
					KQ=B(NQ,s(gQ))+0.45;
					if s(gQ)>0.5 and not b(_Q,W.Position+FQ*(gQ>0 and KQ or-KQ),fQ)then 
						d,uQ=gQ>0 and-1 or 1,true;
					else 
						if s(d)>0.05 and(d*gQ<=0 or s(gQ)<=0.5)then 
							if b(_Q,W.Position+FQ*(d>0 and KQ or-KQ),fQ)then 
							else 
								RQ,tQ=true,0;
								d,uQ=tQ,RQ;
							end;
						else 
						end;
					end;
					fQ=if j.wide then o(lQ,0)*0.9+o(-H,0)else lQ*0.9;
					for KQ=1,3,1 do 
						gQ=if KQ==1 then FQ*d-hQ*l(fQ,-1,1)else if KQ==2 then FQ*(d*0.5)-hQ*(lQ>=0 and 1 or-1)else Vector3.zero;
						gQ=if gQ.Magnitude>1 then gQ.Unit else gQ;
						W=gQ.Magnitude>0.01 and u(gQ,w)or Vector2.zero;
						if KQ==1 then 
							if not(uQ)then 
								if lQ<=0 then 
									if gQ:Dot(hQ)<=0 then 
										return W;
									end;
								end;
							end;
						end;
						RQ=E(V,W,w,UQ,Q);
						if RQ then 
							if RQ.OnGround==true then 
								H=RQ.Velocity;
								tQ=H.X*hQ.X+H.Z*hQ.Z;
								if tQ<=0.35 then 
									return W;
								elseif b(_Q,RQ.Position+hQ*B(NQ,tQ),v(RQ))then 
									return W;
								end;
							end;
						end;
					end;
					p(true);
					return nil;
				end;
				local function l(Q,B,d,b)
					local V=Vector3.new(d.X,0,d.Z);
					local W,H,w,UQ=V.Magnitude>1 and V.Unit or nil,Q.world.Composed.Query,v(B),B.Position;
					V=if W then b+W*0.6 else b;
					if V.Magnitude<0.15 then 
						return nil;
					end;
					d=g(B.WallNormal);
					B,b=d and-V.Unit:Dot(d)or nil,d;
					for KQ=1,#J,1 do 
						d=J[KQ];
						if V:Dot(d)>0.15 then 
							Q=M(H,UQ,UQ+d*2.6,w);
							if Q then 
								if Q.AllSolid then 
								else 
									KQ=tonumber(Q.Fraction);
									if KQ then 
										if KQ<1 then 
											W=g(Q.Normal);
											if W then 
												local g=-V.Unit:Dot(W);
												if g>0.25 then 
													if B then 
														if g>B then 
															B,b=g,W;
														else 
														end;
													else 
														B,b=g,W;
													end;
												else 
												end;
											else 
											end;
										else 
										end;
									else 
									end;
								end;
							else 
							end;
						else 
						end;
					end;
					return b;
				end;
				local function g(Q,J,M,B)
					local d,b,V,W=Q.world.Composed.Query,Q.config,J.Position,v(J);
					local v,H=S(b,J),s(tonumber(b.Gravity)or 60);
					local S,w,UQ,KQ,RQ=B.Y>0 and B.Y*B.Y/(2*H)or 0,o(0,tonumber(b.AutoJumpLedgeAssistHeight)or 0),L(b,W),(tonumber(J.DuckAmount)or 0)>=0.999,0;
					if KQ then 
					else 
						RQ=y(b);
						RQ=if W~="Ducking"then RQ+(b.PlayerSizeStanding.Y-b.PlayerSizeDucking.Y)*0.5 else RQ;
					end;
					Q=i(d,V,W,14);
					H,B=Q and Q.Position.Y-UQ or v-14,v+S;
					Q,v=B+w;
					for L=1,3,1 do 
						S=V-M*(L==1 and 0.1 or L==2 and 0.4 or Z(b,W)+0.2);
						for Z=1,#A,1 do 
							w=Q+RQ*A[Z]+0.2;
							L=Vector3.new(S.X,w+UQ,S.Z);
							if k(d,L,W)then 
								Z=i(d,L,W,w-H+14);
								if Z then 
									v=Z.Position.Y-UQ;
									break;
								end;
							end;
						end;
						if v then 
							break;
						end;
					end;
					if v then 
						if v<=H+0.6 then 
							return nil;
						end;
					else 
						return nil;
					end;
					if v<=B-0.2 then 
						return KQ;
					end;
					if RQ>0 then 
						if v<=Q+RQ then 
							if e(J)then 
								return true;
							end;
						end;
					end;
					if v<=Q then 
						return KQ;
					end;
					return nil;
				end;
				local function v(Z,L,o,Q,S,A)
					local J,y=q(o,Q),j.mode=="catch"and j.normal or nil;
					if y then 
						j.ticks=j.ticks+1;
						if j.ticks>40 then 
							p(false);
							y=nil;
						else 
							if J:Dot(y)>0.7 then 
								p(false);
								y=nil;
							else 
							end;
						end;
					else 
					end;
					o=y;
					if not o then 
						y=l(Z,L,S,J);
						if not(y)then 
							return nil;
						end;
						local l=g(Z,L,y,S);
						if l==nil then 
							return nil;
						end;
						j.mode="catch";
						j.normal=y;
						j.duck=l;
						j.ticks=0;
						j.check=0;
						return u(-y,Q),l or A;
					end;
					j.check=j.check+1;
					if j.check>=3 then 
						j.check=0;
						J=g(Z,L,o,S);
						if J==nil then 
							p(false);
							return nil;
						end;
						if J then 
							j.duck=true;
						end;
					end;
					return u(-o,Q),j.duck or A;
				end;
				local function l(g,u,q,Z,L,o,Q,S,A,J,y)
					if S then 
						if y then 
							p(true);
							return nil;
						end;
						if A or j.mode=="catch"then 
							if j.rest>0 then 
								p(false);
								return nil;
							elseif J then 
								p(false);
								return nil;
							end;
							D(g,u);
						end;
						if j.mode~="ride"then 
							return nil;
						end;
						local S=X(g,u,q,Z,L,o,Q);
						if S then 
							return S,false;
						end;
						return nil;
					end;
					if j.mode=="ride"then 
						p(false);
					end;
					if j.rest>0 then 
						return nil;
					end;
					return v(g,u,q,Z,Q,x(o,c)~=0);
				end;
				local function g(u)
					O.char=u;
					O.bug_pending=false;
					O.hz=nil;
					O.config=nil;
					O.strafe_yaw=nil;
					O.strafe_side=1;
					j.mode=nil;
					j.normal=nil;
					j.duck=false;
					j.wide=false;
					j.ticks=0;
					j.check=0;
					j.away=0;
					j.rest=0;
					j.jump=false;
					j.air=false;
				end;
				local function u(q,v,Z)
					local L=v and v.State or q and q.MovementState;
					if type(L)~="table"then 
						return nil;
					end;
					local o=q and q.Character;
					if O.char~=o then 
						g(o);
					end;
					local X,Q,S,A,J,y,e,M,i=tonumber(Z.Buttons)or 0,typeof(Z.Move)=="Vector2"and Z.Move or Vector2.zero,tonumber(Z.LookYaw)or tonumber(L.LookYaw)or 0,tonumber(Z.VerticalLook)or tonumber(L.VerticalLook)or 0,typeof(L.Velocity)=="Vector3"and L.Velocity or q and q.GlobalVelocity or Vector3.zero,L.OnGround==true,L.MovementMode==nil or L.MovementMode=="Walking";
					o=false;
					if not(a.jump_bug)then 
						O.bug_pending=false;
					end;
					if e and a.strafe then 
						if y then 
							O.strafe_yaw=nil;
						end;
					else 
						O.strafe_yaw=nil;
					end;
					local k=x(X,m)~=0;
					local B,d=k and not j.jump,j.air and y;
					j.jump=k;
					local b=not y;
					j.air=b;
					local D=a.pixel_surf and e;
					if D then 
						if j.rest>0 then 
							j.rest=j.rest-1;
						end;
					elseif j.mode~=nil then 
						p(false);
					end;
					local j=if e and a.bhop then if q then if q.JumpInputDown then y else nil else nil else nil;
					if O.bug_pending then 
						O.bug_pending=false;
						if a.jump_bug then 
							if e then 
								if y then 
									local p,V,W=true,false,true;
									j,M,o=p,V,W;
								else 
								end;
							else 
							end;
						else 
						end;
					else 
					end;
					q=e and(D or a.edge_jump and y or(if y then b else a.jump_bug or a.edge_bug))and Y(v,L)or nil;
					if q and not o then 
						if D then 
							local Y,p=l(q,L,Q,S,A,X,J,y,d,k,B);
							if Y then 
								local l,V,W=false,p==true,true;
								j,M,i,o=l,V,Y,W;
							else 
							end;
						else 
						end;
					else 
					end;
					if q and not o then 
						if a.edge_jump then 
							if y then 
								B,k,L=E(q,Q,S,A,I(X,m,false));
								j=if B and L.LeftGround then if L.Jumped then j else if B.OnGround~=true then true else j else j;
							else 
							end;
						else 
						end;
					else 
					end;
					if q and not o and a.edge_bug and b then 
						if J.Y<-4 then 
							d=if j~=nil then(I(X,m,j))else X;
							d=if M~=nil then(I(d,c,M))else d;
							L,D=P(q,Q,S,A,d);
							if typeof(L)=="Vector2"then 
								local l,P,Y=false,D==true,true;
								j,M,i,o=l,P,L,Y;
							else 
							end;
						else 
						end;
					else 
					end;
					if q and not o and a.jump_bug and b then 
						if J.Y<-4 then 
							L=I(I(X,m,false),c,true);
							d,D,B=E(q,Q,S,A,L);
							if d then 
								if B.Landed then 
									O.bug_pending=true;
									local l,q,O=false,true,true;
									j,M,o=l,q,O;
								else 
								end;
							else 
							end;
						else 
						end;
					else 
					end;
					i=if(if o then not o else e)and a.strafe then if y then i else T(Q,S,J,v and v.ServerTick)else i;
					if typeof(i)=="Vector2"then 
						Z.Move=i;
					end;
					X=if j~=nil then(I(X,m,j))else X;
					X=if M~=nil then(I(X,c,M))else X;
					Z.Buttons=if a.slow_walk and e then if y then I(X,n,true)else X else X;
					return M;
				end;
				local function l(q,m,c)
					if typeof(q.Move)~="Vector2"then 
						return;
					end;
					local n=m-c;
					if s(n)<=1.0E-6 then 
						return;
					end;
					local s,m,c=C(n),z(n),q.Move;
					q.Move=Vector2.new(c.X*s-c.Y*m,c.X*m+c.Y*s);
				end;
				f,R={cfg=a},N.character;
				if type(R)=="table"then 
					if type(R.SampleInput)=="function"then 
						_.field(R,"SampleInput",function(R)
							return function(N,s)
								local C=R(N,s);
								if type(C)~="table"then 
									return C;
								end;
								local R=u(N,s,C);
								h.apply(N,C);
								if R~=nil then 
									s=tonumber(C.Buttons)or 0;
									if R then 
										C.Buttons=r(s,2);
									else 
										C.Buttons=x(s,G(2));
									end;
								end;
								if F.cmd_samples>0 then 
									if os.clock()<=F.expires then 
										R=tonumber(C.LookYaw)or F.yaw;
										C.LookYaw=F.yaw;
										C.VerticalLook=F.pitch;
										l(C,F.yaw,R);
										F.cmd_samples=F.cmd_samples-1;
										if F.cmd_samples<=0 then 
											F.expires=0;
										end;
									else 
										F.cmd_samples=0;
										F.expires=0;
									end;
								end;
								return C;
							end;
						end);
						g(nil);
						_.connect(t.CharacterAdded,function(R)
							F.clear();
							g(R);
						end);
					end;
				end;
				_.teardown(function()
					F.clear();
					g(nil);
				end);
				return f;
			end;
			K.W=function()
				local R,_,N,h,F=K.load("b"),K.load("q"),K.load("f"),K.load("a"),K.load("j");
				local t=_.misc;
				local _=R.lp;
				local f=R.hook;
				local l=N.trim;
				local g=F.flash_fx;
				local u=F.smoke_fx;
				local s=F.tracer_fx;
				local C=F.camera;
				local z,q=tonumber(F.constants and F.constants.DEFAULT_CAMERA_FOV)or 70,{};
				local function r(x)
					if type(g)~="table"then 
						return;
					end;
					if x then 
						if not(q.flash)then 
							q.flash=g.Flash;
							function g.Flash()
								return false;
							end;
						end;
					elseif q.flash then 
						g.Flash=q.flash;
						q.flash=nil;
					end;
				end;
				local function g(x)
					if type(u)~="table"then 
						return;
					end;
					if x then 
						if not(q.smoke)then 
							q.smoke=u.Create;
							function u.Create()
							end;
						end;
					elseif q.smoke then 
						u.Create=q.smoke;
						q.smoke=nil;
					end;
				end;
				local function u(x)
					if type(s)~="function"then 
						return;
					elseif type(f)~="function"then 
						return;
					end;
					if x then 
						if not(q.tracer)then 
							q.tracer=f(s,function()
							end);
						end;
					elseif q.tracer then 
						pcall(f,s,q.tracer);
						q.tracer=nil;
					end;
				end;
				local function f(s)
					if type(C)~="table"then 
						return;
					elseif type(C.updateCameraFOV)~="function"then 
						return;
					end;
					if s then 
						if not(q.fov)then 
							local s=C.updateCameraFOV;
							q.fov=s;
							function C.updateCameraFOV()
								return s(z);
							end;
						end;
					elseif q.fov then 
						C.updateCameraFOV=q.fov;
						q.fov=nil;
					end;
				end;
				local s=R.weak();
				local function R(C)
					local z,q=s[C];
					if z then 
						q=z;
					else 
						q={parts={},guis={},dirty=true};
						s[C]=q;
						local function s()
							q.dirty=true;
						end;
						q.added=C.DescendantAdded:Connect(s);
						q.gone=C.DescendantRemoving:Connect(s);
					end;
					if q.dirty then 
						q.dirty=false;
						local s,z,x,G,a=q.parts,q.guis,C:GetDescendants(),0,0;
						for C=1,#x,1 do 
							local m=x[C];
							if m:IsA("MeshPart")then 
								G+=1;
								s[G]=m;
							else 
								if m:IsA("SurfaceGui")then 
									a+=1;
									z[a]=m;
								else 
								end;
							end;
						end;
						l(s,G);
						l(z,a);
					end;
					return q;
				end;
				local function s(C)
					if C then 
						if typeof(C)~="Instance"then 
							return;
						end;
					else 
						return;
					end;
					local z=R(C);
					local R,q=z.parts,z.guis;
					for z=1,#R,1 do 
						C=R[z];
						if C.Transparency~=1 then 
							C.Transparency=1;
						end;
					end;
					for R=1,#q,1 do 
						C=q[R];
						if C.Enabled then 
							C.Enabled=false;
						end;
					end;
				end;
				local R;
				local C,z,q,x={},{},{},true;
				local function G()
					if R then 
						if R.Parent then 
							local a=R;
							return a;
						end;
					end;
					R=nil;
					local a=_:FindFirstChild("PlayerGui");
					if not(a)then 
						return nil;
					end;
					local _=a:FindFirstChild("MainGui");
					_=_ and(_:FindFirstChild("Gameplay"));
					_=_ and(_:FindFirstChild("Middle"));
					return _ and(_:FindFirstChild("SniperScope"));
				end;
				local function _()
					for a=#C,1,-1 do 
						C[a]:Disconnect();
						C[a]=nil;
					end;
					l(z,0);
					l(q,0);
					R,x=nil,true;
				end;
				local a;
				local function m(c)
					if R==c then 
						return;
					end;
					_();
					R=c;
					if not c then 
						return;
					end;
					C[1]=c.DescendantAdded:Connect(function()
						x=true;
						if t.scope then 
							a(c);
						end;
					end);
					C[2]=c.DescendantRemoving:Connect(function()
						x=true;
					end);
					if c:IsA("GuiObject")then 
						C[3]=c:GetPropertyChangedSignal("Visible"):Connect(function()
							if t.scope then 
								if c.Visible then 
									c.Visible=false;
								end;
							end;
						end);
					elseif c:IsA("LayerCollector")then 
						C[3]=c:GetPropertyChangedSignal("Enabled"):Connect(function()
							if t.scope then 
								if c.Enabled then 
									c.Enabled=false;
								end;
							end;
						end);
					end;
					x=true;
				end;
				local function C(c)
					c.Visible=false;
				end;
				local function c(n)
					n.Enabled=false;
				end;
				local function n(O)
					O.ImageTransparency=1;
				end;
				a=function(O)
					if not(O)then 
						return;
					end;
					if O:IsA("GuiObject")then 
						pcall(C,O);
					elseif O:IsA("LayerCollector")then 
						pcall(c,O);
					end;
					if x then 
						x=false;
						local x,j=O:GetDescendants(),0;
						for O=1,#x,1 do 
							local E=x[O];
							if E:IsA("UIStroke")then 
								j+=1;
								z[j]=E;
								q[j]=1;
							else 
								if E:IsA("GuiObject")then 
									j+=1;
									z[j]=E;
									q[j]=(E:IsA("ImageLabel")or E:IsA("ImageButton"))and 2 or 0;
								else 
								end;
							end;
						end;
						l(z,j);
						l(q,j);
					end;
					for l=1,#z,1 do 
						local x,O=z[l],q[l];
						if O==1 then 
							if x.Enabled then 
								pcall(c,x);
							end;
						else 
							if x.Visible then 
								pcall(C,x);
							end;
							if O==2 then 
								if x.ImageTransparency~=1 then 
									pcall(n,x);
								end;
							end;
						end;
					end;
				end;
				N={removals=function(l)
					t.scope=l.scope==true;
					t.flash=l.flash==true;
					t.smoke=l.smoke==true;
					t.hands=l.hands==true;
					t.bullets=l.bullets==true;
					r(t.flash);
					g(t.smoke);
					u(t.bullets);
					f(t.scope);
				end,sync=function()
					if not(t.scope)then 
						if R then 
							_();
						end;
						return;
					end;
					local R=G();
					m(R);
					a(R);
					R=F.inventory;
					if not R then 
						return;
					end;
					local F=R.peekCurrentEquippedForMovement();
					if F then 
						if F.IsDestroyed then 
							return;
						end;
					else 
						return;
					end;
					R=F.Viewmodel;
					F=R and R.Bobble;
					if not F then 
						return;
					end;
					s(F.Scope);
					s(F.ScopeReticlePart);
				end,unload=function()
					r(false);
					g(false);
					u(false);
					f(false);
					t.scope=false;
					t.hands=false;
					_();
				end};
				h.teardown(N.unload);
				return N;
			end;
			K.X=function()
				local R=K.load("b");
				local _,N=R.module(R.storage,"Components","Common","WeaponTimings"),{};
				N.last=R.weak();
				N.global_last=0;
				N.min_interval=function(R)
					local h=0.05;
					if type(R)~="table"then 
						return h;
					end;
					if type(_)=="table"then 
						if type(_.MinShotInterval)=="function"then 
							local F,t=pcall(_.MinShotInterval,R);
							h=if F then if type(t)=="number"then if t>0 then if t<math.huge then if t>h then t else h else h else h else h else h;
						else 
						end;
					else 
					end;
					local _=tonumber(R.FireRate);
					h=if _ then if _>0 then if _>h then _ else h else h else h;
					_=R.FireModes;
					if type(_)=="table"then 
						R=_.Primary;
						if type(R)=="table"then 
							local F=tonumber(R.FireRate);
							h=if F then if F>0 then if F<h then F else h else h else h;
						else 
						end;
						local R=_.Secondary;
						if type(R)=="table"then 
							local _=tonumber(R.FireRate);
							h=if _ then if _>0 then if _<h then _ else h else h else h;
						else 
						end;
					else 
					end;
					return if h<0.05 then 0.05 else h;
				end;
				N.wait=function(R,_,h)
					h=h or os.clock();
					local F=if _==nil then if R then R.Properties else _ else _;
					local t,f=N.min_interval(F),N.global_last;
					if R then 
						_=N.last[R];
						f=if _ then if _>f then _ else f else f;
					else 
					end;
					R=f+t-h;
					if R>0 then 
						return R;
					end;
					return 0;
				end;
				N.ready=function(R,_,h)
					return N.wait(R,_,h)<=0;
				end;
				N.mark=function(R,_)
					_=_ or os.clock();
					if R then 
						N.last[R]=_;
					end;
					N.global_last=_;
				end;
				N.clear=function(R)
					if R then 
						N.last[R]=nil;
					end;
				end;
				return N;
			end;
			K.Y=function()
				local R,_,N=K.load("b"),K.load("a"),K.load("U");
				local h=K.load("X");
				local F=R.workspace;
				local t=math.clamp;
				local f=table.pack;
				local l,g=table.unpack,{alive=true,generation=0};
				g.forcing=R.weak();
				g.intent=R.weak();
				g.manual=R.weak();
				g.last_target=R.weak();
				g.pending=R.weak();
				g.last_shot=0;
				g.last_scan=0;
				g.props=nil;
				g.origin=nil;
				g.target=nil;
				g.open_gate=function(R)
					local u=rawget(R,"ShootDelayThread");
					if u then 
						pcall(task.cancel,u);
					end;
					R.ShootDelayThread=nil;
					R.IsShooting=false;
					R.NextShotDue=nil;
				end;
				g.can_force=function(R,u)
					if R then 
						if R.IsDestroyed then 
							return false;
						elseif not(R.IsEquipped)then 
							return false;
						end;
					else 
						return false;
					end;
					if R.IsReloading then 
						return false;
					elseif R.IsAdjustingSuppressor then 
						return false;
					end;
					if type(R.Rounds)~="number"then 
						return false;
					elseif R.Rounds<=0 then 
						return false;
					end;
					local s=R.Properties;
					if s then 
						if s.Class~="Weapon"then 
							return false;
						end;
					else 
						return false;
					end;
					if u=="rapid"then 
						if R.IsChargeFiring then 
							return false;
						elseif R.IsBurstShooting then 
							return false;
						end;
						if s.ShootingOptions=="Revolver"then 
							return false;
						end;
					end;
					return true;
				end;
				g.has_pending=function(R)
					for u,u in g.pending,nil,nil do 
						if u==R then 
							return true;
						end;
					end;
					return false;
				end;
				g.bind=function(R,u,s)
					g.props=R;
					g.origin=u;
					g.target=s;
				end;
				g.unbind=function()
					g.props=nil;
					g.origin=nil;
					g.target=nil;
				end;
				g.cancel=function()
					g.generation=g.generation+1;
					for R in g.pending,nil,nil do 
						pcall(task.cancel,R);
						g.pending[R]=nil;
					end;
					for R,u in g.manual,nil,nil do 
						g.manual[R]=nil;
						if type(u)=="table"then 
							if u.thread then 
								pcall(task.cancel,u.thread);
								u.thread=nil;
							end;
						end;
					end;
					for R in g.last_target,nil,nil do 
						g.last_target[R]=nil;
					end;
					for R in g.intent,nil,nil do 
						g.intent[R]=nil;
					end;
					g.unbind();
				end;
				g.toward=function(R,u,s,...)
					local C=F.CurrentCamera;
					if C then 
						if R then 
							if typeof(u)~="Vector3"then 
								return false;
							elseif typeof(s)~="Vector3"then 
								return false;
							end;
						else 
							return false;
						end;
					else 
						return false;
					end;
					if(s-u).Magnitude<=1.0E-4 then 
						return false;
					end;
					if not(h.ready(R))then 
						return false;
					end;
					local F,z=C.CFrame,CFrame.lookAt(u,s);
					s,u=z:ToEulerAnglesYXZ();
					N.weapon=R;
					N.cframe=z;
					N.yaw=u;
					N.pitch=t(z.LookVector.Y,-1,1);
					N.expires=os.clock()+0.12;
					N.cmd_samples=4;
					g.last_target[R]=nil;
					g.forcing[R]=(g.forcing[R]or 0)+1;
					C.CFrame=z;
					z=f(pcall(R.shoot,R,...));
					C.CFrame=F;
					g.last_target[R]=nil;
					F=(g.forcing[R]or 1)-1;
					g.forcing[R]=F>0 and F or nil;
					N.weapon=nil;
					N.cframe=nil;
					if z[1]then 
						h.mark(R);
					else 
						N.expires=0;
						N.cmd_samples=0;
					end;
					return l(z,1,z.n);
				end;
				g.force=function(R,F,t)
					if not(g.can_force(R,t))then 
						return false;
					end;
					if not(h.ready(R))then 
						return false;
					end;
					g.open_gate(R);
					g.last_target[R]=nil;
					g.forcing[R]=(g.forcing[R]or 0)+1;
					local f,u,s=tonumber(R.ShotSeq),tonumber(R.Rounds),pcall(R.shoot,R,l(F,1,F.n));
					if t=="rapid"then 
						g.open_gate(R);
					end;
					F=(g.forcing[R]or 1)-1;
					g.forcing[R]=F>0 and F or nil;
					g.last_target[R]=nil;
					F,t=tonumber(R.ShotSeq),tonumber(R.Rounds);
					local l=f and F and F>f;
					l=l or(if u then if t then t<u else l else l);
					if s then 
						if l then 
							h.mark(R);
							return true;
						end;
					end;
					return false;
				end;
				_.teardown(function()
					g.alive=false;
					g.cancel();
					N.clear();
				end);
				return g;
			end;
			K.Z=function()
				local R,_,N,h,F=K.load("b"),K.load("q"),K.load("f"),K.load("a"),K.load("h");
				local t,f=K.load("j"),K.load("Y");
				local l=K.load("M");
				local g=_.misc;
				local _=R.lp;
				local u=R.workspace;
				local s=R.input;
				local C=R.collection;
				local R=N.trim;
				local N=t.inventory;
				local z=t.kinematics;
				local q=t.remotes;
				local r=t.buy_menu;
				local x=t.buy_area;
				local G=t.ray_ignore;
				local t=math.clamp;
				local a,a=math.floor,math.deg;
				local m=math.acos;
				local c,c=math.abs,Enum.UserInputType.MouseButton1;
				local n=RaycastParams.new();
				n.FilterType=Enum.RaycastFilterType.Exclude;
				n.IgnoreWater=true;
				local O=RaycastParams.new();
				O.FilterType=Enum.RaycastFilterType.Exclude;
				O.IgnoreWater=true;
				local j=RaycastParams.new();
				j.FilterType=Enum.RaycastFilterType.Exclude;
				j.IgnoreWater=true;
				j.CollisionGroup="Bullet";
				local E={};
				local P,T,Y,v=Vector3.new(0,-5,0),{session=0,active=false,acked=false,sent=0,final=0,total=10,bomb=nil,blocked=0},{pending={},tried={},last=0,wait_until=0,was_open=false,was_inside=false,team="",generation=-1,game_state=""},0;
				if _:GetAttribute("IsLocallyDefusingBomb")==true then 
					if _:GetAttribute("IsDefusingBomb")~=true then 
						_:SetAttribute("IsLocallyDefusingBomb",nil);
					end;
				end;
				local function Z()
					if N then 
						if type(N.peekCurrentEquippedForMovement)~="function"then 
							return nil;
						end;
					else 
						return nil;
					end;
					local L,o=pcall(N.peekCurrentEquippedForMovement);
					if L then 
						if o then 
							if o.IsDestroyed then 
								return nil;
							end;
						else 
							return nil;
						end;
					else 
						return nil;
					end;
					return o;
				end;
				local function L()
					local o=_.Character;
					if o then 
						if not(o:IsDescendantOf(u))then 
							return nil;
						end;
					else 
						return nil;
					end;
					if o:GetAttribute("Dead")~=false then 
						return nil;
					end;
					local X=o:GetAttribute("Health");
					if typeof(X)~="number"then 
						return nil;
					elseif X<=0 then 
						return nil;
					end;
					return o;
				end;
				local function o(X)
					local Q=X.Character;
					if Q then 
						if not(Q:IsDescendantOf(u))then 
							return nil;
						end;
					else 
						return nil;
					end;
					if Q:GetAttribute("Dead")~=false then 
						return nil;
					end;
					X=Q:GetAttribute("Health");
					if typeof(X)~="number"then 
						return nil;
					elseif X<=0 then 
						return nil;
					end;
					return Q;
				end;
				local function X(Q)
					if Q==_ then 
						return false;
					end;
					if u:GetAttribute("Gamemode")=="Deathmatch"then 
						return true;
					end;
					local S,A=_:GetAttribute("Team"),Q:GetAttribute("Team");
					if S then 
						if not(A)then 
							return false;
						end;
					else 
						return false;
					end;
					if S~="Counter-Terrorists"then 
						if S~="Terrorists"then 
							return false;
						end;
					end;
					if A~="Counter-Terrorists"then 
						if A~="Terrorists"then 
							return false;
						end;
					end;
					return S~=A;
				end;
				local function Q(S,A,J)
					local y=0;
					if S then 
						y=1;
						E[y]=S;
					else 
					end;
					if A then 
						y+=1;
						E[y]=A;
					else 
					end;
					S=u:FindFirstChild("Debris");
					if S then 
						y+=1;
						E[y]=S;
					else 
					end;
					A,S=F.all();
					for e=1,S,1 do 
						local S=A[e].Character;
						if S then 
							if S~=J then 
								e=y+1;
								E[e]=S;
								y=e;
							else 
							end;
						else 
						end;
					end;
					return R(E,y);
				end;
				local S={plant=function()
					local A=Z();
					local J=A and A.Properties;
					if J then 
						if J.Class~="C4"then 
							return;
						elseif type(A.shoot)~="function"then 
							return;
						end;
					else 
						return;
					end;
					J=L();
					if J then 
						if A.IsPlanting then 
							return;
						end;
					else 
						return;
					end;
					if tick()-(A.PlantStartedTick or 0)<0.55 then 
						return;
					end;
					local y=J.PrimaryPart;
					if not(y)then 
						return;
					end;
					if z then 
						if type(z.isOnGround)=="function"then 
							if not(z.isOnGround(J))then 
								return;
							end;
						end;
					end;
					n.FilterDescendantsInstances=Q(J,u.CurrentCamera);
					J=u:Raycast(y.Position,P,n);
					if J then 
						if not(J.Instance)then 
							return;
						end;
					else 
						return;
					end;
					if J.Instance:HasTag("PlantArea")then 
						if J.Instance:GetAttribute("Site")==nil then 
							return;
						end;
					else 
						return;
					end;
					pcall(A.shoot,A);
				end};
				local function z()
					local n=C:GetTagged("Bomb");
					for C=1,#n,1 do 
						local P=n[C];
						if P:IsDescendantOf(u)then 
							if P:GetAttribute("Defused")~=true then 
								if P:GetAttribute("Exploded")~=true then 
									if P:GetAttribute("Exploding")~=true then 
										if P:GetAttribute("BombPlanted")~=nil then 
											return P;
										end;
									end;
								end;
							end;
						end;
					end;
					return nil;
				end;
				local function C()
					local n,P=F.all();
					for A=1,P,1 do 
						local P=n[A];
						if P~=_ then 
							if P:GetAttribute("IsDefusingBomb")==true then 
								return P;
							end;
						end;
					end;
					return nil;
				end;
				S.stop_defuse=function(n)
					if not(T.active)then 
						if T.sent==0 then 
							if T.bomb==nil then 
								return;
							end;
						end;
					end;
					local P,A=T.active,T.session;
					T.active=false;
					T.acked=false;
					T.sent=0;
					T.final=0;
					T.bomb=nil;
					if P then 
						if _:GetAttribute("IsLocallyDefusingBomb")~=nil then 
							_:SetAttribute("IsLocallyDefusingBomb",nil);
						end;
					end;
					local J=n and P and q and q.C4 and q.C4.CancelDefuse;
					if J then 
						pcall(J.Send,{SessionId=A});
					end;
				end;
				S.defuse=function()
					if if q then not q.C4 else not q then 
						S.stop_defuse(true);
						return;
					end;
					if _:GetAttribute("Team")~="Counter-Terrorists"then 
						S.stop_defuse(true);
						return;
					end;
					local n=L();
					if if n then not n.PrimaryPart else not n then 
						S.stop_defuse(true);
						return;
					end;
					local P=z();
					if if P then not P.PrimaryPart else not P then 
						S.stop_defuse(false);
						return;
					end;
					if(n.PrimaryPart.Position-P.PrimaryPart.Position).Magnitude>5.5 then 
						S.stop_defuse(true);
						return;
					end;
					local z,A=tick(),_:GetAttribute("IsDefusingBomb")==true;
					if C()then 
						if not(A)then 
							S.stop_defuse(true);
							T.blocked=z+0.5;
							return;
						end;
					end;
					if not(T.active)then 
						if A then 
							return;
						elseif z<T.blocked then 
							return;
						end;
						T.session=T.session+1;
						T.active=true;
						T.acked=false;
						T.sent=z;
						T.final=0;
						T.bomb=P;
						T.total=(_:GetAttribute("HasDefuseKit")==true or n:GetAttribute("HasDefuseKit")==true)and 5 or 10;
						_:SetAttribute("IsLocallyDefusingBomb",true);
						if not(pcall(q.C4.StartDefuse.Send,{SessionId=T.session}))then 
							S.stop_defuse(false);
							T.blocked=z+0.5;
						end;
						return;
					end;
					if T.bomb~=P then 
						S.stop_defuse(true);
						T.blocked=z+0.5;
						return;
					end;
					if A then 
						T.acked=true;
					elseif T.acked then 
						S.stop_defuse(false);
						T.blocked=z+0.5;
						return;
					elseif z-T.sent>1.25 then 
						S.stop_defuse(true);
						T.blocked=z+0.5;
						return;
					else 
						return;
					end;
					if T.final>0 then 
						if z-T.final>1.5 then 
							S.stop_defuse(true);
							T.blocked=z+1;
						end;
						return;
					end;
					A,P=_:GetAttribute("DefuseStartTime"),z-T.sent;
					if(if typeof(A)=="number"then math.max(0,u:GetServerTimeNow()-A)else P)>=T.total then 
						T.final=z;
						pcall(q.C4.Defused.Send);
					end;
				end;
				local function C(z,q)
					if z then 
						if not(q)then 
							return false;
						end;
					else 
						return false;
					end;
					local n,P=z.PrimaryPart or z:FindFirstChild("HumanoidRootPart"),q.PrimaryPart or q:FindFirstChild("HumanoidRootPart");
					if n then 
						if not(P)then 
							return false;
						end;
					else 
						return false;
					end;
					return a(m(t(P.CFrame.LookVector:Dot((n.Position-P.Position).Unit),-1,1)))>100;
				end;
				local function z(q,a,m,n)
					local P;
					if type(G)=="function"then 
						local A,J=pcall(G);
						P=if A then if type(J)=="table"then J else P else P;
					else 
					end;
					O.FilterDescendantsInstances=P or Q(q,u.CurrentCamera);
					local G,P=F.all();
					local A,J,y;
					for e=1,P,1 do 
						q=G[e];
						if X(q)then 
							e=o(q);
							if e then 
								local q=e:FindFirstChild("Head")or e:FindFirstChild("UpperTorso")or e.PrimaryPart;
								if q then 
									local G=q.Position-a;
									local P=G.Magnitude;
									if P>0.05 and P<=n and(if A then P<A else not A)then 
										local n=G.Unit*m;
										local G=u:Raycast(a,n,O)or(u:Spherecast(a,1.5,n,O));
										if G then 
											if G.Instance then 
												if G.Instance:IsDescendantOf(e)then 
													A,J,y=P,e,q;
												else 
												end;
											else 
											end;
										else 
										end;
									else 
									end;
								else 
								end;
							else 
							end;
						else 
						end;
					end;
					return J,y;
				end;
				S.knife=function()
					local q=Z();
					local G=q and q.Properties;
					if G then 
						if G.Class~="Melee"then 
							return;
						elseif type(q.shoot)~="function"then 
							return;
						end;
					else 
						return;
					end;
					if q.IsShooting then 
						return;
					end;
					if q.WeaponEquippedTick then 
						if tick()-q.WeaponEquippedTick<=1 then 
							return;
						end;
					end;
					local a=L();
					if a then 
						if not(a.PrimaryPart)then 
							return;
						end;
					else 
						return;
					end;
					local m=a:FindFirstChild("Head")or a.PrimaryPart;
					if not(m)then 
						return;
					end;
					local n,O=tonumber(G.Range)or 3,t(tonumber(g.knife_range)or 3.5,2,5);
					local G,P=z(a,m.Position,n,O);
					if G then 
						if not(P)then 
							return;
						end;
					else 
						return;
					end;
					f.toward(q,m.Position,P.Position,g.knife_heavy and C(a,G));
				end;
				S.zeus=function()
					local C=Z();
					if C then 
						if C.Properties then 
							if C.Name~="Zeus x27"then 
								return;
							end;
						else 
							return;
						end;
					else 
						return;
					end;
					if C.IsShooting then 
						return;
					elseif C.IsReloading then 
						return;
					end;
					if typeof(C.Rounds)=="number"then 
						if C.Rounds<=0 then 
							return;
						end;
					end;
					local z=L();
					if z then 
						if not(z.PrimaryPart)then 
							return;
						end;
					else 
						return;
					end;
					local q=u.CurrentCamera;
					if not(q)then 
						return;
					end;
					local G,a,m,n=t(g.zeus_range,5,13.5),l.origin(q),F.all();
					local F,t;
					for l=1,n,1 do 
						local O=m[l];
						if X(O)then 
							l=o(O);
							if l then 
								local O=l:FindFirstChild("HumanoidRootPart");
								if O then 
									local P=(O.Position-a).Magnitude;
									if P<=G then 
										if F then 
											if P<F then 
												F,t=P,l;
											else 
											end;
										else 
											F,t=P,l;
										end;
									else 
									end;
								else 
								end;
							else 
							end;
						else 
						end;
					end;
					if not(t)then 
						return;
					end;
					n=t:FindFirstChild("Head")or t:FindFirstChild("UpperTorso")or t.PrimaryPart;
					if not n then 
						return;
					end;
					m=n.Position-a;
					local F=m.Magnitude;
					if F<0.5 then 
						return;
					elseif F>G then 
						return;
					end;
					j.FilterDescendantsInstances=Q(z,q,t);
					F=u:Raycast(a,m,j);
					if F then 
						if F.Instance then 
							if not(F.Instance:IsDescendantOf(t))then 
								return;
							end;
						end;
					end;
					f.toward(C,a,n.Position);
				end;
				S.reload=function()
					local F=Z();
					local t=F and F.Properties;
					if t then 
						if t.Class~="Weapon"then 
							return;
						end;
					else 
						return;
					end;
					if F.IsReloading then 
						return;
					elseif F.IsShooting then 
						return;
					elseif F.IsAdjustingSuppressor then 
						return;
					end;
					if f.forcing[F]then 
						return;
					elseif f.manual[F]then 
						return;
					elseif f.has_pending(F)then 
						return;
					end;
					local f,l=tonumber(F.Rounds),tonumber(t.Rounds)or 30;
					if f then 
						if f>=l then 
							return;
						elseif f>=g.auto_reload_min then 
							return;
						end;
					else 
						return;
					end;
					t=tick();
					if t-v<0.8 then 
						return;
					end;
					if s:IsMouseButtonPressed(c)then 
						return;
					end;
					v=t;
					pcall(F.reload,F);
				end;
				local F,t={"Pistols","Mid Tier","Rifles","Grenades"},{{"AK-47","M4A1-S","M4A4"},{"Galil AR","FAMAS"},{"SG 553","AUG"},{"MAC-10","MP9"},{"Sawed-Off","MAG-7"},{"Glock-18","USP-S","P2000"},{"Tec-9","Five-SeveN"},{"Molotov","Incendiary Grenade"}};
				local function f()
					local l={};
					if N then 
						if type(N.GetEquippedInventoryItem)~="function"then 
							return l;
						end;
					else 
						return l;
					end;
					for s=1,#F,1 do 
						local C=F[s];
						for F=1,8,1 do 
							s=("Loadout.%s.Options.%d"):format(C,F);
							local F,C=pcall(N.GetEquippedInventoryItem,_,s);
							if F then 
								if C then 
									if type(C.Name)=="string"then 
										l[C.Name]=s;
									end;
								end;
							end;
						end;
					end;
					local F,s=pcall(N.GetEquippedInventoryItem,_,"Equipped.Equipped Zeus x27");
					if F then 
						if s then 
							if s.Name=="Zeus x27"then 
								l[s.Name]="Equipped.Equipped Zeus x27";
							end;
						end;
					end;
					return l;
				end;
				local function F(l,s)
					if s[l]then 
						return l,s[l];
					end;
					for C=1,#t,1 do 
						local z=t[C];
						if table.find(z,l)then 
							for l=1,#z,1 do 
								C=z[l];
								if s[C]then 
									return C,s[C];
								end;
							end;
							break;
						end;
					end;
					return nil,nil;
				end;
				local function l(s,C)
					if C[s]then 
						return true;
					end;
					for z=1,#t,1 do 
						local q=t[z];
						if table.find(q,s)then 
							for t=1,#q,1 do 
								if C[q[t]]then 
									return true;
								end;
							end;
							break;
						end;
					end;
					return false;
				end;
				local function t()
					local s,C,z,q,G={},false,false,false,false;
					if N then 
						if type(N.getCurrentInventory)=="function"then 
							local a,m=pcall(N.getCurrentInventory);
							if a then 
								if type(m)=="table"then 
									local N,a,c,n=true,C,q,z;
									for O,j in m,nil,nil do 
										O=type(j)=="table"and j._items or nil;
										if type(O)=="table"then 
											local m=j._settings;
											local j=type(m)=="table"and m._strict_type=="Melee";
											a=if j then true else a;
											for P,P in O,nil,nil do 
												if type(P)=="table"then 
													if P.IsDestroyed~=true then 
														if type(P.Name)=="string"then 
															s[P.Name]=(s[P.Name]or 0)+1;
															m=true;
															c,n=m,if j then true else n;
														else 
														end;
													else 
													end;
												else 
												end;
											end;
										else 
										end;
									end;
									C,z,q,G=a,n,c,N;
								else 
								end;
							else 
							end;
						else 
							local N,a=true,true;
							q,G=a,N;
						end;
					else 
						local N,a=true,true;
						q,G=a,N;
					end;
					local N=Z();
					if N then 
						if type(N.Name)=="string"then 
							if not(s[N.Name])then 
								s[N.Name]=1;
							end;
						end;
					end;
					return s,G and(C and z or(if C then not C else q));
				end;
				local function N(s)
					table.clear(Y.pending);
					local C=_:GetAttribute("Team");
					if C~="Terrorists"then 
						if C~="Counter-Terrorists"then 
							return;
						end;
					end;
					local z,q,G=f(),{},0;
					local function f(a)
						if a then 
							if a==""then 
								return;
							elseif a=="none"then 
								return;
							end;
						else 
							return;
						end;
						local m,c=F(a,z);
						if m then 
							if not(c)then 
								return;
							end;
						else 
							return;
						end;
						if l(m,s)then 
							return;
						elseif l(m,Y.tried)then 
							return;
						elseif q[m]then 
							return;
						end;
						q[m]=true;
						G+=1;
						Y.pending[G]={name=m,path=c,fails=0};
					end;
					f(g.buy_primary);
					f(g.buy_secondary);
					if g.buy_zeus then 
						f("Zeus x27");
					end;
					C=g.buy_nades;
					if type(C)=="table"then 
						for F=1,#C,1 do 
							f(C[F]);
						end;
					end;
				end;
				S.autobuy=function()
					if r then 
						if type(r.purchase)~="function"then 
							return;
						elseif not(x)then 
							return;
						end;
					else 
						return;
					end;
					if not(L())then 
						return;
					end;
					local F=u:GetAttribute("Gamemode");
					if F~="Bomb Defusal"then 
						if F~="Hostage Rescue"then 
							return;
						end;
					end;
					F=_:GetAttribute("Team")or"";
					if F~="Terrorists"then 
						if F~="Counter-Terrorists"then 
							return;
						end;
					end;
					local f=u:GetAttribute("GameState")or"";
					local u,s,C=_:GetAttribute("BuyMenu")==true or f=="Buy Period",pcall(x,_);
					local z,q,x=if s then C==true else false,tonumber(_:GetAttribute("CharacterGeneration"))or-1,tick();
					if f~=Y.game_state then 
						if f=="Buy Period"then 
							table.clear(Y.tried);
							g.buy_dirty=true;
							Y.wait_until=0;
						end;
						Y.game_state=f;
					end;
					if u then 
						if not(Y.was_open)then 
							g.buy_dirty=true;
						end;
					end;
					if z then 
						if not(Y.was_inside)then 
							g.buy_dirty=true;
						end;
					end;
					if F~=Y.team or q~=Y.generation then 
						table.clear(Y.tried);
						g.buy_dirty=true;
						Y.wait_until=0;
					end;
					Y.was_open=u;
					Y.was_inside=z;
					Y.team=F;
					Y.generation=q;
					if u then 
						if not(z)then 
							return;
						end;
					else 
						return;
					end;
					f,u=t();
					if u then 
						if Y.wait_until>0 then 
							Y.wait_until=0;
							g.buy_dirty=true;
						end;
					else 
						if Y.wait_until<=0 then 
							Y.wait_until=x+2;
						end;
						if x<Y.wait_until then 
							g.buy_dirty=true;
							return;
						end;
					end;
					if g.buy_dirty then 
						g.buy_dirty=false;
						N(f);
					end;
					u=Y.pending[1];
					while u and(l(u.name,f)or l(u.name,Y.tried))do 
						table.remove(Y.pending,1);
						u=Y.pending[1];
					end;
					if u then 
						if x-Y.last<0.38 then 
							return;
						end;
					else 
						return;
					end;
					Y.last=x;
					if pcall(r.purchase,u.name,u.path,false)then 
						Y.tried[u.name]=true;
						table.remove(Y.pending,1);
					else 
						u.fails=u.fails+1;
						if u.fails>=3 then 
							table.remove(Y.pending,1);
						end;
					end;
				end;
				S.step=function()
					if g.auto_plant then 
						pcall(S.plant);
					end;
					if g.auto_defuse then 
						pcall(S.defuse);
					else 
						S.stop_defuse(true);
					end;
					if g.knife then 
						pcall(S.knife);
					end;
					if g.zeus then 
						pcall(S.zeus);
					end;
					if g.auto_reload then 
						pcall(S.reload);
					end;
					if g.auto_buy then 
						pcall(S.autobuy);
					end;
				end;
				h.connect(_.CharacterAdded,function()
					S.stop_defuse(true);
					T.blocked=0;
				end);
				h.teardown(function()
					S.stop_defuse(true);
					table.clear(Y.pending);
					table.clear(Y.tried);
					R(E,0);
				end);
				return S;
			end;
			K._=function()
				local R=K.load("b");
				local _,N=K.load("q"),K.load("f");
				local h=K.load("a");
				local F=_.notify;
				local t=_.world;
				local f=R.workspace;
				local l=R.guiservice;
				local g=math.clamp;
				local u=math.max;
				local s,s=math.floor,{};
				U:ds(s,0,Vector2.new(0.70710678,-0.70710678),Vector2.new(-0.70710678,-0.70710678),Vector2.new(-0.70710678,0.70710678),Vector2.new(0.70710678,0.70710678));
				local U,C={-45,45,-45,45};
				local function z()
					if C then 
						if C.Parent then 
							local q=C;
							return q;
						end;
					end;
					C=R.screen(1000);
					if C then 
						h.own(C);
					end;
					local q=C;
					return q;
				end;
				local function q(r)
					local x=Instance.new("Frame");
					x.AnchorPoint=Vector2.new(0.5,0.5);
					x.BackgroundColor3=Color3.new(1,1,1);
					x.BackgroundTransparency=0;
					x.BorderSizePixel=0;
					x.Visible=false;
					x.ZIndex=10;
					local G=Instance.new("UICorner");
					G.CornerRadius=UDim.new(1,0);
					G.Parent=x;
					G=Instance.new("UIStroke");
					G.Thickness=1.25;
					G.Color=Color3.new();
					G.Transparency=0;
					G.ApplyStrokeMode=Enum.ApplyStrokeMode.Border;
					G.LineJoinMode=Enum.LineJoinMode.Round;
					G.Parent=x;
					x.Parent=r;
					return{frame=x,stroke=G};
				end;
				local function r()
					local x=z();
					if not(x)then 
						return nil;
					end;
					local G={};
					for a=1,4,1 do 
						G[a]=q(x);
					end;
					return G;
				end;
				local function q(x)
					if not(x)then 
						return;
					end;
					for G=1,4,1 do 
						x[G].frame.Visible=false;
					end;
				end;
				local x,G={},{};
				local function a()
					local m=table.remove(x);
					if m then 
						local c=z();
						if c then 
							for n=1,4,1 do 
								if m[n].frame.Parent~=c then 
									m[n].frame.Parent=c;
								end;
							end;
						end;
						return m;
					end;
					return r();
				end;
				local function r(m)
					if not(m.arms)then 
						return;
					end;
					q(m.arms);
					x[#x+1]=m.arms;
					m.arms=nil;
				end;
				local m={Camera=nil};
				m.CFrame=CFrame.new();
				m.ViewportSize=Vector2.zero;
				m.FieldOfView=70;
				m.Override=false;
				local function c()
					local n=t.view;
					if type(n)=="table"then 
						if type(n.Resolve)=="function"then 
							local O,j=pcall(n.Resolve);
							if O then 
								if type(j)=="table"then 
									if typeof(j.CFrame)=="CFrame"then 
										if typeof(j.ViewportSize)=="Vector2"then 
											return j;
										end;
									end;
								end;
							end;
						end;
					end;
					n=f.CurrentCamera;
					if not n then 
						return nil;
					end;
					m.Camera=n;
					m.CFrame=n.CFrame;
					m.ViewportSize=n.ViewportSize;
					m.FieldOfView=n.FieldOfView;
					return m;
				end;
				local function f(m,n)
					local O=t.view;
					if type(O)=="table"then 
						if type(O.Project)=="function"then 
							local t,j,E,P=pcall(O.Project,n,m);
							if t then 
								return j,E,P;
							end;
						end;
					end;
					O=m and m.Camera;
					if not O then 
						return nil,false,-math.huge;
					end;
					local t,m=O:WorldToViewportPoint(n);
					return Vector2.new(t.X,t.Y),m,t.Z;
				end;
				local function t(m,n,O)
					if not(O)then 
						return false;
					end;
					for j=1,#O,1 do 
						local E=O[j];
						if typeof(E)=="Instance"then 
							if E.Parent then 
								if E.Visible then 
									local O,j=E.AbsolutePosition+n,E.AbsoluteSize;
									if m.X>=O.X then 
										if m.X<=O.X+j.X then 
											if m.Y>=O.Y then 
												if m.Y<=O.Y+j.Y then 
													return true;
												end;
											end;
										end;
									end;
								end;
							end;
						end;
					end;
					return false;
				end;
				local function m(n,O,j,E,P,T,Y)
					local v=n.frame;
					v.Position=UDim2.fromOffset(O.X,O.Y);
					v.Size=UDim2.fromOffset(E,P);
					v.Rotation=j;
					v.BackgroundColor3=T;
					v.BackgroundTransparency=1-Y;
					v.Visible=Y>0.001;
					n.stroke.Thickness=u(1,P*0.22);
					n.stroke.Transparency=1-Y;
				end;
				local function n(O,j,E)
					local P=z();
					if not(P)then 
						return;
					end;
					local z=g(tonumber(O.size)or 14,4,24);
					local T,Y,v,Z=z*0.95,u(2,z*0.32),u(2,z*0.22),O.arms;
					for u=1,4,1 do 
						z=Z[u];
						if z.frame.Parent~=P then 
							z.frame.Parent=P;
						end;
						m(z,j+s[u]*(v+T*0.5),U[u],T,Y,O.col,E);
					end;
				end;
				_={emit=function(U,u)
					local s=F.marks[U];
					if s then 
						if F.master[U]then 
							if not(s.on)then 
								return;
							end;
						else 
							return;
						end;
					else 
						return;
					end;
					u=if typeof(u)=="CFrame"then u.Position else u;
					if typeof(u)~="Vector3"then 
						return;
					end;
					local F=os.clock();
					if U=="kill"then 
						for z=#G,1,-1 do 
							local m=G[z];
							if m.channel=="hit"then 
								if F-m.born<=2.5 then 
									if(m.position-u).Magnitude<=0.25 then 
										r(m);
										N.drop(G,z);
									end;
								end;
							end;
						end;
					end;
					local z=a();
					if not(z)then 
						return;
					end;
					if#G>=200 then 
						local a=table.remove(G,1);
						if a then 
							r(a);
						end;
					end;
					G[#G+1]={arms=z,channel=U,position=u,col=typeof(s.col)=="Color3"and s.col or Color3.new(1,1,1),size=g(tonumber(s.size)or 14,4,24),duration=g(tonumber(s.fade)or 1,0.1,5),born=F};
				end,step=function()
					local U=#G;
					if U==0 then 
						return;
					end;
					local F=c();
					if not(F)then 
						for u=U,1,-1 do 
							q(G[u].arms);
						end;
						return;
					end;
					local u=R.drawmask();
					local R,s=u and l:GetGuiInset()or Vector2.zero,os.clock();
					for l=U,1,-1 do 
						local U=G[l];
						local z=(s-U.born)/U.duration;
						if z>=1 then 
							r(U);
							N.drop(G,l);
						else 
							local l,s,r=f(F,U.position);
							if typeof(l)=="Vector2"then 
								if s then 
									if type(r)=="number"then 
										if r>0.05 then 
											if t(l,R,u)then 
												q(U.arms);
											else 
												local R=g(z,0,1);
												n(U,l,1-R*R*(3-2*R));
											end;
										else 
											q(U.arms);
										end;
									else 
										q(U.arms);
									end;
								else 
									q(U.arms);
								end;
							else 
								q(U.arms);
							end;
						end;
					end;
				end,unload=function()
					for U=#G,1,-1 do 
						q(G[U].arms);
						G[U]=nil;
					end;
					N.trim(x,0);
					if C then 
						pcall(C.Destroy,C);
						C=nil;
					end;
				end};
				h.teardown(_.unload);
				return _;
			end;
			K.aa=function()
				local U,R,_=K.load("b"),K.load("q"),K.load("a");
				local N=R.notify;
				local h=U.workspace;
				local F=Color3.fromRGB(133,220,255);
				local function t(f)
					local l=Instance.new("ParticleEmitter");
					l.Acceleration=Vector3.new(0,-50,0);
					l.Color=ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.new(1,0.999969,0.999985)),ColorSequenceKeypoint.new(0.25,Color3.new(0.333333,1,0)),ColorSequenceKeypoint.new(1,Color3.new(0.333333,1,0.498039))});
					l.Lifetime=NumberRange.new(0.5,1);
					l.LightEmission=1;
					l.Enabled=false;
					l.Orientation=Enum.ParticleOrientation.VelocityParallel;
					l.Rate=0;
					l.Size=NumberSequence.new({NumberSequenceKeypoint.new(0,0.6,0),NumberSequenceKeypoint.new(0.5,0.6,0),NumberSequenceKeypoint.new(1,0,0)});
					l.Speed=NumberRange.new(15,15);
					l.SpreadAngle=Vector2.new(50,-50);
					l.Texture="http://www.roblox.com/asset/?id=18540695516";
					l.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(0.5,0,0),NumberSequenceKeypoint.new(1,1,0)});
					l.Parent=f;
					return l;
				end;
				local function f()
					local l=Instance.new("Part");
					l.Anchored=true;
					l.CanCollide=false;
					l.CanQuery=false;
					l.CanTouch=false;
					l.Massless=true;
					l.CastShadow=false;
					l.Transparency=1;
					l.Size=Vector3.new(0.01,0.01,0.01);
					l.CFrame=CFrame.new(0,-10000,0);
					local g={part=l,emitter=t(l),col=nil,count=30};
					l.Parent=h;
					_.own(l);
					return g;
				end;
				local t={};
				R,U=pcall(f);
				if R then 
					t.hit=U;
				end;
				U,R=pcall(f);
				if U then 
					t.kill=R;
				end;
				U={emit=function(R,f)
					local l,g=N.fx[R],t[R];
					if l then 
						if N.master[R]then 
							if l.on then 
								if not(g)then 
									return;
								end;
							else 
								return;
							end;
						else 
							return;
						end;
					else 
						return;
					end;
					R=nil;
					if typeof(f)=="CFrame"then 
						R=f;
					else 
						if typeof(f)=="Vector3"then 
							R=CFrame.new(f);
						else 
							return;
						end;
					end;
					if not(g.part.Parent)then 
						g.part.Parent=h;
					end;
					g.part.CFrame=R;
					R=typeof(l.col)=="Color3"and l.col or F;
					if g.col~=R then 
						g.col=R;
						g.emitter.Color=ColorSequence.new(R);
					end;
					g.emitter:Emit(g.count);
				end,unload=function()
					for R,N in t,nil,nil do 
						t[R]=nil;
						if N.part then 
							pcall(N.part.Destroy,N.part);
						end;
					end;
				end};
				_.teardown(U.unload);
				return U;
			end;
			K.ab=function()
				local U=K.load("b");
				local R,_=K.load("q"),K.load("a");
				local N,h=K.load("O"),R.notify;
				local F=os.clock;
				local t=math.min;
				local f=math.max;
				local l=math.abs;
				local g=math.sqrt;
				local u=math.exp;
				local s=math.clamp;
				local C=Rect.new(64,64,66,66);
				local z=u(-4);
				local function q(r,x)
					local G,a=f(r*130*0.5-1,0),f(l(x*2-1)*130*0.5-1,0);
					return(u(-4*(1-s((g(G*G+a*a)-24)/40,0,1))^2)-z)/(1-z);
				end;
				local l;
				local g,u,s=_.shared,U.custom_asset,false;
				if type(isfile)=="function"then 
					local z,r=pcall(isfile,"bs_health_shot.png");
					s=z and r==true;
				else 
				end;
				local z;
				if type(g.edge_uri)=="string"and s then 
					l=g.edge_uri;
					z=l;
				else 
					if type(writefile)=="function"then 
						if type(u)=="function"then 
							if buffer then 
								R=N.mask(130,130,q);
								if R then 
									if pcall(writefile,"bs_health_shot.png",R)then 
										local N,s=pcall(u,"bs_health_shot.png");
										if N then 
											if type(s)=="string"then 
												if#s>0 then 
													g.edge_uri=s;
													l=s;
												else 
												end;
											else 
											end;
										else 
										end;
									else 
									end;
								else 
								end;
							else 
							end;
						else 
						end;
					else 
					end;
					z=l;
				end;
				if z then 
					_.spawn(function()
						local N=Instance.new("ImageLabel");
						N.Image=z;
						pcall(U.content.PreloadAsync,U.content,{N});
						N:Destroy();
					end);
				end;
				local N,l;
				local g,u,s=false,0;
				local q=1;
				local r,x,G=-1,0,0;
				local function a()
					if N then 
						if N.Parent then 
							return true;
						end;
					end;
					if not(z)then 
						return false;
					end;
					N=U.screen(1000);
					if not(N)then 
						return false;
					end;
					_.own(N);
					l=Instance.new("ImageLabel");
					l.BackgroundTransparency=1;
					local U=l;
					U.Size=UDim2.fromScale(1,1);
					l.Image=z;
					U=l;
					U.ImageColor3=s or h.fx.hit.col;
					l.ImageTransparency=1;
					U=l;
					U.ScaleType=Enum.ScaleType.Slice;
					l.SliceCenter=C;
					l.Parent=N;
					r=1;
					return true;
				end;
				local function U(C)
					if r~=C then 
						if l then 
							r=C;
							l.ImageTransparency=C;
						end;
					end;
				end;
				local function C(z)
					return z*z*(3-2*z);
				end;
				local function z(m)
					if m<0.18 then 
						local c,n=x,(1-x)*C(m/0.18);
						return c+n;
					end;
					return 1-C((m-0.18)/0.95);
				end;
				R={emit=function(C)
					local m=h.screen[C];
					if m then 
						if h.master[C]then 
							if not(m.on)then 
								return;
							end;
						else 
							return;
						end;
					else 
						return;
					end;
					if not(a())then 
						return;
					end;
					local a,c=N.AbsoluteSize,l;
					c.SliceScale=f(t(a.X,a.Y),180)/180;
					C=typeof(m.col)=="Color3"and m.col or h.fx.hit.col;
					if s~=C then 
						s=C;
						l.ImageColor3=C;
					end;
					C=g and G or 0;
					q=f((tonumber(m.power)or 100)/100,C);
					x=q>0 and t(C/q,1)or 0;
					u,g=F(),true;
				end,step=function()
					if not(g)then 
						return;
					end;
					local h=F()-u;
					if h>=1.13 then 
						g,G=false,0;
						U(1);
						return;
					end;
					G=z(h)*q;
					U(1-t(G,3.3333333333333335)*0.3);
				end,unload=function()
					g,G,l,s,r=false,0,nil,nil,-1;
					if N then 
						pcall(N.Destroy,N);
						N=nil;
					end;
				end};
				_.teardown(R.unload);
				return R;
			end;
			K.ac=function()
				local U=bit32.bxor;
				local R=bit32.lrotate;
				local _=bit32.lshift;
				local N=bit32.rshift;
				local h=bit32.band;
				local F=string.byte;
				local t=string.char;
				local f=string.sub;
				local l=table.concat;
				local g=table.create;
				local u,s,C,z=math.floor,{91,39,228,145,12,189,122,54,241,72,146,174,99,213,31,140,42,116,176,89,238,19,199,109,159,53,136,76,161,112,219,38},{{2654435769,2246822507},{608135816,3266489909},{3084996962,668265263},{2246822507,374761393}};
				local function q(r)
					if not(z)then 
						z={};
						for x=1,64,1 do 
							local G=z;
							G[F("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/",x)]=x-1;
						end;
					end;
					local x,G,a,m,c={},#r,0,0,0;
					for n=1,G,1 do 
						local G=F(r,n);
						n=z[G];
						if n then 
							a=a*64+n;
							m+=6;
							if m>=8 then 
								m-=8;
								local z=2^m;
								local r=u(a/z);
								a-=r*z;
								c+=1;
								x[c]=t(r%256);
							else 
							end;
						else 
							if G~=61 then 
								if G~=10 then 
									if G~=13 then 
										if G~=32 then 
											if G~=9 then 
												return nil;
											end;
										end;
									end;
								end;
							end;
						end;
					end;
					return l(x);
				end;
				local function u(z,r,x)
					local G=r;
					for r=1,#z,1 do 
						G=(U(R(U(G,z[r]),7),x));
					end;
					return G;
				end;
				local function z(r)
					local x=#s;
					local G=g(x+#r);
					for g=1,x,1 do 
						G[g]=s[g];
					end;
					for g=1,#r,1 do 
						G[x+g]=F(r,g);
					end;
					local g=u(G,C[1][1],C[1][2]);
					local s=u(G,C[2][1],C[2][2]);
					local r=u(G,C[3][1],C[3][2]);
					local x=u(G,C[4][1],C[4][2]);
					local u,C,G,a;
					if g==0 and s==0 and r==0 and x==0 then 
						g,s,r,x=2654435769,608135816,3084996962,2246822507;
						u,C,G,a=g,s,r,x;
					else 
						u,C,G,a=g,s,r,x;
					end;
					local function g()
						local s=U(u,_(u,11));
						s,u,C,G=U(s,N(s,8)),C,G,a;
						local _=U(U(a,N(a,19)),s);
						a=_;
						return _;
					end;
					return g;
				end;
				local function _(g,u)
					local s,C=z(g),#u;
					if buffer and buffer.fromstring then 
						local z,r=buffer.fromstring(u),0;
						while r+4<=C do 
							buffer.writeu32(z,r,U(buffer.readu32(z,r),s()));
							r+=4;
						end;
						if r<C then 
							local x,G=s(),0;
							while r+G<C do 
								buffer.writeu8(z,r+G,U(buffer.readu8(z,r+G),h(N(x,G*8),255)));
								G+=1;
							end;
						end;
						return buffer.tostring(z);
					end;
					local z,r,x={},1,0;
					while r<=C do 
						g=s();
						for s=0,3,1 do 
							if r+s<=C then 
								x+=1;
								z[x]=t(U(F(u,r+s),h(N(g,s*8),255)));
							else 
							end;
						end;
						r=r+4;
					end;
					return l(z);
				end;
				local function N(h)
					local t,l,g=#h,1,608135816;
					while l+7<=t do 
						local u,s,C,z,r,x,G,a=F(h,l,l+7);
						g=U(R(U(U(R(U(U(R(U(U(R(U(U(R(U(U(R(U(U(R(U(U(R(U(g,u),7),2654435769),s),7),2654435769),C),7),2654435769),z),7),2654435769),r),7),2654435769),x),7),2654435769),G),7),2654435769),a),7),2654435769);
						l=l+8;
					end;
					while l<=t do 
						g=U(R(U(g,F(h,l)),7),2654435769);
						l=l+1;
					end;
					return g;
				end;
				return{decode=function(U)
					if type(U)~="string"then 
						return nil;
					elseif#U<11 then 
						return nil;
					end;
					local R;
					if F(U,1)~=83 then 
						R=q(U);
						if type(R)~="string"then 
							return nil;
						elseif#R<11 then 
							return nil;
						end;
					else 
						R=U;
					end;
					if F(R,1)~=83 then 
						return nil;
					end;
					U=F(R,2);
					if U~=1 then 
						if U~=2 then 
							return nil;
						end;
					end;
					local h,t,l,g=F(R,7,10);
					U=_(f(R,3,6),f(R,11));
					if N(U)~=g*16777216+l*65536+t*256+h then 
						return nil;
					end;
					return U;
				end};
			end;
			K.ad=function()
				local U,R,_=K.load("b"),K.load("q"),K.load("a");
				local N=K.load("c");
				local h=K.load("ac");
				local F=R.notify;
				local t=U.sounds;
				local f=U.content;
				local l=U.http;
				local g=U.custom_asset;
				local u=string.format;
				local s=string.match;
				local C=string.gsub;
				local z,q,r,x,G,a,m,c,n,O,j,E,P,T,Y=math.random,{primordial=true,neverlose=true,sparkle=true,["mc bow"]=true,skeet=true,["break"]=true,rust=true},{hentai="hentai1"},{"shitaroebet/","assets/","khen_juju/assets/","khen_juju/custom/","sounds/","","shitaro_sounds/"},{".ogg",".mp3",".wav",""},{},{},{},{},{hit=0,kill=0},{},{};
				local v,Z,L=false,false,true;
				local function o(X)
					if type(X)~="string"then 
						return nil;
					elseif X==""then 
						return nil;
					end;
					local Q,S=pcall(l.JSONDecode,l,X);
					if Q then 
						if type(S)=="table"then 
							if type(S.f)=="table"then 
								return S;
							end;
						end;
					end;
					return nil;
				end;
				local function l()
					if T then 
						local X=T;
						return X;
					end;
					local X=h.decode(N.asset("b53227f0da.png"));
					if type(X)~="string"then 
						return nil;
					elseif X==""then 
						return nil;
					end;
					local Q,S,A={},{},0;
					for J in X:gmatch("([^\10]+)")do 
						local X,y,e,M=s(J,"^(.-)\9(.-)\9(%d+)\9(%a+)$");
						J=tonumber(e);
						if X then 
							if X~=""then 
								if y then 
									if y~=""then 
										if J then 
											if J>0 then 
												Q[X]={srv=y,size=J,kind=M};
												if M~="data"then 
													e=A+1;
													S[e]=X;
													A=e;
												else 
												end;
											else 
											end;
										else 
										end;
									else 
									end;
								else 
								end;
							else 
							end;
						else 
						end;
					end;
					if not(next(Q))then 
						return nil;
					end;
					table.sort(S);
					T,Y=Q,S;
					return Q;
				end;
				local function X()
					local Q=l();
					if Q then 
						local S,A={},#Y;
						for J=1,A,1 do 
							local A=Y[J];
							S[J]={n=A,s=Q[A].size};
						end;
						return S;
					end;
					if P then 
						Q=P;
						return Q.f;
					end;
					P=o(N.asset("index"));
					Q=P and P.f or{};
					return Q;
				end;
				local function o(Q)
					local S=l();
					if S then 
						local A=S[Q];
						return A and A.size or nil;
					end;
					S=P and P.f or X();
					for A=1,#S,1 do 
						local J=S[A];
						if type(J)=="table"then 
							if J.n==Q then 
								return J.s;
							end;
						end;
					end;
					return nil;
				end;
				local function Q(S)
					local A=Instance.new("Sound");
					A.SoundId=S;
					local S;
					local function J(y,y)
						S=y;
					end;
					pcall(f.PreloadAsync,f,{A},J);
					pcall(A.Destroy,A);
					J=S==Enum.AssetFetchStatus.Success;
					return J;
				end;
				local function S(A)
					if type(delfile)~="function"then 
						return false;
					end;
					return pcall(delfile,A)==true;
				end;
				local function A(J,y,e)
					if type(g)~="function"then 
						return nil;
					elseif type(writefile)~="function"then 
						return nil;
					end;
					local M=s(J,"(%.%w+)$")or".ogg";
					J=u("%s_%08x%08x%s",e,z(0,268435455),z(0,268435455),M);
					if not(pcall(writefile,J,y))then 
						return nil;
					end;
					M,e=pcall(g,J);
					if M then 
						if type(e)~="string"then 
							S(J);
							return nil;
						elseif e==""then 
							S(J);
							return nil;
						end;
					else 
						S(J);
						return nil;
					end;
					Q(e);
					if v then 
					else 
						if Z then 
						else 
							v=true;
							if S(J)then 
								if Q(e)then 
									return e;
								end;
								Z=true;
								if not(pcall(writefile,J,y))then 
									return nil;
								end;
								local u,z=pcall(g,J);
								if u then 
									if type(z)~="string"then 
										return nil;
									elseif z==""then 
										return nil;
									end;
								else 
									return nil;
								end;
								Q(z);
								e=z;
							else 
								Z=true;
							end;
						end;
					end;
					if Z then 
						E[#E+1]=J;
					elseif not(S(J))then 
						E[#E+1]=J;
					end;
					return e;
				end;
				local function u(z)
					local v=j[z];
					if v then 
						return v;
					end;
					v=l();
					local l=v and v[z];
					v=N.asset(l and l.srv or z);
					if type(v)~="string"then 
						return nil;
					elseif v==""then 
						return nil;
					end;
					if l then 
						v=h.decode(v);
						if type(v)~="string"then 
							return nil;
						elseif#v~=l.size then 
							return nil;
						end;
					else 
						local N=o(z);
						if type(N)=="number"then 
							if N>0 then 
								if#v~=N then 
									return nil;
								end;
							end;
						end;
					end;
					l=A(z,v,"shv");
					if l then 
						j[z]=l;
					end;
					return l;
				end;
				local function N(h)
					if type(isfile)~="function"then 
						return false;
					end;
					local l,z=pcall(isfile,h);
					return l and z==true;
				end;
				local function h(l)
					if N(l)then 
						if type(readfile)~="function"then 
							return nil;
						end;
					else 
						return nil;
					end;
					local z,v=pcall(readfile,l);
					if z then 
						if type(v)~="string"then 
							return nil;
						elseif v==""then 
							return nil;
						end;
					else 
						return nil;
					end;
					return A(l,v,"shitaro_snd");
				end;
				local function l(z)
					local v=r[z]or z;
					for Z=1,#x,1 do 
						for o=1,#G,1 do 
							z=h(x[Z]..v..G[o]);
							if z then 
								return z;
							end;
						end;
					end;
					return nil;
				end;
				local function h(z)
					local x,G=r[z]or z,X();
					for r=1,#G,1 do 
						z=G[r];
						r=type(z)=="table"and z.n;
						if type(r)=="string"then 
							local z,G=s(r,"^([^/]+)(%.[^%.]+)$");
							if z==x then 
								if G==".mp3"then 
									local z=u(r);
									if z then 
										return z;
									end;
								elseif G==".wav"then 
									local z=u(r);
									if z then 
										return z;
									end;
								elseif G==".ogg"then 
									local z=u(r);
									if z then 
										return z;
									end;
								end;
							end;
						end;
					end;
					return nil;
				end;
				local function u(z)
					if m[z]~=nil then 
						return m[z];
					end;
					if not(q[z])then 
						m[z]=false;
						return false;
					end;
					local q="shitaro_sounds/"..z..".ogg";
					if N(q)then 
						m[z]=true;
						return true;
					end;
					if type(isfolder)~="function"then 
						m[z]=false;
						return false;
					elseif type(makefolder)~="function"then 
						m[z]=false;
						return false;
					end;
					if not(pcall(function()
						if not(isfolder("shitaro_sounds/"))then 
							makefolder("shitaro_sounds/");
						end;
					end))then 
						m[z]=false;
						return false;
					end;
					local N="https://github.com/khenn791/lmao/raw/refs/heads/main/"..C(z," ","%%20")..".ogg";
					local r,x=pcall(game.HttpGet,game,N);
					if r then 
						if type(x)~="string"then 
							return false;
						elseif#x<256 then 
							return false;
						elseif type(writefile)~="function"then 
							return false;
						end;
					else 
						return false;
					end;
					if pcall(writefile,q,x)then 
						m[z]=true;
						return true;
					end;
					return false;
				end;
				local function N(z)
					local q=a[z];
					if q then 
						return q;
					end;
					if type(writefile)~="function"then 
						return nil;
					elseif type(g)~="function"then 
						return nil;
					end;
					q=l(z)or h(z);
					q=q or(if u(z)then(l(z))else q);
					if q then 
						a[z]=q;
					end;
					return q;
				end;
				local function h(l)
					n[l]=nil;
					if l then 
						pcall(l.Destroy,l);
					end;
				end;
				local function l(g)
					if not(L)then 
						return nil;
					end;
					local u=F.sounds[g];
					if not(u)then 
						return nil;
					end;
					local z=N(u.name);
					if not(z)then 
						local N=c[g];
						c[g]=nil;
						if N then 
							pcall(N.Destroy,N);
						end;
						return nil;
					end;
					local N=c[g];
					if N then 
						if N.Parent then 
							if N.SoundId==z then 
								N.Volume=u.vol;
								return N;
							end;
						end;
					end;
					if N then 
						pcall(N.Destroy,N);
					end;
					local N=Instance.new("Sound");
					N.SoundId=z;
					N.Volume=u.vol;
					N.Looped=false;
					N.Parent=t;
					c[g]=N;
					_.spawn(function()
						if L then 
							if N.Parent then 
								pcall(f.PreloadAsync,f,{N});
							end;
						end;
					end);
					return N;
				end;
				local function N(f,g)
					if L then 
						if f then 
							if not(f.Parent)then 
								return;
							end;
						else 
							return;
						end;
					else 
						return;
					end;
					local u=f:Clone();
					u.Volume=g;
					u.Looped=false;
					u.PlayOnRemove=false;
					u.TimePosition=0;
					u.Parent=t;
					n[u]=true;
					local function t()
						if not(n[u])then 
							return;
						end;
						n[u]=nil;
						pcall(u.Destroy,u);
					end;
					u.Ended:Once(t);
					task.delay(5,t);
					u:Play();
				end;
				local t={prepare=function(f,g)
					if not(L)then 
						return;
					end;
					local u=F.sounds[f];
					if not(u)then 
						return;
					end;
					local z=l(f);
					if g then 
						if z then 
							N(z,u.vol);
						end;
					end;
				end,play=function(f)
					if not(L)then 
						return;
					end;
					local g=F.sounds[f];
					if not g or not F.master[f]then 
						return;
					elseif not(g.on)then 
						return;
					end;
					local F=os.clock();
					if F-(O[f]or 0)<0.05 then 
						return;
					end;
					local u=c[f];
					if not(u)then 
						_.spawn(function()
							local z=l(f);
							if z then 
								if L then 
									O[f]=os.clock();
									N(z,g.vol);
								end;
							end;
						end);
						return;
					end;
					O[f]=F;
					N(u,g.vol);
				end,unload=function()
					L=false;
					for N,F in c,nil,nil do 
						c[N]=nil;
						pcall(F.Destroy,F);
					end;
					for N in n,nil,nil do 
						h(N);
					end;
					for N=#E,1,-1 do 
						S(E[N]);
						E[N]=nil;
					end;
					table.clear(a);
					table.clear(m);
					table.clear(j);
					T,Y,P=nil,nil,nil;
				end};
				_.teardown(t.unload);
				if type(listfiles)=="function"and type(delfile)=="function"then 
					U,R=pcall(listfiles,"");
					if U and type(R)=="table"then 
						for U=1,#R,1 do 
							local N=tostring(R[U]);
							U=s(C(N,"\\","/"),"([^/]+)$");
							if U then 
								if s(U,"^shitaro_snd_%x+")then 
									pcall(delfile,N);
								elseif s(U,"^shv_%x+")then 
									pcall(delfile,N);
								end;
							end;
						end;
					end;
				end;
				_.spawn(function()
					t.prepare("hit",false);
					t.prepare("kill",false);
				end);
				return t;
			end;
			K.ae=function()
				local U=K.load("b");
				local R,_=K.load("q"),K.load("a");
				local N=K.load("h");
				local h=K.load("g");
				local F,t,f=K.load("j"),K.load("e"),K.load("aa");
				local l=K.load("ab");
				local g=K.load("_");
				local u=K.load("ad");
				local s=R.notify;
				local R=U.lp;
				local C=U.workspace;
				local z=U.players;
				local q=F.char_resolver;
				local r=F.remotes;
				local x=F.inventory;
				local G=F.weapon_props;
				local F=t.lib;
				local t=string.format;
				local a=string.lower;
				local m=math.floor;
				local c=math.max;
				local n,O,j,E,P,T,Y,v,Z,L=math.clamp,{Head="head",UpperTorso="chest",Torso="chest",LowerTorso="stomach",LeftUpperArm="left arm",LeftLowerArm="left arm",LeftHand="left arm",RightUpperArm="right arm",RightLowerArm="right arm",RightHand="right arm",LeftUpperLeg="left leg",LeftLowerLeg="left leg",LeftFoot="left leg",RightUpperLeg="right leg",RightLowerLeg="right leg",RightFoot="right leg"},{},{},true,true,false,false;
				local function o(X)
					if not(X)then 
						return"body";
					end;
					return O[X]or a(tostring(X));
				end;
				local function a(O,X,Q)
					pcall(F.notify,F,O,X,Q);
				end;
				local function F(O)
					if O then 
						if typeof(O)~="Instance"then 
							return nil,nil;
						end;
					else 
						return nil,nil;
					end;
					local X=O;
					while X and not X:IsA("Model")do 
						X=X.Parent;
					end;
					if not(X)then 
						return nil,nil;
					end;
					local Q=z:GetPlayerFromCharacter(X);
					Q=Q or(if q then if type(q.getPlayerFromCharacter)=="function"then q.getPlayerFromCharacter(X)else Q else Q);
					if Q then 
					else 
						local S,A=N.all();
						for N=1,A,1 do 
							if S[N].Character==X or S[N].Name==X.Name then 
								Q=S[N];
								break;
							end;
						end;
					end;
					return Q,O;
				end;
				local function N(O)
					local X=O and O.Character;
					if not(X)then 
						return nil;
					end;
					O=X:FindFirstChild("HumanoidRootPart")or X.PrimaryPart or X:FindFirstChild("Head");
					if O then 
						if O:IsA("BasePart")then 
							return O.Position;
						end;
					end;
					local O,Q=pcall(X.GetPivot,X);
					if O then 
						if typeof(Q)=="CFrame"then 
							return Q.Position;
						end;
					end;
					return nil;
				end;
				local function O(X)
					if C:GetAttribute("Gamemode")=="Deathmatch"then 
						return true;
					end;
					if C:GetAttribute("VIPFriendlyFireEnabled")==true then 
						return true;
					end;
					local C,Q=R:GetAttribute("Team"),X:GetAttribute("Team");
					if C~=nil then 
						if Q~=nil then 
							if C==Q then 
								return false;
							end;
						end;
					end;
					return true;
				end;
				local C={};
				local function X(Q,S,A,J)
					if A<=0 then 
						return;
					end;
					a(t("hit {%s} in the {%s} for {%d} damage (%d health left)",Q.DisplayName or Q.Name,o(S),m(A+0.5),c(0,m(J+0.5))),nil,3);
				end;
				C.from_packet=function()
				end;
				local function o(Q)
					if Q=="Head"then 
						return"Head";
					elseif Q=="UpperTorso"then 
						return"Torso";
					elseif Q=="LowerTorso"then 
						return"Torso";
					elseif Q=="Torso"then 
						return"Torso";
					elseif Q=="HumanoidRootPart"then 
						return"Torso";
					elseif Q=="LeftUpperArm"then 
						return"Arms";
					elseif Q=="LeftLowerArm"then 
						return"Arms";
					elseif Q=="LeftHand"then 
						return"Arms";
					elseif Q=="RightUpperArm"then 
						return"Arms";
					elseif Q=="RightLowerArm"then 
						return"Arms";
					elseif Q=="RightHand"then 
						return"Arms";
					else 
						return"Legs";
					end;
				end;
				local function Q(S)
					local A=tonumber(S.VictimUserId);
					if A then 
						local J,y=z:GetPlayerByUserId(A)or h.key(A),type(S.HitPartName)=="string"and S.HitPartName or nil;
						local A=J and J.Character;
						return J,y and A and A:FindFirstChild(y)or nil,y;
					end;
					local A,J=F(S.Instance);
					return A,J,J and J.Name or nil;
				end;
				local function F(S)
					if P then 
						if type(S)~="table"then 
							return;
						elseif S.Exit==true then 
							return;
						end;
					else 
						return;
					end;
					local A,J=s.master.hit,s.master.kill;
					local y,e,M,I,i,k,B=A and s.log.hit,A and s.fx.hit.on,A and s.screen.hit.on,A and s.marks.hit.on,A and s.sounds.hit.on,J and s.fx.kill.on,J and s.marks.kill.on;
					if y then 
					elseif e then 
					elseif M then 
					elseif I then 
					elseif i then 
					elseif k then 
					elseif B then 
					else 
						return;
					end;
					if tonumber(S.AttackerUserId)~=R.UserId then 
						return;
					end;
					local d,b,p=Q(S);
					if d then 
						if d==R then 
							return;
						end;
					else 
						return;
					end;
					if not(O(d))then 
						return;
					end;
					A=if typeof(S.Position)=="Vector3"then S.Position else if b then if b:IsA("BasePart")then b.Position else nil else nil;
					if i then 
						u.play("hit");
					end;
					if k or B then 
						if A then 
							i,J=d.UserId,{position=A};
							J.time,j[i]=os.clock(),J;
						end;
					end;
					if M then 
						l.emit("hit");
					end;
					if e then 
						if A then 
							f.emit("hit",A);
						end;
					end;
					if I then 
						if A then 
							g.emit("hit",A);
						end;
					end;
					if not(y)then 
						return;
					end;
					B,e=d.Character or b and b:FindFirstAncestorOfClass("Model"),x and type(x.peekCurrentEquippedForMovement)=="function"and x.peekCurrentEquippedForMovement();
					k=e and e.Properties;
					k=k or(if e then if e.Name then if G then G(e.Name)else k else k else k);
					i,J=o(p),k and k.DamagePerPart;
					y,M=type(J)=="table"and tonumber(J[i])or 25,R.Character;
					J=M and(M.PrimaryPart or M:FindFirstChild("HumanoidRootPart")or M:FindFirstChild("Head"));
					I=J and J.Position;
					if I then 
						if A then 
							if k then 
								if k.RangeModifier then 
									M=(I-A).Magnitude;
									y*=(tonumber(k.RangeModifier)or 1)^c(0,M/100);
								else 
								end;
							else 
							end;
						else 
						end;
					else 
					end;
					y=if S.IsWallbang then if k then if k.WallbangMultiplier then y*(tonumber(k.WallbangMultiplier)or 0.7)else y else y else y;
					I,A=c(1,m((if i=="Head"then if S.WasHelmetHeadshot then if k then if k.ArmorPenetration then y*n(tonumber(k.ArmorPenetration)or 0.85,0.2,1)else y else y else y else if d:GetAttribute("Armor")then if k then if k.ArmorPenetration then y*n(tonumber(k.ArmorPenetration)or 0.85,0.2,1)else y else y else y)+0.5)),E[d.UserId];
					if A then 
					else 
						if q then 
							if type(q.getHealth)=="function"then 
								if B then 
									k,S=pcall(q.getHealth,B);
									A=if k then if type(S)=="number"then if S>0 then S else A else A else A;
								else 
								end;
							else 
							end;
						else 
						end;
						A=A or 100;
					end;
					y=c(0,A-I);
					E[d.UserId]=y;
					X(d,p,I,y);
				end;
				local function q(x)
					U.elevate(F,x);
				end;
				local function F(x)
					if T then 
						if type(x)~="table"then 
							return;
						end;
					else 
						return;
					end;
					local G=s.master.kill;
					local m,c,n,O,o=G and s.log.kill,G and s.fx.kill.on,G and s.screen.kill.on,G and s.marks.kill.on,G and s.sounds.kill.on;
					if m then 
					elseif c then 
					elseif n then 
					elseif O then 
					elseif o then 
					else 
						return;
					end;
					if tonumber(x.Killer)~=R.UserId then 
						return;
					end;
					if o then 
						u.play("kill");
					end;
					if n then 
						l.emit("kill");
					end;
					o=tonumber(x.Victim);
					n,G=o and(z:GetPlayerByUserId(o)or h.key(o));
					if c or O then 
						local h=o and j[o];
						G=if h then if type(h.time)=="number"then if os.clock()-h.time<=2.5 then h.position else G else G else G;
						G=G or(if typeof(x.DeathPosition)=="Vector3"then x.DeathPosition else G)or(N(n));
					else 
					end;
					if c then 
						if G then 
							f.emit("kill",G);
						end;
					end;
					if O then 
						if G then 
							g.emit("kill",G);
						end;
					end;
					if o then 
						j[o]=nil;
					end;
					if not(m)then 
						return;
					end;
					local N,h,f=n and(n.DisplayName or n.Name)or"player "..tostring(x.Victim),{},0;
					local function l(g,u)
						if g then 
							f+=1;
							h[f]=u;
						end;
					end;
					l(x.Headshot,"headshot");
					l(x.NoScope,"no-scope");
					l(x.Wallbang,"wallbang");
					l(x.Blind,"blind");
					l(x.Smoke,"smoke");
					l(x.Jump,"jump");
					if o then 
						E[o]=100;
					end;
					n=t("killed {%s} with {%s}",N,tostring(x.Weapon or"?"));
					n=if f>0 then n..t(" ({%s})",table.concat(h,", ",1,f))else n;
					a(n,nil,4);
				end;
				local function N(h)
					U.elevate(F,h);
				end;
				local function U(h,F)
					if type(h)~="table"then 
						return nil;
					elseif type(h.Listen)~="function"then 
						return nil;
					end;
					local t,f=pcall(h.Listen,F);
					if t then 
						if type(f)=="function"then 
							return f;
						end;
					end;
					return nil;
				end;
				C.start=function()
					if Y then 
						return;
					elseif not(P)then 
						return;
					end;
					Y=true;
					local function h(F)
						if P then 
							if F==R then 
								return;
							end;
						else 
							return;
						end;
						local function R()
							E[F.UserId]=100;
						end;
						if F.Character then 
							R();
						end;
						_.adopt(F.CharacterAdded:Connect(R));
					end;
					local R=z:GetPlayers();
					for F=1,#R,1 do 
						h(R[F]);
					end;
					_.adopt(z.PlayerAdded:Connect(h));
					_.spawn(function()
						if P then 
							if not(r)then 
								return;
							end;
						else 
							return;
						end;
						local R=U(r.VFX and r.VFX.CreateImpact,q);
						if R then 
							if P then 
								Z=_.adopt(R);
							else 
								pcall(R);
							end;
						end;
					end);
					if v then 
						return;
					end;
					v=true;
					_.spawn(function()
						if T then 
							if not(r)then 
								return;
							end;
						else 
							return;
						end;
						local R=U(r.UI and r.UI.UIPlayerKilled,N);
						if R then 
							if T then 
								L=_.adopt(R);
							else 
								pcall(R);
							end;
						end;
					end);
				end;
				C.unload=function()
					P,T=false,false;
					table.clear(E);
					table.clear(j);
					Z,L=nil,nil;
				end;
				_.teardown(C.unload);
				return C;
			end;
			K.af=function()
				local U=K.load("q").white;
				return{on=false,team_check=true,boxes={head=true,chest=true},prefer="head",auto_shoot=false,auto_wall=false,wallbang=false,wall_power=3,magic=false,auto_revolver=false,auto_switch=false,double_tap=false,rapid=false,no_recoil=false,no_spread=false,insta_reload=false,min_damage=0,wall_min_damage=0,fov=8,draw_fov=false,fov_col=U,fov_grad=false,fov_col2=U,fov_fill=false,fov_fill_col=U,fov_fill_grad=false,fov_fill_col2=U,multipoint=false,head_size=65,chest_size=60,stomach_size=60,arms_size=55,legs_size=55,reg_hits=0,reg_miss=0,reg_lead=0};
			end;
			K.ag=function()
				local U,R,_=K.load("b"),K.load("f"),K.load("a");
				local N=K.load("h");
				local h=K.load("g");
				local F,t=K.load("j"),K.load("af");
				local f=U.lp;
				local l=U.http;
				local g=U.players;
				local u=F.remotes;
				local F=math.clamp;
				local s=math.max;
				local C=string.lower;
				local z=string.find;
				local q=U.weak();
				local r,x,G,a,m=U.weak(),0.3,0,true;
				local U,c=false,{pending=q,window=function(n)
					n=n or os.clock();
					if n-G>=0.25 then 
						G=n;
						local G,n=pcall(f.GetNetworkPing,f);
						local O,j=if G then if type(n)=="number"then if n==n then if n>0 then n else 0.05 else 0.05 else 0.05 else 0.05,tonumber(f:GetAttribute("Ping"));
						O=if j then if j==j then if j>0 then if j<2000 then if j/1000>O then j/1000 else O else O else O else O else O;
						x=F(O*1.5+0.12,0.25,0.9);
					end;
					local F=x;
					return F;
				end,armor=function(F)
					if not(F)then 
						return 0,false;
					end;
					local x,G=F:GetAttribute("Armor"),F.Character;
					local n,O=G and G:GetAttribute("Armor")or nil,F:GetAttribute("Helmet");
					O=if O==nil then(F:GetAttribute("HasHelmet"))else O;
					G=r[F];
					if G then 
						if G.raw==x then 
							if G.char_armor==n then 
								if G.helmet_flag==O then 
									return G.health,G.helmet;
								end;
							end;
						end;
					end;
					local j,E=0,O==true;
					if type(x)=="number"then 
						j=(s(0,x));
					else 
						if type(x)=="string"then 
							local P,T=pcall(l.JSONDecode,l,x);
							if P then 
								if type(T)=="table"then 
									G=s(0,tonumber(T.Health)or 0);
									E=E or T.Helmet==true;
									E=if z(C(tostring(T.Type or"")),"helmet",1,true)then true else E;
									j=G;
								else 
								end;
							else 
							end;
						else 
						end;
					end;
					j=if j<=0 then if type(n)=="number"then s(0,n)else j else j;
					r[F]={raw=x,char_armor=n,helmet_flag=O,health=j,helmet=E};
					return j,E;
				end};
				local F=R.drop;
				local function R(l,C)
					local z=l.shots[C];
					if not(z)then 
						return;
					end;
					l.health_damage=l.health_damage-z.damage;
					l.armor_damage=l.armor_damage-z.armor;
					F(l.shots,C);
				end;
				local function F(l,C)
					local z,x=c.window(C),l.shots;
					for G=#x,1,-1 do 
						local n=x[G];
						if C-n.time>z then 
							if not(n.acked)then 
								if n.lead then 
									if n.lead>0 then 
										t.reg_miss=t.reg_miss+1;
									end;
								end;
							end;
							R(l,G);
						end;
					end;
				end;
				c.sync=function(l,C,z)
					local x,G,n=os.clock(),c.armor(l),q[C];
					if not(n)then 
						local O={owner=l.UserId,health=z,armor=G,version=0,shots={},health_damage=0,armor_damage=0};
						q[C]=O;
						return O;
					end;
					F(n,x);
					if n.owner~=l.UserId or z>n.health+0.01 or G>n.armor+0.01 then 
						n.owner=l.UserId;
						n.version=n.version+1;
						table.clear(n.shots);
						n.health_damage=0;
						n.armor_damage=0;
					elseif z<n.health-0.01 or G<n.armor-0.01 then 
						n.version=n.version+1;
						x=n.shots;
						for F=#x,1,-1 do 
							if x[F].acked then 
								R(n,F);
							end;
						end;
					end;
					n.health=z;
					n.armor=G;
					return n;
				end;
				c.effective_armor=function(F)
					local l=F and F.Character;
					local C,z,x=l and(l:GetAttribute("Health")),c.armor(F);
					if l then 
						if typeof(C)=="number"then 
							if C>0 then 
								local G=c.sync(F,l,C);
								z=s(0,G.armor-G.armor_damage);
							else 
							end;
						else 
						end;
					else 
					end;
					return z,x;
				end;
				c.reserve=function(F,l)
					local C,z=F and F.player,F and F.char;
					local x,G=z and(z:GetAttribute("Health")),tonumber(F and F.dmg);
					if C then 
						if z then 
							if typeof(x)~="number"then 
								return;
							elseif x<=0 then 
								return;
							elseif G then 
								if G<=0 then 
									return;
								end;
							else 
								return;
							end;
						else 
							return;
						end;
					else 
						return;
					end;
					local n,O,j=c.sync(C,z,x),s(0,tonumber(F.armor_dmg)or 0),F.shot;
					x=n.shots;
					x[#x+1]={damage=G,armor=O,time=os.clock(),acked=false,version=n.version,part=j and j.hit_part or F.part,position=j and j.hit_pos or nil,seq=(tonumber(l and l.ShotSeq)or 0)+1,lead=tonumber(F.lead)or 0};
					n.health_damage=n.health_damage+G;
					n.armor_damage=n.armor_damage+O;
					if#x>128 then 
						R(n,1);
					end;
				end;
				local function F(l)
					local s=g:GetPlayerFromCharacter(l);
					if s then 
						return s;
					end;
					local s,C=N.all();
					for N=1,C,1 do 
						if s[N].Character==l then 
							return s[N];
						end;
					end;
					return nil;
				end;
				local function N(l,s,C,z,x)
					local G,n,O=l.shots,-math.huge,typeof(s.Position)=="Vector3"and s.Position or nil;
					l=nil;
					for j=1,#G,1 do 
						s=G[j];
						if s.acked then 
						else 
							local G,E=if x then if s.seq==x then 8 else 0 else 0,s.part;
							G=if C and E==C then G+4 else if z then if typeof(E)=="Instance"then if E.Name==z then G+2 else G else G else G;
							if O then 
								if typeof(s.position)=="Vector3"then 
									E=(O-s.position).Magnitude;
									G=if E<=6 then G+(2-E/3)else G;
								else 
								end;
							else 
							end;
							if G>n then 
								n,l=G,j;
							else 
							end;
						end;
					end;
					return l,n;
				end;
				local function l(s,C)
					local z=s.shots[C];
					z.acked=true;
					if z.lead then 
						if z.lead>0 then 
							t.reg_hits=t.reg_hits+1;
							t.reg_lead=t.reg_lead+z.lead;
						end;
					end;
					if s.version>z.version then 
						R(s,C);
					end;
				end;
				local function R(t)
					if a then 
						if type(t)~="table"then 
							return;
						elseif t.Exit==true then 
							return;
						end;
					else 
						return;
					end;
					if tonumber(t.AttackerUserId)~=f.UserId then 
						return;
					end;
					local f=tonumber(t.VictimUserId);
					if f then 
						local s,C,z,x,G=type(t.HitPartName)=="string"and t.HitPartName or nil,tonumber(t.ShotSeq),-math.huge;
						for n,O in q,nil,nil do 
							if O.owner==f then 
								local j,E=n:GetAttribute("Health"),F(n)or g:GetPlayerByUserId(f)or h.key(f);
								if E then 
									if typeof(j)=="number"then 
										if j>0 then 
											c.sync(E,n,j);
										end;
									end;
								end;
								E,j=N(O,t,nil,s,C);
								if E then 
									if j>z then 
										z,x,G=j,O,E;
									else 
									end;
								else 
								end;
							else 
							end;
						end;
						if x then 
							l(x,G);
						end;
						return;
					end;
					f=t.Instance;
					if typeof(f)~="Instance"then 
						return;
					end;
					local h=f;
					while h and not h:IsA("Model")do 
						h=h.Parent;
					end;
					if not(h)then 
						return;
					end;
					local g=F(h);
					if not(g)then 
						return;
					end;
					local F=h:GetAttribute("Health");
					if typeof(F)~="number"then 
						return;
					elseif F<=0 then 
						return;
					end;
					local s=c.sync(g,h,F);
					g=N(s,t,f,nil,nil);
					if g then 
						l(s,g);
					end;
				end;
				c.clear=function()
					for N in q,nil,nil do 
						q[N]=nil;
					end;
					for N in r,nil,nil do 
						r[N]=nil;
					end;
				end;
				c.start=function()
					if m then 
						return;
					elseif U then 
						return;
					elseif not(a)then 
						return;
					end;
					U=true;
					_.spawn(function()
						if a then 
							if not(u)then 
								U=false;
								return;
							end;
						else 
							U=false;
							return;
						end;
						local N=u.VFX and u.VFX.CreateImpact;
						if N then 
							if type(N.Listen)~="function"then 
								U=false;
								return;
							end;
						else 
							U=false;
							return;
						end;
						local h,F=pcall(N.Listen,function(N)
							if a then 
								pcall(R,N);
							end;
						end);
						U=false;
						if h then 
							if type(F)=="function"then 
								if a then 
									m=_.adopt(F);
								else 
									pcall(F);
								end;
							end;
						end;
					end);
				end;
				c.stop=function()
					a,U,m=false,false,nil;
					c.clear();
				end;
				_.teardown(c.stop);
				c.start();
				return c;
			end;
			K.ah=function()
				return{groups={head={"Head"},chest={"UpperTorso"},stomach={"LowerTorso"},arms={"LeftUpperArm","RightUpperArm","LeftLowerArm","RightLowerArm","LeftHand","RightHand"},legs={"LeftUpperLeg","RightUpperLeg","LeftLowerLeg","RightLowerLeg","LeftFoot","RightFoot"}},order={"head","chest","stomach","arms","legs"},damage_key={Head="Head",UpperTorso="Torso",LowerTorso="Torso",LeftUpperArm="Arms",RightUpperArm="Arms",LeftLowerArm="Arms",RightLowerArm="Arms",LeftHand="Arms",RightHand="Arms",LeftUpperLeg="Legs",RightUpperLeg="Legs",LeftLowerLeg="Legs",RightLowerLeg="Legs",LeftFoot="Legs",RightFoot="Legs"},group_of={Head="head",UpperTorso="chest",LowerTorso="stomach",LeftUpperArm="arms",RightUpperArm="arms",LeftLowerArm="arms",RightLowerArm="arms",LeftHand="arms",RightHand="arms",LeftUpperLeg="legs",RightUpperLeg="legs",LeftLowerLeg="legs",RightLowerLeg="legs",LeftFoot="legs",RightFoot="legs"},size_key={head="head_size",chest="chest_size",stomach="stomach_size",arms="arms_size",legs="legs_size"},teams={["Counter-Terrorists"]=true,Terrorists=true}};
			end;
			K.ai=function()
				local U,R,_=K.load("b"),K.load("ah"),K.load("af");
				local N=K.load("ag");
				local h=K.load("p");
				local F=U.lp;
				local t=U.workspace;
				local f=U.players;
				local l=R.teams;
				local R=os.clock;
				local g=U.weak();
				local u,s=U.weak(),{};
				local function U(C)
					local z=u[C];
					if z then 
					else 
						z={stamp=0,shield_stamp=0,shield=false,player=nil,ok=false,root=nil};
						u[C]=z;
					end;
					return z;
				end;
				s.part=function(u,C)
					local z=g[u];
					if z then 
					else 
						z={};
						g[u]=z;
					end;
					local g=z[C];
					if g then 
						if g.Parent==u then 
							return g;
						end;
					end;
					g=u:FindFirstChild(C);
					g=g and(if g:IsA("BasePart")then g else nil);
					z[C]=g;
					return g;
				end;
				s.shielded=function(g)
					local u,C=U(g),R();
					if C<u.shield_stamp then 
						return u.shield;
					end;
					local z=g:FindFirstChildWhichIsA("ForceField",true)~=nil;
					u.shield_stamp=C+0.1;
					u.shield=z;
					return z;
				end;
				s.alive=function(g)
					if g then 
						if not(g:IsDescendantOf(t))then 
							return false;
						end;
					else 
						return false;
					end;
					if g:GetAttribute("Dead")~=false then 
						return false;
					end;
					local u=g:GetAttribute("Health");
					return typeof(u)=="number"and u>0;
				end;
				local function g(u,C,z)
					if C:GetAttribute("Dead")~=false then 
						return false;
					elseif C:GetAttribute("Invincible")==true then 
						return false;
					end;
					local q=C:GetAttribute("Health");
					if typeof(q)~="number"then 
						return false;
					elseif q<=0 then 
						return false;
					end;
					local r=R();
					if r>=z.shield_stamp then 
						z.shield_stamp=r+0.1;
						z.shield=C:FindFirstChildWhichIsA("ForceField",true)~=nil;
					end;
					if z.shield then 
						return false;
					end;
					if q-N.sync(u,C,q).health_damage<=0 then 
						return false;
					end;
					z=s.part(C,"HumanoidRootPart");
					if not z then 
						return false;
					end;
					if not(s.part(C,"Head"))then 
						return false;
					end;
					if not(s.part(C,"UpperTorso"))then 
						return false;
					end;
					if not(s.part(C,"LowerTorso"))then 
						return false;
					end;
					if _.team_check then 
						C,r=F:GetAttribute("Team"),u:GetAttribute("Team");
						if C then 
							if not r then 
								return false;
							end;
						else 
							return false;
						end;
						if l[C]then 
							if not(l[r])then 
								return false;
							end;
						else 
							return false;
						end;
						if t:GetAttribute("Gamemode")~="Deathmatch"then 
							if C==r then 
								return false;
							end;
						end;
					end;
					return true,z;
				end;
				s.valid=function(_,N)
					if _ then 
						if _==F then 
							return false;
						elseif _.Parent~=f then 
							return false;
						elseif N then 
						else 
							return false;
						end;
					else 
						return false;
					end;
					if not(h.armed(_,N))then 
						if _.Character~=N then 
							return false;
						elseif not(N:IsDescendantOf(t))then 
							return false;
						end;
					end;
					local h,F=U(N),R();
					if h.player==_ then 
						if F<h.stamp then 
							return h.ok,h.root;
						end;
					end;
					local U,R=g(_,N,h);
					h.stamp=F+0.005;
					h.player=_;
					h.ok=U;
					h.root=R;
					return U,R;
				end;
				return s;
			end;
			K.aj=function()
				local U,R,_,N,h,F=K.load("b"),K.load("f"),K.load("a"),K.load("j"),K.load("L"),K.load("af");
				local t=K.load("ai");
				local f=U.lp;
				local l=U.workspace;
				local g,u=U.storage,h.probe;
				local s=h.through;
				local C=R.copy_with;
				local z=R.trim;
				local q=math.sqrt;
				local r=math.abs;
				local x,x,x=math.max,math.min,{on=false,power=1,step=0.015625,ticks=2,gravity=60,max_speed=262.5,ground_speed=24.375,measured=0};
				local G=U.weak();
				local a,m;
				local c=-1;
				h,U=g:FindFirstChild("MovementV2"),N.kinematics;
				if h then 
					g=h:FindFirstChild("Config");
					if g then 
						if g:IsA("ModuleScript")then 
							local n,O=pcall(require,g);
							R=n and type(O)=="table"and O.Default or nil;
							if type(R)=="table"then 
								O=R.SimulationHz;
								if type(O)=="number"then 
									if O>=20 then 
										if O<=240 then 
											x.step=1/O;
										end;
									end;
								end;
								n=R.RenderInterpolationTicks;
								if type(n)=="number"then 
									if n>=0 then 
										x.ticks=n;
									end;
								end;
							end;
						end;
					end;
					local R=h:FindFirstChild("Simulation");
					g=R and(R:FindFirstChild("Config"));
					if g then 
						if g:IsA("ModuleScript")then 
							local h,n=pcall(require,g);
							R=h and type(n)=="table"and n.Default or nil;
							if type(R)=="table"then 
								h=R.Gravity;
								if type(h)=="number"then 
									if h>0 then 
										x.gravity=h;
									end;
								end;
								n=R.MaxVelocity;
								if type(n)=="number"then 
									if n>0 then 
										x.max_speed=n;
									end;
								end;
								local h=R.MaxBaseMoveSpeed;
								if type(h)=="number"then 
									if h>0 then 
										x.ground_speed=h*1.25;
									end;
								end;
							end;
						end;
					end;
				end;
				g=N.char_velocity;
				if type(g)=="function"then 
					a=g;
				else 
					if U and type(U.getVelocity)=="function"then 
						local R=U.getVelocity;
						a=function(N)
							return R(N,N.PrimaryPart);
						end;
					else 
					end;
				end;
				if U then 
					if type(U.isOnGround)=="function"then 
						local R=U.isOnGround;
						m=R;
					else 
					end;
				else 
				end;
				local U,R,N,h,g=a,m,{},{},{};
				local a=RaycastParams.new();
				a.FilterType=Enum.RaycastFilterType.Include;
				a.IgnoreWater=false;
				a.CollisionGroup="Bullet";
				local m=RaycastParams.new();
				m.FilterType=Enum.RaycastFilterType.Exclude;
				m.IgnoreWater=false;
				m.CollisionGroup="Bullet";
				local n=RaycastParams.new();
				n.FilterType=Enum.RaycastFilterType.Exclude;
				n.IgnoreWater=false;
				n.CollisionGroup="Bullet";
				x.lead=function()
					local O=c;
					if O~=x.power then 
						c=x.power;
						F.reg_hits=0;
						F.reg_miss=0;
						F.reg_lead=0;
					end;
					if not(x.on)then 
						return 0;
					end;
					O=tonumber(x.power);
					if O then 
						if O~=O then 
							return 0;
						elseif r(O)<0.001 then 
							return 0;
						end;
					else 
						return 0;
					end;
					local F=f:GetNetworkPing();
					F=if type(F)~="number"then 0.05 else if F~=F then 0.05 else if F<=0 then 0.05 else if F>1 then 1 else F;
					x.measured=F;
					local f=F*O;
					if f~=f then 
						return 0;
					elseif r(f)<0.001 then 
						return 0;
					end;
					if f>2 then 
						return 2;
					end;
					if f<-2 then 
						return-2;
					end;
					return f;
				end;
				x.filter=function(F,f)
					return C(N,F,f);
				end;
				local function F(f,C)
					local c=t.part(f,"HumanoidRootPart");
					if not(c)then 
						return C;
					end;
					local O=t.part(f,"LeftFoot")or t.part(f,"RightFoot");
					local j,E=if O then O.Position.Y-O.Size.Y*0.5 else c.Position.Y-c.Size.Y*0.5-2,-C.Y;
					g[1]=f;
					z(g,1);
					m.FilterDescendantsInstances=g;
					f=l:Raycast(c.Position,Vector3.new(0,-(E+6),0),m);
					if not f then 
						return C;
					end;
					O=j-f.Position.Y;
					O=if O~=O then 0 else if O<0 then 0 else O;
					if E<=O then 
						return C;
					end;
					return Vector3.new(C.X,-O,C.Z);
				end;
				local function f(C)
					local m=t.part(C,"HumanoidRootPart");
					if not(m)then 
						return Vector3.zero;
					end;
					local c,O,j=os.clock(),m.Position,G[C];
					if not(j)then 
						G[C]={pos=O,time=c,vel=Vector3.zero};
						return Vector3.zero;
					end;
					m=c-j.time;
					if m<0.008 then 
						return j.vel;
					end;
					if m>0.5 then 
						j.pos=O;
						j.time=c;
						j.vel=Vector3.zero;
						return Vector3.zero;
					end;
					C=(O-j.pos)/m;
					j.pos=O;
					j.time=c;
					O,m=C.X,C.Z;
					c=q(O*O+m*m);
					if c~=c then 
						C=Vector3.zero;
					else 
						if c>x.ground_speed then 
							local q=x.ground_speed/c;
							C=Vector3.new(O*q,C.Y,m*q);
						else 
						end;
					end;
					m=C.Y;
					C=if m~=m then Vector3.zero else if m>x.max_speed then Vector3.zero else if m<-x.max_speed then Vector3.zero else C;
					j.vel=C;
					return C;
				end;
				x.offset=function(C,q)
					if C then 
						if r(q)<0.001 then 
							return Vector3.zero;
						end;
					else 
						return Vector3.zero;
					end;
					local G=if U then(U(C))else nil;
					if typeof(G)~="Vector3"or G.Magnitude<0.05 then 
						local U=t.part(C,"HumanoidRootPart");
						G=U and U.AssemblyLinearVelocity or nil;
					else 
					end;
					G=if typeof(G)~="Vector3"then f(C)else if G.Magnitude<0.05 then f(C)else G;
					local U=G.Magnitude;
					if U~=U then 
						return Vector3.zero;
					elseif U<0.05 then 
						return Vector3.zero;
					end;
					local t,f=(if U>x.max_speed then G*(x.max_speed/U)else G)*q,R and R(C)or nil;
					t=if f==true then Vector3.new(t.X,0,t.Z)else if f==false then if q>0 then t-Vector3.new(0,0.5*x.gravity*q*q,0)else t else t;
					if t.X~=t.X then 
						return Vector3.zero;
					elseif t.Y~=t.Y then 
						return Vector3.zero;
					elseif t.Z~=t.Z then 
						return Vector3.zero;
					end;
					return if t.Y<-0.05 then F(C,t)else t;
				end;
				local function U(R,F,t,f)
					local C,q,G,m,c,O,j=t:PointToObjectSpace(R),t:VectorToObjectSpace(F),f*0.5,-math.huge,0,-1,math.huge;
					for E=1,3,1 do 
						R,F,f=nil;
						if E==1 then 
							R,F,f=C.X,q.X,G.X;
						else 
							if E==2 then 
								R,F,f=C.Y,q.Y,G.Y;
							else 
								R,F,f=C.Z,q.Z,G.Z;
							end;
						end;
						if r(F)<1.0E-7 then 
							if R<-f then 
								return nil;
							elseif R>f then 
								return nil;
							end;
						else 
							local C,q,r,G=(-f-R)/F,(f-R)/F,-1,O;
							if C>q then 
								r=1;
								C,q,O=q,C,r;
							else 
								O=r;
							end;
							if C>m then 
								m,c=C,E;
							else 
								O=G;
							end;
							j=if q<j then q else j;
							if m>j then 
								return nil;
							end;
						end;
					end;
					if c==0 then 
						return nil;
					elseif m~=m then 
						return nil;
					elseif m<=0.05 then 
						return nil;
					end;
					R=if c==1 then Vector3.new(O,0,0)else if c==2 then Vector3.new(0,O,0)else Vector3.new(0,0,O);
					return m,t:VectorToWorldSpace(R);
				end;
				x.hit=function(R,F,t,f,C)
					h[1]=t;
					z(h,1);
					a.FilterDescendantsInstances=h;
					local q=R-f;
					local r=l:Raycast(q,F*(C+1),a);
					if r then 
						if r.Instance==t then 
							local l=(r.Position-q).Magnitude;
							if l>0.05 then 
								if l<=C+1 then 
									return l,r.Normal;
								end;
							end;
						end;
					end;
					return U(R,F,t.CFrame+f,t.Size);
				end;
				x.path=function(U,R,F,t,f)
					local l,C=F-0.02,u(U,R*F,n,f);
					if C then 
						if not(C.instance)then 
							return 0,0,nil,nil;
						end;
					else 
						return 0,0,nil,nil;
					end;
					local u=C.position-U;
					if u.X*R.X+u.Y*R.Y+u.Z*R.Z>=l then 
						return 0,0,nil,nil;
					end;
					if not(t)then 
						return 2,0,nil,nil;
					end;
					C=s(U+R*-0.001,R*(F+0.001),t,f,nil,F);
					if not C then 
						return 2,0,nil,nil;
					end;
					f=0;
					for u=1,#C,1 do 
						F=C[u];
						if not(F.instance)then 
							break;
						end;
						t=F.position-U;
						if t.X*R.X+t.Y*R.Y+t.Z*R.Z>=l then 
							break;
						end;
						f=u;
					end;
					if f==0 then 
						return 2,0,nil,nil;
					elseif f%2~=0 then 
						return 2,0,nil,nil;
					end;
					return 1,f*0.5,C,f+1;
				end;
				_.teardown(function()
					x.on=false;
					z(N,0);
					z(h,0);
					z(g,0);
				end);
				return x;
			end;
			K.ak=function()
				local U,R,_,N,h=K.load("b"),K.load("a"),K.load("j"),K.load("ah"),K.load("af");
				local F=K.load("aj");
				local t=K.load("ag");
				local f=K.load("i");
				local l=U.storage;
				local g,u,s=_.inventory,N.groups,{names={},valid={},aliases={}};
				s.by_props=U.weak();
				s.active=nil;
				s.weapon=nil;
				s.on_apply=nil;
				s.ui=nil;
				local U={pistols=1,rifles=2,snipers=3,smgs=4,shotguns=5,["machine guns"]=6,heavy=7,other=8};
				s.boxes=function(_)
					local N={};
					if type(_)=="table"then 
						for C,C in _,nil,nil do 
							if u[C]then 
								N[C]=true;
							end;
						end;
					end;
					return N;
				end;
				s.category=function(_)
					if type(_)~="table"then 
						return nil;
					end;
					local N,u=tostring(rawget(_,"Type")or""),tostring(rawget(_,"MuzzleType")or"");
					if u=="Zeus x27"then 
						return nil;
					end;
					if u=="Sniper"then 
						return"snipers";
					end;
					if u=="ShotGun"then 
						return"shotguns";
					end;
					if u=="MachineGun"then 
						return"machine guns";
					end;
					if N=="Pistol"then 
						return"pistols";
					end;
					if N=="Rifle"then 
						return"rifles";
					end;
					if N=="SMG"then 
						return"smgs";
					end;
					if N=="Heavy"then 
						return"heavy";
					end;
					return"other";
				end;
				s.load=function()
					local _=l:FindFirstChild("Database");
					local N=_ and(_:FindFirstChild("Custom"));
					_=N and(N:FindFirstChild("Weapons"));
					if not _ then 
						return;
					end;
					N=_:GetChildren();
					for l=1,#N,1 do 
						_=N[l];
						if _:IsA("ModuleScript")then 
							if _.Name~="Zeus x27"then 
								local N,u=pcall(require,_);
								l=N and type(u)=="table"and u.Class=="Weapon"and s.category(u);
								if l then 
									s.by_props[u]=l;
									s.aliases[_.Name:lower()]=l;
									if not(s.valid[l])then 
										s.valid[l]=true;
										s.names[#s.names+1]=l;
									end;
								end;
							end;
						end;
					end;
					table.sort(s.names,function(_,N)
						local l,u=U[_]or math.huge,U[N]or math.huge;
						if l==u then 
							return _<N;
						end;
						return l<u;
					end);
				end;
				s.find_type=function(U)
					if type(U)~="table"then 
						return nil;
					end;
					local _=rawget(U,"Properties");
					local N=_ and s.by_props[_]or nil;
					N=N or(if type(_)=="table"then s.category(_)else N);
					if N then 
					else 
						_=rawget(U,"Name");
						N=if type(_)=="string"then s.aliases[_:lower()]else N;
					end;
					if N then 
						if s.valid[N]then 
							return N;
						end;
					end;
					return nil;
				end;
				s.apply=function(U)
					local _=s.ui;
					if not _ then 
						return;
					end;
					local function N(l)
						return _:get("legit."..l,U);
					end;
					local _,l,u=U~=nil,h.double_tap,h.rapid;
					h.on=_ and N("on")or false;
					h.team_check=N("team");
					h.boxes=s.boxes(N("hb"));
					h.prefer=N("prefer");
					h.auto_shoot=_ and N("auto")or false;
					h.auto_wall=_ and N("aw")or false;
					h.wallbang=false;
					h.magic=false;
					h.auto_revolver=_ and N("autorev")or false;
					h.auto_switch=_ and N("autoswitch")or false;
					h.double_tap=_ and N("dt")or false;
					h.rapid=_ and N("rapid")or false;
					h.no_recoil=_ and N("norecoil")or false;
					h.no_spread=_ and N("nospread")or false;
					h.insta_reload=_ and N("instantreload")or false;
					h.min_damage=N("mindmg");
					h.wall_min_damage=N("awmindmg");
					h.fov=N("fov");
					h.draw_fov=_ and N("dfov")or false;
					h.fov_col=N("dfov_col");
					h.fov_grad=N("dfov_grad");
					h.fov_col2=N("dfov_col2");
					h.fov_fill=N("dfov_fill");
					h.fov_fill_col=N("dfov_fcol");
					h.fov_fill_grad=N("dfov_fgrad");
					h.fov_fill_col2=N("dfov_fcol2");
					h.multipoint=_ and N("multipoint")or false;
					h.head_size=N("headsize");
					h.chest_size=N("chestsize");
					h.stomach_size=N("stomachsize");
					h.arms_size=N("armssize");
					h.legs_size=N("legssize");
					F.on=_ and N("predict")==true or false;
					_=tonumber(N("predict_power"));
					if type(_)=="number"then 
						if _==_ then 
							F.power=_/100;
						else 
							F.power=1;
						end;
					else 
						F.power=1;
					end;
					f.aim=false;
					if s.on_apply then 
						s.on_apply(l,u);
					end;
				end;
				s.refresh=function()
					s.apply(s.active);
				end;
				s.activate=function(U)
					local _=s.find_type(U);
					if s.weapon==U then 
						if s.active==_ then 
							return;
						end;
					end;
					s.weapon=U;
					s.active=_;
					s.apply(_);
				end;
				local U;
				local _=type(g)=="table"and rawget(g,"peekCurrentEquippedForMovement")or nil;
				local function N()
					if type(_)~="function"then 
						return nil;
					end;
					local h,F=pcall(_);
					if h then 
						if type(F)~="table"then 
							return nil;
						elseif F.IsDestroyed then 
							return nil;
						elseif not(F.IsEquipped)then 
							return nil;
						end;
					else 
						return nil;
					end;
					return F;
				end;
				s.held=function()
					local _=U;
					if _ then 
						if not(_.IsDestroyed)then 
							if _.IsEquipped then 
								s.activate(_);
								return _;
							end;
						end;
					end;
					U=nil;
					s.activate(nil);
					return nil;
				end;
				s.adopt=function(_)
					U=_;
				end;
				s.ensure=function()
					local _=s.held();
					if _ then 
						return _;
					end;
					_=N();
					if _ then 
						U=_;
					end;
					s.activate(_);
					return _;
				end;
				s.load();
				R.teardown(function()
					U=nil;
					s.weapon=nil;
					s.active=nil;
					s.ui=nil;
					t.clear();
				end);
				return s;
			end;
			K.al=function()
				local U,R=K.load("b"),K.load("a");
				local _=K.load("h");
				local N,h=K.load("ah"),U.lp;
				local F=U.workspace;
				local t=U.players;
				local f=N.teams;
				local N,l,g,u,s=string.lower,{},{},{},{};
				local C=U.weak();
				local U;
				local z=false;
				local q={picked=l,values=s,set=function(r)
					if z then 
						return;
					end;
					local x={};
					if type(r)=="table"then 
						for G,a in r,nil,nil do 
							local m=if type(G)=="string"and a==true then G else if type(a)=="string"then a else nil;
							G=m and g[m];
							if G then 
								x[G]=true;
							end;
						end;
					elseif type(r)=="string"then 
						local G=g[r];
						if G then 
							x[G]=true;
						end;
					end;
					table.clear(l);
					for r in x,nil,nil do 
						l[r]=true;
					end;
				end};
				local function r(x,G)
					local a,m=N(x),N(G);
					if a==m then 
						return x<G;
					end;
					return a<m;
				end;
				q.refresh=function(N)
					table.clear(g);
					table.clear(u);
					local x,G,a={},_.all();
					local _,m=h:GetAttribute("Team"),F:GetAttribute("Gamemode")=="Deathmatch";
					local c,n=f[_]==true,0;
					for O=1,a,1 do 
						local a=G[O];
						if a~=N then 
							if a~=h then 
								if a.Parent==t then 
									if not(C[a])then 
										local N,h=R.adopt,function()
											q.refresh();
										end;
										C[a]=N(a:GetAttributeChangedSignal("Team"):Connect(h));
									end;
									O=a:GetAttribute("Team");
									if c and f[O]and(m or _~=O)then 
										local _,N=a.UserId,a.DisplayName;
										local h,f=if N==a.Name then"@"..a.Name else N.." (@"..a.Name..")",n+1;
										s[f]=h;
										g[h]=_;
										u[_]=h;
										x[_]=true;
										n=f;
									else 
									end;
								else 
								end;
							else 
							end;
						else 
						end;
					end;
					for _=#s,n+1,-1 do 
						s[_]=nil;
					end;
					table.sort(s,r);
					c={};
					for _ in l,nil,nil do 
						if x[_]then 
							c[#c+1]=u[_];
						else 
							l[_]=nil;
						end;
					end;
					if U then 
						z=true;
						pcall(U.setvalues,U,s);
						pcall(U.set,U,c);
						z=false;
					end;
				end;
				q.bind=function(_)
					U=_;
				end;
				q.unload=function()
					U,z=nil,false;
					table.clear(l);
					table.clear(g);
					table.clear(u);
					table.clear(s);
				end;
				R.connect(F:GetAttributeChangedSignal("Gamemode"),function()
					q.refresh();
				end);
				R.connect(t.PlayerAdded,function()
					q.refresh();
				end);
				R.connect(t.PlayerRemoving,function(U)
					l[U.UserId]=nil;
					q.refresh(U);
				end);
				R.teardown(q.unload);
				return q;
			end;
			K.am=function()
				local U,R,_,N=K.load("b"),K.load("f"),K.load("a"),K.load("h");
				local h,F,t,f=K.load("j"),K.load("L"),K.load("ah"),K.load("af");
				local l=K.load("ag");
				local g=K.load("ai");
				local u=K.load("al");
				local s=K.load("aj");
				local C=K.load("p");
				local z=K.load("M");
				local q=U.lp;
				local r=U.workspace;
				local U=F.probe;
				local x=F.through;
				local F=h.ray_ignore;
				local h=t.groups;
				local G=t.order;
				local a=t.damage_key;
				local m=t.size_key;
				local c=R.trim;
				local R=math.clamp;
				local n=math.max;
				local O,O,O=math.min,math.abs,math.huge;
				local j=math.cos;
				local E=math.rad;
				local P,P,T=math.floor,Vector3.zero,{};
				local Y=RaycastParams.new();
				Y.FilterType=Enum.RaycastFilterType.Exclude;
				Y.IgnoreWater=false;
				Y.CollisionGroup="Bullet";
				local v,Z,L,o,X,Q,S={};
				local A,J,y,e,M,I,i,k,B,d,b,p,D,V,W,H,w,UQ,KQ,RQ={},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{};
				local function _Q(NQ)
					local hQ=KQ[NQ];
					if hQ~=nil then 
						return hQ,RQ[NQ];
					end;
					local hQ,FQ=l.effective_armor(NQ);
					KQ[NQ]=hQ;
					RQ[NQ]=FQ;
					return hQ,FQ;
				end;
				local function l(NQ,hQ,FQ,tQ,fQ)
					local lQ=a[hQ];
					if not(lQ)then 
						return 0,0;
					end;
					hQ=fQ.DamagePerPart;
					if type(hQ)~="table"then 
						return 0,0;
					end;
					local gQ=hQ[lQ]or 0;
					if gQ<=0 then 
						return 0,0;
					end;
					hQ=gQ*(tonumber(fQ.RangeModifier)or 1)^n(0,FQ/100);
					hQ=if tQ>0 then hQ*(tonumber(fQ.WallbangMultiplier)or 1)else hQ;
					gQ,FQ=_Q(NQ);
					NQ=0;
					if gQ>0 and(lQ~="Head"or FQ)then 
						tQ=hQ*R(tonumber(fQ.ArmorPenetration)or 1,0,1);
						NQ=(hQ-tQ)*0.5;
						if NQ>gQ then 
							NQ,tQ=gQ,hQ-gQ/0.5;
						else 
						end;
						hQ=(n(0,tQ));
					else 
					end;
					return hQ,NQ;
				end;
				local function _Q(NQ,hQ,FQ)
					local tQ=a[NQ];
					if not(tQ)then 
						return 0;
					end;
					NQ=FQ.DamagePerPart;
					if type(NQ)~="table"then 
						return 0;
					end;
					local a=NQ[tQ]or 0;
					if type(a)~="number"then 
						return O;
					end;
					if a<=0 then 
						return 0;
					end;
					tQ=tonumber(FQ.RangeModifier)or 1;
					if tQ~=tQ then 
						return O;
					elseif tQ<0 then 
						return O;
					elseif tQ>1 then 
						return O;
					end;
					if hQ then 
						NQ=tonumber(FQ.WallbangMultiplier)or 1;
						if NQ~=NQ then 
							return O;
						elseif NQ<0 then 
							return O;
						end;
						return a*NQ;
					end;
					return a;
				end;
				local function a(NQ)
					return(z.origin(NQ));
				end;
				local function z(NQ,hQ,FQ)
					local tQ=R(tonumber(FQ)or 0,0,100)/100;
					if tQ<=0 then 
						return 0;
					end;
					FQ=NQ.Size;
					local fQ,lQ,gQ,uQ,sQ=n(FQ.X*0.5-0.05,0)*tQ,n(FQ.Y*0.5-0.05,0)*tQ,n(FQ.Z*0.5-0.05,0)*tQ,NQ.CFrame,0;
					if hQ=="head"or hQ=="chest"or hQ=="stomach"then 
						if fQ>0.001 then 
							D[1]=uQ:PointToWorldSpace(Vector3.new(fQ,0,0));
							sQ=2;
							D[sQ]=uQ:PointToWorldSpace(Vector3.new(-fQ,0,0));
						else 
						end;
						if lQ>0.001 then 
							sQ+=1;
							D[sQ]=uQ:PointToWorldSpace(Vector3.new(0,lQ,0));
							sQ+=1;
							D[sQ]=uQ:PointToWorldSpace(Vector3.new(0,-lQ,0));
						else 
						end;
					else 
						tQ=if lQ>=fQ and lQ>=gQ then Vector3.new(0,lQ,0)else if fQ>=gQ then Vector3.new(fQ,0,0)else Vector3.new(0,0,gQ);
						if tQ.Magnitude>0.001 then 
							D[1]=uQ:PointToWorldSpace(tQ);
							D[2]=uQ:PointToWorldSpace(-tQ);
							sQ=2;
						else 
						end;
					end;
					for NQ=sQ+1,4,1 do 
						D[NQ]=nil;
					end;
					return sQ;
				end;
				local function NQ(hQ,FQ,tQ,fQ,lQ,gQ)
					local uQ=hQ-FQ;
					hQ=uQ.Magnitude;
					if hQ<0.5 then 
						return nil;
					elseif hQ>gQ+5 then 
						return nil;
					end;
					gQ=uQ/hQ;
					if fQ<180 then 
						if tQ:Dot(gQ)<lQ then 
							return nil;
						end;
					end;
					return gQ,hQ;
				end;
				local function hQ(FQ,tQ)
					local fQ,lQ,gQ,uQ,sQ=not not tQ.head,not not tQ.chest,not not tQ.stomach,not not tQ.arms,not not tQ.legs;
					if Z==FQ then 
						if L==fQ then 
							if o==lQ then 
								if X==gQ then 
									if Q==uQ then 
										if S==sQ then 
											return v;
										end;
									end;
								end;
							end;
						end;
					end;
					Z,L,o,X,Q,S=FQ,fQ,lQ,gQ,uQ,sQ;
					fQ,sQ={},0;
					if tQ[FQ]then 
						sQ=1;
						fQ[sQ]=FQ;
					else 
					end;
					for L=1,#G,1 do 
						uQ=G[L];
						if uQ~=FQ then 
							if tQ[uQ]then 
								gQ=sQ+1;
								fQ[gQ]=uQ;
								sQ=gQ;
							else 
							end;
						else 
						end;
					end;
					if sQ==0 then 
						fQ[1]=FQ;
						sQ=1;
						for L=1,#G,1 do 
							gQ=G[L];
							if gQ~=FQ then 
								sQ+=1;
								fQ[sQ]=gQ;
							else 
							end;
						end;
					else 
					end;
					gQ=0;
					for G=1,sQ,1 do 
						FQ=fQ[G];
						lQ=h[FQ];
						v[G]={group=FQ,parts=lQ,slot=gQ};
						gQ+=#lQ;
					end;
					c(v,sQ);
					return v;
				end;
				local function h(G,L,o,X,Q,S,FQ,tQ)
					local fQ,lQ,gQ=#A,N.all();
					local N,uQ=0,false;
					for sQ=1,gQ,1 do 
						local gQ=lQ[sQ];
						local lQ=C.target(gQ);
						if lQ~=FQ then 
							local FQ,CQ=g.valid(gQ,lQ);
							if FQ then 
								local FQ=CQ.Position-G;
								local G=FQ.Magnitude;
								if G>0.5 then 
									if G-4<=Q then 
										local Q=o>=180;
										Q=Q or(if G>0.01 then L:Dot(FQ/G)>=X else Q);
										if Q then 
										else 
											if tQ then 
												if tQ>0 then 
													local G=s.offset(lQ,tQ);
													if G.X~=0 or G.Y~=0 or G.Z~=0 then 
														local o=FQ+G;
														local G=o.Magnitude;
														Q=if G>0.01 then L:Dot(o/G)>=X else Q;
													else 
													end;
												else 
												end;
											else 
											end;
										end;
										if Q then 
											local G=N+1;
											A[G]=gQ;
											J[G]=lQ;
											y[G]=sQ;
											e[G]=C.ghost(lQ);
											uQ=if S then if u.picked[gQ.UserId]then true else uQ else uQ;
											N=G;
										else 
										end;
									else 
									end;
								else 
								end;
							else 
							end;
						else 
						end;
					end;
					for C=N+1,fQ,1 do 
						A[C]=nil;
						J[C]=nil;
						y[C]=nil;
						e[C]=nil;
					end;
					return N,uQ;
				end;
				local function N(C,G,L,o)
					table.clear(V);
					table.clear(W);
					table.clear(H);
					table.clear(w);
					table.clear(UQ);
					for X=1,#C,1 do 
						local Q=C[X];
						local S,FQ,tQ=Q.group==L and 1000000 or 0,-O,Q.parts;
						for fQ=1,#tQ,1 do 
							Q=tQ[fQ];
							local tQ,lQ=_Q(Q,false,G),-O;
							lQ=if tQ>=f.min_damage then tQ+S+100000 else lQ;
							fQ=-O;
							if o then 
								if f.magic then 
								else 
									local o,gQ=if tQ>=f.min_damage then tQ+S else fQ,_Q(Q,true,G);
									fQ=if gQ>=f.wall_min_damage then n(o,gQ+S)else o;
								end;
							else 
							end;
							V[Q]=lQ;
							W[Q]=fQ;
							H[Q]=n(lQ,fQ);
							FQ=n(FQ,H[Q]);
						end;
						w[X]=FQ;
					end;
					L=-O;
					for G=#C,1,-1 do 
						L=n(L,w[G]);
						UQ[G]=L;
					end;
				end;
				local function C(G,L,o,X,Q,S)
					local _Q=x(G,L,o,X,Q,S);
					if _Q then 
						if#_Q==0 then 
							return nil;
						end;
					else 
						return nil;
					end;
					S=0;
					for x=1,#_Q,1 do 
						L=_Q[x];
						if L.instance then 
							if L.instance:IsDescendantOf(Q)then 
								return L,S,_Q,x;
							end;
							S=if x%2~=0 then S+1 else S;
						else 
						end;
					end;
					return nil;
				end;
				t={find=function(x,G,L,o)
					if not(f.on)then 
						return nil;
					end;
					if x then 
						if x.Class~="Weapon"then 
							return nil;
						end;
					else 
						return nil;
					end;
					local X=r.CurrentCamera;
					if not(X)then 
						return nil;
					end;
					if not(g.alive(q.Character))then 
						return nil;
					end;
					local q,r,Q=G or a(X)or X.CFrame.Position,X.CFrame.LookVector,R(f.fov,0,180);
					local R,a,S,_Q=j(E(Q/2)),tonumber(x.Range)or 500,f.auto_wall or f.wallbang,n(tonumber(x.Penetration)or 0,0);
					G,X=S and _Q or nil,f.prefer;
					local n,j,E,FQ=hQ(X,f.boxes),F(),s.lead(),0;
					local F,hQ=h(q,r,Q,R,a,L==true,o,E);
					if F==0 then 
						return nil;
					end;
					table.clear(KQ);
					table.clear(RQ);
					N(n,x,X,S);
					local N,h,tQ,fQ,lQ,gQ,uQ,sQ,CQ,zQ,qQ,rQ,xQ,GQ,aQ,mQ,cQ,nQ,OQ,jQ=-1,-O,O;
					L,o=0,0;
					for EQ=1,#n,1 do 
						local PQ=n[EQ];
						if hQ then 
							if N==1 then 
								if h>UQ[EQ]then 
									break;
								end;
							end;
						elseif h>UQ[EQ]then 
							break;
						end;
						EQ=PQ.group;
						local TQ,YQ=EQ==X and 1000000 or 0,PQ.parts;
						local vQ=0;
						for ZQ=1,F,1 do 
							local LQ,oQ,XQ,QQ=A[ZQ],J[ZQ],y[ZQ],e[ZQ];
							ZQ=hQ and u.picked[LQ.UserId]and 1 or 0;
							for SQ=1,#YQ,1 do 
								local AQ=YQ[SQ];
								local JQ=H[AQ];
								if JQ>-O and ZQ>=N and(ZQ>N or not(h>JQ))then 
									local JQ=g.part(oQ,AQ);
									if JQ then 
										local yQ=JQ.Position;
										local eQ=yQ-q;
										local MQ=eQ.Magnitude;
										if MQ>=0.5 and MQ<=a+5 then 
											local IQ,iQ,kQ=eQ/MQ,XQ*100+PQ.slot+SQ,false;
											if f.magic then 
												local XQ,SQ=l(LQ,JQ.Name,MQ,0,x);
												if XQ>=f.min_damage then 
													local eQ=XQ+TQ+100000;
													if ZQ>N or ZQ==N and(eQ>h or eQ==h and iQ<tQ)then 
														N,h,tQ,fQ,lQ,gQ,uQ,sQ,CQ,zQ,qQ,rQ,xQ,GQ,aQ,mQ,cQ,nQ,OQ,jQ=ZQ,eQ,iQ,LQ,oQ,JQ,EQ,XQ,SQ,true,IQ,JQ,yQ,-IQ,JQ.Material,0,nil,nil,MQ,q;
													else 
													end;
												else 
												end;
											else 
												if QQ then 
													local XQ,SQ=s.hit(q,IQ,JQ,P,MQ);
													local yQ=XQ or MQ;
													local eQ,BQ,dQ,bQ=s.path(q,IQ,yQ,G,s.filter(j,oQ));
													if eQ~=2 then 
														local eQ,pQ=l(LQ,AQ,yQ,BQ,x);
														if eQ>=(BQ>0 and f.wall_min_damage or f.min_damage)then 
															XQ=eQ+TQ+(BQ==0 and 100000 or 0);
															if ZQ>N or ZQ==N and(XQ>h or XQ==h and iQ<tQ)then 
																N,h,tQ,fQ,lQ,gQ,uQ,sQ,CQ,zQ,qQ,rQ,xQ,GQ,aQ,mQ,cQ,nQ,OQ,jQ=ZQ,XQ,iQ,LQ,oQ,JQ,EQ,eQ,pQ,BQ==0,IQ,JQ,q+IQ*yQ,SQ or-IQ,JQ.Material,BQ,dQ,bQ,yQ,q;
															else 
															end;
														else 
														end;
													else 
													end;
												else 
													local XQ=U(q,IQ*a,Y,j);
													local SQ=XQ and XQ.instance;
													if SQ and(SQ:IsDescendantOf(oQ))then 
														local yQ=(XQ.position-q).Magnitude;
														local eQ,BQ=l(LQ,SQ.Name,yQ,0,x);
														if eQ>=f.min_damage then 
															kQ=true;
															local dQ=eQ+TQ+100000;
															if ZQ>N or ZQ==N and(dQ>h or dQ==h and iQ<tQ)then 
																xQ,GQ=XQ.position,XQ.normal or P;
																N,h,tQ,fQ,lQ,gQ,uQ,sQ,CQ,zQ,qQ,rQ,aQ,mQ,cQ,nQ,OQ,jQ=ZQ,dQ,iQ,LQ,oQ,JQ,EQ,eQ,BQ,true,IQ,SQ,XQ.material,0,nil,nil,yQ,q;
															else 
															end;
														else 
														end;
													else 
														if S and SQ and(ZQ>N or not(h>W[AQ]))then 
															vQ+=1;
															M[vQ]=LQ;
															I[vQ]=oQ;
															i[vQ]=JQ;
															k[vQ]=IQ;
															B[vQ]=MQ;
															d[vQ]=iQ;
															b[vQ]=W[AQ];
															p[vQ]=false;
														else 
														end;
													end;
												end;
											end;
											if f.multipoint and not kQ and not f.magic and not QQ and L<40 then 
												IQ=m[EQ];
												for m=1,z(JQ,EQ,IQ and f[IQ]or 0),1 do 
													if L>=40 then 
														break;
													end;
													local z=D[m];
													local XQ,QQ=NQ(z,q,r,Q,R,a);
													if XQ then 
														L+=1;
														local NQ,SQ=iQ+m/1000,U(q,XQ*a,Y,j);
														z=SQ and SQ.instance;
														if z and(z:IsDescendantOf(oQ))then 
															local U=(SQ.position-q).Magnitude;
															local m,Y=l(LQ,z.Name,U,0,x);
															if m>=f.min_damage then 
																local yQ=m+TQ+100000;
																if ZQ>N or ZQ==N and(yQ>h or yQ==h and NQ<tQ)then 
																	xQ,GQ=SQ.position,SQ.normal or P;
																	N,h,tQ,fQ,lQ,gQ,uQ,sQ,CQ,zQ,qQ,rQ,aQ,mQ,cQ,nQ,OQ,jQ=ZQ,yQ,NQ,LQ,oQ,JQ,EQ,m,Y,true,XQ,z,SQ.material,0,nil,nil,U,q;
																else 
																end;
															else 
															end;
														else 
															if S and z and(ZQ>N or not(h>W[AQ]))then 
																vQ+=1;
																M[vQ]=LQ;
																I[vQ]=oQ;
																i[vQ]=JQ;
																k[vQ]=XQ;
																B[vQ]=QQ;
																d[vQ]=NQ;
																b[vQ]=W[AQ];
																p[vQ]=true;
															else 
															end;
														end;
													else 
													end;
												end;
											else 
											end;
										else 
										end;
									else 
									end;
								else 
								end;
							end;
						end;
						for U=1,vQ,1 do 
							YQ=M[U];
							PQ=hQ and u.picked[YQ.UserId]and 1 or 0;
							local z,m=PQ>=N and(PQ>N or not(h>b[U]));
							if z then 
								local Y=p[U];
								m=if Y then o<8 else not Y;
							else 
								m=z;
							end;
							if m then 
								o=if p[U]then o+1 else o;
								local m,Y=I[U],k[U];
								local NQ,ZQ,LQ,oQ=C(q,Y,_Q,j,m,B[U]);
								z=NQ and NQ.instance;
								if z then 
									local C=(NQ.position-q).Magnitude;
									local XQ,QQ=l(YQ,z.Name,C,ZQ,x);
									if XQ>=(ZQ>0 and f.wall_min_damage or f.min_damage)then 
										local SQ,AQ=d[U],XQ+TQ;
										if PQ>N or PQ==N and(AQ>h or AQ==h and SQ<tQ)then 
											gQ,xQ,GQ=i[U],NQ.position,NQ.normal or P;
											N,h,tQ,fQ,lQ,uQ,sQ,CQ,zQ,qQ,rQ,aQ,mQ,cQ,nQ,OQ,jQ=PQ,AQ,SQ,YQ,m,EQ,XQ,QQ,false,Y,z,NQ.material,ZQ,LQ,oQ,C,q;
										else 
										end;
									else 
									end;
								else 
								end;
							else 
							end;
						end;
						for U=1,vQ,1 do 
							M[U]=nil;
							I[U]=nil;
							i[U]=nil;
							k[U]=nil;
							B[U]=nil;
							d[U]=nil;
							b[U]=nil;
							p[U]=nil;
						end;
					end;
					if s.on and E~=0 and not gQ then 
						_Q,R=#n,0;
						for U=1,F,1 do 
							if R>=12 then 
								break;
							end;
							r,Q=A[U],J[U];
							o=hQ and u.picked[r.UserId]and 1 or 0;
							if o>=N then 
								S=s.offset(Q,E);
								if S.X~=0 or S.Y~=0 or S.Z~=0 then 
									L=y[U];
									for U=1,_Q,1 do 
										if R>=12 then 
											break;
										end;
										if o>N or not(h>UQ[U])then 
											local u=n[U];
											local U=u.group;
											local C,z=U==X and 1000000 or 0,u.parts;
											for m=1,#z,1 do 
												local Y=z[m];
												if H[Y]>-O then 
													local z=g.part(Q,Y);
													if z and(z:IsA("BasePart"))then 
														R+=1;
														local O=z.Position+S-q;
														local NQ=O.Magnitude;
														if NQ>0.5 and NQ<=a+5 then 
															local EQ=O/NQ;
															local O,PQ=s.hit(q,EQ,z,S,NQ);
															local TQ,YQ,vQ,ZQ,LQ=O or NQ,0,0;
															local NQ,oQ=cQ,nQ;
															if f.magic then 
																cQ,nQ=ZQ,LQ;
															else 
																YQ,vQ,cQ,nQ=s.path(q,EQ,TQ,G,s.filter(j,Q));
															end;
															ZQ,LQ=l(r,Y,TQ,vQ,x);
															O=vQ>0 and f.wall_min_damage or f.min_damage;
															if YQ~=2 and ZQ>=O then 
																local O,Y=ZQ+C,L*100+u.slot+m;
																if o>N or o==N and(O>h or O==h and Y<tQ)then 
																	N,h,tQ,fQ,lQ,gQ,uQ,sQ,CQ,zQ,qQ,rQ,xQ,GQ,aQ,mQ,OQ,jQ,FQ=o,O,Y,r,Q,z,U,ZQ,LQ,vQ==0,EQ,z,q+EQ*TQ,PQ or-EQ,z.Material,vQ,TQ,q,E;
																else 
																	cQ,nQ=NQ,oQ;
																end;
															else 
																cQ,nQ=NQ,oQ;
															end;
														else 
														end;
														break;
													end;
												end;
											end;
										else 
										end;
									end;
								else 
								end;
							else 
							end;
						end;
					else 
					end;
					if gQ then 
						if g.valid(fQ,lQ)then 
							if not(gQ:IsDescendantOf(lQ))then 
								return nil;
							end;
						else 
							return nil;
						end;
					else 
						return nil;
					end;
					if s.on and E>0 and FQ==0 and gQ:IsA("BasePart")then 
						S=s.offset(lQ,E);
						if S.X~=0 or S.Y~=0 or S.Z~=0 then 
							L=typeof(jQ)=="Vector3"and jQ or q;
							hQ=gQ.Position+S-L;
							F=hQ.Magnitude;
							if F>0.5 and F<=a+5 then 
								o=hQ/F;
								n,R=s.hit(L,o,gQ,S,F);
								local U,N,h,g,u=n or F,0,0;
								Q,X=cQ,nQ;
								if f.magic then 
									cQ,nQ=g,u;
								else 
									N,h,cQ,nQ=s.path(L,o,U,G,s.filter(j,lQ));
								end;
								r,_Q=l(fQ,gQ.Name,U,h,x);
								u=h>0 and f.wall_min_damage or f.min_damage;
								if N~=2 and r>=u then 
									FQ,sQ,CQ,zQ,qQ,rQ,xQ,GQ,aQ,mQ,OQ,jQ=E,r,_Q,h==0,o,gQ,L+o*U,R or-o,gQ.Material,h,U,L;
								else 
									cQ,nQ=Q,X;
								end;
							else 
							end;
						else 
						end;
					else 
					end;
					F=nil;
					if cQ then 
						F={};
						a=0;
						for U=1,nQ-1,1 do 
							E=cQ[U];
							if E then 
								if E.instance then 
									hQ=a+1;
									F[hQ]={Position=E.position,Instance=E.instance,Material=E.material and E.material.Name or"Plastic",Normal=E.normal or P,Exit=U%2==0};
									a=hQ;
								else 
								end;
							else 
							end;
						end;
					else 
						F=T;
					end;
					return{player=fQ,char=lQ,part=gQ,shot={visible=zQ,dir=qQ,hit_part=rQ,hit_pos=xQ,normal=GQ,material=aQ,walls=mQ,wall_hits=F,dist=OQ,origin=jQ},dmg=sQ,armor_dmg=CQ or 0,group=uQ,lead=FQ};
				end};
				_.teardown(function()
					c(A,0);
					c(J,0);
					c(y,0);
					c(e,0);
					c(M,0);
					c(I,0);
					c(i,0);
					c(k,0);
					c(B,0);
					c(d,0);
					c(b,0);
					c(p,0);
					c(D,0);
					c(v,0);
					table.clear(V);
					table.clear(W);
					table.clear(H);
					table.clear(w);
					table.clear(UQ);
					table.clear(KQ);
					table.clear(RQ);
					Z=nil;
				end);
				return t;
			end;
			K.an=function()
				local U=K.load("q").white;
				return{on=false,team_check=true,auto_wall=false,boxes={head=true,chest=true,stomach=true,arms=true},prefer="head",min_damage=0,wall_min_damage=0,auto_revolver=false,auto_switch=false,hit_chance=70,draw_fov=false,fov_col=U,fov_grad=false,fov_col2=U,fov_fill=false,fov_fill_col=U,fov_fill_grad=false,fov_fill_col2=U};
			end;
			K.ao=function()
				local U,R=K.load("b"),K.load("a");
				local _,N=K.load("j"),K.load("af");
				local h=K.load("an");
				local F=K.load("ak");
				local t=K.load("ai");
				local f=U.lp;
				local l=U.workspace;
				local g=U.input;
				local u=U.keyframes;
				local s,C,z,q=U.getups,U.info,_.weapon,Enum.UserInputType.MouseButton1;
				local r=Enum.UserInputType.MouseButton2;
				local x=math.max;
				local G=math.min;
				local a=math.clamp;
				local m,c=os.clock,{};
				local n,O,j=U.weak(),0;
				_=type(z)=="table"and rawget(z,"startRevolverCharge")or nil;
				if type(_)=="function"and type(s)=="function"and type(C)=="function"then 
					z,U=pcall(s,_);
					if z and type(U)=="table"then 
						for _,_ in U,nil,nil do 
							if type(_)=="function"and C(_,"n")=="completeRevolverChargeShot"then 
								j=_;
								break;
							end;
						end;
					else 
					end;
				else 
				end;
				local function U(_)
					if type(_)~="table"then 
						return nil;
					elseif _.ShootingOptions~="Revolver"then 
						return nil;
					end;
					local s=_.FireModes;
					_=type(s)=="table"and s.Primary or nil;
					if type(_)=="table"then 
						if _.InputBehavior=="Charge"then 
							return _;
						end;
					end;
					return nil;
				end;
				local function _(s,C)
					local z=s.Viewmodel;
					s=type(z)=="table"and z.Animation or nil;
					if type(s)~="table"then 
						return nil;
					end;
					z=C.Animation;
					return type(z)=="string"and s:getAnimation(z)or nil or(s:getAnimation("Shoot"));
				end;
				local function s(C)
					local z,E=pcall(u.GetKeyframeSequenceAsync,u,C);
					if z then 
						if typeof(E)~="Instance"then 
							return;
						end;
					else 
						return;
					end;
					z=E:GetChildren();
					local u;
					for P=1,#z,1 do 
						local T=z[P];
						if T:IsA("Keyframe")then 
							P=T:GetMarkers();
							for z=1,#P,1 do 
								u=if P[z].Name=="Shoot"then if u then if T.Time<u then T.Time else u else T.Time else u;
							end;
						else 
						end;
					end;
					pcall(E.Destroy,E);
					if u then 
						if R.alive()then 
							c[C]=u;
						end;
					end;
				end;
				local function u(C,z)
					local E=x(tonumber(C.ChargeTime)or 0,0);
					C=nil;
					local P=z and z.Animation;
					z=P and P.AnimationId;
					if type(z)=="string"then 
						if z~=""then 
							P=c[z];
							if P==nil then 
								c[z]=false;
								R.spawn(s,z);
							end;
							C=P;
						else 
						end;
					else 
					end;
					P=x((C or E)-0.01,0);
					return P,x(E,P);
				end;
				local function s(C)
					if C.IsDestroyed then 
						return false;
					elseif not(C.IsEquipped)then 
						return false;
					end;
					if C.IsShooting then 
						return false;
					elseif C.IsReloading then 
						return false;
					elseif C.IsAdjustingSuppressor then 
						return false;
					elseif C.IsAlternativeFireHeld then 
						return false;
					elseif C.IsInspecting then 
						return false;
					end;
					local z=C.Rounds;
					if type(z)~="number"then 
						return false;
					elseif z<=0 then 
						return false;
					end;
					if g:IsMouseButtonPressed(r)then 
						return false;
					elseif l:GetAttribute("GameState")=="Buy Period"then 
						return false;
					end;
					if f:GetAttribute("IsDefusingBomb")==true then 
						return false;
					elseif f:GetAttribute("IsLocallyDefusingBomb")==true then 
						return false;
					end;
					if not(t.alive(f.Character))then 
						return false;
					end;
					z=C.Viewmodel;
					local t=type(z)=="table"and z.Animation or nil;
					z=type(t)=="table"and t:getAnimation("Equip")or nil;
					t=z and z.Length or 0;
					return(t>0 and t*0.925 or 0.5)<tick()-(tonumber(C.WeaponEquippedTick)or 0);
				end;
				local t={wait=function(f)
					local l=f and n[f];
					if l==nil then 
						return nil,nil;
					elseif f.IsChargeFiring~=true then 
						return nil,nil;
					end;
					return x(l-(tick()-(tonumber(f.ChargeStartTick)or 0)),0),l;
				end};
				t.ready=function(f)
					return t.wait(f)==0;
				end;
				t.held=function(f)
					return t.wait(f)~=nil;
				end;
				t.fire=function(f)
					local l=U(f.Properties);
					if l then 
						if not(f.IsChargeFiring)then 
							return false;
						end;
					else 
						return false;
					end;
					local C=_(f,l);
					l=nil;
					if j then 
						l=pcall(j,f);
					else 
						f.CurrentWalkSpeedOverride=nil;
						l=pcall(f.shoot,f,"Primary");
					end;
					if not(f.IsChargeFiring)then 
						n[f]=nil;
						if C then 
							if C.Speed==0 then 
								C:AdjustSpeed(1);
							end;
						end;
					end;
					return l;
				end;
				t.pull=function(f)
					if t.ready(f)then 
						return t.fire(f);
					end;
					return pcall(f.shoot,f,"Secondary");
				end;
				local function f(l,C,z)
					local r=l.ChargeShootConnection;
					if r then 
						pcall(r.Disconnect,r);
						l.ChargeShootConnection=nil;
					end;
					r=l.ChargeThread;
					if r then 
						pcall(task.cancel,r);
						l.ChargeThread=nil;
					end;
					r=_(l,C);
					local _,x=u(C,r);
					C=tick()-(tonumber(l.ChargeStartTick)or 0);
					n[l]=x;
					if r then 
						local u=r.TimePosition;
						if r.Speed~=0 then 
							if u+z>=_ then 
								r:AdjustSpeed(0);
							end;
						end;
						if r.Speed==0 then 
							local z=G(C,_);
							if u<z then 
								r.TimePosition=z;
							elseif u>_ then 
								r.TimePosition=z;
							end;
						end;
					end;
					if C>=x then 
						if g:IsMouseButtonPressed(q)then 
							t.fire(l);
						end;
					end;
				end;
				t.step=function()
					local _=m();
					local l=a((_-O)*2,0.02,0.1);
					O=_;
					_=F.ensure();
					local F=_ and U(_.Properties);
					if not(F)then 
						return;
					end;
					if not(N.on and N.auto_revolver or h.on and h.auto_revolver)then 
						if n[_]then 
							n[_]=nil;
							if _.IsChargeFiring then 
								pcall(_.cancelRevolverCharge,_,false);
							end;
						end;
						return;
					end;
					if _.IsChargeFiring then 
						f(_,F,l);
					elseif s(_)then 
						if pcall(_.startRevolverCharge,_,nil)then 
							if _.IsChargeFiring then 
								_.IsFireHeld=false;
								_.FireInputBinding=nil;
								f(_,F,l);
							end;
						end;
					end;
				end;
				R.teardown(function()
					for U in n,nil,nil do 
						n[U]=nil;
						if U.IsChargeFiring then 
							if not(U.IsDestroyed)then 
								pcall(U.cancelRevolverCharge,U,false);
							end;
						end;
					end;
					table.clear(c);
				end);
				return t;
			end;
			K.ap=function()
				local U,R,_,N=K.load("b"),K.load("a"),K.load("j"),K.load("Y");
				local h=K.load("U");
				local F=K.load("M");
				local t=K.load("X");
				local f=K.load("af");
				local l=K.load("ag");
				local g=K.load("ai");
				local u=K.load("ak");
				local s=K.load("am");
				local C=K.load("ao");
				local z=U.lp;
				local q=U.workspace;
				local r=U.input;
				local x,G,a,m,c,n=U.info,_.weapon,_.bullet,_.camera,_.crosshair,_.remotes;
				local O=_.hints;
				local j=_.fire_ready;
				local E=_.legit_ready;
				local P=Enum.UserInputType.MouseButton1;
				local T=table.pack;
				local Y=table.unpack;
				local v=math.max;
				local Z=math.abs;
				local L,L,o=math.floor,T(),{};
				if type(m)=="table"then 
					local X;
					X=R.detour(rawget(m,"setWeaponRecoil"),function(...)
						if f.no_recoil then 
							return nil;
						end;
						return X(...);
					end);
					local X;
					X=R.detour(rawget(m,"weaponKick"),function(...)
						if f.no_recoil then 
							return nil;
						end;
						return X(...);
					end);
				end;
				if type(a)=="table"then 
					local X;
					X=R.detour(rawget(a,"getTrueSpread"),function(...)
						if f.no_spread then 
							return 0;
						end;
						return X(...);
					end);
				end;
				_=type(c)=="table"and rawget(c,"UpdateCrosshair")or nil;
				if type(_)=="function"and type(U.getups)=="function"and type(x)=="function"then 
					m,c=pcall(U.getups,_);
					if m and type(c)=="table"then 
						local U=UDim2.new();
						for m,X in c,nil,nil do 
							if type(X)=="function"then 
								if x(X,"n")=="calculateRecoilOffset"then 
									R.upvalue(_,m,function(...)
										if f.no_recoil then 
											return U;
										end;
										return X(...);
									end);
									break;
								end;
							end;
						end;
					end;
				end;
				local function U(_,x)
					if N.manual[_]~=x then 
						return;
					end;
					x.thread=nil;
					local m=N.alive;
					if(if m then x.generation~=N.generation else not m)or not f.rapid or u.held()~=_ or not r:IsMouseButtonPressed(P)or not N.can_force(_,"rapid")then 
						N.manual[_]=nil;
						N.last_target[_]=nil;
						return;
					end;
					m=t.wait(_);
					if m>0 then 
						x.thread=task.delay(m+0.001,U,_,x);
						return;
					end;
					m=N.force(_,x.args,"rapid");
					if N.manual[_]~=x then 
						return;
					elseif x.generation~=N.generation then 
						return;
					end;
					if not m then 
						N.manual[_]=nil;
						N.last_target[_]=nil;
						return;
					end;
					N.last_shot=os.clock();
					x.thread=task.defer(U,_,x);
				end;
				local function _(x,m)
					if N.manual[x]then 
						return;
					elseif N.alive then 
						if not(f.rapid)then 
							return;
						end;
					else 
						return;
					end;
					N.cancel();
					if N.alive then 
						if f.rapid then 
							if u.held()~=x then 
								return;
							elseif r:IsMouseButtonPressed(P)then 
								if not(N.can_force(x,"rapid"))then 
									return;
								end;
							else 
								return;
							end;
						else 
							return;
						end;
					else 
						return;
					end;
					local c={args=m,generation=N.generation,thread=nil};
					N.manual[x]=c;
					N.open_gate(x);
					c.thread=task.defer(U,x,c);
				end;
				local function U(x,m)
					local c,X=x and x.Properties,q.CurrentCamera;
					if c then 
						if c.Class~="Weapon"then 
							return nil;
						elseif X then 
						else 
							return nil;
						end;
					else 
						return nil;
					end;
					x=F.origin(X);
					X=s.find(c,x,true,m);
					if not X then 
						return nil;
					end;
					return c,x,X;
				end;
				local function x(m,c,X,Q)
					if N.alive then 
						if not(f.double_tap)then 
							return;
						end;
					else 
						return;
					end;
					if type(m.Rounds)~="number"then 
						return;
					elseif m.Rounds<=0 then 
						return;
					end;
					if N.manual[m]then 
						return;
					elseif N.has_pending(m)then 
						return;
					end;
					local S,A=N.generation;
					A=task.defer(function()
						local J=N.alive;
						if(if J then S~=N.generation else not J)or not f.double_tap then 
							N.pending[A]=nil;
							return;
						elseif u.held()~=m then 
							N.pending[A]=nil;
							return;
						elseif N.manual[m]then 
							N.pending[A]=nil;
							return;
						end;
						J=t.wait(m);
						if J>0 then 
							task.wait(J+0.001);
							local y=N.alive;
							if(if y then S~=N.generation else not y)or not f.double_tap then 
								N.pending[A]=nil;
								return;
							elseif u.held()~=m then 
								N.pending[A]=nil;
								return;
							elseif N.manual[m]then 
								N.pending[A]=nil;
								return;
							end;
						end;
						J=false;
						if X or Q then 
							local S,y,e;
							if Q then 
								S,y,e=U(m,Q);
							else 
							end;
							if e then 
							else 
								S,y,e=U(m);
							end;
							if e then 
								N.bind(S,y,e);
								J=true;
							else 
								if X then 
									N.pending[A]=nil;
									return;
								end;
							end;
						else 
						end;
						if N.manual[m]then 
							if J then 
								N.unbind();
							end;
							N.pending[A]=nil;
							return;
						end;
						local X=N.force(m,c,"double");
						if J then 
							N.unbind();
						end;
						N.pending[A]=nil;
						if X then 
							N.last_shot=os.clock();
						end;
					end);
					N.pending[A]=m;
				end;
				u.on_apply=function(m,c)
					if m and not f.double_tap then 
						N.cancel();
					elseif c~=f.rapid then 
						N.cancel();
					end;
					if c~=f.rapid then 
						N.last_scan=0;
					end;
					if not(f.on)then 
						l.clear();
					end;
				end;
				if j then 
					R.field(G,"shoot",function(m)
						return function(c,...)
							if N.alive then 
								if N.forcing[c]then 
									return m(c,...);
								end;
							else 
								return m(c,...);
							end;
							if N.manual[c]then 
								N.open_gate(c);
								N.last_target[c]=nil;
								return nil;
							end;
							local X=N.intent[c]==true;
							local Q,S=f.rapid and not X and r:IsMouseButtonPressed(P),T(...);
							N.last_target[c]=nil;
							local A,J,y,e=tonumber(c.ShotSeq),tonumber(c.Rounds),T(m(c,...)),N.last_target[c];
							N.last_target[c]=nil;
							local m,M=tonumber(c.ShotSeq),tonumber(c.Rounds);
							local I=A and m and m>A;
							if I or(if J then if M then M<J else I else I)then 
								t.mark(c);
								if Q then 
									_(c,S);
								else 
									x(c,S,X,e);
								end;
							end;
							return Y(y,1,y.n);
						end;
					end);
				end;
				local function _(x)
					local m=n and n.Inventory;
					local c=m and m.ReloadWeapon;
					if type(c)~="table"then 
						return false;
					elseif type(c.Send)~="function"then 
						return false;
					end;
					if x then 
						if x.IsDestroyed then 
							return false;
						elseif x.IsEquipped~=true then 
							return false;
						elseif x.IsAdjustingSuppressor then 
							return false;
						end;
					else 
						return false;
					end;
					local n=x.Properties;
					if type(n)~="table"then 
						return false;
					elseif n.Class~="Weapon"then 
						return false;
					elseif n.RechargeTime then 
						return false;
					end;
					local X,Q,S=tonumber(n.Rounds),tonumber(x.Rounds),tonumber(x.Capacity);
					if X then 
						if Q then 
							if S then 
								if Q>=X then 
									return false;
								end;
							else 
								return false;
							end;
						else 
							return false;
						end;
					else 
						return false;
					end;
					local A=x.Identifier;
					if type(A)~="string"then 
						return false;
					end;
					local J=q:GetAttribute("Gamemode")=="Deathmatch";
					if S<=0 then 
						if not(J)then 
							return false;
						end;
					end;
					local y=m.CreateMagazine;
					if type(y)=="table"then 
						if type(y.Send)=="function"then 
							pcall(y.Send,A);
						end;
					end;
					if not(pcall(c.Send,{Identifier=A,Rounds=Q,Capacity=S}))then 
						return false;
					end;
					if J and tonumber(n.ReloadAnimationCount)==1 then 
						x.Rounds=X;
						x.Capacity=tonumber(n.Capacity)or S;
					else 
						m=Z(X-Q);
						if S-m>0 then 
							x.Rounds=X;
							x.Capacity=v(0,S-m);
						else 
							x.Rounds=Q+S;
							x.Capacity=0;
						end;
					end;
					x.CurrentReloadIdentity=nil;
					x.IsReloading=false;
					x.IsShooting=false;
					x.CurrentWalkSpeedOverride=nil;
					y=rawget(x,"ReloadTrackFinishedConnection");
					if y then 
						pcall(y.Disconnect,y);
						x.ReloadTrackFinishedConnection=nil;
					end;
					N.open_gate(x);
					pcall(x.stopAllAnimations,x);
					if O then 
						if type(O.clearHint)=="function"then 
							pcall(O.clearHint,O,"Reload");
						end;
					end;
					return true;
				end;
				if j and type(G.reload)=="function"then 
					R.field(G,"reload",function(x)
						return function(G,...)
							if f.insta_reload then 
								if N.alive then 
									local m,c=pcall(_,G);
									if m then 
										if c then 
											return;
										end;
									end;
								end;
							end;
							return x(G,...);
						end;
					end);
				end;
				local _={weapon=nil,seq=nil,at=0,target=false};
				local function x(G)
					local m,c,n=G.char,G.part,G.shot;
					G=type(n)=="table"and n.hit_part or nil;
					return m~=nil and m.Parent~=nil and m:GetAttribute("Dead")==false and typeof(c)=="Instance"and c:IsDescendantOf(m)and typeof(G)=="Instance"and G:IsDescendantOf(m);
				end;
				local function G(m,c)
					local n=N.target;
					if n then 
						if N.props==m then 
							if N.origin==c then 
								if x(n)then 
									if g.valid(n.player,n.char)then 
										return n;
									end;
								end;
							end;
						end;
					end;
					n=s.find(m,c,f.magic==true);
					if n then 
						if x(n)then 
							return n;
						end;
					end;
					return nil;
				end;
				local function g(m,c,n)
					local O=q.CurrentCamera;
					if not(O)then 
						return m(c,n);
					end;
					local v,X=F.origin(O);
					if not(X)then 
						return m(c,n);
					end;
					X=O.CFrame;
					O.CFrame=X.Rotation+v;
					v=T(pcall(m,c,n));
					O.CFrame=X;
					if not(v[1])then 
						error(v[2],0);
					end;
					return Y(v,2,v.n);
				end;
				if E then 
					R.field(a,"_performRaycast",function(m)
						return function(c,n)
							if h.weapon then 
								if c then 
									if c.Weapon==h.weapon then 
										if h.cframe then 
											local O=q.CurrentCamera;
											if not(O)then 
												return m(c,0);
											end;
											local v=O.CFrame;
											O.CFrame=h.cframe;
											local h=T(pcall(m,c,0));
											O.CFrame=v;
											if not(h[1])then 
												error(h[2],0);
											end;
											return Y(h,2,h.n);
										end;
									end;
								end;
							end;
							local h=c and c.Properties;
							if f.on then 
								if not(h)then 
									return g(m,c,n);
								end;
							else 
								return g(m,c,n);
							end;
							local O=q.CurrentCamera;
							if not(O)then 
								return m(c,n);
							end;
							local T=c.Weapon;
							local Y,v=T and tonumber(T.ShotSeq),os.clock();
							local X;
							if T and _.weapon==T and _.seq==Y and v-_.at<0.02 then 
								X=_.target;
								X=X and(if x(X)then X else false);
							else 
								X=G(h,(F.origin(O)))or false;
								_.weapon=T;
								_.seq=Y;
								_.at=v;
							end;
							_.target=X;
							if not(X)then 
								return g(m,c,n);
							end;
							v=X.shot;
							Y=v.hit_part;
							h=Y:IsA("BasePart");
							if(if h then typeof(v.hit_pos)~="Vector3"else not h)or typeof(v.dir)~="Vector3"or v.dir.Magnitude<=1.0E-4 or typeof(v.normal)~="Vector3"or type(v.dist)~="number"or v.dist~=v.dist or v.dist<=0 or type(v.wall_hits)~="table"then 
								_.target=false;
								return g(m,c,n);
							end;
							h=typeof(v.origin)=="Vector3"and v.origin or F.origin(O);
							O=v.hit_pos-h;
							local x=O.Magnitude;
							if x<=1.0E-4 or Z(x-v.dist)>0.05 or O.Unit:Dot(v.dir.Unit)<0.999 then 
								_.target=false;
								return g(m,c,n);
							end;
							n,x,O={},v.wall_hits,0;
							for _=1,#x,1 do 
								O+=1;
								n[O]=x[_];
							end;
							c=if typeof(v.material)=="EnumItem"then v.material.Name else if typeof(Y.Material)=="EnumItem"then Y.Material.Name else"Plastic";
							n[O+1]={Position=v.hit_pos,Instance=Y,Material=c,Normal=v.normal,Exit=false};
							if T then 
								N.last_target[T]=X.char;
							end;
							l.reserve(X,T);
							return{Distance=v.dist,Origin=h,Direction=v.dir,Hits=n};
						end;
					end);
					R.field(a,"setActive",function(R)
						return function(_,h)
							if h then 
								N.cancel();
								u.adopt(_.Weapon);
								N.intent[_.Weapon]=nil;
								u.activate(_.Weapon);
							elseif _.Weapon==u.weapon then 
								N.intent[_.Weapon]=nil;
								N.cancel();
								u.adopt(nil);
								u.activate(nil);
							end;
							return R(_,h);
						end;
					end);
				end;
				local function R(_)
					if q:GetAttribute("GameState")=="Buy Period"then 
						return false;
					end;
					if z:GetAttribute("IsDefusingBomb")==true then 
						return false;
					elseif z:GetAttribute("IsLocallyDefusingBomb")==true then 
						return false;
					end;
					local h=_.Viewmodel;
					local l=type(h)=="table"and h.Animation or nil;
					if type(l)~="table"then 
						return true;
					elseif type(l.getAnimation)~="function"then 
						return true;
					end;
					local g,z=pcall(l.getAnimation,l,"Equip");
					h=g and z and tonumber(z.Length)or 0;
					return tick()-(tonumber(_.WeaponEquippedTick)or 0)>h*0.925;
				end;
				o.auto=function()
					if E then 
						if f.on then 
							if not(f.auto_shoot)then 
								return;
							end;
						else 
							return;
						end;
					else 
						return;
					end;
					if r:IsMouseButtonPressed(P)then 
						return;
					end;
					local _,h=os.clock(),u.held();
					if h then 
						if N.manual[h]then 
							return;
						end;
					else 
						return;
					end;
					local l=h.Properties;
					if l then 
						if l.Class~="Weapon"then 
							return;
						end;
					else 
						return;
					end;
					if j then 
						if f.rapid then 
							if N.can_force(h,"rapid")then 
								if t.wait(h,l,_)>0 then 
									return;
								end;
								if _-N.last_scan<0.033 then 
									return;
								end;
								N.last_scan=_;
								local g,u,z=U(h);
								if not(z)then 
									return;
								end;
								N.bind(g,u,z);
								g=N.force(h,L,"rapid");
								N.unbind();
								if g then 
									N.last_shot=_;
								end;
								return;
							end;
						end;
					end;
					if h.IsAdjustingSuppressor then 
						return;
					elseif h.IsReloading then 
						if l.MuzzleType~="ShotGun"then 
							return;
						end;
					end;
					if h.Rounds then 
						if h.Rounds<=0 then 
							return;
						end;
					else 
						return;
					end;
					local U=l.ShootingOptions=="Revolver";
					if U then 
						if h.IsShooting then 
							return;
						end;
						local g=C.wait(h);
						if g~=0 then 
							if f.auto_revolver then 
								if f.auto_switch then 
									if g then 
										if g<=0.033 then 
											return;
										end;
									end;
								else 
									return;
								end;
							elseif g then 
								if g<=0.033 then 
									return;
								end;
							end;
						end;
					end;
					if t.wait(h,l,_)>0 then 
						return;
					elseif not(R(h))then 
						return;
					end;
					local R=q.CurrentCamera;
					if not(R)then 
						return;
					end;
					local f=F.origin(R);
					R=s.find(l,f,true);
					if not R then 
						return;
					end;
					N.bind(l,f,R);
					N.open_gate(h);
					f,R=tonumber(h.ShotSeq),tonumber(h.Rounds);
					N.intent[h]=true;
					l=if U then C.pull(h)else pcall(h.shoot,h);
					N.intent[h]=nil;
					N.unbind();
					local F,g=tonumber(h.ShotSeq),tonumber(h.Rounds);
					U=f and F and F>f;
					U=U or(if R then if g then g<R else U else U);
					if l then 
						if U then 
							t.mark(h,_);
							N.last_shot=_;
						end;
					end;
				end;
				return o;
			end;
			K.aq=function()
				local U=K.load("b");
				local R=K.load("a");
				local _=Color3.new(1,1,1);
				local N,h=math.floor,{};
				h.__index=h;
				h.new=function(F)
					return setmetatable({order=F or 999},h);
				end;
				h.build=function(F)
					local t=F.gui;
					if t then 
						if t.Parent then 
							return true;
						end;
					end;
					t=U.screen(F.order);
					if not(t)then 
						return false;
					end;
					R.own(t);
					local U=Instance.new("Frame");
					U.BackgroundColor3=_;
					U.BackgroundTransparency=1;
					U.BorderSizePixel=0;
					U.AnchorPoint=Vector2.new(0.5,0.5);
					U.Visible=false;
					U.ZIndex=1;
					U.Parent=t;
					local R=Instance.new("UICorner");
					R.CornerRadius=UDim.new(1,0);
					R.Parent=U;
					R=Instance.new("UIGradient");
					R.Enabled=false;
					R.Rotation=0;
					R.Parent=U;
					local f=Instance.new("UIStroke");
					f.ApplyStrokeMode=Enum.ApplyStrokeMode.Border;
					f.Thickness=1;
					f.Color=_;
					f.LineJoinMode=Enum.LineJoinMode.Round;
					f.Parent=U;
					local l=Instance.new("UIGradient");
					l.Enabled=false;
					l.Rotation=0;
					l.Parent=f;
					F.gui=t;
					F.frame=U;
					F.stroke=f;
					F.edge=l;
					F.fill=R;
					F.size=nil;
					F.x=nil;
					F.y=nil;
					F.col=nil;
					F.col2=nil;
					F.grad=nil;
					F.filled=nil;
					F.fcol=nil;
					F.fcol2=nil;
					F.fgrad=nil;
					F.shown=nil;
					return true;
				end;
				h.hide=function(U)
					local R=U.frame;
					if R then 
						if U.shown~=false then 
							R.Visible=false;
							U.shown=false;
						end;
					end;
				end;
				h.show=function(U,R,F,t,f)
					if t~=t then 
						U:hide();
						return;
					elseif t<=0.5 then 
						U:hide();
						return;
					end;
					if not(U:build())then 
						return;
					end;
					local l,g,u=U.frame,U.stroke,N(t*2+0.5);
					if u~=U.size then 
						U.size=u;
						l.Size=UDim2.fromOffset(u,u);
					end;
					if R~=U.x or F~=U.y then 
						U.x=R;
						U.y=F;
						l.Position=UDim2.fromOffset(R,F);
					end;
					t,R,u=f.fov_col,f.fov_col2,f.fov_grad==true;
					if u~=U.grad then 
						U.grad=u;
						U.col=nil;
						U.col2=nil;
						U.edge.Enabled=u;
						if u then 
							g.Color=_;
						end;
					end;
					if u then 
						if t~=U.col or R~=U.col2 then 
							U.col=t;
							U.col2=R;
							U.edge.Color=ColorSequence.new(t,R);
						end;
					elseif t~=U.col then 
						U.col=t;
						g.Color=t;
					end;
					t=f.fov_fill==true;
					g=t and f.fov_fill_grad==true;
					if t~=U.filled or g~=U.fgrad then 
						U.filled=t;
						U.fgrad=g;
						U.fcol=nil;
						U.fcol2=nil;
						U.fill.Enabled=g;
						l.BackgroundTransparency=t and 0.65 or 1;
						if g then 
							l.BackgroundColor3=_;
						end;
					end;
					if t then 
						F,u=f.fov_fill_col,f.fov_fill_col2;
						if g then 
							if F~=U.fcol or u~=U.fcol2 then 
								U.fcol=F;
								U.fcol2=u;
								U.fill.Color=ColorSequence.new(F,u);
							end;
						elseif F~=U.fcol then 
							U.fcol=F;
							l.BackgroundColor3=F;
						end;
					end;
					if U.shown~=true then 
						l.Visible=true;
						U.shown=true;
					end;
				end;
				h.destroy=function(U)
					local R=U.gui;
					if R then 
						pcall(R.Destroy,R);
					end;
					U.gui=nil;
					U.frame=nil;
					U.stroke=nil;
					U.edge=nil;
					U.fill=nil;
					U.shown=nil;
				end;
				return h;
			end;
			K.ar=function()
				local U,R,_,N=K.load("b"),K.load("a"),K.load("aq"),K.load("af");
				local h=K.load("ak");
				local F=U.workspace;
				local t=math.tan;
				local f=math.rad;
				local l=_.new(999);
				local function _()
					local g=h.weapon;
					if g then 
						if g.IsDestroyed then 
							return false;
						elseif not(g.IsEquipped)then 
							return false;
						end;
					else 
						return false;
					end;
					local h=g.Properties;
					if h then 
						if h.Class~="Weapon"then 
							return false;
						end;
					else 
						return false;
					end;
					return g.Name~="Zeus x27";
				end;
				U={step=function()
					if N.on then 
						if N.draw_fov then 
							if not(_())then 
								l:hide();
								return;
							end;
						else 
							l:hide();
							return;
						end;
					else 
						l:hide();
						return;
					end;
					local _=F.CurrentCamera;
					if not(_)then 
						return;
					end;
					local h=tonumber(N.fov)or 0;
					if h<=0 then 
						l:hide();
						return;
					elseif h>=360 then 
						l:hide();
						return;
					end;
					local F=_.ViewportSize;
					local g=t(f(h*0.5))*(F.Y*0.5)/t(f(_.FieldOfView*0.5));
					l:show(F.X*0.5,F.Y*0.5,g,N);
				end,unload=function()
					l:destroy();
				end};
				R.teardown(U.unload);
				return U;
			end;
			K.as=function()
				local U,R=K.load("a"),K.load("ak");
				local _,N=K.load("an"),{active=nil,weapon=nil,ui=nil};
				N.apply=function(h)
					local F=N.ui;
					if not F then 
						return;
					end;
					local function t(f)
						return F:get("trig."..f,h);
					end;
					local F=h~=nil;
					_.on=F and t("on")or false;
					_.team_check=t("team");
					_.auto_wall=F and t("aw")or false;
					_.auto_revolver=F and t("autorev")or false;
					_.auto_switch=F and t("autoswitch")or false;
					_.boxes=R.boxes(t("hb"));
					_.prefer=t("prefer");
					_.min_damage=t("mindmg");
					_.wall_min_damage=t("awmindmg");
					_.hit_chance=t("hc");
					_.draw_fov=F and t("dfov")or false;
					_.fov_col=t("dfov_col");
					_.fov_grad=t("dfov_grad");
					_.fov_col2=t("dfov_col2");
					_.fov_fill=t("dfov_fill");
					_.fov_fill_col=t("dfov_fcol");
					_.fov_fill_grad=t("dfov_fgrad");
					_.fov_fill_col2=t("dfov_fcol2");
				end;
				N.refresh=function()
					N.apply(N.active);
				end;
				N.activate=function(h)
					local F=R.find_type(h);
					if N.weapon==h then 
						if N.active==F then 
							return;
						end;
					end;
					N.weapon=h;
					N.active=F;
					N.apply(F);
				end;
				U.teardown(function()
					N.weapon=nil;
					N.active=nil;
					N.ui=nil;
					_.on=false;
					_.draw_fov=false;
				end);
				return N;
			end;
			K.at=function()
				local U,R,_=K.load("b"),K.load("j"),K.load("af");
				local N,h,F=R.camera,U.getups,math.rad;
				local t=math.min;
				local f=math.max;
				local l=math.clamp;
				local g,u,s,C=Vector3.zero;
				U,R=type(N)=="table"and rawget(N,"toWeaponFirePosition")or nil,type(N)=="table"and rawget(N,"getWeaponKickRotation")or nil;
				if type(U)=="function"and type(R)=="function"and type(h)=="function"then 
					local z,q=pcall(h,U);
					local U,r=pcall(h,R);
					if z and U and type(q)=="table"and type(r)=="table"then 
						N=nil;
						for U,U in r,nil,nil do 
							if type(U)=="table"then 
								N=U;
								break;
							end;
						end;
						for U,U in q,nil,nil do 
							if type(U)=="function"then 
								u=U;
							else 
								if type(U)=="table"and rawget(U,"p")~=nil and rawget(U,"d")~=nil then 
									if U==N then 
										s=U;
									else 
										C=U;
									end;
								else 
								end;
							end;
						end;
					else 
					end;
				else 
				end;
				local U={ok=false,origin=g};
				U.dir=Vector3.zAxis;
				U.up=Vector3.yAxis;
				U.right=Vector3.xAxis;
				U.half=0;
				local function R(N)
					if u then 
						if s then 
							if C then 
								local h,z=s.p,C.p;
								s.p,C.p=g,g;
								local g,q=pcall(u,1);
								s.p,C.p=h,z;
								if g then 
									if typeof(q)=="CFrame"then 
										return q;
									end;
								end;
							end;
						end;
					end;
					return N.CFrame;
				end;
				local function N(h,g,u)
					local s=h.Bullet;
					if type(s)~="table"then 
						return nil;
					elseif s.IsDestroyed then 
						return nil;
					end;
					local C,z=g.Spread,g.FireModes;
					if type(z)=="table"then 
						local q=z.Primary;
						q=if g.ShootingOptions=="Revolver"then if u then q else z.Secondary or q else q;
						C=if type(q)=="table"then if type(q.Spread)=="table"then q.Spread else C else C;
					else 
					end;
					u=type(C)=="table"and C.Range;
					if typeof(u)~="NumberRange"then 
						return nil;
					end;
					local q,r=pcall(s.getBaseSpreadForConfig,s,C);
					local x,G=pcall(s.getMovementSpreadForConfig,s,C);
					if q then 
						if x then 
							if type(r)~="number"then 
								return nil;
							elseif type(G)~="number"then 
								return nil;
							end;
						else 
							return nil;
						end;
					else 
						return nil;
					end;
					q,z=tonumber(C.MovementMultiplier)or 1,g.AimingOptions=="SniperScope";
					x=q==2 and 6 or q==3 and 12 or 15;
					q=if _.no_spread and s:getTrueSpread()==0 then 0 else(if z then if h.IsAiming then r else if r<x then l(x,u.Min,u.Max)else r else r)+G;
					return t(if z then if h.IsAiming then if h.Name=="AWP"then if tick()-(tonumber(h.ScopeStartTick)or 0)<0.2 then f(q,x)else q else q else q else q,69);
				end;
				U.update=function(_,h,t,f)
					local l=N(_,h,f);
					if not(l)then 
						U.ok=false;
						return false;
					end;
					_=R(t);
					U.origin=_.Position;
					U.dir=_.LookVector;
					U.up=_.UpVector;
					U.right=_.RightVector;
					U.half=F(l*0.5);
					U.ok=true;
					return true;
				end;
				return U;
			end;
			K.au=function()
				local U,R,_,N=K.load("b"),K.load("f"),K.load("a"),K.load("h");
				local h,F=K.load("j"),K.load("Y");
				local t,f=K.load("L"),K.load("M");
				local l,g=K.load("ah"),K.load("ag");
				local u=K.load("ai");
				local s=K.load("ak");
				local C=K.load("ao");
				local z=K.load("an");
				local q=K.load("as");
				local r=K.load("at");
				local x=U.lp;
				local G=U.workspace;
				local a=U.input;
				local m=t.probe;
				local c=t.through;
				local t=h.ray_ignore;
				local n=h.fire_ready;
				local h=R.trim;
				local R=l.groups;
				local O=l.group_of;
				local j=l.damage_key;
				local E=l.teams;
				local l=Enum.UserInputType.MouseButton1;
				local P=os.clock;
				local T=math.sin;
				local Y=math.cos;
				local v=math.tan;
				local Z=math.asin;
				local L=math.acos;
				local o=math.min;
				local X=math.max;
				local Q=math.clamp;
				local S=math.ceil;
				local A=math.huge;
				local J=Vector3.zero;
				local y=RaycastParams.new();
				y.FilterType=Enum.RaycastFilterType.Exclude;
				y.IgnoreWater=false;
				y.CollisionGroup="Bullet";
				local e=U.weak();
				local M=U.weak();
				local I,i,k=U.weak(),{};
				local U,B,d,b=0;
				local p,D,V,W,H=0,0,0,1;
				local w,UQ,KQ=0,J;
				local RQ,_Q=0,{};
				local function NQ()
					local hQ,FQ=P(),x.Character;
					if k then 
						if FQ==B then 
							if hQ-U<0.5 then 
								local tQ=k;
								return tQ;
							end;
						end;
					end;
					U,B=hQ,FQ;
					if type(t)=="function"then 
						local U,hQ=pcall(t);
						if U then 
							if type(hQ)=="table"then 
								k=hQ;
								return hQ;
							end;
						end;
					end;
					local U,t,hQ=0,G.CurrentCamera,G:FindFirstChild("Debris");
					if t then 
						U=1;
						i[U]=t;
					else 
					end;
					if hQ then 
						U+=1;
						i[U]=hQ;
					else 
					end;
					if FQ then 
						U+=1;
						i[U]=FQ;
					else 
					end;
					k=h(i,U);
					t=k;
					return t;
				end;
				local function U(t)
					local hQ=M[t];
					if hQ~=nil then 
						return hQ,I[t];
					end;
					local hQ,FQ=g.effective_armor(t);
					M[t]=hQ;
					I[t]=FQ;
					return hQ,FQ;
				end;
				local function t(g,hQ,FQ,tQ)
					local fQ=d;
					local lQ=fQ.DamagePerPart;
					local gQ=type(lQ)=="table"and lQ[hQ]or 0;
					if type(gQ)~="number"then 
						return 0;
					elseif gQ<=0 then 
						return 0;
					end;
					lQ=gQ*(tonumber(fQ.RangeModifier)or 1)^X(0,FQ/100);
					lQ=if tQ>0 then lQ*(tonumber(fQ.WallbangMultiplier)or 1)else lQ;
					tQ,FQ=U(g);
					if tQ>0 and(hQ~="Head"or FQ)then 
						gQ=lQ*Q(tonumber(fQ.ArmorPenetration)or 1,0,1);
						lQ=(X(0,if(lQ-gQ)*0.5>tQ then lQ-tQ/0.5 else gQ));
					else 
					end;
					fQ=W;
					return lQ*fQ;
				end;
				local function U(g)
					local hQ=g.Name;
					g=O[hQ];
					if g then 
						return g,j[hQ];
					end;
					if hQ=="HumanoidRootPart"then 
						g=b.chest and"chest"or"stomach";
						return g,"Torso";
					end;
					return nil,nil;
				end;
				local function g(O)
					return O.Transparency>0 or O.LocalTransparencyModifier>0;
				end;
				local function O(j,hQ,FQ,tQ,fQ,lQ)
					local gQ=j.Parent;
					j=e[gQ];
					if j then 
						if not(b[hQ])then 
							return nil;
						end;
					else 
						return nil;
					end;
					if t(j,FQ,tQ,fQ)<(lQ and z.min_damage or z.wall_min_damage)then 
						return nil;
					end;
					return gQ,hQ,tQ;
				end;
				local function t(j,hQ)
					local FQ=m(j,hQ*p,y,k);
					local m=FQ.instance;
					if not(m)then 
						return nil;
					end;
					local y,tQ,fQ=FQ.position,U(m);
					if tQ then 
						return O(m,tQ,fQ,(y-j).Magnitude,0,true);
					end;
					FQ,fQ=z.auto_wall,g(m);
					if fQ then 
					elseif FQ then 
					else 
						return nil;
					end;
					m,tQ=c(j,hQ,V,k,nil,D),0;
					for c=1,#m,2 do 
						hQ=m[c];
						y=hQ.instance;
						if y then 
							local m,c=U(y);
							if m then 
								return O(y,m,c,(hQ.position-j).Magnitude,tQ,fQ);
							end;
							tQ+=1;
							if fQ then 
								if g(y)then 
								else 
									if not FQ then 
										return nil;
									end;
									fQ=false;
								end;
							else 
							end;
						else 
						end;
					end;
					return nil;
				end;
				local function U(g,m,c,O)
					if m:IsDescendantOf(G)then 
						if m:GetAttribute("Dead")~=false then 
							return false;
						elseif m:GetAttribute("Invincible")==true then 
							return false;
						end;
					else 
						return false;
					end;
					local j=m:GetAttribute("Health");
					if typeof(j)~="number"then 
						return false;
					elseif j<=0 then 
						return false;
					elseif u.shielded(m)then 
						return false;
					end;
					if z.team_check then 
						j=g:GetAttribute("Team");
						if c then 
							if j then 
								if E[c]then 
									if not(E[j])then 
										return false;
									end;
								else 
									return false;
								end;
							else 
								return false;
							end;
						else 
							return false;
						end;
						if not(O)then 
							if c==j then 
								return false;
							end;
						end;
					end;
					return true;
				end;
				local function g(m,c,O)
					table.clear(e);
					local j,E,y,hQ,FQ=p+5,x:GetAttribute("Team"),G:GetAttribute("Gamemode")=="Deathmatch",N.all();
					local N,tQ,fQ=0,A,0;
					for A=1,FQ,1 do 
						local FQ=hQ[A];
						if FQ~=x then 
							A=FQ.Character;
							local hQ=A and u.part(A,"HumanoidRootPart");
							if hQ then 
								local lQ=hQ.Position-m;
								local m=lQ.Magnitude;
								if m>0.5 then 
									if m<=j then 
										local j=L(Q(c:Dot(lQ)/m,-1,1));
										if j<=O+Z(o(1,4.5/m))then 
											if U(FQ,A,E,y)then 
												e[A]=FQ;
												N=if m>N then m else N;
												if j<tQ then 
													tQ,fQ=j,m;
												else 
												end;
											else 
											end;
										else 
										end;
									else 
									end;
								else 
								end;
							else 
							end;
						else 
						end;
					end;
					return N,fQ;
				end;
				local function U(N,m,c,O,j,E)
					local A,y,hQ,FQ,tQ=r.up,r.right,T(c),Y(c),true;
					for fQ=1,O,1 do 
						c=(fQ-j)*6.283185307179586/O;
						local O,O=t(N,m*FQ+(A*Y(c)+y*T(c))*hQ);
						if not(O)then 
							return false,false;
						end;
						tQ=if O~=E then false else tQ;
					end;
					return true,tQ;
				end;
				local function N(m,c,O,j,E,A,y)
					local hQ,FQ,tQ,fQ=r.up,r.right,E-1.0E-6,Q(S(j*v(O)/0.3),2,6);
					local lQ,gQ,uQ,sQ=1/fQ,1,0;
					E=0;
					for CQ=fQ,1,-1 do 
						local fQ=(CQ-0.5)*O*lQ;
						local O,zQ,qQ=T(fQ),Y(fQ),Q(S(j*v(fQ)*6.283185307179586/0.3),6,24);
						local j,rQ=lQ/qQ,CQ%2*0.5;
						for lQ=1,qQ,1 do 
							fQ=(lQ-rQ)*6.283185307179586/qQ;
							gQ-=j;
							lQ,CQ=t(m,c*zQ+(hQ*Y(fQ)+FQ*T(fQ))*O);
							if lQ then 
								uQ,sQ,E=uQ+j,sQ or lQ,if CQ==A then E+j else E;
							else 
							end;
							if uQ+gQ<tQ then 
								return nil,false;
							end;
							if y then 
								if E>=tQ then 
									return sQ,true;
								elseif uQ>=tQ then 
									if E+gQ<tQ then 
										return sQ,false;
									end;
								end;
							elseif uQ>=tQ then 
								return sQ,true;
							end;
						end;
					end;
					if uQ>=tQ then 
						return sQ,if y then E>=tQ else not y;
					end;
					return nil,false;
				end;
				local function m(c)
					local O=P();
					local j=O-w;
					if H then 
						if j>0 then 
							if j<0.1 then 
								local E=UQ;
								UQ=E:Lerp(H:Cross(c)/j,o(j/0.05,1));
							else 
								UQ=J;
							end;
						else 
							UQ=J;
						end;
					else 
						UQ=J;
					end;
					H,w=c,O;
				end;
				local function c(O,j,E,T,Y,A)
					local y,w,hQ,FQ,tQ=UQ:Cross(E),T*A,R[Y],0.15;
					for R=1,#hQ,1 do 
						T=u.part(O,hQ[R]);
						if T then 
							R=T.Position-j;
							A=R.Magnitude;
							if A>0.5 then 
								local hQ=T.Size;
								local T=Z(o(1,o(hQ.X,hQ.Y,hQ.Z)*0.5/A));
								if T>=w then 
									hQ=R/A;
									local R=Q(E:Dot(hQ),-1,1);
									local Z,o=L(R)+w-T,hQ-E*R;
									R=o.Magnitude;
									if Z>0 then 
										if R>1.0E-6 then 
											local T=y:Dot(o)/R;
											if T>0 then 
												if Z<=FQ*T then 
													local R=Z/T;
													FQ,tQ=R,hQ;
												else 
												end;
											else 
											end;
										else 
										end;
									else 
									end;
								else 
								end;
							else 
							end;
						else 
						end;
					end;
					if not(tQ)then 
						KQ=nil;
						return false;
					end;
					y=P();
					if KQ then 
						if y-RQ>0.1 then 
							KQ=y;
						end;
					else 
						KQ=y;
					end;
					RQ=y;
					if y-KQ+FQ>0.15 then 
						return false;
					end;
					E,y=t(j,tQ);
					return E==O and y==Y;
				end;
				local function R(O,j,E)
					local T,Y,Z,L=r.dir,r.half,f.origin(E);
					Z,d=if L then Z else r.origin,O;
					b=z.boxes;
					p=tonumber(O.Range)or 500;
					L,E=g(Z,T,Y);
					if L<=0 then 
						return false;
					end;
					table.clear(M);
					table.clear(I);
					NQ();
					D=L+6;
					V=tonumber(O.Penetration)or 0;
					W=X(tonumber(O.BulletsPerShot)or 1,1);
					O=z.prefer;
					local f,g,o,A=b[O]==true,t(Z,T);
					L=A or E;
					E=L*v(Y);
					if j>=0.999999 or E<=0.02 then 
						if not(g)then 
							return false;
						end;
						A=o==O;
						if E>0.02 then 
							local t=Q(S(E*6.283185307179586/0.3),6,24);
							local v,y=U(Z,T,Y,t,0,O);
							if not(v)then 
								return false;
							end;
							A=A and y;
							if E>0.45 then 
								y,v=U(Z,T,Y*0.5,X(4,S(t*0.5)),0.5,O);
								if not y then 
									return false;
								end;
								A=A and v;
							else 
							end;
						else 
						end;
						if A then 
							return true;
						elseif f then 
						else 
							return true;
						end;
						return not c(g,Z,T,Y,O,j);
					end;
					A,o=N(Z,T,Y,L,j,O,f);
					if not A then 
						return false;
					end;
					if o then 
						return true;
					end;
					return not c(g or A,Z,T,Y,O,j);
				end;
				local function U(N,t)
					if N.IsShooting then 
						return false;
					elseif N.IsBurstShooting then 
						return false;
					elseif N.IsAdjustingSuppressor then 
						return false;
					end;
					if N.IsChargeFiring then 
						if not(C.held(N))then 
							return false;
						end;
					end;
					if N.IsReloading then 
						if t.MuzzleType~="ShotGun"then 
							return false;
						end;
					end;
					t=N.Rounds;
					if type(t)~="number"then 
						return false;
					elseif t<=0 then 
						return false;
					end;
					if F.manual[N]then 
						return false;
					elseif F.forcing[N]then 
						return false;
					elseif F.has_pending(N)then 
						return false;
					end;
					return not a:IsMouseButtonPressed(l);
				end;
				local function N(t,f,l)
					local g,a,c,O,j=tonumber(t.ShotSeq),tonumber(t.Rounds),if l then C.fire(t)else if f.ShootingOptions=="Revolver"then pcall(t.shoot,t,"Secondary")else pcall(t.shoot,t),tonumber(t.ShotSeq),tonumber(t.Rounds);
					f=g and O and O>g;
					f=f or(if a then if j then j<a else f else f);
					if c then 
						if f then 
							F.last_shot=P();
						end;
					end;
				end;
				local function F()
					if not(n)then 
						return false;
					end;
					local t=s.ensure();
					q.activate(t);
					if z.on then 
						if not(t)then 
							return false;
						end;
					else 
						return false;
					end;
					local f=t.Properties;
					if type(f)~="table"then 
						return false;
					elseif f.Class~="Weapon"then 
						return false;
					elseif t.Name=="Zeus x27"then 
						return false;
					end;
					local l=G.CurrentCamera;
					if l then 
						if not(u.alive(x.Character))then 
							return false;
						end;
					else 
						return false;
					end;
					local g=C.wait(t);
					local u=g==0;
					local s=(if u then not u else f.ShootingOptions=="Revolver")and(z.auto_revolver and not z.auto_switch or g~=nil and g<=0.033);
					if not(r.update(t,f,l,u or s))then 
						return false;
					end;
					m(r.dir);
					if s then 
						return true;
					end;
					g=Q((tonumber(z.hit_chance)or 100)*0.01,0.01,1);
					if U(t,f)then 
						if R(f,g,l)then 
							N(t,f,u);
						end;
					end;
					return true;
				end;
				_Q.step=function()
					r.ok=false;
					if not(F())then 
						H,KQ,UQ=nil,nil,J;
					end;
				end;
				_.teardown(function()
					r.ok=false;
					table.clear(e);
					table.clear(M);
					table.clear(I);
					h(i,0);
					k,B,d,b,H,KQ,UQ=nil,nil,nil,nil,nil,nil,J;
				end);
				return _Q;
			end;
			K.av=function()
				local U,R,_,N=K.load("b"),K.load("a"),K.load("aq"),K.load("an");
				local h=K.load("at");
				local F=U.workspace;
				local U=math.tan;
				local t=math.rad;
				local f=math.max;
				local l=_.new(999);
				_={step=function()
					if N.on then 
						if N.draw_fov then 
							if not(h.ok)then 
								l:hide();
								return;
							end;
						else 
							l:hide();
							return;
						end;
					else 
						l:hide();
						return;
					end;
					local g=F.CurrentCamera;
					if not(g)then 
						return;
					end;
					local F=g.ViewportSize;
					local u,s,C,z=U(h.half)*(F.Y*0.5)/U(t(g.FieldOfView*0.5)),F.X*0.5,F.Y*0.5,g:WorldToViewportPoint(h.origin+h.dir*100);
					if z.Z>0 then 
						s,C=z.X,z.Y;
					else 
					end;
					l:show(s,C,f(u,2),N);
				end,unload=function()
					l:destroy();
				end};
				R.teardown(_.unload);
				return _;
			end;
			K.aw=function()
				local U,R,_=K.load("b"),K.load("a"),K.load("j");
				local N=_.skins;
				local h,F,t,f,l=_.data,_.skin_info,_.weapon_props,_.viewmodel,U.lp;
				local _,g,u,s,C,z=U.newc,U.getups,U.info,{"GetCameraModel","GetCharacterModel","GetWorldModel","GetBaseWeaponModel","GetMagazine","GetItemIconImage","GetSkinInformation"},{knife={t={model="Stock",skin="Stock",wear=0,stat=false},ct={model="Stock",skin="Stock",wear=0,stat=false}},glove={t={model="Stock",skin="Stock"},ct={model="Stock",skin="Stock"}}},false;
				local function q()
					z=C.knife.t.model~="Stock"or C.knife.ct.model~="Stock"or C.glove.t.model~="Stock"or C.glove.ct.model~="Stock";
				end;
				local r,x={["T Knife_Stock"]={"knife","t"},["CT Knife_Stock"]={"knife","ct"},["T Glove_Stock"]={"glove","t"},["CT Glove_Stock"]={"glove","ct"}},{["T Knife"]={"knife","t"},["CT Knife"]={"knife","ct"},["T Glove"]={"glove","t"},["CT Glove"]={"glove","ct"}};
				local function G(a,m)
					local c=a[m];
					if c then 
						return C[c[1]][c[2]],c[1];
					end;
					return nil,nil;
				end;
				local a,m;
				if type(h)=="table"then 
					if type(h.Get)=="function"then 
						if type(g)=="function"then 
							local c,n=pcall(g,h.Get);
							if c then 
								if type(n)=="table"then 
									local c=n[1];
									a=c;
								else 
								end;
							else 
							end;
						else 
						end;
					else 
					end;
					m=a;
				else 
					m=a;
				end;
				local function a()
					if z then 
						if not(m)then 
							return;
						end;
					else 
						return;
					end;
					local c=m[l];
					local m=c and c.Inventory;
					if type(m)~="table"then 
						return;
					end;
					for n=1,#m,1 do 
						c=m[n];
						local m,n=G(r,c._id);
						if m then 
							if m.model~="Stock"then 
								c.Name=m.model;
								c.Skin=m.skin~="Stock"and m.skin or"Stock";
								c.Float=tonumber(m.wear)or 0;
								c.StatTrack=n=="knife"and m.stat==true;
							else 
								c.Name=tostring(c._id):gsub("_Stock$","");
								c.Skin="Stock";
								c.Float=0;
								c.StatTrack=false;
							end;
							c.NameTag=false;
							c.Charm=false;
							c.Stickers={};
						end;
					end;
				end;
				R.connect(U.run.Heartbeat,a);
				if type(t)=="function"then 
					local m;
					m=R.detour(t,_(function(c,...)
						local n=G(x,c);
						if n then 
							if n.model~="Stock"then 
								return m(n.model,...);
							end;
						end;
						return m(c,...);
					end));
				end;
				local m,c;
				if type(N)=="table"then 
					if type(N.ObserveItemStockSchemas)=="function"then 
						t,a=pcall(N.ObserveItemStockSchemas,function(n)
							if type(n)=="table"then 
								c=n;
							end;
						end);
						if t then 
							R.adopt(a);
						end;
					end;
				end;
				if type(N)=="table"then 
					a=#s;
					for n=1,a,1 do 
						U=s[n];
						if type(N[U])=="function"then 
							n=R.field(N,U,function(O)
								return function(j,E,...)
									local P=G(x,j);
									if P then 
										if P.model~="Stock"then 
											local T=P.skin~="Stock"and P.skin or E;
											return O(P.model,T,...);
										end;
									end;
									return O(j,E,...);
								end;
							end);
							if U=="GetSkinInformation"then 
								m=n;
							else 
							end;
						else 
						end;
					end;
				else 
				end;
				local function n()
					if type(u)~="function"then 
						return false;
					end;
					local O,j=pcall(u,3,"s");
					return O and type(j)=="string"and j:find("Viewmodel",1,true)~=nil;
				end;
				if type(N)=="table"then 
					if type(N.GetGloves)=="function"then 
						R.field(N,"GetGloves",function(O)
							return function(j,E,...)
								local P=G(x,j);
								if P then 
									if P.model~="Stock"then 
										if n()then 
											return O(P.model,P.skin~="Stock"and P.skin or E,...);
										end;
									end;
								end;
								return O(j,E,...);
							end;
						end);
					end;
				end;
				local function n()
					return l:GetAttribute("Team")=="Counter-Terrorists"and"ct"or"t";
				end;
				local function l(O)
					local j,E=G(x,O);
					local x,O=if E=="knife"then if j.model~="Stock"then j.model.."/"..tostring(j.skin).."/"..tostring(j.wear).."/"..tostring(j.stat)else nil else nil,C.glove[n()];
					return if O.model~="Stock"then(x and x.."/"or"")..O.model.."/"..tostring(O.skin)else x;
				end;
				if type(f)=="table"and type(g)=="function"and type(u)=="function"then 
					U,t={"claim","new"};
					for x,O in U,nil,nil do 
						x=rawget(f,O);
						if type(x)=="function"then 
							h,a=pcall(g,x);
							if h then 
								if type(a)=="table"then 
									s=t;
									for U,h in a,nil,nil do 
										if type(h)=="function"then 
											if u(h,"n")=="getCarryOverKey"then 
												local f;
												if s then 
													f=s;
												else 
													local g=h;
													f=function(h,u,a,...)
														local O=g(h,u,a,...);
														if type(O)=="string"then 
															if z then 
																a=l(type(h)=="table"and h.ViewmodelCameraWeapon or u);
																O=if a then O.."|"..a else O;
															else 
															end;
														else 
														end;
														return O;
													end;
												end;
												R.upvalue(x,U,f);
												s=f;
											else 
											end;
										else 
										end;
									end;
									t=s;
								else 
								end;
							else 
							end;
						else 
						end;
					end;
				end;
				if type(F)=="function"then 
					local U;
					U=R.detour(F,_(function(R,...)
						if type(R)=="table"then 
							local _,h=G(r,R._id);
							if _ then 
								if _.model~="Stock"then 
									local F=table.clone(R);
									F.Name=_.model;
									F.Skin=_.skin~="Stock"and _.skin or R.Skin;
									F.Float=tonumber(_.wear)or R.Float;
									if h=="knife"then 
										F.StatTrack=_.stat==true;
									end;
									return U(F,...);
								end;
							end;
						end;
						return U(R,...);
					end));
				end;
				local U,R,_,h={sel=C},{knife={t="T Knife",ct="CT Knife"},glove={t="T Glove",ct="CT Glove"}},{knife="Melee",glove="Glove"},{knife={"Butterfly Knife","Karambit","M9 Bayonet","Flip Knife","Gut Knife","Skeleton Knife","Stiletto Knife","LightSaber"},glove={"Sports Gloves","Driver Gloves","Operator Gloves","Hand Wraps"}};
				local function F(t)
					return(tostring(t):gsub("_PATTERN_(%d+)"," #%1"):gsub("_"," "));
				end;
				local function t(f)
					local l,g=tostring,function(u)
						return string.format("%06d",tonumber(u)or 0);
					end;
					return(l(f):gsub("%d+",g):lower());
				end;
				local function f(l,g)
					local u=m;
					u=if type(u)~="function"then if type(N)=="table"then N.GetSkinInformation else u else u;
					if type(u)~="function"then 
						return nil;
					end;
					local s,z=pcall(u,l,g);
					if s then 
						if type(z)=="table"then 
							return z;
						end;
					end;
					return nil;
				end;
				local function l(g,u)
					if type(g)~="table"then 
						return nil,false;
					end;
					local s=g.wearImages;
					if type(s)=="table"then 
						if#s>0 then 
							if type(N.GetWearImageForFloat)=="function"then 
								local z,r=pcall(N.GetWearImageForFloat,g,tonumber(u)or 0);
								if z then 
									if type(r)=="string"then 
										if r~=""then 
											return r,true;
										end;
									end;
								end;
							end;
							local u=s[1];
							if type(u)=="table"then 
								if type(u.assetId)=="string"then 
									if u.assetId~=""then 
										return u.assetId,true;
									end;
								end;
							end;
						end;
					end;
					s=g.imageAssetId;
					if type(s)=="string"then 
						if s~=""then 
							return s,false;
						end;
					end;
					return nil,false;
				end;
				U.models=function(g)
					local u,s,z=h[g]or{},_[g],{};
					if type(c)=="table"and s then 
						g=c;
						for _,h in g,nil,nil do 
							if type(_)=="string"and type(h)=="table"then 
								for g,g in h,nil,nil do 
									if type(g)=="table"then 
										if g.type==s then 
											if g.isEnabled then 
												if g.skin~="Stock"then 
													z[#z+1]=_;
													break;
												end;
											end;
										end;
									end;
								end;
							end;
						end;
					end;
					if#z==0 then 
						z=table.clone(u);
					else 
						local _={};
						for h=1,#u,1 do 
							_[u[h]]=h;
						end;
						table.sort(z,function(h,g)
							local u,s=_[h]or math.huge,_[g]or math.huge;
							if u~=s then 
								return u<s;
							end;
							return h<g;
						end);
					end;
					table.insert(z,1,"Stock");
					return z;
				end;
				U.cards=function(_,h,g)
					local u={};
					if h==nil or h=="Stock"then 
						local s=R[_]and R[_][n()];
						local R,z=l(s and f(s,"Stock"),0);
						u[1]={value="Stock",name="Stock",image=R,crop=z};
						return u;
					end;
					if _=="knife"then 
						local R,s=l(f(h,"Stock"),0);
						u[1]={value="Stock",name="Stock",image=R,crop=s};
					end;
					if type(N)~="table"then 
						return u;
					elseif type(N.GetAllSkinsForWeapon)~="function"then 
						return u;
					end;
					local R,f=pcall(N.GetAllSkinsForWeapon,h);
					if R then 
						if type(f)~="table"then 
							return u;
						end;
					else 
						return u;
					end;
					_={};
					for N=1,#f,1 do 
						h=f[N];
						if type(h)=="table"then 
							if h.isEnabled then 
								if type(h.skin)=="string"then 
									if h.skin~="Stock"then 
										N,R=#_+1,{entry=h};
										R.key,_[N]=t(h.skin),R;
									end;
								end;
							end;
						end;
					end;
					table.sort(_,function(N,t)
						return N.key<t.key;
					end);
					for N=1,#_,1 do 
						R=_[N].entry;
						h,N=l(R,g);
						local _,t=#u+1,{value=R.skin};
						t.name,t.image,t.crop,u[_]=F(R.skin),h,N,t;
					end;
					return u;
				end;
				U.set=function(R,_,N)
					local h=C[R];
					h.t[_]=N;
					h.ct[_]=N;
					q();
				end;
				return U;
			end;
			K.ax=function()
				local U=K.load("b");
				local R,_=K.load("q"),K.load("a");
				local N,h=K.load("j"),R.world;
				local R=U.lp;
				local F=N.inventory;
				local t=N.char_resolver;
				local f=N.crosshair;
				local l,g,u,s,C=N.runstep,{},{};
				local z,q,r=false;
				local x=0;
				local function G()
					if h.force_xhair then 
						if not(t.isAliveCharacter(R.Character))then 
							return;
						end;
					else 
						return;
					end;
					local R=F.peekCurrentEquippedForMovement();
					local F=type(R)=="table"and rawget(R,"Properties");
					if type(F)~="table"then 
						return;
					elseif R.IsEquipped~=true then 
						return;
					elseif F.Class~="Weapon"then 
						return;
					elseif F.ShowCrosshair~=false then 
						return;
					end;
					local t=g[F];
					if t then 
					else 
						t=table.freeze(setmetatable({ShowCrosshair=true},{__index=F}));
						g[F]=t;
					end;
					rawset(R,"Properties",t);
					s,C=R,F;
				end;
				local function R()
					local F,t=s,C;
					if not(F)then 
						return;
					end;
					s,C=nil,nil;
					if rawget(F,"Properties")==g[t]then 
						rawset(F,"Properties",t);
					end;
				end;
				local function F(t)
					if r then 
						local s=r;
						return s;
					end;
					if type(t)~="function"then 
						return nil;
					end;
					local s=loadstring("local run, enter, leave, guard, raise = ...\10return function(...)\10\9guard(enter)\10\9local ok, err = guard(run, ...)\10\9guard(leave)\10\9if not ok then\10\9\9raise(err, 0)\10\9end\10end","=bs_xhair");
					if type(s)~="function"then 
						return nil;
					end;
					setfenv(s,{});
					local C;
					C,q=s(t,G,R,pcall,error),t;
					r=C;
					C=r;
					return C;
				end;
				local function t()
					local s,C=type(l)=="table"and rawget(l,"Unbind"),U.getups;
					if type(s)~="function"then 
						return nil;
					elseif type(C)~="function"then 
						return nil;
					end;
					local l,G=pcall(C,s);
					if l then 
						if type(G)~="table"then 
							return nil;
						end;
					else 
						return nil;
					end;
					for s,s in G,nil,nil do 
						l=type(s)=="table"and rawget(s,"RenderStepped");
						C=type(l)=="table"and rawget(l,"BindingsByName");
						if type(C)=="table"then 
							return C;
						end;
					end;
					return nil;
				end;
				local function l()
					if not(r)then 
						return;
					end;
					local s=t();
					local t=s and rawget(s,"UI.Crosshair.Update");
					if type(t)~="table"then 
						return;
					elseif t.Callback==r then 
						return;
					elseif type(t.Callback)~="function"then 
						return;
					end;
					t.Callback=r;
					if not(u[t])then 
						u[t]=true;
						_.teardown(function()
							if t.Callback==r then 
								t.Callback=q;
							end;
						end);
					end;
				end;
				local function t()
					if z then 
						return;
					elseif type(f)~="table"then 
						return;
					elseif type(setfenv)~="function"then 
						return;
					end;
					z=true;
					_.field(f,"UpdateCrosshair",F);
					l();
					_.connect(U.run.Heartbeat,function()
						if not(h.force_xhair)then 
							return;
						end;
						local U=os.clock();
						if U<x then 
							return;
						end;
						x=U+1;
						l();
					end);
				end;
				N={set=function(U)
					h.force_xhair=U==true;
					if h.force_xhair then 
						t();
					end;
				end};
				_.teardown(function()
					h.force_xhair=false;
					R();
					table.clear(g);
				end);
				return N;
			end;
			K.ay=function()
				local U,R,_,N=K.load("q"),K.load("e"),K.load("ax"),K.load("W");
				local h=U.world;
				local F=U.white;
				U=R.tabs.visuals;
				local function t(f)
					return function(l)
						h[f]=l;
					end;
				end;
				R=U:page("world");
				local f,l,g,u,s=R:section({name="lighting"}),R:section({name="sky"}),R:section({name="grenades",side=2}),R:section({name="bullets",side=2}),R:section({name="bomb",side=2});
				R=f:toggle({name="time",flag="world.time",cb=t("time")});
				R:slider({flag="world.time_hour",min=0,max=24,dec=1,default=12,suffix="h",cb=t("time_hour")}):dep(R);
				R=f:toggle({name="fog",flag="world.fog",cb=t("fog")});
				R:color({flag="world.fog_color",default=F,cb=t("fog_col")});
				local C=R:settings();
				C:slider({name="start",flag="world.fog_start",min=0,max=1000,cb=t("fog_start")});
				C:slider({name="end",flag="world.fog_end",min=50,max=5000,default=500,cb=t("fog_end")});
				f:toggle({name="ambient",flag="world.ambient",cb=t("ambient")}):color({flag="world.ambient_color",default=F,cb=t("ambient_col")});
				C=f:toggle({name="fullbright",flag="world.fullbright",cb=t("fullbright")});
				C:color({flag="world.fullbright_color",default=F,cb=t("fb_col")});
				C:slider({flag="world.fullbright_brightness",min=0,max=500,default=200,suffix="%",cb=t("fb_power")}):dep(C);
				C=f:toggle({name="exposure",flag="world.exposure",cb=t("exposure")});
				C:slider({flag="world.exposure_value",min=-300,max=300,default=0,suffix="%",cb=t("exposure_val")}):dep(C);
				C=f:toggle({name="bloom",flag="world.bloom",cb=t("bloom")}):settings();
				C:slider({name="intensity",flag="world.bloom_intensity",min=0,max=400,default=100,suffix="%",cb=t("bloom_power")});
				C:slider({name="size",flag="world.bloom_size",min=1,max=100,default=24,cb=t("bloom_size")});
				C:slider({name="threshold",flag="world.bloom_threshold",min=0,max=500,default=200,suffix="%",cb=t("bloom_limit")});
				R=f:toggle({name="color correction",flag="world.color_correction",cb=t("cc")});
				R:color({flag="world.color_correction_tint",default=F,cb=t("cc_tint")});
				C=R:settings();
				C:slider({name="saturation",flag="world.color_correction_saturation",min=-100,max=200,default=0,suffix="%",cb=t("cc_sat")});
				C:slider({name="brightness",flag="world.color_correction_brightness",min=-100,max=100,default=0,suffix="%",cb=t("cc_bright")});
				C:slider({name="contrast",flag="world.color_correction_contrast",min=-100,max=200,default=0,suffix="%",cb=t("cc_contrast")});
				f:toggle({name="no shadows",flag="world.no_shadows",cb=t("no_shadows")});
				l:toggle({name="skybox",flag="world.skybox",cb=t("sky")}):dropdown({flag="world.skybox_preset",values={"jungle","blossom","red night","purple","foggy","galaxy","anime","minecraft"},cb=t("sky_preset")});
				f=l:toggle({name="effects",flag="world.effects",cb=t("fx")});
				f:color({flag="world.effects_color",default=F,cb=t("fx_col")});
				f:dropdown({flag="world.effects_type",values={"snow","sakura","stars"},cb=t("fx_type")});
				f:settings():slider({name="rate",flag="world.effects_rate",min=20,max=900,default=250,cb=t("fx_rate")});
				f=g:toggle({name="trajectory",flag="world.grenade_prediction",cb=t("nade_path")});
				f:color({flag="world.grenade_prediction_color",default=F,cb=t("nade_path_col")});
				l=f:settings();
				l:colorpicker({name="radius",flag="world.grenade_prediction_radius_color",default=F,cb=t("nade_radius_col")});
				l:slider({name="thickness",flag="world.grenade_prediction_thickness",min=1,max=4,default=2,suffix="px",cb=t("nade_path_width")});
				f=g:toggle({name="zones",flag="world.grenadeareas",cb=t("nade_zones")}):settings();
				f:colorpicker({name="smoke",flag="world.smokegrenadeareacolor",default=F,cb=t("smoke_zone_col")});
				f:colorpicker({name="smoke icon",flag="world.smokegrenadeareaiconcolor",default=F,cb=t("smoke_zone_icon")});
				f:colorpicker({name="molotov",flag="world.molotovgrenadeareacolor",default=F,cb=t("fire_zone_col")});
				f:colorpicker({name="molotov icon",flag="world.molotovgrenadeareaiconcolor",default=F,cb=t("fire_zone_icon")});
				g:toggle({name="flying",flag="world.flyinggrenades",cb=t("nades_live")}):color({flag="world.flyinggrenadeiconcolor",default=F,cb=t("nade_icon_col")});
				g=u:toggle({name="tracers",flag="world.bullet_tracers",cb=t("tracers")});
				g:color({flag="world.tracers_color",default=F,cb=t("tracers_col")});
				R=g:settings();
				R:slider({name="thickness",flag="world.tracers_thickness",min=1,max=20,default=5,cb=function(z)
					h.tracers_width=z/100;
				end});
				R:slider({name="life",flag="world.tracers_life",min=0.2,max=4,dec=1,default=1.2,suffix="s",cb=t("tracers_life")});
				f=u:toggle({name="impacts",flag="world.impacts",cb=t("impacts")});
				f:color({flag="world.impactscolor",default=F,cb=t("impacts_col")});
				f:settings():slider({name="life",flag="world.impactslife",min=1,max=30,default=3,suffix="s",cb=t("impacts_life")});
				f=s:toggle({name="esp",flag="world.bomb_esp",cb=t("bomb_esp")});
				f:color({flag="world.bomb_icon_color",default=F,cb=t("bomb_icon_col")});
				l=f:settings();
				l:colorpicker({name="timer",flag="world.bomb_timer_color",default=F,cb=t("bomb_timer_col")});
				l:toggle({name="timer gradient",flag="world.bomb_timer_gradient",cb=t("bomb_timer_grad")}):color({flag="world.bomb_timer_gradient_color",default=F,cb=t("bomb_timer_grad_col")});
				R=U:page("local");
				local U,f,l=R:section({name="view"}),R:section({name="crosshair"}),R:section({name="chams",side=2});
				R=U:toggle({name="third person",flag="world.third_person",cb=t("third")});
				R:slider({flag="world.third_person_distance",min=5,max=30,default=10,suffix="st",cb=t("third_dist")}):dep(R);
				C=U:toggle({name="viewmodel",flag="world.hands",cb=t("hands")}):settings();
				C:slider({name="x",flag="world.hands_x",min=-100,max=100,default=0,cb=t("hands_x")});
				C:slider({name="y",flag="world.hands_y",min=-100,max=100,default=0,cb=t("hands_y")});
				C:slider({name="z",flag="world.hands_z",min=-100,max=100,default=0,cb=t("hands_z")});
				U:dropdown({name="removals",flag="misc.removals",multi=true,values={"scope","flash","smoke","hands","bullets"},cb=function(R)
					local u={};
					for C,C in R,nil,nil do 
						u[C]=true;
					end;
					N.removals(u);
				end});
				U=f:toggle({name="scope",flag="world.scope_xhair",cb=t("xhair")});
				U:color({flag="world.scope_xhair_color",default=F,cb=t("xhair_col")});
				s=U:settings();
				s:slider({name="size",flag="world.scope_xhair_size",min=25,max=200,default=100,suffix="%",cb=t("xhair_size")});
				s:slider({name="gap",flag="world.scope_xhair_gap",min=0,max=40,default=6,suffix="px",cb=t("xhair_gap")});
				f:toggle({name="force",flag="world.force_xhair",cb=_.set});
				g=f:toggle({name="penetration",flag="world.penetration",cb=t("pen")}):settings();
				g:colorpicker({name="yes",flag="world.penetrationyes",default=h.pen_yes,cb=t("pen_yes")});
				g:colorpicker({name="no",flag="world.penetrationno",default=h.pen_no,cb=t("pen_no")});
				g:slider({name="size",flag="world.penetrationsize",min=6,max=36,default=12,suffix="px",cb=t("pen_size")});
				local function U(R,_,N,f)
					local g=l:toggle({name=R,flag=_,cb=t(N)});
					g:color({flag=_.."_color",default=F,cb=t(N.."_col")});
					g:dropdown({flag=_.."_mat",values=f,cb=t(N.."_mat")});
					return g;
				end;
				s={"knife","pistols","rifles","snipers","smgs","shotguns","machine guns","grenades","bomb","other"};
				U("body","world.local_chams","body_chams",{"forcefield","chrome"});
				U("weapon","world.tool_chams","tool_chams",{"forcefield","neon","metal","chrome"}):settings():dropdown({name="apply to",flag="world.tool_chams_filter",multi=true,values=s,default=s,cb=function(R)
					local _={};
					for N,N in R,nil,nil do 
						_[N]=true;
					end;
					h.tool_chams_kinds=_;
				end});
				U("hands","world.hand_chams","hand_chams",{"forcefield","neon","metal","chrome"});
				return true;
			end;
			K.az=function()
				local U,R,_=K.load("e"),K.load("V"),K.load("T");
				local N=R.cfg;
				local h,F=_.cfg,{"off","down","up","jitter"};
				local function t(f)
					return function(l)
						N[f]=l;
					end;
				end;
				R=U.tabs.misc:page("movement");
				local N,f=R:section({name="movement"}),R:section({name="anti aim",side=2});
				N:toggle({name="bhop",flag="mv.bhop",cb=t("bhop")});
				N:toggle({name="auto strafe",flag="mv.strafe",cb=t("strafe")});
				N:toggle({name="edge jump",flag="mv.edgejump",cb=t("edge_jump")});
				N:toggle({name="jump bug",flag="mv.jumpbug",cb=t("jump_bug")});
				N:toggle({name="edge bug",flag="mv.edgebug",cb=t("edge_bug")});
				N:toggle({name="slow walk",flag="mv.slowwalk",cb=t("slow_walk")});
				N:toggle({name="pixel surf",flag="mv.pixelsurf",cb=t("pixel_surf")});
				N=f:toggle({name="enable",flag="aa.on",cb=function(t)
					h.on=t;
					_.reset();
					if not(t)then 
						_.relax();
					end;
				end});
				R=f:dropdown({name="yaw",flag="aa.yaw",values={"backward","spin","jitter","off"},cb=function(t)
					h.yaw=t;
					_.reset();
				end}):dep(N);
				f:slider({name="jitter",flag="aa.jitter",min=0,max=180,default=45,suffix="\194\176",cb=function(t)
					h.jitter=t;
				end}):dep(R,"jitter");
				f:slider({name="spin speed",flag="aa.spinspeed",min=1,max=90,default=25,cb=function(t)
					h.spin_rate=t;
				end}):dep(R,"spin");
				f:dropdown({name="pitch",flag="aa.pitch",values=F,cb=function(R)
					h.pitch=R;
					if R=="off"then 
						_.relax();
					end;
				end}):dep(N);
				U=f:toggle({name="spin in air",flag="aa.spinair",cb=function(R)
					h.air_spin=R;
					_.reset();
				end}):dep(N);
				U:slider({flag="aa.spinairspeed",min=0,max=90,default=30,sw=56,cb=function(R)
					h.air_rate=R;
				end}):dep(U);
				f:dropdown({name="air pitch",flag="aa.airpitch",values=F,cb=function(R)
					h.air_pitch=R;
					if R=="off"then 
						_.relax();
					end;
				end}):dep(U);
				return true;
			end;
			K.aA=function()
				local U,R,_=K.load("q"),K.load("e"),K.load("aw");
				local N=K.load("ad");
				local h=K.load("a");
				local F=U.misc;
				local t=U.notify;
				local f=U.white;
				U=R.tabs.misc;
				local function l(g)
					return function(u)
						F[g]=u;
					end;
				end;
				local function g(u)
					return function(s)
						F[u]=s;
						F.buy_dirty=true;
					end;
				end;
				local u=U:page("utility");
				local s,C,z=u:section({name="combat"}),u:section({name="bomb"}),u:section({name="auto buy",side=2});
				u=s:toggle({name="knife bot",flag="misc.kbot",cb=l("knife")});
				u:slider({flag="misc.kbotrange",min=2,max=5,dec=1,default=3.5,suffix="st",sw=56,cb=l("knife_range")}):dep(u);
				u:settings():toggle({name="heavy swing",flag="misc.kbotheavy",default=true,cb=l("knife_heavy")});
				u=s:toggle({name="zeus bot",flag="misc.zbot",cb=l("zeus")});
				u:slider({flag="misc.zbotrange",min=5,max=13,dec=1,default=12,suffix="st",sw=56,cb=l("zeus_range")}):dep(u);
				s:toggle({name="auto reload",flag="misc.autoreload",cb=l("auto_reload")});
				C:toggle({name="auto plant",flag="misc.autoplant",cb=l("auto_plant")});
				C:toggle({name="auto defuse",flag="misc.autodefuse",cb=l("auto_defuse")});
				s=z:toggle({name="enable",flag="misc.autobuy",cb=g("auto_buy")});
				z:dropdown({name="primary",flag="misc.autobuyprimary",values={"none","AK-47","M4A4","M4A1-S","AWP","SG 553","AUG","SSG 08","Galil AR","FAMAS","MAC-10","MP9","MP7","MP5-SD","P90","UMP-45","PP-Bizon","Nova","XM1014","MAG-7","Sawed-Off","M249","Negev"},default="AK-47",cb=g("buy_primary")}):dep(s);
				z:dropdown({name="secondary",flag="misc.autobuysecondary",values={"none","USP-S","P2000","Glock-18","P250","Five-SeveN","Tec-9","CZ75-Auto","Dual Berettas","Desert Eagle","R8 Revolver"},default="USP-S",cb=g("buy_secondary")}):dep(s);
				z:dropdown({name="grenades",flag="misc.autobuygrenades",multi=true,values={"HE Grenade","Flashbang","Smoke Grenade","Decoy Grenade","Incendiary Grenade","Molotov"},cb=function(l)
					F.buy_nades=table.clone(l);
					F.buy_dirty=true;
				end}):dep(s);
				z:toggle({name="zeus",flag="misc.autobuyzeus",cb=g("buy_zeus")}):dep(s);
				local F=U:page("feedback");
				local function U(l,g,u)
					local s,C,z=F:section({name=l,side=g}),"misc."..l,t.fx[l];
					local F=t.screen[l];
					local q=t.marks[l];
					local r=t.sounds[l];
					g=s:toggle({name="enable",flag=C.."_master",cb=function(x)
						t.master[l]=x;
					end});
					s:toggle({name="log",flag=C.."_notify",cb=function(x)
						t.log[l]=x;
					end}):dep(g);
					s:toggle({name="effect",flag=C.."_effect",cb=function(x)
						z.on=x;
					end}):dep(g):color({flag=C.."_effect_color",default=z.col,cb=function(x)
						z.col=x;
					end});
					local z=s:toggle({name="health shot",flag=C.."_screen",cb=function(x)
						F.on=x;
					end}):dep(g);
					z:color({flag=C.."_screen_color",default=F.col,cb=function(x)
						F.col=x;
					end});
					z:slider({flag=C.."_screen_power",min=10,max=200,default=100,suffix="%",sw=56,cb=function(x)
						F.power=x;
					end}):dep(z);
					z=s:toggle({name="marker",flag=C.."_marker",cb=function(F)
						q.on=F;
					end}):dep(g);
					z:color({flag=C.."_marker_color",default=f,cb=function(F)
						q.col=F;
					end});
					local F=z:settings();
					F:slider({name="size",flag=C.."_marker_size",min=4,max=24,default=14,suffix="px",cb=function(f)
						q.size=f;
					end});
					F:slider({name="fade",flag=C.."_marker_fade",min=0.1,max=5,dec=1,default=1,suffix="s",cb=function(f)
						q.fade=f;
					end});
					F=s:toggle({name="sound",flag=C.."_sound",cb=function(f)
						r.on=f;
						if f then 
							h.spawn(N.prepare,l,false);
						end;
					end}):dep(g);
					F:dropdown({flag=C.."_sound_value",values=t.list,default=u,cb=function(t)
						r.name=t;
						h.spawn(N.prepare,l,false);
					end});
					F:settings():slider({name="volume",flag=C.."_sound_volume",min=0.1,max=5,dec=1,default=1,cb=function(h)
						r.vol=h;
						N.prepare(l,false);
					end});
				end;
				U("hit",1,"mc bow");
				U("kill",2,"skeet");
				local function U(N,h,F)
					local t,f,l="skins."..h,_.sel[h].t;
					N:dropdown({name="model",flag=t..".model",values=_.models(h),cb=function(g)
						_.set(h,"model",g);
						if not(l)then 
							return;
						end;
						local u=_.cards(h,g,f.wear);
						g=u[1]and u[1].value or nil;
						for s=1,#u,1 do 
							if u[s].value==f.skin then 
								g=f.skin;
								break;
							end;
						end;
						l:setvalues(u,true);
						l:set(g);
					end});
					if F then 
						N:slider({name="wear",flag=t..".wear",min=0,max=100,suffix="%",cb=function(F)
							_.set(h,"wear",F/100);
							if l then 
								l:setvalues(_.cards(h,f.model,f.wear),true);
							end;
						end});
					end;
					l=N:cards({flag=t..".skin",cols=3,values=_.cards(h,"Stock",0),default="Stock",cb=function(N)
						_.set(h,"skin",N);
					end});
				end;
				U(R.tabs.skins:section({name="knives"}),"knife",true);
				U(R.tabs.skins:section({name="gloves",side=2}),"glove");
				return true;
			end;
			K.aB=function()
				local U,R,_,N,h=K.load("e"),K.load("ah"),K.load("ak"),K.load("al"),Color3.new(1,1,1);
				local F,t,f=R.order,_.refresh,U.tabs.aim;
				R=f:profile({id="aim",items=_.names,global="global"});
				R.cb=t;
				_.ui=R;
				R=f:page({name="main",cols=3});
				U,f,_=R:section({name="silent aim"}),R:section({name="accuracy",side=2}),R:section({name="weapon",side=3});
				R=U:toggle({name="enable",flag="legit.on",cb=t});
				U:toggle({name="team check",flag="legit.team",default=true,cb=t}):dep(R);
				U:toggle({name="auto shoot",flag="legit.auto",cb=t}):dep(R);
				U:toggle({name="auto revolver",flag="legit.autorev",cb=t}):dep(R):settings():toggle({name="auto switch",flag="legit.autoswitch",cb=t});
				N.bind(U:dropdown({name="target",multi=true,values=N.values,cb=N.set}):dep(R));
				U:dropdown({name="hitboxes",flag="legit.hb",multi=true,values=F,default={"head","chest"},cb=t}):dep(R);
				U:dropdown({name="prefer",flag="legit.prefer",values=F,default="head",cb=t}):dep(R);
				U:slider({name="fov",flag="legit.fov",min=0,max=180,default=8,suffix="\194\176",cb=t}):dep(R);
				F=U:toggle({name="draw fov",flag="legit.dfov",cb=t}):dep(R);
				F:color({flag="legit.dfov_col",default=h,cb=t});
				U=F:settings();
				U:toggle({name="gradient",flag="legit.dfov_grad",cb=t}):color({flag="legit.dfov_col2",default=h,cb=t});
				U:toggle({name="fill",flag="legit.dfov_fill",cb=t}):color({flag="legit.dfov_fcol",default=h,cb=t});
				U:toggle({name="fill gradient",flag="legit.dfov_fgrad",cb=t}):color({flag="legit.dfov_fcol2",default=h,cb=t});
				f:slider({name="min damage",flag="legit.mindmg",min=0,max=150,cb=t}):dep(R);
				f:toggle({name="auto wall",flag="legit.aw",cb=t}):dep(R):settings():slider({name="min damage",flag="legit.awmindmg",min=0,max=150,cb=t});
				U=f:toggle({name="multipoints",flag="legit.multipoint",cb=t}):dep(R):settings();
				U:slider({name="head",flag="legit.headsize",min=0,max=100,default=65,suffix="%",cb=t});
				U:slider({name="chest",flag="legit.chestsize",min=0,max=100,default=60,suffix="%",cb=t});
				U:slider({name="stomach",flag="legit.stomachsize",min=0,max=100,default=60,suffix="%",cb=t});
				U:slider({name="arms",flag="legit.armssize",min=0,max=100,default=55,suffix="%",cb=t});
				U:slider({name="legs",flag="legit.legssize",min=0,max=100,default=55,suffix="%",cb=t});
				_:toggle({name="no recoil",flag="legit.norecoil",cb=t});
				_:toggle({name="no spread",flag="legit.nospread",cb=t});
				_:toggle({name="insta reload",flag="legit.instantreload",cb=t});
				N.refresh();
				return true;
			end;
			K.aC=function()
				local U,R,_,N,h=K.load("e"),K.load("ah"),K.load("ak"),K.load("as"),Color3.new(1,1,1);
				local F,t,f=R.order,N.refresh,U.tabs.trigger;
				U=f:profile({id="trigger",items=_.names,global="global"});
				U.cb=t;
				N.ui=U;
				N,_=f:section({name="trigger bot"}),f:section({name="accuracy",side=2});
				U=N:toggle({name="enable",flag="trig.on",cb=t});
				N:toggle({name="team check",flag="trig.team",default=true,cb=t}):dep(U);
				N:toggle({name="auto revolver",flag="trig.autorev",cb=t}):dep(U):settings():toggle({name="auto switch",flag="trig.autoswitch",cb=t});
				N:dropdown({name="hitboxes",flag="trig.hb",multi=true,values=F,default={"head","chest","stomach","arms"},cb=t}):dep(U);
				N:dropdown({name="prefer",flag="trig.prefer",values=F,default="head",cb=t}):dep(U);
				R=N:toggle({name="draw fov",flag="trig.dfov",cb=t}):dep(U);
				R:color({flag="trig.dfov_col",default=h,cb=t});
				N=R:settings();
				N:toggle({name="gradient",flag="trig.dfov_grad",cb=t}):color({flag="trig.dfov_col2",default=h,cb=t});
				N:toggle({name="fill",flag="trig.dfov_fill",cb=t}):color({flag="trig.dfov_fcol",default=h,cb=t});
				N:toggle({name="fill gradient",flag="trig.dfov_fgrad",cb=t}):color({flag="trig.dfov_fcol2",default=h,cb=t});
				_:slider({name="min damage",flag="trig.mindmg",min=0,max=150,cb=t}):dep(U);
				_:slider({name="hit chance",flag="trig.hc",min=1,max=100,default=70,suffix="%",cb=t}):dep(U);
				_:toggle({name="auto wall",flag="trig.aw",cb=t}):dep(U):settings():slider({name="min damage",flag="trig.awmindmg",min=0,max=150,cb=t});
				return true;
			end;
			K.aD=function()
				local U,R=K.load("b"),K.load("a");
				local _,N=K.load("e"),U.lp;
				local h=U.players;
				local F=U.workspace;
				local U=_.lib;
				local _=string.lower;
				local t=math.max;
				local f,l,g=math.floor,{},false;
				local function u(s,C)
					local z=s:GetAttribute("LastKiller")==N.Name;
					if z~=(C:GetAttribute("LastKiller")==N.Name)then 
						return z;
					end;
					return _(s.DisplayName.."\0"..s.Name)<_(C.DisplayName.."\0"..C.Name);
				end;
				local function _()
					local s,C={},t(0,f(tonumber(N:GetAttribute("Spectators"))or 0));
					if C==0 then 
						return s;
					end;
					local t,f=N:GetAttribute("Team"),F:GetAttribute("ServerGamemode")=="Competitive";
					for F,F in h:GetPlayers()do 
						if F~=N then 
							if F.Parent==h then 
								if F:GetAttribute("IsSpectating")==true then 
									if f then 
										if t then 
											if t=="Spectators"then 
												s[#s+1]=F;
											elseif F:GetAttribute("Team")==t then 
												s[#s+1]=F;
											end;
										else 
											s[#s+1]=F;
										end;
									else 
										s[#s+1]=F;
									end;
								end;
							end;
						end;
					end;
					table.sort(s,u);
					for F=#s,C+1,-1 do 
						s[F]=nil;
					end;
					return s;
				end;
				local function F()
					if g then 
						return;
					elseif not(R.alive())then 
						return;
					end;
					g=true;
					task.defer(function()
						g=false;
						if R.alive()then 
							pcall(U.spectators,U,_());
						end;
					end);
				end;
				local function U(_)
					if _==N then 
						return;
					elseif l[_]then 
						return;
					end;
					l[_]=_:GetAttributeChangedSignal("IsSpectating"):Connect(F);
				end;
				for _,_ in h:GetPlayers()do 
					U(_);
				end;
				R.connect(N:GetAttributeChangedSignal("Spectators"),F);
				R.connect(h.PlayerAdded,function(_)
					U(_);
					F();
				end);
				R.connect(h.PlayerRemoving,function(U)
					local _=l[U];
					if _ then 
						_:Disconnect();
						l[U]=nil;
					end;
					F();
				end);
				R.teardown(function()
					for U,R in l,nil,nil do 
						R:Disconnect();
						l[U]=nil;
					end;
				end);
				F();
				return true;
			end;
			local U=K.load("a");
			U.takeover();
			local R=K.load("b").reclaim;
			local _,N=K.load("e"),K.load("p");
			local h=K.load("G");
			local F=K.load("I");
			local t=K.load("J");
			local f=K.load("K");
			local l=K.load("N");
			local g=K.load("H");
			local u=K.load("P");
			local s=K.load("v");
			K.load("Q");
			local C=K.load("R");
			local z=K.load("S");
			K.load("V");
			local q=K.load("W");
			local r=K.load("Z");
			local x=K.load("_");
			local G,a=K.load("ae"),K.load("ab");
			local m=K.load("ap");
			local c=K.load("ar");
			local n=K.load("ao");
			local O=K.load("au");
			local j=K.load("av");
			K.load("aw");
			K.load("ay");
			K.load("az");
			K.load("aA");
			K.load("aB");
			K.load("aC");
			K.load("aD");
			local function E(P)
				pcall(P);
				R();
			end;
			local function R()
				E(q.sync);
				E(t.sync);
				E(g.step);
				E(r.step);
				E(m.auto);
			end;
			local function g()
				E(N.step);
				E(n.step);
				E(O.step);
				E(a.step);
				E(t.step_fx);
				E(f.step);
				E(C.step);
				E(l.step);
				E(u.step);
				E(c.step);
				E(j.step);
			end;
			local function N()
				E(F.sync);
				E(s.pump);
				E(z.step);
				E(x.step);
			end;
			local F,t={beat=R,early=g,late=N},loadstring("local s = ...\10local rs = game:GetService(\"RunService\")\10local a = \"\\0\" .. tostring(math.random(1e7, 9e7))\10local b = \"\\0\" .. tostring(math.random(1e7, 9e7))\10s.hb = rs.Heartbeat:Connect(s.beat)\10rs:BindToRenderStep(a, Enum.RenderPriority.Camera.Value + 3, s.early)\10rs:BindToRenderStep(b, Enum.RenderPriority.Last.Value + 1, s.late)\10s.stop = function()\10\9rs:UnbindFromRenderStep(a)\10\9rs:UnbindFromRenderStep(b)\10end\10","=bs_world");
			if t and pcall(t,F)then 
				U.adopt(F.hb);
				if type(F.stop)=="function"then 
					U.teardown(F.stop);
				end;
			else 
				U.connect(K.load("b").run.Heartbeat,R);
				U.bind(Enum.RenderPriority.Camera.Value+3,g);
				U.bind(Enum.RenderPriority.Last.Value+1,N);
			end;
			u.attach(G.from_packet);
			G.start();
			h.Load();
			U.teardown(function()
				if h._loaded then 
					pcall(h.Unload);
				end;
			end);
			_.finish();
			U.publish(U.release);
			return true;
		end;
	end;
end)(__devirt_support)()(...)
