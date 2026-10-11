
return setmetatable({
	S = function(P, T, o, d, m, A, _, V, l, E)
		if T <= 16 then
			if T <= 15 then
				local a = buffer.readu8(l, d)
				if not (a < 128) then
					return 143, l, o, m, a, E
				else
					return 141, a, o, m, A, E
				end
			else
				return 76, l, o, 1 + m, A, E
			end
		elseif T <= 17 then
			local d = 16384 * (E - 128)
			local a = 128 * (_ - 128) + d + V
			return 54, l, o, 3 + m, A, a
		elseif T <= 18 then
			return 56, l, (o - 128) * 128 + m, 2, A, E
		else
			local T = buffer.readu8(l, m)
			return not (128 <= T) and 133 or 6, l, o, m, A, T
		end
	end,
	[12407] = function(P, T, o, d, m, A, _, V, l, E, E, a, I, H, H, W, w, w, w)
		local w, j, n, y, S, r, t, X, J, e, R, q, c, N, Q, D, K, s, k, L =
			P[25],
			table.create,
			P[36],
			table.move,
			table.pack,
			P[48],
			coroutine.wrap,
			P.yH,
			P[29],
			bit32.band,
			bit32.rshift,
			bit32.lshift,
			bit32.bxor,
			buffer.readu8,
			buffer.writeu32,
			buffer.readu32,
			buffer.writeu8,
			P[54],
			P[46],
			P.rH
		local function f(Y, M, M)
			local M, u, v, h, z, C, O, i, x, Z, G, p, g, F, B, b, U, Pb, Tb, ob =
				w, j, n, y, S, r, t, X, J, e, R, q, c, N, Q, D, K, s, k, L
			local function w(...)
				local j
				local n, y, S, r = 2898694488, 2596608142
				local t, X, J, e = 1126668143
				local R, q, c = H, a, u
				local a = c(I)
				local I, H, N, Q, D, K, s, k, L, u, db, mb, Ab, _b, Vb, lb, Eb =
					M(), C, x, h, z, O, i, Z, G, p, g, F, B, b, U, Pb, Tb
				local M, h, z, C, O = v(function(...)
					local v, i, x, Z, G, p, g, F, B
					local b = q == 154
					if b then
						while true do
							local U = W[R]
							local Pb = U >= 83
							if Pb then
								local Pb = U >= 125
								if Pb then
									local Pb = U < 146
									if Pb then
										local Pb = U < 135
										if Pb then
											local Pb = U < 130
											if Pb then
												local Pb = U >= 127
												if Pb then
													local Pb = U < 128
													if Pb then
														local Pb = not (m[R] < a[o[R]])
														if Pb then
															R = d[R]
														end
													else
														local Pb = U ~= 129
														if Pb then
															local Pb = a[m[R]] == a[o[R]]
															if Pb then
																R = d[R]
															end
														else
															B, g, i = o[R], d[R], m[R]
															p, v = B + i - 1, B + g
															Z = a[v]
															x = Z.n
															G = g + x - 1
															Z.n = G
															Q(Z, 1, x, g, Z)
															Q(a, B + 1, v - 1, 1, Z)
															F = D(a[B](H(Z, 1, Z.n)))
															Q(F, 1, i, B, a)
														end
													end
												else
													local Pb = U ~= 126
													if Pb then
														a[d[R]] = a[o[R]] // m[R]
													else
														a[d[R]] = a[m[R]] > V[R]
													end
												end
											else
												local Pb = U < 132
												if Pb then
													local Pb = U == 131
													if Pb then
														B, g, i = m[R], o[R], d[R]
														p, v, Z = B + i - 1, B + g, D(a[B](H(a, B + 1, B + g)))
														Q(Z, 1, i, B, a)
													else
														a[d[R]](H(a[m[R]], 1, a[m[R]].n))
													end
												else
													local Pb = U < 133
													if Pb then
														r = { [7] = r, [8] = S, [6] = e, [9] = J }
														B, g = o[R], K(s)
														g(P, a[B], a[B + 1], a[B + 2])
														e = g
														R = d[R]
													else
														local Pb = U == 134
														if Pb then
															e = r[6]
															J = r[9]
															S = r[8]
															r = r[7]
														else
															a[o[R]] = A[R] .. E[R]
														end
													end
												end
											end
										else
											local Pb = U < 140
											if Pb then
												local Pb = U < 137
												if Pb then
													local Pb = U ~= 136
													if Pb then
														y = a[d[R]]
													else
														local Pb = not (a[d[R]] <= V[R])
														if Pb then
															R = m[R]
														end
													end
												else
													local Pb = U >= 138
													if Pb then
														local Pb = U ~= 139
														if Pb then
															a[o[R]](a[d[R]], H(a[m[R]], 1, a[m[R]].n))
														else
															a[o[R]] = {}
														end
													else
														a[m[R]] = Y[d[R]][a[o[R]]]
													end
												end
											else
												local Pb = U >= 143
												if Pb then
													local Pb = U < 144
													if Pb then
														a[o[R]] = A[R]
													else
														local Pb = U == 145
														if Pb then
															a[o[R]][d[R]] = a[m[R]]
														else
															local Pb, Tb = X, j
															if Pb then
																for ab in N, Pb, nil do
																	if Pb then
																		local Ib = Pb[ab]
																		if Ib then
																			Ib[6] = Ib
																			Ib[4] = a[ab]
																			Ib[5] = 4
																			Pb[ab] = nil
																		end
																	end
																end
															end
															if Tb then
																for ab, Ib in N, Tb, nil do
																	Pb = Ib[4]
																	if Tb then
																		local Ib = Tb[ab]
																		if Ib then
																			local Hb, Wb = ab + Pb - 1, c(Pb)
																			Q(a, ab, Hb, 1, Wb)
																			Ib[6] = Wb
																			Ib[5] = 1
																			Tb[ab] = nil
																		end
																	end
																end
															end
															return false, false
														end
													end
												else
													local Pb = U >= 141
													if Pb then
														local Pb = U == 142
														if Pb then
															a[o[R]] = a[m[R]] < E[R]
														else
															local Pb = a[d[R]] == V[R]
															if Pb then
																R = m[R]
															end
														end
													else
														local Pb, Tb, ab = o[R], E[R], A[R]
														local Ib, Hb = k(Tb, 4294967295), k(ab, 4294967295)
														local Tb, Wb, wb, jb =
															k(Ib, 65535), L(Ib, 16), k(Hb, 65535), L(Hb, 16)
														ab = k(Tb * wb + u(k(Tb * jb + Wb * wb, 65535), 16), 4294967295)
														Tb = nil
														repeat
															wb = ab % 4294967296
															if wb ~= wb then
																Tb = 0
																break
															end
															Tb = wb - wb % 1
														until true
														a[Pb] = Tb
													end
												end
											end
										end
									else
										local Pb = U < 156
										if Pb then
											local Pb = U < 151
											if Pb then
												local Pb = U < 148
												if Pb then
													local Pb = U == 147
													if Pb then
														a[d[R]] = I[V[R]]
														a[m[R + 1]] = a[d[R + 1]][V[R + 1]]
														R += 1
													else
														B, g =
															d[R] + 1, db(m[R], (k(db(t, (k(L(t, 29), 7))), 536870911)))
														local Pb = R
														for Tb = 1, o[Pb], 1 do
															g = k(db(g, (u(g, 13))), 536870911)
															g = db(g, (L(g, 13)))
															g = k(db(g, (u(g, 14))), 536870911)
															d[B] = db(d[B], (k(L(g, 0), 127)))
															m[B] = db(m[B], (k(L(g, 7), 127)))
															o[B] = db(o[B], (k(L(g, 14), 127)))
															W[B] = db(W[B], (k(L(g, 21), 127)))
															B = B + 1
														end
														W[R] = 1
													end
												else
													local Pb = U < 149
													if Pb then
														a[d[R]] = o[R]
													else
														local Pb = U == 150
														if Pb then
															B = a[o[R]]
															a[m[R]] = D(H(B, d[R], B.n))
														else
															Y[d[R]][a[o[R]]] = a[m[R]]
														end
													end
												end
											else
												local Pb = U >= 153
												if Pb then
													local Pb = U < 154
													if Pb then
														local Pb, Tb = X, j
														if Pb then
															for ab in N, Pb, nil do
																if Pb then
																	local Ib = Pb[ab]
																	if Ib then
																		Ib[6] = Ib
																		Ib[4] = a[ab]
																		Ib[5] = 4
																		Pb[ab] = nil
																	end
																end
															end
														end
														if Tb then
															for ab, Ib in N, Tb, nil do
																Pb = Ib[4]
																if Tb then
																	local Ib = Tb[ab]
																	if Ib then
																		local Hb = c(Pb)
																		Q(a, ab, ab + Pb - 1, 1, Hb)
																		Ib[6] = Hb
																		Ib[5] = 1
																		Tb[ab] = nil
																	end
																end
															end
														end
														Tb, Pb = d[R], o[R]
														return true, true, Tb, a[Pb]
													else
														local Pb = U ~= 155
														if Pb then
															local Pb, Tb = X, j
															if Pb then
																for ab in N, Pb, nil do
																	if Pb then
																		local Ib = Pb[ab]
																		if Ib then
																			Ib[6] = Ib
																			Ib[4] = a[ab]
																			Ib[5] = 4
																			Pb[ab] = nil
																		end
																	end
																end
															end
															if Tb then
																for ab, Ib in N, Tb, nil do
																	Pb = Ib[4]
																	if Tb then
																		local Ib = Tb[ab]
																		if Ib then
																			local Hb, Wb = ab + Pb, c(Pb)
																			Q(a, ab, Hb - 1, 1, Wb)
																			Ib[6] = Wb
																			Ib[5] = 1
																			Tb[ab] = nil
																		end
																	end
																end
															end
															local Pb, Tb, ab, Ib = m[R], V[R], a[d[R]], a[d[R]]
															return true, true, Pb, D(Tb, H(ab, 1, Ib.n))
														else
															local Pb, Tb, ab =
																d[R],
																db(m[R], (k(db(t, (k(L(t, 29), 7))), 536870911))),
																l[5]
															local Ib = db(ab[Pb], 43364404)
															ab[Pb] = Ib
															Pb, ab = l[4], Ib + 1
															Ib = mb(Pb, ab)
															local Hb, Wb
															if Ib < 128 then
																Hb, Wb = Ib, ab + 1
															else
																local wb = mb(Pb, ab + 1)
																if wb < 128 then
																	Hb, Wb = (Ib - 128) * 128 + wb, ab + 2
																else
																	local jb = mb(Pb, ab + 2)
																	if jb < 128 then
																		Hb, Wb =
																			(Ib - 128) * 16384 + (wb - 128) * 128 + jb,
																			ab + 3
																	else
																		local nb = mb(Pb, ab + 3)
																		Hb, Wb =
																			(Ib - 128) * 128
																				+ (wb - 128)
																				+ (jb - 128) * 16384
																				+ nb % 128 * 2097152
																				+ (nb - nb % 128) * 2097152,
																			ab + 4
																	end
																end
															end
															Ib, ab = Tb * 16843009, Wb + Hb
															local wb = ab - Hb % 4
															for jb = Wb, wb - 1, 4 do
																Ab(Pb, jb, (db(_b(Pb, jb), Ib)))
															end
															for Ib = wb, ab - 1, 1 do
																Vb(Pb, Ib, (db(mb(Pb, Ib), Tb)))
															end
															Hb, Tb, wb = R, R, R
															d[R] = 87
															m[Hb] = 215
															o[Tb] = 220
															W[wb] = 1
														end
													end
												else
													local Pb = U == 152
													if Pb then
														a[d[R]] = #a[m[R]]
													else
														a[m[R]] = a[d[R]] > a[o[R]]
													end
												end
											end
										else
											local Pb = U < 161
											if Pb then
												local Pb = U < 158
												if Pb then
													local Pb = U ~= 157
													if Pb then
														B = o[R]
														local Pb, Tb, ab = e()
														if Pb then
															a[B + 1] = Tb
															a[B + 2] = ab
															R = m[R]
														end
														g, i, p = Pb, Tb, ab
													else
														a[m[R]](a[d[R]])
													end
												else
													local Pb = U < 159
													if Pb then
														a[m[R]] = d[R] * a[o[R]]
													else
														local Pb = U ~= 160
														if Pb then
															B = Y[o[R]]
															B[6][B[5]] = A[R]
														else
															Y[d[R]][A[R]] = V[R]
														end
													end
												end
											else
												local Pb = U >= 164
												if Pb then
													local Pb = U >= 165
													if Pb then
														local Pb = U ~= 166
														if Pb then
															a[m[R]] = a[o[R]] .. a[d[R]]
														else
															B, g, i = m[R], { ... }, o[R]
															Q(g, 1, B - 1, i, a)
															a[i + B - 1] = D(lb(B, ...))
														end
													else
														q = d[R]
														R = o[R] + 1
														break
													end
												else
													local Pb = U >= 162
													if Pb then
														local Pb = U ~= 163
														if Pb then
															t = a[o[R]]
														else
															B = Y[d[R]]
															B[6][B[5]][a[m[R]]] = a[o[R]]
														end
													else
														local Pb, Tb = X, d[R]
														if Pb then
															local lb = Pb[Tb]
															if lb then
																lb[6] = lb
																lb[4] = a[Tb]
																lb[5] = 4
																Pb[Tb] = nil
															end
														end
													end
												end
											end
										end
									end
								else
									local Pb = U < 104
									if Pb then
										local Pb = U >= 93
										if Pb then
											local Pb = U >= 98
											if Pb then
												local Pb = U < 101
												if Pb then
													local Pb = U < 99
													if Pb then
														a[o[R]] = a[m[R]](H(a[d[R]], 1, a[d[R]].n))
													else
														local Pb = U == 100
														if Pb then
															B, g, i = m[R], d[R], o[R]
															p = a[B]
															Q(a, B + 1, B + g, i + 1, p)
														else
															local Pb, Tb = X, j
															if Pb then
																for lb in N, Pb, nil do
																	if Pb then
																		local ab = Pb[lb]
																		if ab then
																			ab[6] = ab
																			ab[4] = a[lb]
																			ab[5] = 4
																			Pb[lb] = nil
																		end
																	end
																end
															end
															if Tb then
																for lb, ab in N, Tb, nil do
																	Pb = ab[4]
																	if Tb then
																		local ab = Tb[lb]
																		if ab then
																			local Ib = c(Pb)
																			Q(a, lb, lb + Pb - 1, 1, Ib)
																			ab[6] = Ib
																			ab[5] = 1
																			Tb[lb] = nil
																		end
																	end
																end
															end
															local Pb, Tb, lb = m[R], V[R], a[d[R]]
															return true, true, Pb, D(Tb, lb)
														end
													end
												else
													local Pb = U >= 102
													if Pb then
														local Pb = U ~= 103
														if Pb then
															a[m[R]], a[o[R]] = a[d[R]]()
														else
															local Pb = a[d[R]] ~= A[R]
															if Pb then
																R = o[R]
															end
														end
													else
														a[m[R]] = E[R] * V[R]
													end
												end
											else
												local Pb = U >= 95
												if Pb then
													local Pb = U < 96
													if Pb then
														a[d[R]] = a[m[R]] >= o[R]
													else
														local Pb = U == 97
														if Pb then
															a[d[R]] = A[R] .. a[o[R]]
														else
															a[d[R]] = Y[m[R]]
														end
													end
												else
													local Pb = U == 94
													if Pb then
														local Pb = not (o[R] <= a[m[R]])
														if Pb then
															R = d[R]
														end
													else
														R = a[m[R]]
													end
												end
											end
										else
											local Pb = U < 88
											if Pb then
												local Pb = U < 85
												if Pb then
													local Pb = U ~= 84
													if Pb then
														a[d[R]] = a[m[R]] % a[o[R]]
													else
														a[o[R]] = a[d[R]] <= A[R]
													end
												else
													local Pb = U >= 86
													if Pb then
														local Pb = U == 87
														if Pb then
															local Pb, Tb = X, j
															if Pb then
																for lb in N, Pb, nil do
																	if Pb then
																		local ab = Pb[lb]
																		if ab then
																			ab[6] = ab
																			ab[4] = a[lb]
																			ab[5] = 4
																			Pb[lb] = nil
																		end
																	end
																end
															end
															if Tb then
																for lb, ab in N, Tb, nil do
																	Pb = ab[4]
																	if Tb then
																		local ab = Tb[lb]
																		if ab then
																			local Ib, Hb = lb + Pb - 1, c(Pb)
																			Q(a, lb, Ib, 1, Hb)
																			ab[6] = Hb
																			ab[5] = 1
																			Tb[lb] = nil
																		end
																	end
																end
															end
															local Pb, Tb, lb, ab = m[R], a[o[R]], a[d[R]], a[d[R]]
															return true, true, Pb, D(Tb, H(lb, 1, ab.n))
														else
															local Pb = not (a[d[R]] <= a[o[R]])
															if Pb then
																R = m[R]
															end
														end
													else
														a[m[R]] = a[o[R]] - a[d[R]]
													end
												end
											else
												local Pb = U >= 90
												if Pb then
													local Pb = U >= 91
													if Pb then
														local Pb = U == 92
														if Pb then
															a[d[R]] = A[R] == V[R]
														else
															a[d[R]] = a[m[R]] ~= V[R]
														end
													else
														a[m[R]] = d[R] + a[o[R]]
													end
												else
													local Pb = U ~= 89
													if Pb then
														a[m[R]] = not a[o[R]]
													else
														a[o[R]] = a[d[R]] - m[R]
													end
												end
											end
										end
									else
										local Pb = U < 114
										if Pb then
											local Pb = U >= 109
											if Pb then
												local Pb = U < 111
												if Pb then
													local Pb = U ~= 110
													if Pb then
														B, g, i = d[R], m[R], o[R]
														p = B + g
														a[B] = D(a[B](H(a, B + 1, p)))
													else
														a[o[R]] = P[d[R]]
														a[d[R + 1]] = o[R + 1]
														R += 1
													end
												else
													local Pb = U < 112
													if Pb then
														local Pb, Tb = X, j
														if Pb then
															for lb in N, Pb, nil do
																if Pb then
																	local ab = Pb[lb]
																	if ab then
																		ab[6] = ab
																		ab[4] = a[lb]
																		ab[5] = 4
																		Pb[lb] = nil
																	end
																end
															end
														end
														if Tb then
															for lb, ab in N, Tb, nil do
																Pb = ab[4]
																if Tb then
																	local ab = Tb[lb]
																	if ab then
																		local Ib, Hb = lb + Pb - 1, c(Pb)
																		Q(a, lb, Ib, 1, Hb)
																		ab[6] = Hb
																		ab[5] = 1
																		Tb[lb] = nil
																	end
																end
															end
														end
														Pb, Tb = o[R], a[m[R]]
														return true, true, Pb, D(Tb)
													else
														local Pb = U ~= 113
														if Pb then
															a[d[R]][a[o[R]]] = A[R]
														else
															local Pb, Tb, lb = d[R], m[R], l[5]
															local ab = db(lb[Pb], 43364404)
															lb[Pb] = ab
															Pb, lb = l[4], ab + 1
															ab = mb(Pb, lb)
															local Ib, Hb
															if ab < 128 then
																Ib, Hb = ab, lb + 1
															else
																local Wb = mb(Pb, lb + 1)
																if Wb < 128 then
																	Ib, Hb = (ab - 128) * 128 + Wb, lb + 2
																else
																	local wb = mb(Pb, lb + 2)
																	if wb < 128 then
																		Ib, Hb =
																			(ab - 128) * 16384 + (Wb - 128) * 128 + wb,
																			lb + 3
																	else
																		local jb = mb(Pb, lb + 3)
																		Ib, Hb =
																			(ab - 128) * 128
																				+ (Wb - 128)
																				+ (wb - 128) * 16384
																				+ jb % 128 * 2097152
																				+ (jb - jb % 128) * 2097152,
																			lb + 4
																	end
																end
															end
															lb, ab = Tb * 16843009, Hb + Ib
															local Wb = ab - Ib % 4
															for Ib = Hb, Wb - 1, 4 do
																Ab(Pb, Ib, (db(_b(Pb, Ib), lb)))
															end
															for Ib = Wb, ab - 1, 1 do
																Vb(Pb, Ib, (db(mb(Pb, Ib), Tb)))
															end
															Pb, ab, lb = R, R, R
															d[R] = 192
															m[Pb] = 92
															o[ab] = 158
															W[lb] = 1
														end
													end
												end
											else
												local Pb = U < 106
												if Pb then
													local Pb = U == 105
													if Pb then
														a[m[R]] = a[o[R]] ^ d[R]
													else
														a[d[R]] = a[m[R]][a[o[R]]]
													end
												else
													local Pb = U >= 107
													if Pb then
														local Pb = U ~= 108
														if Pb then
															local Pb, Tb = X, j
															if Pb then
																for lb in N, Pb, nil do
																	if Pb then
																		local ab = Pb[lb]
																		if ab then
																			ab[6] = ab
																			ab[4] = a[lb]
																			ab[5] = 4
																			Pb[lb] = nil
																		end
																	end
																end
															end
															if Tb then
																for lb, ab in N, Tb, nil do
																	Pb = ab[4]
																	if Tb then
																		local ab = Tb[lb]
																		if ab then
																			local Ib, Hb = lb + Pb, c(Pb)
																			Q(a, lb, Ib - 1, 1, Hb)
																			ab[6] = Hb
																			ab[5] = 1
																			Tb[lb] = nil
																		end
																	end
																end
															end
															Pb = a[m[R]]
															return false, true, D(Pb)
														else
															local Pb, Tb = X, j
															if Pb then
																for lb in N, Pb, nil do
																	if Pb then
																		local ab = Pb[lb]
																		if ab then
																			ab[6] = ab
																			ab[4] = a[lb]
																			ab[5] = 4
																			Pb[lb] = nil
																		end
																	end
																end
															end
															if Tb then
																for lb, ab in N, Tb, nil do
																	Pb = ab[4]
																	if Tb then
																		local ab = Tb[lb]
																		if ab then
																			local Ib, Hb = lb + Pb, c(Pb)
																			Q(a, lb, Ib - 1, 1, Hb)
																			ab[6] = Hb
																			ab[5] = 1
																			Tb[lb] = nil
																		end
																	end
																end
															end
															Pb = E[R]
															return false, true, D(Pb)
														end
													else
														a[m[R]][V[R]] = a[d[R]]
													end
												end
											end
										else
											local Pb = U < 119
											if Pb then
												local Pb = U < 116
												if Pb then
													local Pb = U == 115
													if Pb then
														local Pb, Tb = X, j
														if Pb then
															for lb in N, Pb, nil do
																if Pb then
																	local ab = Pb[lb]
																	if ab then
																		ab[6] = ab
																		ab[4] = a[lb]
																		ab[5] = 4
																		Pb[lb] = nil
																	end
																end
															end
														end
														if Tb then
															for lb, ab in N, Tb, nil do
																Pb = ab[4]
																if Tb then
																	local ab = Tb[lb]
																	if ab then
																		local Ib, Hb = lb + Pb, c(Pb)
																		Q(a, lb, Ib - 1, 1, Hb)
																		ab[6] = Hb
																		ab[5] = 1
																		Tb[lb] = nil
																	end
																end
															end
														end
														local Pb, Tb, lb = m[R], a[d[R]], a[o[R]]
														return true, true, Pb, D(Tb, lb)
													else
														local Pb, Tb, lb =
															d[R],
															db(m[R], (k(db(y, (k(L(y, 29), 7))), 536870911))),
															l[5]
														local ab = db(lb[Pb], 43364404)
														lb[Pb] = ab
														lb, Pb = l[4], ab + 1
														ab = mb(lb, Pb)
														local Ib, Hb
														if ab < 128 then
															Ib, Hb = ab, Pb + 1
														else
															local Wb = mb(lb, Pb + 1)
															if Wb < 128 then
																Ib, Hb = (ab - 128) * 128 + Wb, Pb + 2
															else
																local wb = mb(lb, Pb + 2)
																if wb < 128 then
																	Ib, Hb =
																		(ab - 128) * 16384 + (Wb - 128) * 128 + wb,
																		Pb + 3
																else
																	local jb = mb(lb, Pb + 3)
																	Ib, Hb =
																		(ab - 128) * 128
																			+ (Wb - 128)
																			+ (wb - 128) * 16384
																			+ jb % 128 * 2097152
																			+ (jb - jb % 128) * 2097152,
																		Pb + 4
																end
															end
														end
														ab, Pb = Tb * 16843009, Hb + Ib
														local Wb = Pb - Ib % 4
														for Ib = Hb, Wb - 1, 4 do
															Ab(lb, Ib, (db(_b(lb, Ib), ab)))
														end
														for ab = Wb, Pb - 1, 1 do
															Vb(lb, ab, (db(mb(lb, ab), Tb)))
														end
														Hb, lb, Tb = R, R, R
														d[R] = 87
														m[Hb] = 142
														o[lb] = 135
														W[Tb] = 1
													end
												else
													local Pb = U >= 117
													if Pb then
														local Pb = U ~= 118
														if Pb then
															B, g = d[R], a[m[R]]
															a[B + 1] = g
															a[B] = g[V[R]]
														else
															a[d[R]]()
														end
													else
														Y[o[R]][E[R]] = m[R]
													end
												end
											else
												local Pb = U >= 122
												if Pb then
													local Pb = U < 123
													if Pb then
														local Pb, Tb, lb = d[R], o[R], a[m[R]]
														local ab, Ib = k(Tb, 4294967295), k(lb, 4294967295)
														local Hb, Wb, wb, jb =
															k(ab, 65535), L(ab, 16), k(Ib, 65535), L(Ib, 16)
														Tb = k(Hb * wb + u(k(Hb * jb + Wb * wb, 65535), 16), 4294967295)
														Ib = nil
														repeat
															lb = Tb % 4294967296
															if lb ~= lb then
																Ib = 0
																break
															end
															Ib = lb - lb % 1
														until true
														a[Pb] = Ib
													else
														local Pb = U ~= 124
														if Pb then
															local Pb = a[o[R]] == m[R]
															if Pb then
																R = d[R]
															end
														else
															Y[d[R]][V[R]] = a[m[R]]
														end
													end
												else
													local Pb = U >= 120
													if Pb then
														local Pb = U == 121
														if Pb then
															a[m[R]] = t
														else
															local Pb = a[m[R]] < o[R]
															if Pb then
																R = d[R]
															end
														end
													else
														a[d[R]] = I[V[R]]
													end
												end
											end
										end
									end
								end
							else
								local Pb = U >= 41
								if Pb then
									local Pb = U >= 62
									if Pb then
										local Pb = U >= 72
										if Pb then
											local Pb = U < 77
											if Pb then
												local Pb = U < 74
												if Pb then
													local Pb = U ~= 73
													if Pb then
														a[d[R]] = n
													else
														a[m[R]] = a[d[R]] + a[o[R]]
													end
												else
													local Pb = U >= 75
													if Pb then
														local Pb = U ~= 76
														if Pb then
															a[d[R]][A[R]] = V[R]
														else
															B = Y[m[R]]
															a[o[R]] = B[6][B[5]][a[d[R]]]
														end
													else
														local Pb, Tb, lb = m[R], d[R], o[R]
														local ab, Ib = k(Tb, 4294967295), k(lb, 4294967295)
														local Hb, Wb, wb, jb =
															k(ab, 65535), L(ab, 16), k(Ib, 65535), L(Ib, 16)
														lb = k(Hb * wb + u(k(Hb * jb + Wb * wb, 65535), 16), 4294967295)
														ab = nil
														repeat
															Tb = lb % 4294967296
															if Tb ~= Tb then
																ab = 0
																break
															end
															ab = Tb - Tb % 1
														until true
														a[Pb] = ab
													end
												end
											else
												local Pb = U >= 80
												if Pb then
													local Pb = U < 81
													if Pb then
														B, g =
															d[R] + 1, db(m[R], (k(db(y, (k(L(y, 29), 7))), 536870911)))
														local Pb = R
														for Tb = 1, o[Pb], 1 do
															g = k(db(g, (u(g, 13))), 536870911)
															g = db(g, (L(g, 13)))
															g = k(db(g, (u(g, 14))), 536870911)
															d[B] = db(d[B], (k(L(g, 0), 127)))
															m[B] = db(m[B], (k(L(g, 7), 127)))
															o[B] = db(o[B], (k(L(g, 14), 127)))
															W[B] = db(W[B], (k(L(g, 21), 127)))
															B = B + 1
														end
														W[R] = 1
													else
														local Pb = U == 82
														if Pb then
															local Pb = not (a[d[R]] < a[o[R]])
															if Pb then
																R = m[R]
															end
														else
															a[d[R]] = V[R] + a[m[R]]
														end
													end
												else
													local Pb = U >= 78
													if Pb then
														local Pb = U == 79
														if Pb then
															a[o[R]] = P[d[R]]
														else
															a[d[R]] = y
														end
													else
														local Pb = a[o[R]] < A[R]
														if Pb then
															R = d[R]
														end
													end
												end
											end
										else
											local Pb = U >= 67
											if Pb then
												local Pb = U < 69
												if Pb then
													local Pb = U == 68
													if Pb then
														a[m[R]] = a[o[R]][d[R]]
													else
														local Pb, Tb, lb = d[R], A[R], o[R]
														local ab, Ib = k(Tb, 4294967295), k(lb, 4294967295)
														local Tb, Hb, Wb, wb =
															k(ab, 65535), L(ab, 16), k(Ib, 65535), L(Ib, 16)
														lb = k(Tb * Wb + u(k(Tb * wb + Hb * Wb, 65535), 16), 4294967295)
														ab = nil
														repeat
															Hb = lb % 4294967296
															if Hb ~= Hb then
																ab = 0
																break
															end
															ab = Hb - Hb % 1
														until true
														a[Pb] = ab
													end
												else
													local Pb = U >= 70
													if Pb then
														local Pb = U == 71
														if Pb then
															B, g, i = m[R], o[R], d[R]
															p, v = a[B], B + g
															Z = a[v]
															Q(a, B + 1, v - 1, i + 1, p)
															Q(Z, 1, Z.n, i + g, p)
														else
															a[o[R]] = a[m[R]] * E[R]
														end
													else
														local Pb, Tb, lb = o[R], a[d[R]], m[R]
														local ab, Ib = k(Tb, 4294967295), k(lb, 4294967295)
														local Hb, Wb, wb, jb =
															k(ab, 65535), L(ab, 16), k(Ib, 65535), L(Ib, 16)
														lb = k(Hb * wb + u(k(Hb * jb + Wb * wb, 65535), 16), 4294967295)
														Tb = nil
														repeat
															Hb = lb % 4294967296
															if Hb ~= Hb then
																Tb = 0
																break
															end
															Tb = Hb - Hb % 1
														until true
														a[Pb] = Tb
													end
												end
											else
												local Pb = U >= 64
												if Pb then
													local Pb = U >= 65
													if Pb then
														local Pb = U == 66
														if Pb then
															B = Y[d[R]]
															B[6][B[5]][V[R]] = A[R]
														else
															local Pb
															local Tb, lb, ab, Ib, Hb = V[R], X, j
															if Tb then
																local Wb = #Tb / 3
																if Wb > 0 then
																	Pb, Ib, Hb = {}, lb, ab
																	for wb = 1, Wb, 1 do
																		local Wb = (wb - 1) * 3
																		local jb, nb = Tb[Wb + 3], Tb[Wb + 2]
																		if jb == 1 then
																			Ib = if not Ib then {} else Ib
																			local yb = Ib[nb]
																			if not yb then
																				yb = { [5] = nb, [6] = a }
																				Ib[nb] = yb
																			else
																			end
																			Pb[wb] = yb
																		else
																			if jb == 0 then
																				Pb[wb] = a[nb]
																			else
																				if jb == 2 then
																					Pb[wb] = Y[nb]
																				else
																					if jb == 3 then
																						Hb = if not Hb then {} else Hb
																						local jb = Hb[nb]
																						if not jb then
																							jb = {
																								[6] = a,
																								[5] = nb,
																								[4] = Tb[Wb + 1],
																							}
																							Hb[nb] = jb
																						else
																						end
																						Pb[wb] = jb
																					else
																					end
																				end
																			end
																		end
																	end
																else
																	Ib, Hb = lb, ab
																end
															else
																Ib, Hb = lb, ab
															end
															X, j = Ib, Hb
															g = A[R](Pb)
															Eb(g, I)
															a[d[R]] = g
															B = Pb
														end
													else
														a[d[R]] = a[m[R]] <= o[R]
													end
												else
													local Pb = U ~= 63
													if Pb then
														a[d[R]] = a[o[R]] - A[R]
													else
														a[m[R]] = a[o[R]] < d[R]
													end
												end
											end
										end
									else
										local Pb = U < 51
										if Pb then
											local Pb = U < 46
											if Pb then
												local Pb = U >= 43
												if Pb then
													local Pb = U < 44
													if Pb then
														local Pb = a[m[R]] ~= a[d[R]]
														if Pb then
															R = o[R]
														end
													else
														local Pb = U ~= 45
														if Pb then
															a[d[R]] = a[o[R]] == A[R]
														else
															B = d[R]
															g, i, p = a[B], a[B + 1], a[B + 2]
															a[B] = g(i, p)
														end
													end
												else
													local Pb = U ~= 42
													if Pb then
														local Pb, Tb, lb = o[R], a[m[R]]
														repeat
															local ab = Tb % 4294967296
															if ab ~= ab then
																lb = 0
																break
															end
															lb = ab - ab % 1
														until true
														a[Pb] = lb
													else
														local Pb = not (V[R] <= a[m[R]])
														if Pb then
															R = d[R]
														end
													end
												end
											else
												local Pb = U < 48
												if Pb then
													local Pb = U == 47
													if Pb then
														a[d[R]] = a[m[R]] ~= o[R]
													else
														B = Y[d[R]]
														a[o[R]] = B[6][B[5]][A[R]]
													end
												else
													local Pb = U >= 49
													if Pb then
														local Pb = U ~= 50
														if Pb then
															local Pb, Tb, lb = o[R], A[R]
															repeat
																local ab = Tb % 4294967296
																if ab ~= ab then
																	lb = 0
																	break
																end
																lb = ab - ab % 1
															until true
															a[Pb] = lb
														else
															a[o[R]] = Y[d[R]][A[R]]
														end
													else
														a[o[R]] = a[m[R]] * d[R]
													end
												end
											end
										else
											local Pb = U >= 56
											if Pb then
												local Pb = U >= 59
												if Pb then
													local Pb = U < 60
													if Pb then
														a[d[R]] = a[o[R]](A[R])
													else
														local Pb = U ~= 61
														if Pb then
															a[m[R]][a[o[R]]] = a[d[R]]
														else
															a[o[R]] = a[m[R]] == a[d[R]]
														end
													end
												else
													local Pb = U >= 57
													if Pb then
														local Pb = U == 58
														if Pb then
															local Pb, Tb, lb = d[R], A[R], a[o[R]]
															local ab, Ib = k(Tb, 4294967295), k(lb, 4294967295)
															local Hb, Wb, wb, jb =
																k(ab, 65535), L(ab, 16), k(Ib, 65535), L(Ib, 16)
															Tb = k(
																Hb * wb + u(k(Hb * jb + Wb * wb, 65535), 16),
																4294967295
															)
															lb = nil
															repeat
																Hb = Tb % 4294967296
																if Hb ~= Hb then
																	lb = 0
																	break
																end
																lb = Hb - Hb % 1
															until true
															a[Pb] = lb
														else
															a[d[R]] = o[R] - a[m[R]]
														end
													else
														a[m[R]] = a[d[R]] ~= a[o[R]]
													end
												end
											else
												local Pb = U < 53
												if Pb then
													local Pb = U ~= 52
													if Pb then
														a[m[R]] = a[d[R]][V[R]]
													else
														a[o[R]] = a[m[R]]
													end
												else
													local Pb = U >= 54
													if Pb then
														local Pb = U == 55
														if Pb then
															a[o[R]] = a[d[R]] < a[m[R]]
														else
															a[o[R]](E[R], A[R])
														end
													else
														r = { [7] = r, [8] = S, [6] = e, [9] = J }
														B = d[R]
														S = a[B + 2] + 0
														J = a[B + 1] + 0
														e = a[B] - S
														R = m[R]
													end
												end
											end
										end
									end
								else
									local Pb = U < 20
									if Pb then
										local Pb = U < 10
										if Pb then
											local Pb = U < 5
											if Pb then
												local Pb = U >= 2
												if Pb then
													local Pb = U >= 3
													if Pb then
														local Pb = U == 4
														if Pb then
															a[m[R]] = a[d[R]] / o[R]
														else
															a[m[R]](V[R], a[d[R]])
														end
													else
														a[d[R]] = A[R] ~= V[R]
													end
												else
													local Pb = U ~= 1
													if Pb then
														a[o[R]] = a[d[R]](a[m[R]])
													end
												end
											else
												local Pb = U >= 7
												if Pb then
													local Pb = U >= 8
													if Pb then
														local Pb = U ~= 9
														if Pb then
															local Pb, Tb, lb = o[R], m[R], E[R]
															local ab, Ib = k(Tb, 4294967295), k(lb, 4294967295)
															local lb, Hb, Wb, wb =
																k(ab, 65535), L(ab, 16), k(Ib, 65535), L(Ib, 16)
															Tb = k(
																lb * Wb + u(k(lb * wb + Hb * Wb, 65535), 16),
																4294967295
															)
															lb = nil
															repeat
																wb = Tb % 4294967296
																if wb ~= wb then
																	lb = 0
																	break
																end
																lb = wb - wb % 1
															until true
															a[Pb] = lb
														else
															a[d[R]] = a[m[R]] + V[R]
														end
													else
														B = Y[d[R]]
														B[6][B[5]][A[R]] = a[o[R]]
													end
												else
													local Pb = U == 6
													if Pb then
														a[m[R]] = a[d[R]] + o[R]
													else
														a[o[R]] = a[m[R]] * a[d[R]]
													end
												end
											end
										else
											local Pb = U >= 15
											if Pb then
												local Pb = U < 17
												if Pb then
													local Pb = U ~= 16
													if Pb then
														a[d[R]] = a[m[R]] .. V[R]
													else
														a[d[R]] = a[m[R]] // a[o[R]]
													end
												else
													local Pb = U < 18
													if Pb then
														a[o[R]] = a[d[R]] / a[m[R]]
													else
														local Pb = U ~= 19
														if Pb then
															B, g, i, p =
																o[R],
																m[R],
																db(y, k(L(y, 14), 262143), (k(L(y, 28), 15))),
																d[R]
															v = p < 2097152 and 7 or 14
															Z, x = L(p, v), k(p, u(1, v) - 1)
															local Pb = R
															o[Pb] = db(B, 38, (k(L(i, 14), 127)))
															Pb = R
															d[Pb] = db(x, 0, (k(i, 127)))
															Pb = R
															W[Pb] = db(Z, 122, (k(L(i, 21), 127)))
															Pb = R
															m[Pb] = db(g, 95, (k(L(i, 7), 127)))
															R -= 1
														else
															local Pb = a[m[R]] ~= d[R]
															if Pb then
																R = o[R]
															end
														end
													end
												end
											else
												local Pb = U < 12
												if Pb then
													local Pb = U ~= 11
													if Pb then
														a[d[R]] = a[m[R]] >= a[o[R]]
													else
														B, g = d[R] + 1, m[R]
														local Pb = R
														for Tb = 1, o[Pb], 1 do
															g = k(db(g, (u(g, 13))), 536870911)
															g = db(g, (L(g, 13)))
															g = k(db(g, (u(g, 14))), 536870911)
															d[B] = db(d[B], (k(L(g, 0), 127)))
															m[B] = db(m[B], (k(L(g, 7), 127)))
															o[B] = db(o[B], (k(L(g, 14), 127)))
															W[B] = db(W[B], (k(L(g, 21), 127)))
															B = B + 1
														end
														W[R] = 1
													end
												else
													local Pb = U >= 13
													if Pb then
														local Pb = U == 14
														if Pb then
															a[m[R]](V[R])
														else
															a[o[R]] = a[m[R]] > d[R]
														end
													else
														a[d[R]] = D(a[o[R]](a[m[R]]))
													end
												end
											end
										end
									else
										local Pb = U < 30
										if Pb then
											local Pb = U < 25
											if Pb then
												local Pb = U >= 22
												if Pb then
													local Pb = U < 23
													if Pb then
														e += S
														B = if S <= 0 then e >= J else e <= J
														if B then
															a[m[R]] = e
															R = d[R]
														end
													else
														local Pb = U == 24
														if Pb then
															R = m[R]
														else
															a[o[R]] = a[m[R]] / E[R]
														end
													end
												else
													local Pb = U ~= 21
													if Pb then
														B = Y[d[R]]
														B[6][B[5]] = a[m[R]]
													else
														a[m[R]][V[R]] = d[R]
													end
												end
											else
												local Pb = U < 27
												if Pb then
													local Pb = U ~= 26
													if Pb then
														B = Y[d[R]]
														a[m[R]] = B[6][B[5]]
													else
														B, g = { ... }, d[R]
														Q(B, 1, m[R], g, a)
													end
												else
													local Pb = U < 28
													if Pb then
														a[m[R]] = a[d[R]] <= a[o[R]]
													else
														local Pb = U ~= 29
														if Pb then
															a[d[R]] = -a[o[R]]
														else
															n = a[o[R]]
														end
													end
												end
											end
										else
											local Pb = U >= 35
											if Pb then
												local Pb = U < 38
												if Pb then
													local Pb = U >= 36
													if Pb then
														local Pb = U ~= 37
														if Pb then
															a[d[R]](a[m[R]], V[R])
														else
															a[d[R]] = a[m[R]] == o[R]
														end
													else
														a[m[R]] = V[R] > E[R]
													end
												else
													local Pb = U >= 39
													if Pb then
														local Pb = U == 40
														if Pb then
															local Pb, Tb, lb = d[R], a[m[R]], a[o[R]]
															local ab, Ib = k(Tb, 4294967295), k(lb, 4294967295)
															local lb, Hb, Wb, wb =
																k(ab, 65535), L(ab, 16), k(Ib, 65535), L(Ib, 16)
															ab = k(
																lb * Wb + u(k(lb * wb + Hb * Wb, 65535), 16),
																4294967295
															)
															Tb = nil
															repeat
																wb = ab % 4294967296
																if wb ~= wb then
																	Tb = 0
																	break
																end
																Tb = wb - wb % 1
															until true
															a[Pb] = Tb
														else
															a[o[R]] = a[m[R]]()
														end
													else
														B, g, i, p =
															o[R],
															d[R],
															m[R],
															db(y, k(L(y, 14), 262143), (k(L(y, 28), 15)))
														v = B < 16384 and 7 or (B < 2097152 and 14 or 21)
														Z, x = k(B, u(1, v) - 1), L(B, v)
														local Pb = R
														o[Pb] = db(Z, 37, (k(L(p, 14), 127)))
														Pb = R
														d[Pb] = db(g, 10, (k(p, 127)))
														Pb = R
														m[Pb] = db(i, 80, (k(L(p, 7), 127)))
														Pb = R
														W[Pb] = db(x, 60, (k(L(p, 21), 127)))
														R -= 1
													end
												end
											else
												local Pb = U >= 32
												if Pb then
													local Pb = U < 33
													if Pb then
														a[o[R]] = Y[m[R]][d[R]]
													else
														local Pb = U ~= 34
														if Pb then
															R = if a[m[R]] then o[R] else d[R]
														else
															Y[m[R]][a[o[R]]] = E[R]
														end
													end
												else
													local Pb = U == 31
													if Pb then
														a[m[R]](a[d[R]], a[o[R]])
													else
														a[d[R]] = D(a[m[R]]())
													end
												end
											end
										end
									end
								end
							end
							R += 1
						end
					else
					end
					b = q == 185
					if b then
						while true do
							local U = m[R]
							local Pb = U >= 84
							if Pb then
								local Pb = U >= 126
								if Pb then
									local Pb = U >= 147
									if Pb then
										local Pb = U < 157
										if Pb then
											local Pb = U < 152
											if Pb then
												local Pb = U < 149
												if Pb then
													local Pb = U == 148
													if Pb then
														local Pb = not (d[R] <= a[o[R]])
														if Pb then
															R = W[R]
														end
													else
														B, g, i, p =
															db(y, k(L(y, 14), 262143), (k(L(y, 28), 15))),
															W[R],
															d[R],
															o[R]
														v = i < 2097152 and 7 or 14
														Z, x = k(i, u(1, v) - 1), L(i, v)
														local Pb = R
														d[Pb] = db(Z, 113, (k(L(B, 14), 127)))
														Pb = R
														m[Pb] = db(x, 124, (k(L(B, 21), 127)))
														Pb = R
														o[Pb] = db(p, 95, (k(L(B, 7), 127)))
														Pb = R
														W[Pb] = db(g, 0, (k(B, 127)))
														R -= 1
													end
												else
													local Pb = U < 150
													if Pb then
														a[d[R]] = Y[o[R]][_[R]]
													else
														local Pb = U ~= 151
														if Pb then
															a[d[R]] = -a[o[R]]
														else
															local Pb = not (a[W[R]] < d[R])
															if Pb then
																R = o[R]
															end
														end
													end
												end
											else
												local Pb = U < 154
												if Pb then
													local Pb = U == 153
													if Pb then
														local Pb, Tb = X, d[R]
														if Pb then
															local lb = Pb[Tb]
															if lb then
																lb[6] = lb
																lb[4] = a[Tb]
																lb[5] = 4
																Pb[Tb] = nil
															end
														end
													else
														a[o[R]] = a[d[R]] == _[R]
													end
												else
													local Pb = U >= 155
													if Pb then
														local Pb = U == 156
														if Pb then
															B = a[W[R]]
															a[d[R]] = D(H(B, o[R], B.n))
														else
															a[d[R]] = a[o[R]]()
														end
													else
														a[o[R]] = a[d[R]] .. a[W[R]]
													end
												end
											end
										else
											local Pb = U >= 162
											if Pb then
												local Pb = U >= 165
												if Pb then
													local Pb = U >= 166
													if Pb then
														local Pb = U ~= 167
														if Pb then
															a[o[R]] = not a[W[R]]
														else
															a[o[R]] = a[W[R]] <= E[R]
														end
													else
														a[d[R]] = _[R] ~= V[R]
													end
												else
													local Pb = U < 163
													if Pb then
														B = Y[d[R]]
														a[o[R]] = B[6][B[5]][_[R]]
													else
														local Pb = U == 164
														if Pb then
															a[o[R]] = a[W[R]] + a[d[R]]
														else
															a[o[R]] = _[R] + a[d[R]]
														end
													end
												end
											else
												local Pb = U >= 159
												if Pb then
													local Pb = U >= 160
													if Pb then
														local Pb = U == 161
														if Pb then
															R = if a[d[R]] then W[R] else o[R]
														else
															a[W[R]] = n
														end
													else
														B, g, i = d[R], W[R], o[R]
														p, v = B + i - 1, B + g
														Z = a[v]
														x = Z.n
														G = g + x - 1
														Z.n = G
														Q(Z, 1, x, g, Z)
														Q(a, B + 1, v - 1, 1, Z)
														F = D(a[B](H(Z, 1, Z.n)))
														Q(F, 1, i, B, a)
													end
												else
													local Pb = U ~= 158
													if Pb then
														local Pb, Tb, lb = o[R], a[d[R]], a[W[R]]
														local ab, Ib = k(Tb, 4294967295), k(lb, 4294967295)
														local Hb, Wb, wb, jb =
															k(ab, 65535), L(ab, 16), k(Ib, 65535), L(Ib, 16)
														lb = k(Hb * wb + u(k(Hb * jb + Wb * wb, 65535), 16), 4294967295)
														wb = nil
														repeat
															Tb = lb % 4294967296
															if Tb ~= Tb then
																wb = 0
																break
															end
															wb = Tb - Tb % 1
														until true
														a[Pb] = wb
													else
														n = a[d[R]]
													end
												end
											end
										end
									else
										local Pb = U >= 136
										if Pb then
											local Pb = U >= 141
											if Pb then
												local Pb = U >= 144
												if Pb then
													local Pb = U < 145
													if Pb then
														a[W[R]] = a[d[R]] * o[R]
													else
														local Pb = U == 146
														if Pb then
															local Pb, Tb, lb = W[R], V[R], a[d[R]]
															local ab, Ib = k(Tb, 4294967295), k(lb, 4294967295)
															local lb, Hb, Wb, wb =
																k(ab, 65535), L(ab, 16), k(Ib, 65535), L(Ib, 16)
															Ib = k(
																lb * Wb + u(k(lb * wb + Hb * Wb, 65535), 16),
																4294967295
															)
															Wb = nil
															repeat
																Tb = Ib % 4294967296
																if Tb ~= Tb then
																	Wb = 0
																	break
																end
																Wb = Tb - Tb % 1
															until true
															a[Pb] = Wb
														else
															local Pb = not (a[d[R]] < a[W[R]])
															if Pb then
																R = o[R]
															end
														end
													end
												else
													local Pb = U >= 142
													if Pb then
														local Pb = U == 143
														if Pb then
															local Pb = a[d[R]] <= o[R]
															if Pb then
																R = W[R]
															end
														else
															B = Y[W[R]]
															B[6][B[5]][E[R]] = V[R]
														end
													else
														a[W[R]] = a[o[R]]
													end
												end
											else
												local Pb = U >= 138
												if Pb then
													local Pb = U >= 139
													if Pb then
														local Pb = U == 140
														if Pb then
															B, g, i = o[R], d[R], W[R]
															p = B + g
															v = a[p]
															Z = v.n
															x = g + Z - 1
															v.n = x
															Q(v, 1, Z, g, v)
															Q(a, B + 1, p - 1, 1, v)
															a[B] = D(a[B](H(v, 1, v.n)))
														else
															local Pb, Tb, lb = o[R], d[R], _[R]
															local ab, Ib = k(Tb, 4294967295), k(lb, 4294967295)
															local Tb, lb, Hb, Wb =
																k(ab, 65535), L(ab, 16), k(Ib, 65535), L(Ib, 16)
															Ib = k(
																Tb * Hb + u(k(Tb * Wb + lb * Hb, 65535), 16),
																4294967295
															)
															ab = nil
															repeat
																Hb = Ib % 4294967296
																if Hb ~= Hb then
																	ab = 0
																	break
																end
																ab = Hb - Hb % 1
															until true
															a[Pb] = ab
														end
													else
														local Pb, Tb = X, j
														if Pb then
															for lb in N, Pb, nil do
																if Pb then
																	local ab = Pb[lb]
																	if ab then
																		ab[6] = ab
																		ab[4] = a[lb]
																		ab[5] = 4
																		Pb[lb] = nil
																	end
																end
															end
														end
														if Tb then
															for lb, ab in N, Tb, nil do
																Pb = ab[4]
																if Tb then
																	local ab = Tb[lb]
																	if ab then
																		local Ib = c(Pb)
																		Q(a, lb, lb + Pb - 1, 1, Ib)
																		ab[6] = Ib
																		ab[5] = 1
																		Tb[lb] = nil
																	end
																end
															end
														end
														Tb, Pb = a[d[R]], a[o[R]]
														return false, true, D(Tb, Pb)
													end
												else
													local Pb = U ~= 137
													if Pb then
														local Pb = V[R] ~= E[R]
														if Pb then
															R = W[R]
														end
													else
														B, g, i = d[R], o[R], W[R]
														p = a[B]
														Q(a, B + 1, B + g, i + 1, p)
													end
												end
											end
										else
											local Pb = U >= 131
											if Pb then
												local Pb = U >= 133
												if Pb then
													local Pb = U < 134
													if Pb then
														a[d[R]] = a[W[R]] < a[o[R]]
													else
														local Pb = U ~= 135
														if Pb then
															a[d[R]] = _[R] * V[R]
														else
															a[d[R]] = a[W[R]] ~= V[R]
														end
													end
												else
													local Pb = U == 132
													if Pb then
														a[W[R]](V[R], E[R])
													else
														a[d[R]] = a[o[R]] < W[R]
													end
												end
											else
												local Pb = U >= 128
												if Pb then
													local Pb = U >= 129
													if Pb then
														local Pb = U == 130
														if Pb then
															B, g = o[R] + 1, d[R]
															local Pb = R
															for Tb = 1, W[Pb], 1 do
																g = k(db(g, (u(g, 13))), 536870911)
																g = db(g, (L(g, 13)))
																g = k(db(g, (u(g, 14))), 536870911)
																W[B] = db(W[B], (k(L(g, 0), 127)))
																o[B] = db(o[B], (k(L(g, 7), 127)))
																d[B] = db(d[B], (k(L(g, 14), 127)))
																m[B] = db(m[B], (k(L(g, 21), 127)))
																B = B + 1
															end
															m[R] = 24
														else
															local Pb = a[o[R]] == d[R]
															if Pb then
																R = W[R]
															end
														end
													else
														a[o[R]] = a[d[R]] <= a[W[R]]
													end
												else
													local Pb = U == 127
													if Pb then
														local Pb, Tb, lb = W[R], d[R], l[5]
														local ab = db(lb[Pb], 43364404)
														lb[Pb] = ab
														Pb, lb = l[4], ab + 1
														ab = mb(Pb, lb)
														local Ib, Hb
														if ab < 128 then
															Ib, Hb = ab, lb + 1
														else
															local Wb = mb(Pb, lb + 1)
															if Wb < 128 then
																Ib, Hb = (ab - 128) * 128 + Wb, lb + 2
															else
																local wb = mb(Pb, lb + 2)
																if wb < 128 then
																	Ib, Hb =
																		(ab - 128) * 16384 + (Wb - 128) * 128 + wb,
																		lb + 3
																else
																	local jb = mb(Pb, lb + 3)
																	Ib, Hb =
																		(ab - 128) * 128
																			+ (Wb - 128)
																			+ (wb - 128) * 16384
																			+ jb % 128 * 2097152
																			+ (jb - jb % 128) * 2097152,
																		lb + 4
																end
															end
														end
														lb, ab = Tb * 16843009, Hb + Ib
														local Wb = ab - Ib % 4
														for Ib = Hb, Wb - 1, 4 do
															Ab(Pb, Ib, (db(_b(Pb, Ib), lb)))
														end
														for lb = Wb, ab - 1, 1 do
															Vb(Pb, lb, (db(mb(Pb, lb), Tb)))
														end
														ab, Wb, Pb = R, R, R
														W[R] = 33
														d[ab] = 140
														o[Wb] = 186
														m[Pb] = 24
													else
														local Pb = a[d[R]] ~= a[o[R]]
														if Pb then
															R = W[R]
														end
													end
												end
											end
										end
									end
								else
									local Pb = U >= 105
									if Pb then
										local Pb = U >= 115
										if Pb then
											local Pb = U < 120
											if Pb then
												local Pb = U < 117
												if Pb then
													local Pb = U ~= 116
													if Pb then
														a[W[R]] = a[o[R]] / a[d[R]]
													else
														a[W[R]] = #a[d[R]]
													end
												else
													local Pb = U >= 118
													if Pb then
														local Pb = U == 119
														if Pb then
															B, g = o[R], a[W[R]]
															a[B + 1] = g
															a[B] = g[E[R]]
														else
															a[d[R]] = P[W[R]]
														end
													else
														B, g, i = o[R], W[R], d[R]
														p, v, Z = B + i - 1, B + g, D(a[B](H(a, B + 1, B + g)))
														Q(Z, 1, i, B, a)
													end
												end
											else
												local Pb = U < 123
												if Pb then
													local Pb = U < 121
													if Pb then
														R = a[o[R]]
													else
														local Pb = U ~= 122
														if Pb then
															local Pb = a[W[R]] == V[R]
															if Pb then
																R = d[R]
															end
														else
															r = { [7] = r, [8] = S, [6] = e, [9] = J }
															B, g = d[R], K(s)
															g(P, a[B], a[B + 1], a[B + 2])
															e = g
															R = o[R]
														end
													end
												else
													local Pb = U < 124
													if Pb then
														a[o[R]] = E[R] * a[W[R]]
													else
														local Pb = U ~= 125
														if Pb then
															a[W[R]][o[R]] = E[R]
														else
															e = r[6]
															J = r[9]
															S = r[8]
															r = r[7]
														end
													end
												end
											end
										else
											local Pb = U < 110
											if Pb then
												local Pb = U < 107
												if Pb then
													local Pb = U == 106
													if Pb then
														local Pb, Tb, lb = o[R], a[W[R]]
														repeat
															local ab = Tb % 4294967296
															if ab ~= ab then
																lb = 0
																break
															end
															lb = ab - ab % 1
														until true
														a[Pb] = lb
													else
														local Pb, Tb, lb =
															W[R],
															db(o[R], (k(db(t, (k(L(t, 29), 7))), 536870911))),
															l[5]
														local ab = db(lb[Pb], 43364404)
														lb[Pb] = ab
														Pb, lb = l[4], ab + 1
														ab = mb(Pb, lb)
														local Ib, Hb
														if ab < 128 then
															Ib, Hb = ab, lb + 1
														else
															local Wb = mb(Pb, lb + 1)
															if Wb < 128 then
																Ib, Hb = (ab - 128) * 128 + Wb, lb + 2
															else
																local wb = mb(Pb, lb + 2)
																if wb < 128 then
																	Ib, Hb =
																		(ab - 128) * 16384 + (Wb - 128) * 128 + wb,
																		lb + 3
																else
																	local jb = mb(Pb, lb + 3)
																	Ib, Hb =
																		(ab - 128) * 128
																			+ (Wb - 128)
																			+ (wb - 128) * 16384
																			+ jb % 128 * 2097152
																			+ (jb - jb % 128) * 2097152,
																		lb + 4
																end
															end
														end
														ab, lb = Tb * 16843009, Hb + Ib
														local Wb = lb - Ib % 4
														for Ib = Hb, Wb - 1, 4 do
															Ab(Pb, Ib, (db(_b(Pb, Ib), ab)))
														end
														for ab = Wb, lb - 1, 1 do
															Vb(Pb, ab, (db(mb(Pb, ab), Tb)))
														end
														Pb, Tb, Wb = R, R, R
														W[R] = 184
														o[Pb] = 167
														d[Tb] = 194
														m[Wb] = 24
													end
												else
													local Pb = U < 108
													if Pb then
														a[o[R]] = a[d[R]](H(a[W[R]], 1, a[W[R]].n))
													else
														local Pb = U == 109
														if Pb then
															Y[o[R]][E[R]] = W[R]
														else
															local Pb = _[R] < a[d[R]]
															if Pb then
																R = o[R]
															end
														end
													end
												end
											else
												local Pb = U >= 112
												if Pb then
													local Pb = U < 113
													if Pb then
														a[d[R]] = a[o[R]] % W[R]
													else
														local Pb = U == 114
														if Pb then
															local Pb, Tb = X, j
															if Pb then
																for lb in N, Pb, nil do
																	if Pb then
																		local ab = Pb[lb]
																		if ab then
																			ab[6] = ab
																			ab[4] = a[lb]
																			ab[5] = 4
																			Pb[lb] = nil
																		end
																	end
																end
															end
															if Tb then
																for lb, ab in N, Tb, nil do
																	Pb = ab[4]
																	if Tb then
																		local ab = Tb[lb]
																		if ab then
																			local Ib, Hb = lb + Pb, c(Pb)
																			Q(a, lb, Ib - 1, 1, Hb)
																			ab[6] = Hb
																			ab[5] = 1
																			Tb[lb] = nil
																		end
																	end
																end
															end
															Tb = a[d[R]]
															return false, true, D(Tb)
														else
															a[W[R]] = a[d[R]][V[R]]
														end
													end
												else
													local Pb = U ~= 111
													if Pb then
														a[o[R]] = a[W[R]] - a[d[R]]
													else
														B = d[R]
														local Pb, Tb, lb = e()
														if Pb then
															a[B + 1] = Tb
															a[B + 2] = lb
															R = W[R]
														end
														g, i, p = Pb, Tb, lb
													end
												end
											end
										end
									else
										local Pb = U >= 94
										if Pb then
											local Pb = U < 99
											if Pb then
												local Pb = U >= 96
												if Pb then
													local Pb = U >= 97
													if Pb then
														local Pb = U ~= 98
														if Pb then
															a[o[R]] = D(a[W[R]]())
														else
															a[d[R]] = a[o[R]] / W[R]
														end
													else
														a[o[R]](a[W[R]], a[d[R]])
													end
												else
													local Pb = U == 95
													if Pb then
														a[W[R]](E[R], a[o[R]])
													else
														Y[W[R]][a[d[R]]] = a[o[R]]
													end
												end
											else
												local Pb = U >= 102
												if Pb then
													local Pb = U < 103
													if Pb then
														B = d[R]
														i = B + o[R]
														local Pb, Tb = X, j
														if Pb then
															for lb in N, Pb, nil do
																if Pb then
																	local ab = Pb[lb]
																	if ab then
																		ab[6] = ab
																		ab[4] = a[lb]
																		ab[5] = 4
																		Pb[lb] = nil
																	end
																end
															end
														end
														if Tb then
															for lb, ab in N, Tb, nil do
																Pb = ab[4]
																if Tb then
																	local ab = Tb[lb]
																	if ab then
																		local Ib, Hb = lb + Pb, c(Pb)
																		Q(a, lb, Ib - 1, 1, Hb)
																		ab[6] = Hb
																		ab[5] = 1
																		Tb[lb] = nil
																	end
																end
															end
														end
														return true, false, B, i
													else
														local Pb = U == 104
														if Pb then
															a[d[R]] = a[o[R]] * a[W[R]]
														else
															e += S
															B = if S <= 0 then e >= J else e <= J
															if B then
																a[W[R]] = e
																R = d[R]
															end
														end
													end
												else
													local Pb = U < 100
													if Pb then
														local Pb = not (_[R] < a[o[R]])
														if Pb then
															R = d[R]
														end
													else
														local Pb = U ~= 101
														if Pb then
															local Pb, Tb = X, j
															if Pb then
																for lb in N, Pb, nil do
																	if Pb then
																		local ab = Pb[lb]
																		if ab then
																			ab[6] = ab
																			ab[4] = a[lb]
																			ab[5] = 4
																			Pb[lb] = nil
																		end
																	end
																end
															end
															if Tb then
																for lb, ab in N, Tb, nil do
																	Pb = ab[4]
																	if Tb then
																		local ab = Tb[lb]
																		if ab then
																			local Ib, Hb = lb + Pb - 1, c(Pb)
																			Q(a, lb, Ib, 1, Hb)
																			ab[6] = Hb
																			ab[5] = 1
																			Tb[lb] = nil
																		end
																	end
																end
															end
															Tb, Pb = d[R], o[R]
															return true, true, Tb, a[Pb]
														else
															local Pb = a[W[R]] <= a[d[R]]
															if Pb then
																R = o[R]
															end
														end
													end
												end
											end
										else
											local Pb = U >= 89
											if Pb then
												local Pb = U >= 91
												if Pb then
													local Pb = U < 92
													if Pb then
														y = a[W[R]]
													else
														local Pb = U == 93
														if Pb then
															B, g, i, p =
																db(y, k(L(y, 14), 262143), (k(L(y, 28), 15))),
																W[R],
																d[R],
																o[R]
															v = p < 16384 and 7 or (p < 2097152 and 14 or 21)
															Z, x = L(p, v), k(p, u(1, v) - 1)
															local Pb = R
															d[Pb] = db(i, 34, (k(L(B, 14), 127)))
															Pb = R
															o[Pb] = db(x, 123, (k(L(B, 7), 127)))
															Pb = R
															W[Pb] = db(g, 84, (k(B, 127)))
															Pb = R
															m[Pb] = db(Z, 10, (k(L(B, 21), 127)))
															R -= 1
														else
															a[o[R]] = E[R] == _[R]
														end
													end
												else
													local Pb = U == 90
													if Pb then
														a[d[R]] = W[R]
														a[d[R + 1]] = W[R + 1]
														R += 1
													else
														a[o[R]] = a[d[R]] + W[R]
													end
												end
											else
												local Pb = U >= 86
												if Pb then
													local Pb = U < 87
													if Pb then
														a[d[R]] = a[W[R]][o[R]]
													else
														local Pb = U == 88
														if Pb then
															local Pb, Tb, lb = d[R], o[R], a[W[R]]
															local ab, Ib = k(Tb, 4294967295), k(lb, 4294967295)
															local Tb, Hb, Wb, wb =
																k(ab, 65535), L(ab, 16), k(Ib, 65535), L(Ib, 16)
															ab = k(
																Tb * Wb + u(k(Tb * wb + Hb * Wb, 65535), 16),
																4294967295
															)
															Hb = nil
															repeat
																lb = ab % 4294967296
																if lb ~= lb then
																	Hb = 0
																	break
																end
																Hb = lb - lb % 1
															until true
															a[Pb] = Hb
														else
															B = W[R]
															g, i, p = a[B], a[B + 1], a[B + 2]
															a[B] = g(i, p)
														end
													end
												else
													local Pb = U ~= 85
													if Pb then
														a[o[R]][_[R]] = E[R]
													else
														B = Y[o[R]]
														B[6][B[5]] = E[R]
													end
												end
											end
										end
									end
								end
							else
								local Pb = U < 42
								if Pb then
									local Pb = U >= 21
									if Pb then
										local Pb = U < 31
										if Pb then
											local Pb = U >= 26
											if Pb then
												local Pb = U >= 28
												if Pb then
													local Pb = U < 29
													if Pb then
														a[d[R]] = W[R]
													else
														local Pb = U ~= 30
														if Pb then
															B = Y[W[R]]
															B[6][B[5]][V[R]] = d[R]
														else
															a[W[R]] = a[o[R]][a[d[R]]]
														end
													end
												else
													local Pb = U ~= 27
													if Pb then
														local Pb, Tb = X, j
														if Pb then
															for lb in N, Pb, nil do
																if Pb then
																	local ab = Pb[lb]
																	if ab then
																		ab[6] = ab
																		ab[4] = a[lb]
																		ab[5] = 4
																		Pb[lb] = nil
																	end
																end
															end
														end
														if Tb then
															for lb, ab in N, Tb, nil do
																Pb = ab[4]
																if Tb then
																	local ab = Tb[lb]
																	if ab then
																		local Ib, Hb = lb + Pb, c(Pb)
																		Q(a, lb, Ib - 1, 1, Hb)
																		ab[6] = Hb
																		ab[5] = 1
																		Tb[lb] = nil
																	end
																end
															end
														end
														local Pb, Tb, lb = d[R], a[o[R]], a[W[R]]
														return true, true, Pb, D(Tb, lb)
													else
														a[W[R]] = Y[d[R]][a[o[R]]]
													end
												end
											else
												local Pb = U < 23
												if Pb then
													local Pb = U ~= 22
													if Pb then
														a[W[R]] = a[d[R]] < V[R]
													else
														local Pb, Tb, lb =
															W[R],
															db(o[R], (k(db(y, (k(L(y, 29), 7))), 536870911))),
															l[5]
														local ab = db(lb[Pb], 43364404)
														lb[Pb] = ab
														Pb, lb = l[4], ab + 1
														ab = mb(Pb, lb)
														local Ib, Hb
														if ab < 128 then
															Ib, Hb = ab, lb + 1
														else
															local Wb = mb(Pb, lb + 1)
															if Wb < 128 then
																Ib, Hb = (ab - 128) * 128 + Wb, lb + 2
															else
																local wb = mb(Pb, lb + 2)
																if wb < 128 then
																	Ib, Hb =
																		(ab - 128) * 16384 + (Wb - 128) * 128 + wb,
																		lb + 3
																else
																	local jb = mb(Pb, lb + 3)
																	Ib, Hb =
																		(ab - 128) * 128
																			+ (Wb - 128)
																			+ (wb - 128) * 16384
																			+ jb % 128 * 2097152
																			+ (jb - jb % 128) * 2097152,
																		lb + 4
																end
															end
														end
														ab, lb = Tb * 16843009, Hb + Ib
														local Wb = lb - Ib % 4
														for wb = Hb, Wb - 1, 4 do
															Ab(Pb, wb, (db(_b(Pb, wb), ab)))
														end
														for ab = Wb, lb - 1, 1 do
															Vb(Pb, ab, (db(mb(Pb, ab), Tb)))
														end
														Wb, Ib, Pb = R, R, R
														W[R] = 94
														o[Wb] = 86
														d[Ib] = 55
														m[Pb] = 24
													end
												else
													local Pb = U >= 24
													if Pb then
														local Pb = U ~= 25
														if not Pb then
															a[d[R]] = I[V[R]]
														end
													else
														local Pb = a[W[R]] ~= V[R]
														if Pb then
															R = d[R]
														end
													end
												end
											end
										else
											local Pb = U < 36
											if Pb then
												local Pb = U < 33
												if Pb then
													local Pb = U ~= 32
													if Pb then
														a[W[R]] = a[o[R]](a[d[R]])
													else
														a[o[R]][_[R]] = d[R]
													end
												else
													local Pb = U >= 34
													if Pb then
														local Pb = U == 35
														if Pb then
															local Pb = _[R] == E[R]
															if Pb then
																R = o[R]
															end
														else
															B = Y[d[R]]
															B[6][B[5]] = a[W[R]]
														end
													else
														a[d[R]][_[R]] = a[o[R]]
													end
												end
											else
												local Pb = U >= 39
												if Pb then
													local Pb = U >= 40
													if Pb then
														local Pb = U ~= 41
														if Pb then
															a[W[R]] = Y[o[R]][d[R]]
														else
															a[o[R]] = a[d[R]] / _[R]
														end
													else
														a[o[R]](a[W[R]], H(a[d[R]], 1, a[d[R]].n))
													end
												else
													local Pb = U < 37
													if Pb then
														a[o[R]][a[d[R]]] = _[R]
													else
														local Pb = U == 38
														if Pb then
															a[W[R]] = D(a[o[R]](a[d[R]]))
														else
															B, g, i = d[R], W[R], o[R]
															p = B + g
															a[B] = D(a[B](H(a, B + 1, p)))
														end
													end
												end
											end
										end
									else
										local Pb = U >= 10
										if Pb then
											local Pb = U < 15
											if Pb then
												local Pb = U < 12
												if Pb then
													local Pb = U ~= 11
													if Pb then
														a[o[R]] = a[W[R]] + E[R]
													else
														local Pb, Tb, lb = o[R], W[R], d[R]
														local ab, Ib = k(Tb, 4294967295), k(lb, 4294967295)
														local Hb, Wb, wb, jb =
															k(ab, 65535), L(ab, 16), k(Ib, 65535), L(Ib, 16)
														lb = k(Hb * wb + u(k(Hb * jb + Wb * wb, 65535), 16), 4294967295)
														Ib = nil
														repeat
															Tb = lb % 4294967296
															if Tb ~= Tb then
																Ib = 0
																break
															end
															Ib = Tb - Tb % 1
														until true
														a[Pb] = Ib
													end
												else
													local Pb = U >= 13
													if Pb then
														local Pb = U == 14
														if Pb then
															a[d[R]] = a[W[R]] >= o[R]
														else
															a[W[R]] = a[d[R]] > V[R]
														end
													else
														B, g =
															W[R] + 1, db(o[R], (k(db(t, (k(L(t, 29), 7))), 536870911)))
														local Pb = R
														for Tb = 1, d[Pb], 1 do
															g = k(db(g, (u(g, 13))), 536870911)
															g = db(g, (L(g, 13)))
															g = k(db(g, (u(g, 14))), 536870911)
															W[B] = db(W[B], (k(L(g, 0), 127)))
															o[B] = db(o[B], (k(L(g, 7), 127)))
															d[B] = db(d[B], (k(L(g, 14), 127)))
															m[B] = db(m[B], (k(L(g, 21), 127)))
															B = B + 1
														end
														m[R] = 24
													end
												end
											else
												local Pb = U < 18
												if Pb then
													local Pb = U >= 16
													if Pb then
														local Pb = U ~= 17
														if Pb then
															a[d[R]] = a[o[R]] - W[R]
														else
															a[o[R]] = a[W[R]] <= d[R]
														end
													else
														a[o[R]](_[R])
													end
												else
													local Pb = U >= 19
													if Pb then
														local Pb = U == 20
														if Pb then
															a[d[R]][a[W[R]]] = a[o[R]]
														else
															local Pb, Tb = X, j
															if Pb then
																for lb in N, Pb, nil do
																	if Pb then
																		local ab = Pb[lb]
																		if ab then
																			ab[6] = ab
																			ab[4] = a[lb]
																			ab[5] = 4
																			Pb[lb] = nil
																		end
																	end
																end
															end
															if Tb then
																for lb, ab in N, Tb, nil do
																	Pb = ab[4]
																	if Tb then
																		local ab = Tb[lb]
																		if ab then
																			local Ib, Hb = lb + Pb - 1, c(Pb)
																			Q(a, lb, Ib, 1, Hb)
																			ab[6] = Hb
																			ab[5] = 1
																			Tb[lb] = nil
																		end
																	end
																end
															end
															return false, false
														end
													else
														local Pb, Tb = X, j
														if Pb then
															for lb in N, Pb, nil do
																if Pb then
																	local ab = Pb[lb]
																	if ab then
																		ab[6] = ab
																		ab[4] = a[lb]
																		ab[5] = 4
																		Pb[lb] = nil
																	end
																end
															end
														end
														if Tb then
															for lb, ab in N, Tb, nil do
																Pb = ab[4]
																if Tb then
																	local ab = Tb[lb]
																	if ab then
																		local Ib, Hb = lb + Pb, c(Pb)
																		Q(a, lb, Ib - 1, 1, Hb)
																		ab[6] = Hb
																		ab[5] = 1
																		Tb[lb] = nil
																	end
																end
															end
														end
														local Pb, Tb, lb, ab = d[R], V[R], a[W[R]], a[W[R]]
														return true, true, Pb, D(Tb, H(lb, 1, ab.n))
													end
												end
											end
										else
											local Pb = U >= 5
											if Pb then
												local Pb = U >= 7
												if Pb then
													local Pb = U < 8
													if Pb then
														r = { [7] = r, [8] = S, [6] = e, [9] = J }
														B = o[R]
														S = a[B + 2] + 0
														J = a[B + 1] + 0
														e = a[B] - S
														R = W[R]
													else
														local Pb = U ~= 9
														if Pb then
															a[d[R]](a[W[R]], V[R])
														else
															a[W[R]] = a[d[R]] * V[R]
														end
													end
												else
													local Pb = U ~= 6
													if Pb then
														Y[o[R]][_[R]] = a[d[R]]
													else
														a[d[R]], a[o[R]] = a[W[R]]()
													end
												end
											else
												local Pb = U >= 2
												if Pb then
													local Pb = U >= 3
													if Pb then
														local Pb = U ~= 4
														if Pb then
															local Pb = a[W[R]] ~= d[R]
															if Pb then
																R = o[R]
															end
														else
															a[W[R]] = {}
														end
													else
														Y[o[R]][E[R]] = _[R]
													end
												else
													local Pb = U == 1
													if Pb then
														a[W[R]] = a[d[R]] - V[R]
													else
														a[d[R]] = a[W[R]] >= V[R]
													end
												end
											end
										end
									end
								else
									local Pb = U >= 63
									if Pb then
										local Pb = U >= 73
										if Pb then
											local Pb = U >= 78
											if Pb then
												local Pb = U < 81
												if Pb then
													local Pb = U < 79
													if Pb then
														local Pb, Tb = X, j
														if Pb then
															for lb in N, Pb, nil do
																if Pb then
																	local ab = Pb[lb]
																	if ab then
																		ab[6] = ab
																		ab[4] = a[lb]
																		ab[5] = 4
																		Pb[lb] = nil
																	end
																end
															end
														end
														if Tb then
															for lb, ab in N, Tb, nil do
																Pb = ab[4]
																if Tb then
																	local ab = Tb[lb]
																	if ab then
																		local Ib = c(Pb)
																		Q(a, lb, lb + Pb - 1, 1, Ib)
																		ab[6] = Ib
																		ab[5] = 1
																		Tb[lb] = nil
																	end
																end
															end
														end
														local Pb, Tb, lb = a[d[R]], a[W[R]], a[W[R]]
														return false, true, D(Pb, H(Tb, 1, lb.n))
													else
														local Pb = U ~= 80
														if Pb then
															t = a[d[R]]
														else
															a[W[R]] = d[R] - a[o[R]]
														end
													end
												else
													local Pb = U >= 82
													if Pb then
														local Pb = U ~= 83
														if Pb then
															a[o[R]] = d[R] + a[W[R]]
														else
															local Pb = not (o[R] < a[d[R]])
															if Pb then
																R = W[R]
															end
														end
													else
														a[W[R]] = a[d[R]] >= a[o[R]]
													end
												end
											else
												local Pb = U >= 75
												if Pb then
													local Pb = U < 76
													if Pb then
														a[o[R]] = Y[d[R]]
													else
														local Pb = U ~= 77
														if Pb then
															a[d[R]] = I[V[R]]
															a[W[R + 1]] = a[d[R + 1]][V[R + 1]]
															R += 1
														else
															local Pb, Tb, lb = o[R], E[R], _[R]
															local ab, Ib = k(Tb, 4294967295), k(lb, 4294967295)
															local Hb, Wb, wb, jb =
																k(ab, 65535), L(ab, 16), k(Ib, 65535), L(Ib, 16)
															lb = k(
																Hb * wb + u(k(Hb * jb + Wb * wb, 65535), 16),
																4294967295
															)
															ab = nil
															repeat
																Tb = lb % 4294967296
																if Tb ~= Tb then
																	ab = 0
																	break
																end
																ab = Tb - Tb % 1
															until true
															a[Pb] = ab
														end
													end
												else
													local Pb = U ~= 74
													if Pb then
														a[W[R]] = a[d[R]] ~= o[R]
													else
														B, g, i = o[R], W[R], d[R]
														p, v = a[B], B + g
														Z = a[v]
														Q(a, B + 1, v - 1, i + 1, p)
														Q(Z, 1, Z.n, i + g, p)
													end
												end
											end
										else
											local Pb = U < 68
											if Pb then
												local Pb = U < 65
												if Pb then
													local Pb = U == 64
													if Pb then
														local Pb, Tb, lb = o[R], a[d[R]], W[R]
														local ab, Ib = k(Tb, 4294967295), k(lb, 4294967295)
														local Hb, Wb, wb, jb =
															k(ab, 65535), L(ab, 16), k(Ib, 65535), L(Ib, 16)
														lb = k(Hb * wb + u(k(Hb * jb + Wb * wb, 65535), 16), 4294967295)
														Tb = nil
														repeat
															Ib = lb % 4294967296
															if Ib ~= Ib then
																Tb = 0
																break
															end
															Tb = Ib - Ib % 1
														until true
														a[Pb] = Tb
													else
														a[o[R]] = a[d[R]](_[R])
													end
												else
													local Pb = U >= 66
													if Pb then
														local Pb = U == 67
														if Pb then
															R = W[R]
														else
															local Pb, Tb = X, j
															if Pb then
																for lb in N, Pb, nil do
																	if Pb then
																		local ab = Pb[lb]
																		if ab then
																			ab[6] = ab
																			ab[4] = a[lb]
																			ab[5] = 4
																			Pb[lb] = nil
																		end
																	end
																end
															end
															if Tb then
																for lb, ab in N, Tb, nil do
																	Pb = ab[4]
																	if Tb then
																		local ab = Tb[lb]
																		if ab then
																			local Ib = c(Pb)
																			Q(a, lb, lb + Pb - 1, 1, Ib)
																			ab[6] = Ib
																			ab[5] = 1
																			Tb[lb] = nil
																		end
																	end
																end
															end
															Pb = _[R]
															return false, true, D(Pb)
														end
													else
														a[o[R]](a[d[R]])
													end
												end
											else
												local Pb = U < 70
												if Pb then
													local Pb = U == 69
													if Pb then
														a[d[R]] = a[o[R]] == a[W[R]]
													else
														local Pb, Tb, lb = o[R], _[R]
														repeat
															local ab = Tb % 4294967296
															if ab ~= ab then
																lb = 0
																break
															end
															lb = ab - ab % 1
														until true
														a[Pb] = lb
													end
												else
													local Pb = U < 71
													if Pb then
														local Pb = a[d[R]] < V[R]
														if Pb then
															R = W[R]
														end
													else
														local Pb = U == 72
														if Pb then
															local Pb, Tb, lb = d[R], V[R], W[R]
															local ab, Ib = k(Tb, 4294967295), k(lb, 4294967295)
															local Tb, Hb, Wb, wb =
																k(ab, 65535), L(ab, 16), k(Ib, 65535), L(Ib, 16)
															lb = k(
																Tb * Wb + u(k(Tb * wb + Hb * Wb, 65535), 16),
																4294967295
															)
															wb = nil
															repeat
																Wb = lb % 4294967296
																if Wb ~= Wb then
																	wb = 0
																	break
																end
																wb = Wb - Wb % 1
															until true
															a[Pb] = wb
														else
															a[d[R]] = a[o[R]] .. _[R]
														end
													end
												end
											end
										end
									else
										local Pb = U < 52
										if Pb then
											local Pb = U >= 47
											if Pb then
												local Pb = U < 49
												if Pb then
													local Pb = U ~= 48
													if Pb then
														B, g =
															W[R] + 1, db(o[R], (k(db(y, (k(L(y, 29), 7))), 536870911)))
														local Pb = R
														for Tb = 1, d[Pb], 1 do
															g = k(db(g, (u(g, 13))), 536870911)
															g = db(g, (L(g, 13)))
															g = k(db(g, (u(g, 14))), 536870911)
															W[B] = db(W[B], (k(L(g, 0), 127)))
															o[B] = db(o[B], (k(L(g, 7), 127)))
															d[B] = db(d[B], (k(L(g, 14), 127)))
															m[B] = db(m[B], (k(L(g, 21), 127)))
															B = B + 1
														end
														m[R] = 24
													else
														a[W[R]] = y
													end
												else
													local Pb = U >= 50
													if Pb then
														local Pb = U == 51
														if Pb then
															a[o[R]] = a[d[R]] > a[W[R]]
														else
															a[o[R]] = t
														end
													else
														B = Y[W[R]]
														a[d[R]] = B[6][B[5]]
													end
												end
											else
												local Pb = U < 44
												if Pb then
													local Pb = U == 43
													if Pb then
														a[d[R]] = V[R] - a[W[R]]
													else
														B = Y[W[R]]
														a[d[R]] = B[6][B[5]][a[o[R]]]
													end
												else
													local Pb = U < 45
													if Pb then
														a[d[R]] = a[W[R]] // a[o[R]]
													else
														local Pb = U == 46
														if Pb then
															a[o[R]] = a[W[R]] // d[R]
														else
															a[W[R]] = o[R] * a[d[R]]
														end
													end
												end
											end
										else
											local Pb = U < 57
											if Pb then
												local Pb = U < 54
												if Pb then
													local Pb = U == 53
													if Pb then
														q = d[R]
														R = o[R] + 1
														break
													else
														a[W[R]]()
													end
												else
													local Pb = U < 55
													if Pb then
														local Pb = d[R] <= a[o[R]]
														if Pb then
															R = W[R]
														end
													else
														local Pb = U == 56
														if Pb then
															a[o[R]] = E[R]
														else
															a[o[R]] = a[W[R]] == d[R]
														end
													end
												end
											else
												local Pb = U >= 60
												if Pb then
													local Pb = U >= 61
													if Pb then
														local Pb = U == 62
														if Pb then
															B = Y[o[R]]
															B[6][B[5]][E[R]] = a[W[R]]
														else
															a[o[R]] = E[R] .. a[W[R]]
														end
													else
														a[d[R]] = a[W[R]] > o[R]
													end
												else
													local Pb = U >= 58
													if Pb then
														local Pb = U == 59
														if Pb then
															local U
															local Pb, Tb, lb, ab, Ib = E[R], X, j
															if Pb then
																local Hb = #Pb / 3
																if Hb > 0 then
																	U, ab, Ib = {}, Tb, lb
																	for Wb = 1, Hb, 1 do
																		local Hb = (Wb - 1) * 3
																		local wb, jb = Pb[Hb + 3], Pb[Hb + 2]
																		if wb == 1 then
																			ab = if not ab then {} else ab
																			local nb = ab[jb]
																			if not nb then
																				nb = { [5] = jb, [6] = a }
																				ab[jb] = nb
																			else
																			end
																			U[Wb] = nb
																		else
																			if wb == 0 then
																				U[Wb] = a[jb]
																			else
																				if wb == 2 then
																					U[Wb] = Y[jb]
																				else
																					if wb == 3 then
																						Ib = if not Ib then {} else Ib
																						local wb = Ib[jb]
																						if not wb then
																							wb = {
																								[6] = a,
																								[5] = jb,
																								[4] = Pb[Hb + 1],
																							}
																							Ib[jb] = wb
																						else
																						end
																						U[Wb] = wb
																					else
																					end
																				end
																			end
																		end
																	end
																else
																	ab, Ib = Tb, lb
																end
															else
																ab, Ib = Tb, lb
															end
															X, j = ab, Ib
															g = V[R](U)
															Eb(g, I)
															a[W[R]] = g
															B = U
														else
															a[W[R]] = a[o[R]] ~= a[d[R]]
														end
													else
														local U = a[d[R]] == a[W[R]]
														if U then
															R = o[R]
														end
													end
												end
											end
										end
									end
								end
							end
							R += 1
						end
					else
					end
					b = q == 220
					if b then
						while true do
							local U = d[R]
							local Pb = U >= 90
							if Pb then
								local Pb, Tb, lb = U < 135, v, Z
								if Pb then
									local Pb = U < 112
									if Pb then
										local Pb = U >= 101
										if Pb then
											local Pb = U >= 106
											if Pb then
												local Pb = U < 109
												if Pb then
													local Pb = U < 107
													if Pb then
														local Pb = _[R] < a[o[R]]
														if Pb then
															R = m[R]
														end
													else
														local Pb = U ~= 108
														if Pb then
															a[m[R]] = o[R] + a[W[R]]
														else
															a[W[R]] = a[o[R]] ~= A[R]
														end
													end
												else
													local Pb = U >= 110
													if Pb then
														local Pb = U == 111
														if Pb then
															a[o[R]] = D(a[m[R]](a[W[R]]))
														else
															a[o[R]][a[W[R]]] = a[m[R]]
														end
													else
														a[o[R]] = a[m[R]] ^ W[R]
													end
												end
											else
												local Pb = U >= 103
												if Pb then
													local Pb = U >= 104
													if Pb then
														local Pb = U == 105
														if Pb then
															local Pb = not (a[o[R]] <= W[R])
															if Pb then
																R = m[R]
															end
														else
															a[o[R]] = a[m[R]] >= W[R]
														end
													else
														a[W[R]](a[m[R]], a[o[R]])
													end
												else
													local Pb = U == 102
													if Pb then
														local Pb, ab, Ib = W[R], m[R], V[R]
														local Hb, Wb = k(ab, 4294967295), k(Ib, 4294967295)
														local ab, Ib, wb, jb =
															k(Hb, 65535), L(Hb, 16), k(Wb, 65535), L(Wb, 16)
														Hb = k(ab * wb + u(k(ab * jb + Ib * wb, 65535), 16), 4294967295)
														Ib = nil
														repeat
															jb = Hb % 4294967296
															if jb ~= jb then
																Ib = 0
																break
															end
															Ib = jb - jb % 1
														until true
														a[Pb] = Ib
													else
														local Pb, ab = X, j
														if Pb then
															for Ib in N, Pb, nil do
																if Pb then
																	local Hb = Pb[Ib]
																	if Hb then
																		Hb[6] = Hb
																		Hb[4] = a[Ib]
																		Hb[5] = 4
																		Pb[Ib] = nil
																	end
																end
															end
														end
														if ab then
															for Ib, Hb in N, ab, nil do
																Pb = Hb[4]
																if ab then
																	local Hb = ab[Ib]
																	if Hb then
																		local Wb, wb = Ib + Pb, c(Pb)
																		Q(a, Ib, Wb - 1, 1, wb)
																		Hb[6] = wb
																		Hb[5] = 1
																		ab[Ib] = nil
																	end
																end
															end
														end
														Pb = A[R]
														return false, true, D(Pb)
													end
												end
											end
										else
											local Pb = U >= 95
											if Pb then
												local Pb = U >= 98
												if Pb then
													local Pb = U < 99
													if Pb then
														B = Y[m[R]]
														a[o[R]] = B[6][B[5]]
													else
														local Pb = U ~= 100
														if Pb then
															a[o[R]] = a[m[R]]()
														else
															a[W[R]] = V[R] == A[R]
														end
													end
												else
													local Pb = U < 96
													if Pb then
														local Pb = a[o[R]] ~= a[W[R]]
														if Pb then
															R = m[R]
														end
													else
														local Pb = U ~= 97
														if Pb then
															B = Y[m[R]]
															a[W[R]] = B[6][B[5]][V[R]]
														else
															a[o[R]] = a[m[R]] // a[W[R]]
														end
													end
												end
											else
												local Pb = U < 92
												if Pb then
													local Pb = U ~= 91
													if Pb then
														local Pb, ab, Ib = o[R], _[R]
														repeat
															local Hb = ab % 4294967296
															if Hb ~= Hb then
																Ib = 0
																break
															end
															Ib = Hb - Hb % 1
														until true
														a[Pb] = Ib
													else
														a[o[R]](A[R], _[R])
													end
												else
													local Pb = U < 93
													if Pb then
														B = Y[o[R]]
														B[6][B[5]] = a[m[R]]
													else
														local Pb = U ~= 94
														if Pb then
															B, g, i = o[R], W[R], m[R]
															p = B + g
															a[B] = D(a[B](H(a, B + 1, p)))
														else
														end
													end
												end
											end
										end
									else
										local Pb = U >= 123
										if Pb then
											local Pb = U < 129
											if Pb then
												local Pb = U < 126
												if Pb then
													local Pb = U < 124
													if Pb then
														a[W[R]] = a[o[R]] < A[R]
													else
														local Pb = U == 125
														if Pb then
															a[W[R]] = a[o[R]] > A[R]
														else
															a[m[R]] = a[o[R]] >= a[W[R]]
														end
													end
												else
													local Pb = U >= 127
													if Pb then
														local Pb = U == 128
														if Pb then
															B, g =
																W[R] + 1,
																db(o[R], (k(db(y, (k(L(y, 29), 7))), 536870911)))
															local Pb = R
															for ab = 1, m[Pb], 1 do
																g = k(db(g, (u(g, 13))), 536870911)
																g = db(g, (L(g, 13)))
																g = k(db(g, (u(g, 14))), 536870911)
																W[B] = db(W[B], (k(L(g, 0), 127)))
																o[B] = db(o[B], (k(L(g, 7), 127)))
																m[B] = db(m[B], (k(L(g, 14), 127)))
																d[B] = db(d[B], (k(L(g, 21), 127)))
																B = B + 1
															end
															d[R] = 94
														else
															B, g, i = m[R], W[R], o[R]
															p = a[B]
															Q(a, B + 1, B + g, i + 1, p)
														end
													else
														a[m[R]] = a[W[R]]
													end
												end
											else
												local Pb = U >= 132
												if Pb then
													local Pb = U < 133
													if Pb then
														a[m[R]] = a[W[R]] + o[R]
													else
														local Pb = U ~= 134
														if Pb then
															local Pb = a[W[R]] <= o[R]
															if Pb then
																R = m[R]
															end
														else
															a[W[R]] = a[m[R]] .. a[o[R]]
														end
													end
												else
													local Pb = U < 130
													if Pb then
														B = m[R]
														g, i, p = a[B], a[B + 1], a[B + 2]
														a[B] = g(i, p)
													else
														local Pb = U ~= 131
														if Pb then
															local Pb = not (V[R] <= a[m[R]])
															if Pb then
																R = W[R]
															end
														else
															a[W[R]][a[o[R]]] = A[R]
														end
													end
												end
											end
										else
											local Pb = U >= 117
											if Pb then
												local Pb = U >= 120
												if Pb then
													local Pb = U >= 121
													if Pb then
														local Pb = U ~= 122
														if Pb then
															a[W[R]](a[m[R]], H(a[o[R]], 1, a[o[R]].n))
														else
															a[o[R]] = a[W[R]] % m[R]
														end
													else
														a[W[R]] = n
													end
												else
													local Pb = U >= 118
													if Pb then
														local Pb = U ~= 119
														if Pb then
															local Pb, ab, Ib =
																W[R],
																db(o[R], (k(db(y, (k(L(y, 29), 7))), 536870911))),
																l[5]
															local Hb = db(Ib[Pb], 43364404)
															Ib[Pb] = Hb
															Pb, Ib = l[4], Hb + 1
															Hb = mb(Pb, Ib)
															local Wb, wb
															if Hb < 128 then
																Wb, wb = Hb, Ib + 1
															else
																local jb = mb(Pb, Ib + 1)
																if jb < 128 then
																	Wb, wb = (Hb - 128) * 128 + jb, Ib + 2
																else
																	local nb = mb(Pb, Ib + 2)
																	if nb < 128 then
																		Wb, wb =
																			(Hb - 128) * 16384 + (jb - 128) * 128 + nb,
																			Ib + 3
																	else
																		local yb = mb(Pb, Ib + 3)
																		Wb, wb =
																			(Hb - 128) * 128
																				+ (jb - 128)
																				+ (nb - 128) * 16384
																				+ yb % 128 * 2097152
																				+ (yb - yb % 128) * 2097152,
																			Ib + 4
																	end
																end
															end
															Hb, Ib = ab * 16843009, wb + Wb
															local jb = Ib - Wb % 4
															for Wb = wb, jb - 1, 4 do
																Ab(Pb, Wb, (db(_b(Pb, Wb), Hb)))
															end
															for Hb = jb, Ib - 1, 1 do
																Vb(Pb, Hb, (db(mb(Pb, Hb), ab)))
															end
															Pb, jb, ab = R, R, R
															W[R] = 179
															o[Pb] = 230
															m[jb] = 107
															d[ab] = 94
														else
															a[m[R]] = a[o[R]](a[W[R]])
														end
													else
														a[m[R]] = not a[W[R]]
													end
												end
											else
												local Pb = U < 114
												if Pb then
													local Pb = U == 113
													if Pb then
														a[W[R]][o[R]] = a[m[R]]
													else
														a[o[R]] = _[R] + a[m[R]]
													end
												else
													local Pb = U < 115
													if Pb then
														a[m[R]] = a[W[R]] < a[o[R]]
													else
														local Pb = U ~= 116
														if Pb then
															local Pb, ab, Ib = m[R], _[R], V[R]
															local Hb, Wb = k(ab, 4294967295), k(Ib, 4294967295)
															local Ib, wb, jb, nb =
																k(Hb, 65535), L(Hb, 16), k(Wb, 65535), L(Wb, 16)
															Wb = k(
																Ib * jb + u(k(Ib * nb + wb * jb, 65535), 16),
																4294967295
															)
															ab = nil
															repeat
																nb = Wb % 4294967296
																if nb ~= nb then
																	ab = 0
																	break
																end
																ab = nb - nb % 1
															until true
															a[Pb] = ab
														else
															B, g = o[R], m[R]
															i = B + g
															p = a[i]
															v = p.n
															local Pb, ab = X, j
															if Pb then
																for Ib in N, Pb, nil do
																	if Pb then
																		local Hb = Pb[Ib]
																		if Hb then
																			Hb[6] = Hb
																			Hb[4] = a[Ib]
																			Hb[5] = 4
																			Pb[Ib] = nil
																		end
																	end
																end
															end
															if ab then
																for Ib, Hb in N, ab, nil do
																	Pb = Hb[4]
																	if ab then
																		local Hb = ab[Ib]
																		if Hb then
																			local Wb = c(Pb)
																			Q(a, Ib, Ib + Pb - 1, 1, Wb)
																			Hb[6] = Wb
																			Hb[5] = 1
																			ab[Ib] = nil
																		end
																	end
																end
															end
															p.n = g + v - 1
															Q(p, 1, v, g, p)
															Q(a, B + 1, i - 1, 1, p)
															return true, true, B, p
														end
													end
												end
											end
										end
									end
								else
									local Pb = U >= 157
									if Pb then
										local Pb = U < 168
										if Pb then
											local Pb = U < 162
											if Pb then
												local Pb = U >= 159
												if Pb then
													local Pb = U >= 160
													if Pb then
														local Pb = U ~= 161
														if Pb then
															a[o[R]] = a[m[R]][_[R]]
														else
															a[W[R]] = Y[o[R]][A[R]]
														end
													else
														a[m[R]] = a[W[R]] ~= a[o[R]]
													end
												else
													local Pb = U == 158
													if Pb then
														B = Y[W[R]]
														B[6][B[5]][V[R]] = m[R]
													else
														local Pb, ab = X, j
														if Pb then
															for Ib in N, Pb, nil do
																if Pb then
																	local Hb = Pb[Ib]
																	if Hb then
																		Hb[6] = Hb
																		Hb[4] = a[Ib]
																		Hb[5] = 4
																		Pb[Ib] = nil
																	end
																end
															end
														end
														if ab then
															for Ib, Hb in N, ab, nil do
																Pb = Hb[4]
																if ab then
																	local Hb = ab[Ib]
																	if Hb then
																		local Wb = c(Pb)
																		Q(a, Ib, Ib + Pb - 1, 1, Wb)
																		Hb[6] = Wb
																		Hb[5] = 1
																		ab[Ib] = nil
																	end
																end
															end
														end
														Pb = a[o[R]]
														return false, true, D(Pb)
													end
												end
											else
												local Pb = U >= 165
												if Pb then
													local Pb = U < 166
													if Pb then
														local Pb = not (a[W[R]] <= a[m[R]])
														if Pb then
															R = o[R]
														end
													else
														local Pb = U == 167
														if Pb then
															local Pb = o[R] < a[W[R]]
															if Pb then
																R = m[R]
															end
														else
															a[o[R]] = a[m[R]] >= _[R]
														end
													end
												else
													local Pb = U < 163
													if Pb then
														local Pb, ab = X, j
														if Pb then
															for Ib in N, Pb, nil do
																if Pb then
																	local Hb = Pb[Ib]
																	if Hb then
																		Hb[6] = Hb
																		Hb[4] = a[Ib]
																		Hb[5] = 4
																		Pb[Ib] = nil
																	end
																end
															end
														end
														if ab then
															for Ib, Hb in N, ab, nil do
																Pb = Hb[4]
																if ab then
																	local Hb = ab[Ib]
																	if Hb then
																		local Wb, wb = Ib + Pb - 1, c(Pb)
																		Q(a, Ib, Wb, 1, wb)
																		Hb[6] = wb
																		Hb[5] = 1
																		ab[Ib] = nil
																	end
																end
															end
														end
														B = W[R]
														ab = B + m[R]
														return false, false, B, ab - 1
													else
														local Pb = U == 164
														if Pb then
															local Pb = not (W[R] <= a[o[R]])
															if Pb then
																R = m[R]
															end
														else
															B = Y[o[R]]
															a[W[R]] = B[6][B[5]][a[m[R]]]
														end
													end
												end
											end
										else
											local Pb = U >= 174
											if Pb then
												local Pb = U < 177
												if Pb then
													local Pb = U >= 175
													if Pb then
														local Pb = U ~= 176
														if Pb then
															a[o[R]] = _[R] * A[R]
														else
															local Pb, ab, Ib = W[R], o[R], m[R]
															local Hb, Wb = k(ab, 4294967295), k(Ib, 4294967295)
															local ab, wb, jb, nb =
																k(Hb, 65535), L(Hb, 16), k(Wb, 65535), L(Wb, 16)
															Ib = k(
																ab * jb + u(k(ab * nb + wb * jb, 65535), 16),
																4294967295
															)
															ab = nil
															repeat
																jb = Ib % 4294967296
																if jb ~= jb then
																	ab = 0
																	break
																end
																ab = jb - jb % 1
															until true
															a[Pb] = ab
														end
													else
														Y[m[R]][V[R]] = W[R]
													end
												else
													local Pb = U >= 178
													if Pb then
														local Pb = U ~= 179
														if Pb then
															local Pb, ab = X, j
															if Pb then
																for Ib in N, Pb, nil do
																	if Pb then
																		local Hb = Pb[Ib]
																		if Hb then
																			Hb[6] = Hb
																			Hb[4] = a[Ib]
																			Hb[5] = 4
																			Pb[Ib] = nil
																		end
																	end
																end
															end
															if ab then
																for Ib, Hb in N, ab, nil do
																	Pb = Hb[4]
																	if ab then
																		local Hb = ab[Ib]
																		if Hb then
																			local Wb, wb = Ib + Pb, c(Pb)
																			Q(a, Ib, Wb - 1, 1, wb)
																			Hb[6] = wb
																			Hb[5] = 1
																			ab[Ib] = nil
																		end
																	end
																end
															end
															ab, Pb = m[R], W[R]
															return true, true, ab, a[Pb]
														else
															R = if a[o[R]] then m[R] else W[R]
														end
													else
														local Pb, ab = X, j
														if Pb then
															for Ib in N, Pb, nil do
																if Pb then
																	local Hb = Pb[Ib]
																	if Hb then
																		Hb[6] = Hb
																		Hb[4] = a[Ib]
																		Hb[5] = 4
																		Pb[Ib] = nil
																	end
																end
															end
														end
														if ab then
															for Ib, Hb in N, ab, nil do
																Pb = Hb[4]
																if ab then
																	local Hb = ab[Ib]
																	if Hb then
																		local Wb, wb = Ib + Pb, c(Pb)
																		Q(a, Ib, Wb - 1, 1, wb)
																		Hb[6] = wb
																		Hb[5] = 1
																		ab[Ib] = nil
																	end
																end
															end
														end
														local Pb, ab, Ib = W[R], a[o[R]], A[R]
														return true, true, Pb, D(ab, Ib)
													end
												end
											else
												local Pb = U < 171
												if Pb then
													local Pb = U < 169
													if Pb then
														B = o[R]
														local Pb, ab, Ib = e()
														if Pb then
															a[B + 1] = ab
															a[B + 2] = Ib
															R = W[R]
														end
														g, i, p = Pb, ab, Ib
													else
														local Pb = U == 170
														if Pb then
															local Pb = a[o[R]] ~= m[R]
															if Pb then
																R = W[R]
															end
														else
															a[W[R]] = y
														end
													end
												else
													local Pb = U >= 172
													if Pb then
														local Pb = U == 173
														if Pb then
															local Pb = _[R] == A[R]
															if Pb then
																R = o[R]
															end
														else
															a[m[R]][V[R]] = W[R]
														end
													else
														local Pb, ab = X, j
														if Pb then
															for Ib in N, Pb, nil do
																if Pb then
																	local Hb = Pb[Ib]
																	if Hb then
																		Hb[6] = Hb
																		Hb[4] = a[Ib]
																		Hb[5] = 4
																		Pb[Ib] = nil
																	end
																end
															end
														end
														if ab then
															for Ib, Hb in N, ab, nil do
																Pb = Hb[4]
																if ab then
																	local Hb = ab[Ib]
																	if Hb then
																		local Wb, wb = Ib + Pb, c(Pb)
																		Q(a, Ib, Wb - 1, 1, wb)
																		Hb[6] = wb
																		Hb[5] = 1
																		ab[Ib] = nil
																	end
																end
															end
														end
														local Pb, ab, Ib = A[R], a[W[R]], a[o[R]]
														return false, true, D(Pb, ab, Ib)
													end
												end
											end
										end
									else
										local Pb = U >= 146
										if Pb then
											local Pb = U >= 151
											if Pb then
												local Pb = U >= 154
												if Pb then
													local Pb = U >= 155
													if Pb then
														local Pb = U == 156
														if Pb then
															local Pb = a[o[R]] ~= A[R]
															if Pb then
																R = W[R]
															end
														else
															R = W[R]
														end
													else
														a[o[R]] = m[R] * a[W[R]]
													end
												else
													local Pb = U >= 152
													if Pb then
														local Pb = U ~= 153
														if Pb then
															Y[W[R]][a[m[R]]] = a[o[R]]
														else
															n = a[m[R]]
														end
													else
														r = { [7] = r, [8] = S, [6] = e, [9] = J }
														B = W[R]
														S = a[B + 2] + 0
														J = a[B + 1] + 0
														e = a[B] - S
														R = o[R]
													end
												end
											else
												local Pb = U >= 148
												if Pb then
													local Pb = U < 149
													if Pb then
														a[m[R]] = a[o[R]] % a[W[R]]
													else
														local Pb = U == 150
														if Pb then
															B = Y[W[R]]
															B[6][B[5]][V[R]] = A[R]
														else
															q = W[R]
															R, v, Z = m[R] + 1, Tb, lb
															break
														end
													end
												else
													local Pb = U == 147
													if Pb then
														a[W[R]] = a[m[R]] - a[o[R]]
													else
														local Pb, Tb = X, j
														if Pb then
															for lb in N, Pb, nil do
																if Pb then
																	local ab = Pb[lb]
																	if ab then
																		ab[6] = ab
																		ab[4] = a[lb]
																		ab[5] = 4
																		Pb[lb] = nil
																	end
																end
															end
														end
														if Tb then
															for lb, ab in N, Tb, nil do
																Pb = ab[4]
																if Tb then
																	local ab = Tb[lb]
																	if ab then
																		local Ib = c(Pb)
																		Q(a, lb, lb + Pb - 1, 1, Ib)
																		ab[6] = Ib
																		ab[5] = 1
																		Tb[lb] = nil
																	end
																end
															end
														end
														Tb = W[R]
														return true, true, Tb, D()
													end
												end
											end
										else
											local Pb = U < 140
											if Pb then
												local Pb = U >= 137
												if Pb then
													local Pb = U < 138
													if Pb then
														a[W[R]][V[R]] = A[R]
													else
														local Pb = U ~= 139
														if Pb then
															local Pb = a[m[R]] == W[R]
															if Pb then
																R = o[R]
															end
														else
															local Pb, Tb, lb, ab, Ib, Hb = A[R], X, j
															if Pb then
																local Wb = #Pb / 3
																if Wb > 0 then
																	ab, Ib, Hb = {}, Tb, lb
																	for wb = 1, Wb, 1 do
																		local Wb = (wb - 1) * 3
																		local jb, nb = Pb[Wb + 3], Pb[Wb + 2]
																		if jb == 1 then
																			Ib = if not Ib then {} else Ib
																			local yb = Ib[nb]
																			if not yb then
																				yb = { [5] = nb, [6] = a }
																				Ib[nb] = yb
																			else
																			end
																			ab[wb] = yb
																		else
																			if jb == 0 then
																				ab[wb] = a[nb]
																			else
																				if jb == 2 then
																					ab[wb] = Y[nb]
																				else
																					if jb == 3 then
																						Hb = if not Hb then {} else Hb
																						local jb = Hb[nb]
																						if not jb then
																							jb = {
																								[6] = a,
																								[5] = nb,
																								[4] = Pb[Wb + 1],
																							}
																							Hb[nb] = jb
																						else
																						end
																						ab[wb] = jb
																					else
																					end
																				end
																			end
																		end
																	end
																else
																	Ib, Hb = Tb, lb
																end
															else
																Ib, Hb = Tb, lb
															end
															X, j = Ib, Hb
															g = V[R](ab)
															Eb(g, I)
															a[W[R]] = g
															B = ab
														end
													end
												else
													local Pb = U == 136
													if Pb then
														a[m[R]] = a[o[R]] == _[R]
													else
														B, g = o[R], a[W[R]]
														a[B + 1] = g
														a[B] = g[A[R]]
													end
												end
											else
												local Pb = U < 143
												if Pb then
													local Pb = U >= 141
													if Pb then
														local Pb = U ~= 142
														if Pb then
															a[m[R]] = I[V[R]]
														else
															R = a[o[R]]
														end
													else
														a[o[R]] = A[R] - a[W[R]]
													end
												else
													local Pb = U < 144
													if Pb then
														a[W[R]] = m[R] / a[o[R]]
													else
														local Pb = U ~= 145
														if Pb then
															a[m[R]] = a[W[R]] * V[R]
														else
															a[W[R]](a[o[R]])
														end
													end
												end
											end
										end
									end
								end
							else
								local Pb = U >= 45
								if Pb then
									local Pb = U >= 67
									if Pb then
										local Pb = U >= 78
										if Pb then
											local Pb = U < 84
											if Pb then
												local Pb = U >= 81
												if Pb then
													local Pb = U < 82
													if Pb then
														a[m[R]] = a[W[R]] / o[R]
													else
														local Pb = U == 83
														if Pb then
															a[W[R]] = a[o[R]] / a[m[R]]
														else
															a[o[R]](H(a[W[R]], 1, a[W[R]].n))
														end
													end
												else
													local Pb = U >= 79
													if Pb then
														local Pb = U == 80
														if Pb then
															local Pb, Tb, lb = o[R], W[R], l[5]
															local ab = db(lb[Pb], 43364404)
															lb[Pb] = ab
															lb, Pb = l[4], ab + 1
															ab = mb(lb, Pb)
															local Ib, Hb
															if ab < 128 then
																Ib, Hb = ab, Pb + 1
															else
																local Wb = mb(lb, Pb + 1)
																if Wb < 128 then
																	Ib, Hb = (ab - 128) * 128 + Wb, Pb + 2
																else
																	local wb = mb(lb, Pb + 2)
																	if wb < 128 then
																		Ib, Hb =
																			(ab - 128) * 16384 + (Wb - 128) * 128 + wb,
																			Pb + 3
																	else
																		local jb = mb(lb, Pb + 3)
																		Ib, Hb =
																			(ab - 128) * 128
																				+ (Wb - 128)
																				+ (wb - 128) * 16384
																				+ jb % 128 * 2097152
																				+ (jb - jb % 128) * 2097152,
																			Pb + 4
																	end
																end
															end
															ab, Pb = Tb * 16843009, Hb + Ib
															local Wb = Pb - Ib % 4
															for wb = Hb, Wb - 1, 4 do
																Ab(lb, wb, (db(_b(lb, wb), ab)))
															end
															for ab = Wb, Pb - 1, 1 do
																Vb(lb, ab, (db(mb(lb, ab), Tb)))
															end
															Ib, Wb, lb = R, R, R
															o[R] = 61
															W[Ib] = 99
															m[Wb] = 54
															d[lb] = 94
														else
															Y[m[R]][V[R]] = a[W[R]]
														end
													else
														local Pb = a[m[R]] == a[W[R]]
														if Pb then
															R = o[R]
														end
													end
												end
											else
												local Pb = U < 87
												if Pb then
													local Pb = U < 85
													if Pb then
														local Pb, Tb = X, j
														if Pb then
															for lb in N, Pb, nil do
																if Pb then
																	local ab = Pb[lb]
																	if ab then
																		ab[6] = ab
																		ab[4] = a[lb]
																		ab[5] = 4
																		Pb[lb] = nil
																	end
																end
															end
														end
														if Tb then
															for lb, ab in N, Tb, nil do
																Pb = ab[4]
																if Tb then
																	local ab = Tb[lb]
																	if ab then
																		local Ib = c(Pb)
																		Q(a, lb, lb + Pb - 1, 1, Ib)
																		ab[6] = Ib
																		ab[5] = 1
																		Tb[lb] = nil
																	end
																end
															end
														end
														return false, false
													else
														local Pb = U ~= 86
														if Pb then
															t = a[m[R]]
														else
															a[o[R]] = a[m[R]] < W[R]
														end
													end
												else
													local Pb = U >= 88
													if Pb then
														local Pb = U == 89
														if Pb then
															a[o[R]] = a[W[R]] + a[m[R]]
														else
															e = r[6]
															J = r[9]
															S = r[8]
															r = r[7]
														end
													else
														local Pb, Tb, lb = o[R], _[R], m[R]
														local ab, Ib = k(Tb, 4294967295), k(lb, 4294967295)
														local Hb, Wb, wb, jb =
															k(ab, 65535), L(ab, 16), k(Ib, 65535), L(Ib, 16)
														Tb = k(Hb * wb + u(k(Hb * jb + Wb * wb, 65535), 16), 4294967295)
														jb = nil
														repeat
															lb = Tb % 4294967296
															if lb ~= lb then
																jb = 0
																break
															end
															jb = lb - lb % 1
														until true
														a[Pb] = jb
													end
												end
											end
										else
											local Pb = U >= 72
											if Pb then
												local Pb = U < 75
												if Pb then
													local Pb = U < 73
													if Pb then
														a[m[R]] = a[o[R]] == a[W[R]]
													else
														local Pb = U == 74
														if Pb then
															a[o[R]] = Y[m[R]][a[W[R]]]
														else
															a[m[R]] = a[o[R]] * W[R]
														end
													end
												else
													local Pb = U >= 76
													if Pb then
														local Pb = U == 77
														if Pb then
															local Pb = a[m[R]] == _[R]
															if Pb then
																R = o[R]
															end
														else
															a[m[R]] = a[o[R]] + _[R]
														end
													else
														a[m[R]] = Y[W[R]]
													end
												end
											else
												local Pb = U < 69
												if Pb then
													local Pb = U ~= 68
													if Pb then
														B = Y[o[R]]
														B[6][B[5]][A[R]] = a[W[R]]
													else
														a[m[R]] = a[o[R]] <= a[W[R]]
													end
												else
													local Pb = U >= 70
													if Pb then
														local Pb = U == 71
														if Pb then
															a[m[R]] = a[o[R]] / _[R]
														else
															local Pb = not (a[m[R]] < W[R])
															if Pb then
																R = o[R]
															end
														end
													else
														local Pb, Tb, lb =
															W[R],
															db(o[R], (k(db(t, (k(L(t, 29), 7))), 536870911))),
															l[5]
														local ab = db(lb[Pb], 43364404)
														lb[Pb] = ab
														lb, Pb = l[4], ab + 1
														ab = mb(lb, Pb)
														local Ib, Hb
														if ab < 128 then
															Ib, Hb = ab, Pb + 1
														else
															local Wb = mb(lb, Pb + 1)
															if Wb < 128 then
																Ib, Hb = (ab - 128) * 128 + Wb, Pb + 2
															else
																local wb = mb(lb, Pb + 2)
																if wb < 128 then
																	Ib, Hb =
																		(ab - 128) * 16384 + (Wb - 128) * 128 + wb,
																		Pb + 3
																else
																	local jb = mb(lb, Pb + 3)
																	Ib, Hb =
																		(ab - 128) * 128
																			+ (Wb - 128)
																			+ (wb - 128) * 16384
																			+ jb % 128 * 2097152
																			+ (jb - jb % 128) * 2097152,
																		Pb + 4
																end
															end
														end
														ab, Pb = Tb * 16843009, Hb + Ib
														local Wb = Pb - Ib % 4
														for Ib = Hb, Wb - 1, 4 do
															Ab(lb, Ib, (db(_b(lb, Ib), ab)))
														end
														for Ib = Wb, Pb - 1, 1 do
															Vb(lb, Ib, (db(mb(lb, Ib), Tb)))
														end
														Pb, ab, Hb = R, R, R
														W[R] = 55
														o[Pb] = 179
														m[ab] = 36
														d[Hb] = 94
													end
												end
											end
										end
									else
										local Pb = U >= 56
										if Pb then
											local Pb = U < 61
											if Pb then
												local Pb = U >= 58
												if Pb then
													local Pb = U >= 59
													if Pb then
														local Pb = U == 60
														if Pb then
															a[o[R]] = D(a[m[R]](_[R]))
														else
															a[W[R]] = a[o[R]][m[R]]
														end
													else
														a[m[R]] = o[R] - a[W[R]]
													end
												else
													local Pb = U ~= 57
													if Pb then
														a[m[R]] = V[R]
													else
														Y[W[R]][a[o[R]]] = A[R]
													end
												end
											else
												local Pb = U >= 64
												if Pb then
													local Pb = U >= 65
													if Pb then
														local Pb = U ~= 66
														if Pb then
															a[o[R]] = a[W[R]] > a[m[R]]
														else
															a[o[R]] = a[W[R]] .. A[R]
														end
													else
														a[o[R]] = a[W[R]][a[m[R]]]
													end
												else
													local Pb = U < 62
													if Pb then
														a[W[R]] = a[m[R]](H(a[o[R]], 1, a[o[R]].n))
													else
														local Pb = U == 63
														if Pb then
															local Pb, Tb, lb = m[R], _[R], a[o[R]]
															local ab, Ib = k(Tb, 4294967295), k(lb, 4294967295)
															local lb, Hb, Wb, wb =
																k(ab, 65535), L(ab, 16), k(Ib, 65535), L(Ib, 16)
															ab = k(
																lb * Wb + u(k(lb * wb + Hb * Wb, 65535), 16),
																4294967295
															)
															Tb = nil
															repeat
																wb = ab % 4294967296
																if wb ~= wb then
																	Tb = 0
																	break
																end
																Tb = wb - wb % 1
															until true
															a[Pb] = Tb
														else
															a[m[R]] = I[V[R]]
															a[o[R + 1]] = a[m[R + 1]][_[R + 1]]
															R += 1
														end
													end
												end
											end
										else
											local Pb = U >= 50
											if Pb then
												local Pb = U < 53
												if Pb then
													local Pb = U < 51
													if Pb then
														local Pb, Tb, lb = W[R], o[R], a[m[R]]
														local ab, Ib = k(Tb, 4294967295), k(lb, 4294967295)
														local lb, Hb, Wb, wb =
															k(ab, 65535), L(ab, 16), k(Ib, 65535), L(Ib, 16)
														Tb = k(lb * Wb + u(k(lb * wb + Hb * Wb, 65535), 16), 4294967295)
														Ib = nil
														repeat
															ab = Tb % 4294967296
															if ab ~= ab then
																Ib = 0
																break
															end
															Ib = ab - ab % 1
														until true
														a[Pb] = Ib
													else
														local Pb = U ~= 52
														if Pb then
															B = a[W[R]]
															a[o[R]] = D(H(B, m[R], B.n))
														else
															a[W[R]] = V[R] * a[m[R]]
														end
													end
												else
													local Pb = U >= 54
													if Pb then
														local Pb = U ~= 55
														if Pb then
															a[m[R]] = a[o[R]] * a[W[R]]
														else
															e += S
															B = if S <= 0 then e >= J else e <= J
															if B then
																a[m[R]] = e
																R = W[R]
															end
														end
													else
														B, g, i, p =
															W[R],
															o[R],
															m[R],
															db(t, k(L(t, 14), 262143), (k(L(t, 28), 15)))
														v = B < 2097152 and 7 or 14
														Z, x = k(B, u(1, v) - 1), L(B, v)
														local Pb = R
														m[Pb] = db(i, 57, (k(L(p, 14), 127)))
														Pb = R
														o[Pb] = db(g, 86, (k(L(p, 7), 127)))
														Pb = R
														W[Pb] = db(Z, 23, (k(p, 127)))
														Pb = R
														d[Pb] = db(x, 96, (k(L(p, 21), 127)))
														R -= 1
													end
												end
											else
												local Pb = U >= 47
												if Pb then
													local Pb = U < 48
													if Pb then
														B = Y[W[R]]
														B[6][B[5]][a[m[R]]] = a[o[R]]
													else
														local Pb = U == 49
														if Pb then
															B, g, i = m[R], W[R], o[R]
															p, v = B + i - 1, B + g
															Z = a[v]
															x = Z.n
															G = g + x - 1
															Z.n = G
															Q(Z, 1, x, g, Z)
															Q(a, B + 1, v - 1, 1, Z)
															F = D(a[B](H(Z, 1, Z.n)))
															Q(F, 1, i, B, a)
														else
															a[m[R]](a[W[R]], V[R])
														end
													end
												else
													local Pb = U ~= 46
													if Pb then
														a[m[R]] = #a[W[R]]
													else
														Y[W[R]][A[R]] = V[R]
													end
												end
											end
										end
									end
								else
									local Pb = U >= 22
									if Pb then
										local Pb = U < 33
										if Pb then
											local Pb = U < 27
											if Pb then
												local Pb = U < 24
												if Pb then
													local Pb = U == 23
													if Pb then
														local Pb, Tb = X, j
														if Pb then
															for lb in N, Pb, nil do
																if Pb then
																	local ab = Pb[lb]
																	if ab then
																		ab[6] = ab
																		ab[4] = a[lb]
																		ab[5] = 4
																		Pb[lb] = nil
																	end
																end
															end
														end
														if Tb then
															for lb, ab in N, Tb, nil do
																Pb = ab[4]
																if Tb then
																	local ab = Tb[lb]
																	if ab then
																		local Ib = c(Pb)
																		Q(a, lb, lb + Pb - 1, 1, Ib)
																		ab[6] = Ib
																		ab[5] = 1
																		Tb[lb] = nil
																	end
																end
															end
														end
														Pb, Tb = a[o[R]], a[W[R]]
														return false, true, D(Pb, Tb)
													else
														a[o[R]](_[R], a[m[R]])
													end
												else
													local Pb = U < 25
													if Pb then
														local Pb = a[W[R]] < a[m[R]]
														if Pb then
															R = o[R]
														end
													else
														local Pb = U == 26
														if Pb then
															a[o[R]] = a[m[R]] // W[R]
														else
															a[o[R]](A[R], H(a[W[R]], 1, a[W[R]].n))
														end
													end
												end
											else
												local Pb = U >= 30
												if Pb then
													local Pb = U < 31
													if Pb then
														local Pb, Tb = X, j
														if Pb then
															for lb in N, Pb, nil do
																if Pb then
																	local ab = Pb[lb]
																	if ab then
																		ab[6] = ab
																		ab[4] = a[lb]
																		ab[5] = 4
																		Pb[lb] = nil
																	end
																end
															end
														end
														if Tb then
															for lb, ab in N, Tb, nil do
																Pb = ab[4]
																if Tb then
																	local ab = Tb[lb]
																	if ab then
																		local Ib, Hb = lb + Pb, c(Pb)
																		Q(a, lb, Ib - 1, 1, Hb)
																		ab[6] = Hb
																		ab[5] = 1
																		Tb[lb] = nil
																	end
																end
															end
														end
														local Pb, Tb, lb = o[R], _[R], a[m[R]]
														return true, true, Pb, D(Tb, lb)
													else
														local Pb = U == 32
														if Pb then
															local Pb, Tb = X, j
															if Pb then
																for lb in N, Pb, nil do
																	if Pb then
																		local ab = Pb[lb]
																		if ab then
																			ab[6] = ab
																			ab[4] = a[lb]
																			ab[5] = 4
																			Pb[lb] = nil
																		end
																	end
																end
															end
															if Tb then
																for lb, ab in N, Tb, nil do
																	Pb = ab[4]
																	if Tb then
																		local ab = Tb[lb]
																		if ab then
																			local Ib, Hb = lb + Pb - 1, c(Pb)
																			Q(a, lb, Ib, 1, Hb)
																			ab[6] = Hb
																			ab[5] = 1
																			Tb[lb] = nil
																		end
																	end
																end
															end
															Tb, Pb = o[R], a[m[R]]
															return true, true, Tb, D(Pb)
														else
															a[W[R]] = m[R]
															a[W[R + 1]] = m[R + 1]
															R += 1
														end
													end
												else
													local Pb = U < 28
													if Pb then
														a[o[R]] = a[W[R]] - m[R]
													else
														local Pb = U ~= 29
														if Pb then
															local Pb, Tb = X, m[R]
															if Pb then
																local lb = Pb[Tb]
																if lb then
																	lb[6] = lb
																	lb[4] = a[Tb]
																	lb[5] = 4
																	Pb[Tb] = nil
																end
															end
														else
															local Pb = not (a[m[R]] < a[W[R]])
															if Pb then
																R = o[R]
															end
														end
													end
												end
											end
										else
											local Pb = U < 39
											if Pb then
												local Pb = U < 36
												if Pb then
													local Pb = U < 34
													if Pb then
														a[o[R]] = t
													else
														local Pb = U ~= 35
														if Pb then
															a[W[R]] = a[m[R]] <= o[R]
														else
															a[o[R]] = a[W[R]](A[R])
														end
													end
												else
													local Pb = U >= 37
													if Pb then
														local Pb = U == 38
														if Pb then
															B, g, i = m[R], W[R], o[R]
															p, v = a[B], B + g
															Z = a[v]
															Q(a, B + 1, v - 1, i + 1, p)
															Q(Z, 1, Z.n, i + g, p)
														else
															a[o[R]] = P[W[R]]
														end
													else
														local Pb = not (a[o[R]] < _[R])
														if Pb then
															R = m[R]
														end
													end
												end
											else
												local Pb = U < 42
												if Pb then
													local Pb = U >= 40
													if Pb then
														local Pb = U ~= 41
														if Pb then
															a[W[R]] = A[R] .. a[o[R]]
														else
															local Pb, Tb, lb = W[R], a[o[R]]
															repeat
																local ab = Tb % 4294967296
																if ab ~= ab then
																	lb = 0
																	break
																end
																lb = ab - ab % 1
															until true
															a[Pb] = lb
														end
													else
														B, g, i = m[R], o[R], W[R]
														p, v, Z = B + i - 1, B + g, D(a[B](H(a, B + 1, B + g)))
														Q(Z, 1, i, B, a)
													end
												else
													local Pb = U >= 43
													if Pb then
														local Pb = U ~= 44
														if Pb then
															y = a[W[R]]
														else
															a[W[R]] = m[R]
														end
													else
														local Pb, Tb, lb = m[R], a[o[R]], W[R]
														local ab, Ib = k(Tb, 4294967295), k(lb, 4294967295)
														local lb, Hb, Wb, wb =
															k(ab, 65535), L(ab, 16), k(Ib, 65535), L(Ib, 16)
														Tb = k(lb * Wb + u(k(lb * wb + Hb * Wb, 65535), 16), 4294967295)
														Wb = nil
														repeat
															Hb = Tb % 4294967296
															if Hb ~= Hb then
																Wb = 0
																break
															end
															Wb = Hb - Hb % 1
														until true
														a[Pb] = Wb
													end
												end
											end
										end
									else
										local Pb = U < 11
										if Pb then
											local Pb = U >= 5
											if Pb then
												local Pb = U < 8
												if Pb then
													local Pb = U >= 6
													if Pb then
														local Pb = U == 7
														if Pb then
															B, g = o[R] + 1, W[R]
															local Pb = R
															for Tb = 1, m[Pb], 1 do
																g = k(db(g, (u(g, 13))), 536870911)
																g = db(g, (L(g, 13)))
																g = k(db(g, (u(g, 14))), 536870911)
																W[B] = db(W[B], (k(L(g, 0), 127)))
																o[B] = db(o[B], (k(L(g, 7), 127)))
																m[B] = db(m[B], (k(L(g, 14), 127)))
																d[B] = db(d[B], (k(L(g, 21), 127)))
																B = B + 1
															end
															d[R] = 94
														else
															a[o[R]] = a[W[R]] == m[R]
														end
													else
														a[W[R]] = D(a[m[R]]())
													end
												else
													local Pb = U < 9
													if Pb then
														B, g =
															W[R] + 1, db(o[R], (k(db(t, (k(L(t, 29), 7))), 536870911)))
														local Pb = R
														for Tb = 1, m[Pb], 1 do
															g = k(db(g, (u(g, 13))), 536870911)
															g = db(g, (L(g, 13)))
															g = k(db(g, (u(g, 14))), 536870911)
															W[B] = db(W[B], (k(L(g, 0), 127)))
															o[B] = db(o[B], (k(L(g, 7), 127)))
															m[B] = db(m[B], (k(L(g, 14), 127)))
															d[B] = db(d[B], (k(L(g, 21), 127)))
															B = B + 1
														end
														d[R] = 94
													else
														local Pb = U == 10
														if Pb then
															a[m[R]] = a[o[R]] - _[R]
														else
															a[m[R]] = {}
														end
													end
												end
											else
												local Pb = U < 2
												if Pb then
													local Pb = U ~= 1
													if Pb then
														a[m[R]] = Y[W[R]][o[R]]
													else
														local Pb, Tb, lb = m[R], a[o[R]], a[W[R]]
														local ab, Ib = k(Tb, 4294967295), k(lb, 4294967295)
														local Hb, Wb, wb, jb =
															k(ab, 65535), L(ab, 16), k(Ib, 65535), L(Ib, 16)
														Ib = k(Hb * wb + u(k(Hb * jb + Wb * wb, 65535), 16), 4294967295)
														lb = nil
														repeat
															Tb = Ib % 4294967296
															if Tb ~= Tb then
																lb = 0
																break
															end
															lb = Tb - Tb % 1
														until true
														a[Pb] = lb
													end
												else
													local Pb = U < 3
													if Pb then
														B, g, i, p =
															W[R],
															db(t, k(L(t, 14), 262143), (k(L(t, 28), 15))),
															m[R],
															o[R]
														v = p < 16384 and 7 or (p < 2097152 and 14 or 21)
														Z, x = L(p, v), k(p, u(1, v) - 1)
														local Pb = R
														d[Pb] = db(Z, 110, (k(L(g, 21), 127)))
														Pb = R
														o[Pb] = db(x, 76, (k(L(g, 7), 127)))
														Pb = R
														W[Pb] = db(B, 72, (k(g, 127)))
														Pb = R
														m[Pb] = db(i, 115, (k(L(g, 14), 127)))
														R -= 1
													else
														local Pb = U == 4
														if Pb then
															a[m[R]] = a[W[R]] > o[R]
														else
															a[W[R]]()
														end
													end
												end
											end
										else
											local Pb = U < 16
											if Pb then
												local Pb = U >= 13
												if Pb then
													local Pb = U >= 14
													if Pb then
														local Pb = U == 15
														if Pb then
															a[o[R]](A[R])
														else
															B = m[R]
															i = B + o[R]
															local Pb, Tb = X, j
															if Pb then
																for lb in N, Pb, nil do
																	if Pb then
																		local ab = Pb[lb]
																		if ab then
																			ab[6] = ab
																			ab[4] = a[lb]
																			ab[5] = 4
																			Pb[lb] = nil
																		end
																	end
																end
															end
															if Tb then
																for lb, ab in N, Tb, nil do
																	Pb = ab[4]
																	if Tb then
																		local ab = Tb[lb]
																		if ab then
																			local Ib, Hb = lb + Pb, c(Pb)
																			Q(a, lb, Ib - 1, 1, Hb)
																			ab[6] = Hb
																			ab[5] = 1
																			Tb[lb] = nil
																		end
																	end
																end
															end
															return true, false, B, i
														end
													else
														local Pb = not (o[R] < a[m[R]])
														if Pb then
															R = W[R]
														end
													end
												else
													local Pb = U ~= 12
													if Pb then
														B = Y[o[R]]
														B[6][B[5]] = _[R]
													else
														a[o[R]] = a[m[R]] ~= W[R]
													end
												end
											else
												local Pb = U < 19
												if Pb then
													local Pb = U >= 17
													if Pb then
														local Pb = U ~= 18
														if Pb then
															r = { [7] = r, [8] = S, [6] = e, [9] = J }
															B, g = m[R], K(s)
															g(P, a[B], a[B + 1], a[B + 2])
															e = g
															R = W[R]
														else
															a[o[R]] = -a[W[R]]
														end
													else
														a[m[R]] = _[R] ~= V[R]
													end
												else
													local V = U >= 20
													if V then
														local V = U == 21
														if V then
															B, g, i = W[R], o[R], m[R]
															p = B + g
															v = a[p]
															Z = v.n
															x = g + Z - 1
															v.n = x
															Q(v, 1, Z, g, v)
															Q(a, B + 1, p - 1, 1, v)
															a[B] = D(a[B](H(v, 1, v.n)))
														else
															a[o[R]][A[R]] = a[W[R]]
														end
													else
														local V = not (_[R] < a[m[R]])
														if V then
															R = o[R]
														end
													end
												end
											end
										end
									end
								end
							end
							R += 1
						end
					else
					end
					b = q == 173
					if b then
						while true do
							local V = o[R]
							local q = V >= 88
							if q then
								local q = V >= 132
								if q then
									local q = V < 154
									if q then
										local q = V >= 143
										if q then
											local q = V < 148
											if q then
												local q = V < 145
												if q then
													local q = V ~= 144
													if q then
														a[m[R]] = y
													else
														B, g =
															m[R] + 1, db(W[R], (k(db(t, (k(L(t, 29), 7))), 536870911)))
														local q = R
														for b = 1, d[q], 1 do
															g = k(db(g, (u(g, 13))), 536870911)
															g = db(g, (L(g, 13)))
															g = k(db(g, (u(g, 14))), 536870911)
															m[B] = db(m[B], (k(L(g, 0), 127)))
															W[B] = db(W[B], (k(L(g, 7), 127)))
															d[B] = db(d[B], (k(L(g, 14), 127)))
															o[B] = db(o[B], (k(L(g, 21), 127)))
															B = B + 1
														end
														o[R] = 25
													end
												else
													local q = V < 146
													if q then
														B = Y[d[R]]
														B[6][B[5]] = A[R]
													else
														local q = V ~= 147
														if q then
															local q, b = X, j
															if q then
																for U in N, q, nil do
																	if q then
																		local Pb = q[U]
																		if Pb then
																			Pb[6] = Pb
																			Pb[4] = a[U]
																			Pb[5] = 4
																			q[U] = nil
																		end
																	end
																end
															end
															if b then
																for U, Pb in N, b, nil do
																	q = Pb[4]
																	if b then
																		local Pb = b[U]
																		if Pb then
																			local Tb, lb = U + q - 1, c(q)
																			Q(a, U, Tb, 1, lb)
																			Pb[6] = lb
																			Pb[5] = 1
																			b[U] = nil
																		end
																	end
																end
															end
															return false, false
														else
															a[W[R]] = D(a[m[R]]())
														end
													end
												end
											else
												local q = V < 151
												if q then
													local q = V >= 149
													if q then
														local q = V ~= 150
														if q then
															a[W[R]] = E[R] + a[m[R]]
														else
															local q, b, U = W[R], d[R], l[5]
															local Pb = db(U[q], 43364404)
															U[q] = Pb
															q, U = l[4], Pb + 1
															Pb = mb(q, U)
															local Tb, lb
															if Pb < 128 then
																Tb, lb = Pb, U + 1
															else
																local ab = mb(q, U + 1)
																if ab < 128 then
																	Tb, lb = (Pb - 128) * 128 + ab, U + 2
																else
																	local Ib = mb(q, U + 2)
																	if Ib < 128 then
																		Tb, lb =
																			(Pb - 128) * 16384 + (ab - 128) * 128 + Ib,
																			U + 3
																	else
																		local Hb = mb(q, U + 3)
																		Tb, lb =
																			(Pb - 128) * 128
																				+ (ab - 128)
																				+ (Ib - 128) * 16384
																				+ Hb % 128 * 2097152
																				+ (Hb - Hb % 128) * 2097152,
																			U + 4
																	end
																end
															end
															U, Pb = b * 16843009, lb + Tb
															local ab = Pb - Tb % 4
															for Ib = lb, ab - 1, 4 do
																Ab(q, Ib, (db(_b(q, Ib), U)))
															end
															for U = ab, Pb - 1, 1 do
																Vb(q, U, (db(mb(q, U), b)))
															end
															ab, Tb, q = R, R, R
															W[R] = 115
															d[ab] = 131
															m[Tb] = 48
															o[q] = 25
														end
													else
														a[W[R]] = E[R] * a[m[R]]
													end
												else
													local q = V < 152
													if q then
														a[d[R]] = a[W[R]] - m[R]
													else
														local q = V == 153
														if q then
															a[W[R]] = a[m[R]] // d[R]
														else
															R = a[W[R]]
														end
													end
												end
											end
										else
											local q = V >= 137
											if q then
												local q = V >= 140
												if q then
													local q = V < 141
													if q then
														a[m[R]] = d[R]
														a[m[R + 1]] = d[R + 1]
														R += 1
													else
														local q = V == 142
														if q then
															B, g, i = m[R], W[R], d[R]
															p, v, Z = B + i - 1, B + g, D(a[B](H(a, B + 1, B + g)))
															Q(Z, 1, i, B, a)
														else
															B, g, i = W[R], m[R], d[R]
															p = B + g
															v = a[p]
															Z = v.n
															x = g + Z - 1
															v.n = x
															Q(v, 1, Z, g, v)
															Q(a, B + 1, p - 1, 1, v)
															a[B] = D(a[B](H(v, 1, v.n)))
														end
													end
												else
													local q = V < 138
													if q then
														t = a[d[R]]
													else
														local q = V == 139
														if q then
															B, g, i = d[R], W[R], m[R]
															p, v = B + i - 1, B + g
															Z = a[v]
															x = Z.n
															G = g + x - 1
															Z.n = G
															Q(Z, 1, x, g, Z)
															Q(a, B + 1, v - 1, 1, Z)
															F = D(a[B](H(Z, 1, Z.n)))
															Q(F, 1, i, B, a)
														else
															a[m[R]] = a[W[R]] ^ d[R]
														end
													end
												end
											else
												local q = V < 134
												if q then
													local q = V == 133
													if q then
														a[W[R]] = Y[d[R]][m[R]]
													else
														a[W[R]] = A[R] == E[R]
													end
												else
													local q = V >= 135
													if q then
														local q = V ~= 136
														if q then
															a[W[R]] = I[A[R]]
															a[W[R + 1]] = a[d[R + 1]][A[R + 1]]
															R += 1
														else
															B, g, i = d[R], W[R], m[R]
															p = a[B]
															Q(a, B + 1, B + g, i + 1, p)
														end
													else
														local q = d[R] < a[m[R]]
														if q then
															R = W[R]
														end
													end
												end
											end
										end
									else
										local q = V < 165
										if q then
											local q = V >= 159
											if q then
												local q = V < 162
												if q then
													local q = V >= 160
													if q then
														local q = V ~= 161
														if q then
															a[m[R]] = _[R] > E[R]
														else
															a[W[R]] = a[m[R]][a[d[R]]]
														end
													else
														a[d[R]] = a[m[R]] > W[R]
													end
												else
													local q = V >= 163
													if q then
														local q = V ~= 164
														if q then
															a[d[R]] = a[W[R]] // a[m[R]]
														else
															local q = not (a[m[R]] <= a[W[R]])
															if q then
																R = d[R]
															end
														end
													else
														a[W[R]] = a[m[R]] - a[d[R]]
													end
												end
											else
												local q = V >= 156
												if q then
													local q = V >= 157
													if q then
														local q = V == 158
														if q then
															local q = a[W[R]] < E[R]
															if q then
																R = m[R]
															end
														else
															a[W[R]][m[R]] = a[d[R]]
														end
													else
														local q, G, F = d[R], W[R], A[R]
														local b, U = k(G, 4294967295), k(F, 4294967295)
														local F, Pb, Tb, lb =
															k(b, 65535), L(b, 16), k(U, 65535), L(U, 16)
														G = k(F * Tb + u(k(F * lb + Pb * Tb, 65535), 16), 4294967295)
														lb = nil
														repeat
															Pb = G % 4294967296
															if Pb ~= Pb then
																lb = 0
																break
															end
															lb = Pb - Pb % 1
														until true
														a[q] = lb
													end
												else
													local q = V ~= 155
													if q then
														B = d[R]
														i = B + W[R]
														local q, G = X, j
														if q then
															for F in N, q, nil do
																if q then
																	local b = q[F]
																	if b then
																		b[6] = b
																		b[4] = a[F]
																		b[5] = 4
																		q[F] = nil
																	end
																end
															end
														end
														if G then
															for F, b in N, G, nil do
																q = b[4]
																if G then
																	local b = G[F]
																	if b then
																		local U, Pb = F + q - 1, c(q)
																		Q(a, F, U, 1, Pb)
																		b[6] = Pb
																		b[5] = 1
																		G[F] = nil
																	end
																end
															end
														end
														return true, false, B, i
													else
														a[d[R]](H(a[m[R]], 1, a[m[R]].n))
													end
												end
											end
										else
											local q = V < 171
											if q then
												local q = V < 168
												if q then
													local q = V < 166
													if q then
														a[W[R]] = a[d[R]] >= a[m[R]]
													else
														local q = V ~= 167
														if q then
															a[W[R]] = A[R] ~= E[R]
														else
															local q, G = X, j
															if q then
																for F in N, q, nil do
																	if q then
																		local b = q[F]
																		if b then
																			b[6] = b
																			b[4] = a[F]
																			b[5] = 4
																			q[F] = nil
																		end
																	end
																end
															end
															if G then
																for F, b in N, G, nil do
																	q = b[4]
																	if G then
																		local b = G[F]
																		if b then
																			local U, Pb = F + q, c(q)
																			Q(a, F, U - 1, 1, Pb)
																			b[6] = Pb
																			b[5] = 1
																			G[F] = nil
																		end
																	end
																end
															end
															local q, G, F = m[R], a[W[R]], E[R]
															return true, true, q, D(G, F)
														end
													end
												else
													local q = V < 169
													if q then
														a[d[R]] = a[m[R]] + _[R]
													else
														local q = V ~= 170
														if q then
															local q = not (d[R] <= a[m[R]])
															if q then
																R = W[R]
															end
														else
															B, g = m[R], a[W[R]]
															a[B + 1] = g
															a[B] = g[E[R]]
														end
													end
												end
											else
												local q = V >= 174
												if q then
													local q = V < 175
													if q then
														a[W[R]] = D(a[d[R]](a[m[R]]))
													else
														local q = V == 176
														if q then
															a[W[R]](a[m[R]], H(a[d[R]], 1, a[d[R]].n))
														else
															a[W[R]][A[R]] = a[d[R]]
														end
													end
												else
													local q = V < 172
													if q then
														a[d[R]] = not a[W[R]]
													else
														local q = V ~= 173
														if q then
															a[W[R]] = a[m[R]] >= E[R]
														else
															B = Y[W[R]]
															a[m[R]] = B[6][B[5]][E[R]]
														end
													end
												end
											end
										end
									end
								else
									local q = V >= 110
									if q then
										local q = V < 121
										if q then
											local q = V >= 115
											if q then
												local q = V >= 118
												if q then
													local q = V < 119
													if q then
														local q, G = X, j
														if q then
															for F in N, q, nil do
																if q then
																	local b = q[F]
																	if b then
																		b[6] = b
																		b[4] = a[F]
																		b[5] = 4
																		q[F] = nil
																	end
																end
															end
														end
														if G then
															for F, b in N, G, nil do
																q = b[4]
																if G then
																	local b = G[F]
																	if b then
																		local U = c(q)
																		Q(a, F, F + q - 1, 1, U)
																		b[6] = U
																		b[5] = 1
																		G[F] = nil
																	end
																end
															end
														end
														G, q = a[W[R]], A[R]
														return false, true, D(G, q)
													else
														local q = V == 120
														if q then
															local q = not (a[d[R]] < a[m[R]])
															if q then
																R = W[R]
															end
														else
															B = Y[W[R]]
															B[6][B[5]][A[R]] = d[R]
														end
													end
												else
													local q = V < 116
													if q then
														B, g = m[R] + 1, d[R]
														local q = R
														for G = 1, W[q], 1 do
															g = k(db(g, (u(g, 13))), 536870911)
															g = db(g, (L(g, 13)))
															g = k(db(g, (u(g, 14))), 536870911)
															m[B] = db(m[B], (k(L(g, 0), 127)))
															W[B] = db(W[B], (k(L(g, 7), 127)))
															d[B] = db(d[B], (k(L(g, 14), 127)))
															o[B] = db(o[B], (k(L(g, 21), 127)))
															B = B + 1
														end
														o[R] = 25
													else
														local q = V == 117
														if q then
															a[m[R]] = a[W[R]] < a[d[R]]
														else
															local q, G = X, W[R]
															if q then
																local F = q[G]
																if F then
																	F[6] = F
																	F[4] = a[G]
																	F[5] = 4
																	q[G] = nil
																end
															end
														end
													end
												end
											else
												local q = V < 112
												if q then
													local q = V == 111
													if q then
														local q = a[W[R]] == m[R]
														if q then
															R = d[R]
														end
													else
														a[d[R]] = Y[W[R]][A[R]]
													end
												else
													local q = V >= 113
													if q then
														local q = V == 114
														if q then
															local q, G, F = m[R], W[R], a[d[R]]
															local b, U = k(G, 4294967295), k(F, 4294967295)
															local Pb, Tb, lb, ab =
																k(b, 65535), L(b, 16), k(U, 65535), L(U, 16)
															F = k(
																Pb * lb + u(k(Pb * ab + Tb * lb, 65535), 16),
																4294967295
															)
															ab = nil
															repeat
																G = F % 4294967296
																if G ~= G then
																	ab = 0
																	break
																end
																ab = G - G % 1
															until true
															a[q] = ab
														else
															a[W[R]] = a[m[R]] ~= d[R]
														end
													else
														local q, G, F =
															m[R],
															db(W[R], (k(db(y, (k(L(y, 29), 7))), 536870911))),
															l[5]
														local b = db(F[q], 43364404)
														F[q] = b
														q, F = l[4], b + 1
														b = mb(q, F)
														local U, Pb
														if b < 128 then
															U, Pb = b, F + 1
														else
															local Tb = mb(q, F + 1)
															if Tb < 128 then
																U, Pb = (b - 128) * 128 + Tb, F + 2
															else
																local lb = mb(q, F + 2)
																if lb < 128 then
																	U, Pb =
																		(b - 128) * 16384 + (Tb - 128) * 128 + lb, F + 3
																else
																	local ab = mb(q, F + 3)
																	U, Pb =
																		(b - 128) * 128
																			+ (Tb - 128)
																			+ (lb - 128) * 16384
																			+ ab % 128 * 2097152
																			+ (ab - ab % 128) * 2097152,
																		F + 4
																end
															end
														end
														b, F = G * 16843009, Pb + U
														local Tb = F - U % 4
														for U = Pb, Tb - 1, 4 do
															Ab(q, U, (db(_b(q, U), b)))
														end
														for b = Tb, F - 1, 1 do
															Vb(q, b, (db(mb(q, b), G)))
														end
														Tb, Pb, q = R, R, R
														m[R] = 237
														W[Tb] = 222
														d[Pb] = 91
														o[q] = 25
													end
												end
											end
										else
											local q = V >= 126
											if q then
												local q = V < 129
												if q then
													local q = V < 127
													if q then
														a[d[R]] = _[R] .. a[m[R]]
													else
														local q = V ~= 128
														if q then
															a[d[R]] = a[m[R]] < W[R]
														else
															local q, G, F = W[R], m[R], d[R]
															local b, U = k(G, 4294967295), k(F, 4294967295)
															local G, Pb, Tb, lb =
																k(b, 65535), L(b, 16), k(U, 65535), L(U, 16)
															F = k(
																G * Tb + u(k(G * lb + Pb * Tb, 65535), 16),
																4294967295
															)
															U = nil
															repeat
																Pb = F % 4294967296
																if Pb ~= Pb then
																	U = 0
																	break
																end
																U = Pb - Pb % 1
															until true
															a[q] = U
														end
													end
												else
													local q = V >= 130
													if q then
														local q = V ~= 131
														if q then
															B = d[R]
															g, i, p = a[B], a[B + 1], a[B + 2]
															a[B] = g(i, p)
														else
															a[W[R]](a[m[R]])
														end
													else
														a[d[R]] = a[W[R]] == m[R]
													end
												end
											else
												local q = V < 123
												if q then
													local q = V == 122
													if q then
														B = Y[m[R]]
														B[6][B[5]] = a[W[R]]
													else
														a[m[R]] = d[R]
													end
												else
													local q = V >= 124
													if q then
														local q = V ~= 125
														if q then
															a[m[R]] = E[R]
														else
															a[m[R]](a[W[R]], a[d[R]])
														end
													else
														a[W[R]] = a[m[R]] * E[R]
													end
												end
											end
										end
									else
										local q = V < 99
										if q then
											local q = V >= 93
											if q then
												local q = V < 96
												if q then
													local q = V >= 94
													if q then
														local q = V ~= 95
														if q then
															a[W[R]] = a[m[R]] + a[d[R]]
														else
															B, g = d[R], m[R]
															i = B + g
															p = a[i]
															v = p.n
															local q, G = X, j
															if q then
																for F in N, q, nil do
																	if q then
																		local b = q[F]
																		if b then
																			b[6] = b
																			b[4] = a[F]
																			b[5] = 4
																			q[F] = nil
																		end
																	end
																end
															end
															if G then
																for F, b in N, G, nil do
																	q = b[4]
																	if G then
																		local b = G[F]
																		if b then
																			local U = c(q)
																			Q(a, F, F + q - 1, 1, U)
																			b[6] = U
																			b[5] = 1
																			G[F] = nil
																		end
																	end
																end
															end
															p.n = g + v - 1
															Q(p, 1, v, g, p)
															Q(a, B + 1, i - 1, 1, p)
															return true, true, B, p
														end
													else
														R = m[R]
													end
												else
													local q = V >= 97
													if q then
														local q = V == 98
														if q then
															a[d[R]] = a[W[R]](a[m[R]])
														else
															B = Y[d[R]]
															a[W[R]] = B[6][B[5]]
														end
													else
														r = { [7] = r, [8] = S, [6] = e, [9] = J }
														B, g = W[R], K(s)
														g(P, a[B], a[B + 1], a[B + 2])
														e = g
														R = d[R]
													end
												end
											else
												local q = V >= 90
												if q then
													local q = V >= 91
													if q then
														local q = V ~= 92
														if q then
															Y[m[R]][E[R]] = W[R]
														else
															Y[d[R]][a[m[R]]] = _[R]
														end
													else
														local q = _[R] < a[m[R]]
														if q then
															R = d[R]
														end
													end
												else
													local q = V ~= 89
													if q then
														a[W[R]] = t
													else
														B = d[R]
														local q, K, s = e()
														if q then
															a[B + 1] = K
															a[B + 2] = s
															R = m[R]
														end
														g, i, p = q, K, s
													end
												end
											end
										else
											local q = V >= 104
											if q then
												local q = V >= 107
												if q then
													local q = V < 108
													if q then
														a[d[R]] = a[W[R]] / a[m[R]]
													else
														local q = V == 109
														if q then
															a[d[R]] = a[m[R]] < _[R]
														else
															n = a[d[R]]
														end
													end
												else
													local q = V < 105
													if q then
														a[W[R]]()
													else
														local q = V ~= 106
														if q then
															a[m[R]](a[W[R]], E[R])
														else
															r = { [7] = r, [8] = S, [6] = e, [9] = J }
															B = d[R]
															S = a[B + 2] + 0
															J = a[B + 1] + 0
															e = a[B] - S
															R = W[R]
														end
													end
												end
											else
												local q = V < 101
												if q then
													local q = V ~= 100
													if q then
														a[d[R]] = a[W[R]]
													else
														a[d[R]] = Y[W[R]][a[m[R]]]
													end
												else
													local q = V < 102
													if q then
														a[W[R]] = I[A[R]]
													else
														local q = V == 103
														if q then
															local q = a[d[R]] ~= A[R]
															if q then
																R = W[R]
															end
														else
															a[d[R]] = a[m[R]] .. _[R]
														end
													end
												end
											end
										end
									end
								end
							else
								local q = V >= 44
								if q then
									local q = V >= 66
									if q then
										local q = V >= 77
										if q then
											local q = V < 82
											if q then
												local q = V < 79
												if q then
													local q = V == 78
													if q then
														local q, K, s = m[R], _[R], a[d[R]]
														local G, F = k(K, 4294967295), k(s, 4294967295)
														local K, b, U, Pb = k(G, 65535), L(G, 16), k(F, 65535), L(F, 16)
														s = k(K * U + u(k(K * Pb + b * U, 65535), 16), 4294967295)
														K = nil
														repeat
															Pb = s % 4294967296
															if Pb ~= Pb then
																K = 0
																break
															end
															K = Pb - Pb % 1
														until true
														a[q] = K
													else
														y = a[m[R]]
													end
												else
													local q = V >= 80
													if q then
														local q = V == 81
														if q then
															a[W[R]] = E[R] <= A[R]
														else
															local q, K, s = d[R], a[m[R]], a[W[R]]
															local G, F = k(K, 4294967295), k(s, 4294967295)
															local K, s, b, U =
																k(G, 65535), L(G, 16), k(F, 65535), L(F, 16)
															G = k(K * b + u(k(K * U + s * b, 65535), 16), 4294967295)
															U = nil
															repeat
																b = G % 4294967296
																if b ~= b then
																	U = 0
																	break
																end
																U = b - b % 1
															until true
															a[q] = U
														end
													else
														a[W[R]] = a[m[R]](H(a[d[R]], 1, a[d[R]].n))
													end
												end
											else
												local q = V >= 85
												if q then
													local q = V < 86
													if q then
														a[m[R]] = a[d[R]] * W[R]
													else
														local q = V ~= 87
														if q then
															a[W[R]] = a[m[R]] - E[R]
														else
															a[m[R]] = a[d[R]](_[R])
														end
													end
												else
													local q = V < 83
													if q then
														local q = a[d[R]] ~= W[R]
														if q then
															R = m[R]
														end
													else
														local q = V ~= 84
														if q then
															a[m[R]] = a[W[R]] >= d[R]
														else
															B = a[W[R]]
															a[d[R]] = D(H(B, m[R], B.n))
														end
													end
												end
											end
										else
											local q = V >= 71
											if q then
												local q = V >= 74
												if q then
													local q = V >= 75
													if q then
														local q = V == 76
														if q then
															a[d[R]] = A[R] - a[W[R]]
														else
															a[m[R]] = d[R] + a[W[R]]
														end
													else
														local q, K = X, j
														if q then
															for s in N, q, nil do
																if q then
																	local G = q[s]
																	if G then
																		G[6] = G
																		G[4] = a[s]
																		G[5] = 4
																		q[s] = nil
																	end
																end
															end
														end
														if K then
															for s, G in N, K, nil do
																q = G[4]
																if K then
																	local G = K[s]
																	if G then
																		local F, b = s + q, c(q)
																		Q(a, s, F - 1, 1, b)
																		G[6] = b
																		G[5] = 1
																		K[s] = nil
																	end
																end
															end
														end
														local q, K, s = a[W[R]], a[d[R]], a[d[R]]
														return false, true, D(q, H(K, 1, s.n))
													end
												else
													local q = V >= 72
													if q then
														local q = V == 73
														if q then
															local q = not (A[R] <= E[R])
															if q then
																R = W[R]
															end
														else
															a[d[R]][a[W[R]]] = A[R]
														end
													else
														local q, K = X, j
														if q then
															for s in N, q, nil do
																if q then
																	local G = q[s]
																	if G then
																		G[6] = G
																		G[4] = a[s]
																		G[5] = 4
																		q[s] = nil
																	end
																end
															end
														end
														if K then
															for s, G in N, K, nil do
																q = G[4]
																if K then
																	local G = K[s]
																	if G then
																		local F, b = s + q, c(q)
																		Q(a, s, F - 1, 1, b)
																		G[6] = b
																		G[5] = 1
																		K[s] = nil
																	end
																end
															end
														end
														q, K = a[d[R]], a[m[R]]
														return false, true, D(q, K)
													end
												end
											else
												local q = V >= 68
												if q then
													local q = V < 69
													if q then
														a[W[R]] = #a[d[R]]
													else
														local q = V ~= 70
														if q then
															local q, K, s = d[R], a[m[R]]
															repeat
																local G = K % 4294967296
																if G ~= G then
																	s = 0
																	break
																end
																s = G - G % 1
															until true
															a[q] = s
														else
															local q, K, s = d[R], _[R], A[R]
															local G, F = k(K, 4294967295), k(s, 4294967295)
															local s, b, U, Pb =
																k(G, 65535), L(G, 16), k(F, 65535), L(F, 16)
															K = k(s * U + u(k(s * Pb + b * U, 65535), 16), 4294967295)
															G = nil
															repeat
																Pb = K % 4294967296
																if Pb ~= Pb then
																	G = 0
																	break
																end
																G = Pb - Pb % 1
															until true
															a[q] = G
														end
													end
												else
													local q = V ~= 67
													if q then
														a[m[R]] = a[d[R]] / W[R]
													else
														a[d[R]] = a[m[R]] <= W[R]
													end
												end
											end
										end
									else
										local q = V >= 55
										if q then
											local q = V < 60
											if q then
												local q = V >= 57
												if q then
													local q = V >= 58
													if q then
														local q = V ~= 59
														if q then
															Y[m[R]][E[R]] = a[W[R]]
														else
															a[d[R]] = a[m[R]] + W[R]
														end
													else
														local q, K = X, j
														if q then
															for s in N, q, nil do
																if q then
																	local G = q[s]
																	if G then
																		G[6] = G
																		G[4] = a[s]
																		G[5] = 4
																		q[s] = nil
																	end
																end
															end
														end
														if K then
															for s, G in N, K, nil do
																q = G[4]
																if K then
																	local G = K[s]
																	if G then
																		local F, b = s + q, c(q)
																		Q(a, s, F - 1, 1, b)
																		G[6] = b
																		G[5] = 1
																		K[s] = nil
																	end
																end
															end
														end
														K, q = m[R], a[d[R]]
														return true, true, K, D(q)
													end
												else
													local q = V ~= 56
													if q then
														local q, K, s =
															m[R],
															db(W[R], (k(db(t, (k(L(t, 29), 7))), 536870911))),
															l[5]
														local G = db(s[q], 43364404)
														s[q] = G
														q, s = l[4], G + 1
														G = mb(q, s)
														local l, F
														if G < 128 then
															l, F = G, s + 1
														else
															local b = mb(q, s + 1)
															if b < 128 then
																l, F = (G - 128) * 128 + b, s + 2
															else
																local U = mb(q, s + 2)
																if U < 128 then
																	l, F =
																		(G - 128) * 16384 + (b - 128) * 128 + U, s + 3
																else
																	local Pb = mb(q, s + 3)
																	l, F =
																		(G - 128) * 128
																			+ (b - 128)
																			+ (U - 128) * 16384
																			+ Pb % 128 * 2097152
																			+ (Pb - Pb % 128) * 2097152,
																		s + 4
																end
															end
														end
														G, s = K * 16843009, F + l
														local b = s - l % 4
														for U = F, b - 1, 4 do
															Ab(q, U, (db(_b(q, U), G)))
														end
														for F = b, s - 1, 1 do
															Vb(q, F, (db(mb(q, F), K)))
														end
														l, s, G = R, R, R
														m[R] = 199
														W[l] = 177
														d[s] = 221
														o[G] = 25
													else
														a[W[R]][A[R]] = E[R]
													end
												end
											else
												local l = V >= 63
												if l then
													local l = V >= 64
													if l then
														local l = V ~= 65
														if l then
															B = Y[W[R]]
															a[d[R]] = B[6][B[5]][m[R]]
														else
															Y[m[R]][_[R]] = E[R]
														end
													else
														a[W[R]] = a[d[R]] ~= a[m[R]]
													end
												else
													local l = V < 61
													if l then
														a[d[R]] = a[W[R]] == a[m[R]]
													else
														local l = V == 62
														if l then
															local l, q = X, j
															if l then
																for K in N, l, nil do
																	if l then
																		local s = l[K]
																		if s then
																			s[6] = s
																			s[4] = a[K]
																			s[5] = 4
																			l[K] = nil
																		end
																	end
																end
															end
															if q then
																for K, s in N, q, nil do
																	l = s[4]
																	if q then
																		local s = q[K]
																		if s then
																			local G = c(l)
																			Q(a, K, K + l - 1, 1, G)
																			s[6] = G
																			s[5] = 1
																			q[K] = nil
																		end
																	end
																end
															end
															q = a[d[R]]
															return false, true, D(q)
														else
															a[W[R]] = a[d[R]][A[R]]
														end
													end
												end
											end
										else
											local l = V >= 49
											if l then
												local l = V < 52
												if l then
													local l = V < 50
													if l then
														a[d[R]] = a[W[R]]()
													else
														local l = V ~= 51
														if l then
															a[m[R]](_[R], E[R])
														else
															local l = a[d[R]] == _[R]
															if l then
																R = m[R]
															end
														end
													end
												else
													local l = V >= 53
													if l then
														local l = V == 54
														if l then
															local l, q, K = W[R], E[R], m[R]
															local s, G = k(q, 4294967295), k(K, 4294967295)
															local q, F, b, U =
																k(s, 65535), L(s, 16), k(G, 65535), L(G, 16)
															K = k(q * b + u(k(q * U + F * b, 65535), 16), 4294967295)
															s = nil
															repeat
																U = K % 4294967296
																if U ~= U then
																	s = 0
																	break
																end
																s = U - U % 1
															until true
															a[l] = s
														else
															local l = not (a[d[R]] < m[R])
															if l then
																R = W[R]
															end
														end
													else
														local l, q, K = d[R], a[m[R]], W[R]
														local s, G = k(q, 4294967295), k(K, 4294967295)
														local q, F, b, U = k(s, 65535), L(s, 16), k(G, 65535), L(G, 16)
														G = k(q * b + u(k(q * U + F * b, 65535), 16), 4294967295)
														K = nil
														repeat
															U = G % 4294967296
															if U ~= U then
																K = 0
																break
															end
															K = U - U % 1
														until true
														a[l] = K
													end
												end
											else
												local l = V < 46
												if l then
													local l = V == 45
													if l then
														local l, q = X, j
														if l then
															for K in N, l, nil do
																if l then
																	local s = l[K]
																	if s then
																		s[6] = s
																		s[4] = a[K]
																		s[5] = 4
																		l[K] = nil
																	end
																end
															end
														end
														if q then
															for K, s in N, q, nil do
																l = s[4]
																if q then
																	local s = q[K]
																	if s then
																		local G = c(l)
																		Q(a, K, K + l - 1, 1, G)
																		s[6] = G
																		s[5] = 1
																		q[K] = nil
																	end
																end
															end
														end
														l, q = m[R], d[R]
														return true, true, l, a[q]
													else
														a[m[R]] = a[d[R]] / _[R]
													end
												else
													local l = V >= 47
													if l then
														local l = V ~= 48
														if l then
															local l = a[m[R]] ~= a[W[R]]
															if l then
																R = d[R]
															end
														else
															local l, q = X, j
															if l then
																for K in N, l, nil do
																	if l then
																		local s = l[K]
																		if s then
																			s[6] = s
																			s[4] = a[K]
																			s[5] = 4
																			l[K] = nil
																		end
																	end
																end
															end
															if q then
																for K, s in N, q, nil do
																	l = s[4]
																	if q then
																		local s = q[K]
																		if s then
																			local G = c(l)
																			Q(a, K, K + l - 1, 1, G)
																			s[6] = G
																			s[5] = 1
																			q[K] = nil
																		end
																	end
																end
															end
															local l, q, K = m[R], _[R], E[R]
															return true, true, l, D(q, K)
														end
													else
														local l, q = X, j
														if l then
															for K in N, l, nil do
																if l then
																	local s = l[K]
																	if s then
																		s[6] = s
																		s[4] = a[K]
																		s[5] = 4
																		l[K] = nil
																	end
																end
															end
														end
														if q then
															for K, s in N, q, nil do
																l = s[4]
																if q then
																	local s = q[K]
																	if s then
																		local G, F = K + l - 1, c(l)
																		Q(a, K, G, 1, F)
																		s[6] = F
																		s[5] = 1
																		q[K] = nil
																	end
																end
															end
														end
														B = W[R]
														l = B + m[R]
														return false, false, B, l - 1
													end
												end
											end
										end
									end
								else
									local l = V < 22
									if l then
										local l = V >= 11
										if l then
											local l = V >= 16
											if l then
												local l = V >= 19
												if l then
													local l = V >= 20
													if l then
														local l = V ~= 21
														if l then
															Y[m[R]][a[d[R]]] = a[W[R]]
														else
															a[W[R]] = a[m[R]] * a[d[R]]
														end
													else
														a[d[R]][a[W[R]]] = a[m[R]]
													end
												else
													local l = V >= 17
													if l then
														local l = V == 18
														if l then
															a[d[R]](_[R], a[m[R]])
														else
															B, g, i, p =
																W[R],
																d[R],
																m[R],
																db(t, k(L(t, 14), 262143), (k(L(t, 28), 15)))
															v = B < 16384 and 7 or (B < 2097152 and 14 or 21)
															Z, x = k(B, u(1, v) - 1), L(B, v)
															local l = R
															d[l] = db(g, 94, (k(L(p, 14), 127)))
															l = R
															W[l] = db(Z, 91, (k(L(p, 7), 127)))
															l = R
															m[l] = db(i, 66, (k(p, 127)))
															l = R
															o[l] = db(x, 33, (k(L(p, 21), 127)))
															R -= 1
														end
													else
														B = Y[m[R]]
														a[W[R]] = B[6][B[5]][a[d[R]]]
													end
												end
											else
												local l = V >= 13
												if l then
													local l = V < 14
													if l then
														a[m[R]] = P[W[R]]
													else
														local l = V == 15
														if l then
															B = Y[W[R]]
															B[6][B[5]][A[R]] = E[R]
														else
															a[W[R]] = Y[m[R]]
														end
													end
												else
													local l = V ~= 12
													if l then
														a[d[R]] = a[W[R]] % m[R]
													else
														a[m[R]] = W[R] * a[d[R]]
													end
												end
											end
										else
											local l = V >= 5
											if l then
												local l = V >= 8
												if l then
													local l = V < 9
													if l then
														a[d[R]] = {}
													else
														local l = V == 10
														if l then
															a[d[R]] = a[W[R]] > a[m[R]]
														else
															e = r[6]
															J = r[9]
															S = r[8]
															r = r[7]
														end
													end
												else
													local l = V < 6
													if l then
														local l, r = X, j
														if l then
															for q in N, l, nil do
																if l then
																	local K = l[q]
																	if K then
																		K[6] = K
																		K[4] = a[q]
																		K[5] = 4
																		l[q] = nil
																	end
																end
															end
														end
														if r then
															for q, K in N, r, nil do
																l = K[4]
																if r then
																	local K = r[q]
																	if K then
																		local s, G = q + l, c(l)
																		Q(a, q, s - 1, 1, G)
																		K[6] = G
																		K[5] = 1
																		r[q] = nil
																	end
																end
															end
														end
														local l, r, q = W[R], a[d[R]], a[m[R]]
														return true, true, l, D(r, q)
													else
														local l = V ~= 7
														if l then
															a[W[R]][A[R]] = d[R]
														else
															local l
															local r, q, K, s, G = A[R], X, j
															if r then
																local F = #r / 3
																if F > 0 then
																	l, s, G = {}, q, K
																	for b = 1, F, 1 do
																		local F = (b - 1) * 3
																		local U, Pb = r[F + 3], r[F + 2]
																		if U == 1 then
																			s = if not s then {} else s
																			local Tb = s[Pb]
																			if not Tb then
																				Tb = { [5] = Pb, [6] = a }
																				s[Pb] = Tb
																			else
																			end
																			l[b] = Tb
																		else
																			if U == 0 then
																				l[b] = a[Pb]
																			else
																				if U == 2 then
																					l[b] = Y[Pb]
																				else
																					if U == 3 then
																						G = if not G then {} else G
																						local U = G[Pb]
																						if not U then
																							U = {
																								[6] = a,
																								[5] = Pb,
																								[4] = r[F + 1],
																							}
																							G[Pb] = U
																						else
																						end
																						l[b] = U
																					else
																					end
																				end
																			end
																		end
																	end
																else
																	s, G = q, K
																end
															else
																s, G = q, K
															end
															X, j = s, G
															g = E[R](l)
															Eb(g, I)
															a[W[R]] = g
															B = l
														end
													end
												end
											else
												local l = V >= 2
												if l then
													local l = V < 3
													if l then
														a[W[R]] = d[R] / a[m[R]]
													else
														local l = V == 4
														if l then
															B, g, i, p =
																d[R],
																W[R],
																db(t, k(L(t, 14), 262143), (k(L(t, 28), 15))),
																m[R]
															v = g < 2097152 and 7 or 14
															Z, x = L(g, v), k(g, u(1, v) - 1)
															local l = R
															m[l] = db(p, 75, (k(i, 127)))
															l = R
															d[l] = db(B, 61, (k(L(i, 14), 127)))
															l = R
															W[l] = db(x, 20, (k(L(i, 7), 127)))
															l = R
															o[l] = db(Z, 10, (k(L(i, 21), 127)))
															R -= 1
														else
															R = if a[m[R]] then W[R] else d[R]
														end
													end
												else
													local l = V == 1
													if l then
														B, g =
															m[R] + 1, db(W[R], (k(db(y, (k(L(y, 29), 7))), 536870911)))
														local l = R
														for I = 1, d[l], 1 do
															g = k(db(g, (u(g, 13))), 536870911)
															g = db(g, (L(g, 13)))
															g = k(db(g, (u(g, 14))), 536870911)
															m[B] = db(m[B], (k(L(g, 0), 127)))
															W[B] = db(W[B], (k(L(g, 7), 127)))
															d[B] = db(d[B], (k(L(g, 14), 127)))
															o[B] = db(o[B], (k(L(g, 21), 127)))
															B = B + 1
														end
														o[R] = 25
													else
														a[W[R]](E[R])
													end
												end
											end
										end
									else
										local o = V >= 33
										if o then
											local o = V >= 38
											if o then
												local o = V >= 41
												if o then
													local o = V < 42
													if o then
														B, g, i = m[R], W[R], d[R]
														p = B + g
														a[B] = D(a[B](H(a, B + 1, p)))
													else
														local o = V == 43
														if o then
															B, g, i = m[R], d[R], W[R]
															p, v = a[B], B + g
															Z = a[v]
															Q(a, B + 1, v - 1, i + 1, p)
															Q(Z, 1, Z.n, i + g, p)
														else
															local o, l = X, j
															if o then
																for I in N, o, nil do
																	if o then
																		local y = o[I]
																		if y then
																			y[6] = y
																			y[4] = a[I]
																			y[5] = 4
																			o[I] = nil
																		end
																	end
																end
															end
															if l then
																for I, y in N, l, nil do
																	o = y[4]
																	if l then
																		local y = l[I]
																		if y then
																			local r, t = I + o - 1, c(o)
																			Q(a, I, r, 1, t)
																			y[6] = t
																			y[5] = 1
																			l[I] = nil
																		end
																	end
																end
															end
															o = A[R]
															return false, true, D(o)
														end
													end
												else
													local o = V >= 39
													if o then
														local o = V ~= 40
														if o then
															a[W[R]] = a[d[R]] ~= A[R]
														else
															local o = A[R] == E[R]
															if o then
																R = W[R]
															end
														end
													else
														a[m[R]] = a[d[R]] .. a[W[R]]
													end
												end
											else
												local o = V < 35
												if o then
													local o = V == 34
													if o then
														a[W[R]] = a[m[R]] <= a[d[R]]
													else
														a[m[R]] = n
													end
												else
													local o = V < 36
													if o then
														local o, l = X, j
														if o then
															for I in N, o, nil do
																if o then
																	local n = o[I]
																	if n then
																		n[6] = n
																		n[4] = a[I]
																		n[5] = 4
																		o[I] = nil
																	end
																end
															end
														end
														if l then
															for I, n in N, l, nil do
																o = n[4]
																if l then
																	local n = l[I]
																	if n then
																		local y = c(o)
																		Q(a, I, I + o - 1, 1, y)
																		n[6] = y
																		n[5] = 1
																		l[I] = nil
																	end
																end
															end
														end
														local o, l, I = _[R], a[d[R]], a[m[R]]
														return false, true, D(o, l, I)
													else
														local o = V ~= 37
														if o then
															B = Y[m[R]]
															B[6][B[5]][a[d[R]]] = a[W[R]]
														else
															a[W[R]] = a[d[R]][m[R]]
														end
													end
												end
											end
										else
											local o = V < 27
											if o then
												local o = V >= 24
												if o then
													local o = V >= 25
													if o then
														local o = V ~= 26
														if o then
														else
															e += S
															B = if S <= 0 then e >= J else e <= J
															if B then
																a[m[R]] = e
																R = d[R]
															end
														end
													else
														local o = not (m[R] < a[W[R]])
														if o then
															R = d[R]
														end
													end
												else
													local o = V == 23
													if o then
														local o, _, l = d[R], A[R]
														repeat
															local A = _ % 4294967296
															if A ~= A then
																l = 0
																break
															end
															l = A - A % 1
														until true
														a[o] = l
													else
														local o, A = X, j
														if o then
															for _ in N, o, nil do
																if o then
																	local l = o[_]
																	if l then
																		l[6] = l
																		l[4] = a[_]
																		l[5] = 4
																		o[_] = nil
																	end
																end
															end
														end
														if A then
															for _, l in N, A, nil do
																o = l[4]
																if A then
																	local l = A[_]
																	if l then
																		local I = c(o)
																		Q(a, _, _ + o - 1, 1, I)
																		l[6] = I
																		l[5] = 1
																		A[_] = nil
																	end
																end
															end
														end
														local o, A, _ = a[d[R]], a[m[R]], a[W[R]]
														return false, true, D(o, A, _)
													end
												end
											else
												local o = V < 30
												if o then
													local o = V >= 28
													if o then
														local o = V == 29
														if o then
															a[d[R]] = m[R] - a[W[R]]
														else
															local o = a[W[R]] == a[d[R]]
															if o then
																R = m[R]
															end
														end
													else
														a[W[R]] = -a[m[R]]
													end
												else
													local o = V >= 31
													if o then
														local o = V ~= 32
														if o then
															a[W[R]] = a[m[R]] > E[R]
														else
															B = Y[W[R]]
															B[6][B[5]][E[R]] = a[m[R]]
														end
													else
														a[W[R]] = a[m[R]] == E[R]
													end
												end
											end
										end
									end
								end
							end
							R += 1
						end
					end
				end, ...)
				if M then
					if h then
						if z then
							return a[C](H(O, 1, O.n))
						else
							return a[C](H(a, C + 1, O))
						end
					elseif C then
						if z then
							return H(C, 1, C.n)
						else
							return H(a, C, O)
						end
					end
				else
					local o, d, m = X, j, a
					if o then
						for A in N, o, nil do
							if o then
								local _ = o[A]
								if _ then
									_[6] = _
									_[4] = m[A]
									_[5] = 4
									o[A] = nil
								end
							end
						end
					end
					if d then
						for A, _ in N, d, nil do
							o = _[4]
							if d then
								local _ = d[A]
								if _ then
									local V, l = A + o - 1, c(o)
									Q(m, A, V, 1, l)
									_[6] = l
									_[5] = 1
									d[A] = nil
								end
							end
						end
					end
					ob(P, h, R, T)
				end
			end
			return w
		end
		return f
	end,
	[106] = function(P, P, P, P)
		return function(P, T, T)
			local T = buffer.writei8
			local o = P[2]
			local d = P[3]
			local m = P[4]
			local A = P[5]
			local _ = P[6]
			local V = P[7]
			local l = table.insert
			local E = P[9]
			return function()
				local P
				local P = T
				local a, I = not P.Alive
				if a then
					I = a
				else
					P = T
					I = not P.Settings.World.BulletTracers
				end
				local T, H
				if I then
					T = I
				else
					a = o[6][o[5]]
					if a then
						local H, H
						H, T = d, o[6][o[5]].Parent ~= d
					else
						T = a
					end
				end
				if T then
					local d
					m[6][m[5]]()
					return
				end
				local d
				I = A
				local d, m, m = #I == 0
				if d then
					T = _
					m = #T == 0
				else
					m = d
				end
				local H
				if m then
					V[6][V[5]]()
					return
				end
				m, a = os.clock(), A
				T = #a
				for H = T, 1, -1 do
					I = A
					P = I[H]
					d = P.Effect.Parent ~= o[6][o[5]] or m - P.Time >= P.Lifetime
					if d then
						local I
						l[6][l[5]](P, P.Effect.Parent == o[6][o[5]])
						table.remove(A, H)
					else
						local o
						E[6][E[5]](P, m)
					end
				end
				d = _
				T = #d
				for o = T, 1, -1 do
					P = _
					d = m - P[o].Time > 0.15
					if d then
						table.remove(_, o)
					end
				end
				a = A
				T, d = #a == 0
				if T then
					a = _
					d = #a == 0
				else
					d = T
				end
				if d then
					V[6][V[5]]()
				end
			end
		end
	end,
	L = function(P, T, o, d, m, A, _, V)
		if A <= 157 then
			local l = buffer.readu8(T, d + 1)
			return not not (l >= 128) and 60 or 122, d, m, V, l
		elseif A <= 158 then
			local A = buffer.readu8(T, d + 2)
			return not not (128 <= A) and 96 or 29, d, A, V, o
		else
			local A = buffer.readu8(T, d + 3)
			local P, T, l, E = 128 * (V - 128), o - 128, 16384 * (_ - 128), 2097152 * (A % 128)
			local _ = 2097152 * (A - A % 128) + T + P + (E + l)
			return 151, d + 4, m, _, o
		end
	end,
	[62] = function(P, P, P, P)
		return function(P, T, T)
			local T = buffer.writei8
			local o = P[2]
			local d = P[3]
			return function(P)
				local m
				local m = T
				if not m.Holder then
					return
				end
				local A
				m = o
				local o = m.CurrentCamera
				if not o then
					return
				end
				local A, _, V, l = o.CFrame.Position, Vector3.new(0.12, 1, 0.05).Unit, ipairs, T
				m = l.Drops
				for T, E in V(m) do
					T = E.Offset - _ * E.Speed * P
					l = T.Y < -15
					if l then
						local P
						T = d[6][d[5]]()
						T = Vector3.new(T.X, 55, T.Z)
					else
					end
					E.Offset = T
					o = A + T
					E.Top.WorldPosition = o + _ * 2.6
					E.Bottom.WorldPosition = o
				end
			end
		end
	end,
	P = function(P, T, o, d, m, A, _, V)
		if m <= 116 then
			local l = buffer.readu8(V, o)
			return l < 128 and 112 or 57, l, A, _
		elseif m <= 117 then
			local m, l, E = T[1], T[4], T[2]
			local a, I = m + l, l <= 0
			l, m = a >= E, a <= E
			E = I and l or not I and m
			T[1] = a
			if E then
				return 127, d, a, _
			else
				return 62, d, A, _
			end
		else
			local T = buffer.readu8(V, 1 + o)
			return 128 > T and 86 or 107, d, A, T
		end
	end,
	[82] = function(P, P, P, P)
		return function(P, T)
			local T = buffer.writei8
			local o = P[2]
			return function()
				local P
				local P = T[6][T[5]]
				if not P then
					return
				end
				local T
				P = o
				local T = P.Character
				P = T and (T:FindFirstChild("HumanoidRootPart"))
				if not P or not P:IsA("BasePart") then
					return
				end
				T = P.AssemblyLinearVelocity
				if Vector3.new(T.X, 0, T.Z).Magnitude < 0.25 then
					local o = os.clock() * 60 % 2 < 1 and 0.3 or -0.3
					P.AssemblyLinearVelocity = Vector3.new(T.X + o, T.Y, T.Z)
				end
			end
		end
	end,
	[26] = function(P, P, P, P)
		return function(P, T, T, T)
			local T = buffer.writei8
			local o = P[2]
			local d = P[3]
			return function(P, m, A)
				local _
				local _ = T
				local T = _.Settings.Aimbot
				if not T.SmartTrigger or not P then
					return A == nil or m >= A
				end
				local V
				_ = o
				local V, l = _.Player ~= P.Player
				if V then
					l = V
				else
					_ = o
					l = m - _.LastAt > 0.4
				end
				if l then
					local E, a, I = o, o, o
					E.Player = P.Player
					a.Since = m
					I.Best = 0
				end
				l = o
				l.LastAt = m
				if A and m < A then
					return false
				end
				local E
				_ = d
				V, l = _(P.HitChance, 1, 0, 1), d
				A, _ = l(T.MinHitChance, 70, 40, 95) / 100, d
				local d, E = _(T.MaxWait, 250, 0, 300) / 1000, o
				T, l =
					m - E.Since,
					P.LocalRootPosition and P.RootPosition and (P.RootPosition - P.LocalRootPosition).Magnitude or 1 / 0
				_ = V >= A or l < 10 or T >= d
				_ = if not _ and P.Airborne and P.VerticalPhase == "Apex" and V >= A * 0.85 then true else _
				T, P = o
				P, T.Best = o, math.max(o.Best, V)
				if _ then
					V, E = o, o
					V.Player = nil
					E.Best = 0
				end
				return _
			end
		end
	end,
	r = function(P, T, o, d, m, A, _, V)
		if A <= 75 then
			local l = buffer.readu8(o, m)
			return not not (l >= 128) and 64 or 50, V, d, l, T
		elseif A <= 76 then
			local A = buffer.readu8(o, m)
			return not (A < 128) and 8 or 4, V, d, _, A
		else
			return 73, d + 128 * (V - 128), m + 2, _, T
		end
	end,
	[61] = function(P, P, P, P)
		return function(P, T, T)
			local T = buffer.writei8
			local o = P[2]
			local d = P[3]
			return function()
				local P
				local P = T
				local m, A = not P.Alive
				if m then
					A = m
				else
					P = T
					A = not P.Settings.World.Enabled
				end
				P = nil
				if A then
					P = A
				else
					m = T
					P = not m.Settings.World.Animate
				end
				if P then
					return
				end
				A = os.clock()
				local T
				P = o[6][o[5]]
				if A < P then
					return
				end
				o[6][o[5]] = A + 0.03333333333333333
				local P
				d[6][d[5]]()
			end
		end
	end,
	[87] = string.format,
	I = function(P, T, o, d, m, A, _, V, l, E, a)
		if a <= 112 then
			if a <= 111 then
				l[_] = o
				return 140, _, m, T
			else
				return 104, 1 + _, m, T
			end
		elseif a <= 113 then
			o[A] = V
			return 74, _, m, T
		elseif a <= 114 then
			local o = buffer.readu8(d, 1 + _)
			return not (o < 128) and 65 or 71, _, m, o
		else
			local P, o, d = E[2], E[5], E[1]
			local A, V = P + o, o <= 0
			o, P = A >= d, A <= d
			d = V and o or not V and P
			E[2] = A
			if d then
				return 19, _, A, T
			else
				return 138, _, m, T
			end
		end
	end,
	T = function(P, T, o, d, m, A, _, V, l, E)
		if l <= 128 then
			if l <= 127 then
				local a = buffer.readu8(V, o)
				return not not (a >= 128) and 118 or 123, o, T, a, d, A
			else
				local a = buffer.readu8(V, 2 + m)
				return not (a < 128) and 95 or 22, o, a, E, d, A
			end
		elseif l <= 129 then
			return 83, 1 + o, T, E, d, A
		elseif l <= 130 then
			local m = buffer.readu8(V, o)
			return not (m < 128) and 157 or 26, o, T, E, m, A
		else
			local P = _ + 128 * (A - 128)
			return 161, o + 2, T, E, d, P
		end
	end,
	pH = function(P, P, T, o, d)
		if T <= 20 then
			local T = P + 128 * (o - 128)
			return 0, 2 + d, T
		else
			return 9, d, o
		end
	end,
	[15] = string.pack,
	[72] = bit32.bor,
	[36] = pcall,
	v = function(P, T, o, d, m, A, _, V)
		if V <= 30 then
			local V = buffer.readu8(d, 2 + A)
			if not not (128 <= V) then
				return 3, d, T, o, V
			else
				return 1, V, T, o, m
			end
		else
			local P = 16384 * (o - 128)
			local o = 128 * (m - 128) + (_ + P)
			return 124, d, 3 + T, o, m
		end
	end,
	VH = function(P, T, o, d, m, A, _)
		local V, l = buffer.readu8(m, T), T + 1
		buffer.fill(o, _ + d, V, A)
		return 10
	end,
	A = function(P, T, o, d, m, A, _, V, l, E, a, I)
		if d <= 46 then
			if d <= 45 then
				local H = buffer.readu8(m, I)
				return not (H >= 128) and 63 or 48, l, I, H, V, a
			else
				return 27, l[2], I, A, V, a
			end
		elseif d <= 47 then
			local H = 128 * (a - 128) + E
			return 54, l, 2 + I, A, V, H
		elseif d <= 48 then
			local d = buffer.readu8(m, I + 1)
			return not not (128 <= d) and 97 or 110, l, I, A, d, a
		else
			o[_] = T - T % 1
			return 42, l, I, A, V, a
		end
	end,
	[124] = bit32.rshift,
	[25] = getfenv,
	[1] = buffer.writei8,
	[109] = buffer.readu8,
	[101] = function(P, T, T, T)
		return function(T, o, o)
			local o = T[1]
			local d = T[2]
			return function(T)
				T = T or os.clock()
				local m
				local m = o
				local A = T >= m.NextAt
				if A then
					local _, V = bit32.bxor(367260184, 0), o
					_ = P:zH(_ + 320396318)
					V.NextAt = T + 0.25
					_ = P:zH(_ - 273117646)
					local P
					pcall(function()
						local _ = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue()
						local l = type(_) == "number" and _ > 0 and _ < 2000
						if l then
							P = _ / 1000
						end
					end)
					m = not P
					if m then
						local _
						local _, _, _, l = d, d, pcall(d.GetNetworkPing, d)
						V = _ and type(l) == "number" and l >= 0 and l < 2
						if V then
							P = l
						else
						end
					else
					end
					if P then
						local d, _ = o
						_, d.Value = o, d.Value + (P - o.Value) * 0.35
					end
				end
				A = o
				local P, d = A.Echo
				if P then
					A = o
					d = T - A.EchoAt < 90
				else
					d = P
				end
				if d then
					A, m = math.clamp, o
					local T, T = o, P + (m.Value - o.EchoPing)
					return A(T, 0, 0.6)
				end
				P = o
				return math.clamp(P.Value, 0, 0.6)
			end
		end
	end,
	[73] = Color3.new,
	D = function(P, T, o, d, m, A, _, V)
		if o <= 137 then
			local o = buffer.readu8(T, A + 3)
			local P, T, l, E, a = (_ - 128) * 128, V - 128, (d - 128) * 16384, o % 128 * 2097152, o % 128
			local d = 2097152 * (o - a)
			o = l + T + (E + (d + P))
			return 124, m, 4 + A, o
		else
			return 144, m[4], A, _
		end
	end,
	c = buffer.create(16),
	tH = function(P, T, o, d, m, A, _)
		if A <= 13 then
			local A = _[6]
			if not not A then
				return 21, A, m
			else
				return 18, d, m
			end
		else
			local m = buffer.readu8(T, o + 2)
			return not (128 <= m) and 4 or 19, d, m
		end
	end,
	i = function(P, ...)
		return (...)[...]
	end,
	[85] = coroutine.running,
	[108] = table.clear,
	[55] = buffer.readf32,
	sH = function(P, T, o, d, m, A, _, V, l)
		if V <= 1 then
			if V <= 0 then
				local E = buffer.readu8(d, A)
				return not not (128 <= E) and 25 or 32, A, l, T, E
			else
				local E = buffer.readu8(d, A + 1)
				return not not (E >= 128) and 27 or 20, A, l, T, E
			end
		elseif V <= 2 then
			local V = buffer.readu8(d, 3 + A)
			local P, d, E, a, I = 128 * (_ - 128), o - 128, (m - 128) * 16384, 2097152 * (V % 128), V % 128
			local o = (V - I) * 2097152
			V = P + d + (o + (E + a))
			return 17, 4 + A, l, T, V
		else
			local P = 128 * (T - 128) + _
			return 26, A, l + 2, P, _
		end
	end,
	CH = function(P, T, o, d, m, A, _, V)
		if m <= 22 then
			local m = buffer.readu8(o, _ + 3)
			local P, o, l, E, a = (V - 128) * 128, A - 128, (d - 128) * 16384, m % 128 * 2097152, m % 128
			local d = (m - a) * 2097152
			m = o + (P + l + (E + d))
			return 34, 4 + _, T, m
		else
			local P = 16384 * (T - 128) + (A + 128 * (V - 128))
			return 8, 3 + _, P, V
		end
	end,
	[79] = buffer.writeu16,
	[71] = string.byte,
	hH = function(P, T, o, d, m, A, _, V, l, E, a)
		if o <= 23 then
			if o <= 22 then
				return 7, d[3], A, _, a, V, E, l, T
			else
				local I = V + (a - 128) * 128
				return 17, d, A, 2 + _, I, V, E, l, T
			end
		elseif o <= 24 then
			local I = 16384 * (a - 128)
			local H = l + ((V - 128) * 128 + I)
			return 17, d, A, _ + 3, H, V, E, l, T
		elseif o <= 25 then
			local o = buffer.readu8(E, 1 + _)
			return not (o < 128) and 11 or 23, d, A, _, a, o, E, l, T
		else
			local T, o, V, l = (_ + A) % 256, buffer.create(m), _ * 16843009, m - m % 4
			local P, m = l - 1, 4 + 0
			return 35, { m, 0 - m, d, P + 0, nil }, T, _, 9, 181, o, V, l
		end
	end,
	M = function(P, T, o, d, m, A, _, V, l, E)
		if A <= 119 then
			local a = (_ - 128) * 16384
			local I = d + (128 * (E - 128) + a)
			return 76, V, 3 + o, I, m
		elseif A <= 120 then
			local d = buffer.readu8(l, 2 + o)
			return not not (d >= 128) and 159 or 156, V, o, _, d
		else
			local P = T + (o - 128) * 128
			return 15, V + 2, P, _, m
		end
	end,
	[125] = buffer.readi8,
	qH = function(P, T, o, d, m, A, _, V, l)
		if d <= 10 then
			if d <= 9 then
				local E = (V - 128) * 128 + o
				return 36, _, 2 + m, E, o
			else
				local E = buffer.readu8(_, m + 1)
				return not not (E >= 128) and 30 or 9, _, m, V, E
			end
		elseif d <= 11 then
			local P = 16384 * (V - 128) + (T + (o - 128) * 128)
			return 36, _, m + 3, P, o
		else
			local P = 16384 * (l - 128) + ((A - 128) * 128 + _)
			return 18, m + 3, P, V, o
		end
	end,
	JH = function(P, ...)
		local T, o, d, m, A, _, V, l, E, a, I = P:UH()
		local H, W, w, j, n, y, S, r, t, X, J = o, d, table.pack(...), m, A, _, V, l, E, a, I
		while T do
			if H <= 17 then
				if H <= 8 then
					if H <= 3 then
						l, E, V, a, m, d, o, _ = P:SH(r, t, j, W, S, n, y, H)
						if l == 2 then
							return j
						elseif l == 1 then
							H, W, j, n, S, r, t = E, V, a, m, d, o, _
						end
					elseif H <= 5 then
						H, j, y, r = P:HH(S, r, H, j, y, t)
					else
						H, W, S, r = P:KH(S, y, W, r, H, n, j)
					end
				elseif H <= 12 then
					H, j, y, t, X = P:qH(J, X, H, y, r, j, t, S)
				else
					I = table.pack(P:kH(n, j, W, H, X, S, r, t, y, P:vH(w)))
					local T, o, d, m, A, _, V, l, E = P:vH(I)
					H, W, j, n, y, S, r, t, X = T, o, d, m, A, _, V, l, E
				end
			elseif H <= 26 then
				if H <= 21 then
					H, j, y, S, t = P:lH(J, t, S, y, r, n, j, X, H)
				elseif H <= 23 then
					H, y, S, r = P:CH(S, j, X, H, t, y, r)
				else
					H, j, y, S, r, t = P:AH(y, r, t, S, j, H)
				end
			elseif H <= 31 then
				H, y, r, t, J = P:GH(J, r, t, y, j, H, W)
			else
				H, W, j, y, S = P:ZH(y, t, r, H, S, W, n, j)
			end
		end
	end,
	[8568] = function(P, T, T, o, d, m, A, _, V, l, l, E, a, I, I, H, W)
		local W, w, j, n, y, S, r, t, X, J, e, R, q, c, N, Q, D, K =
			table.create,
			P[25],
			bit32.band,
			bit32.rshift,
			bit32.lshift,
			table.move,
			table.pack,
			P[48],
			bit32.bxor,
			P[54],
			buffer.readu8,
			buffer.writeu32,
			buffer.readu32,
			buffer.writeu8,
			coroutine.wrap,
			P.yH,
			P[29],
			P[46]
		return function(s, k)
			local k, L, f, Y, M, u, v, h, z, C, O, i, x, Z, G, p, g, F =
				W, w, j, n, y, S, r, t, X, J, e, R, q, c, N, Q, D, K
			return function(...)
				local W
				local w, j, n, y, S = 1209516235
				local r, t, X, J, e, R, q, c, N, Q, D = 2868770281
				local K, B, b = L(), 1989811424, k(a)
				local a, L
				if E == 235 then
					a, L = I, E
					while true do
						local U = H[a]
						if U >= 38 then
							if U < 57 then
								if U < 47 then
									if U >= 42 then
										if U < 44 then
											if U == 43 then
												b[T[a]](l[a], b[d[a]])
											end
										elseif U >= 45 then
											if U == 46 then
												b[o[a]] = b[d[a]] * T[a]
											else
												b[T[a]] = b[d[a]] / o[a]
											end
										else
											b[T[a]] = o[a]
										end
									else
										if U >= 40 then
											if U ~= 41 then
												a = if b[d[a]] then o[a] else T[a]
											else
												b[o[a]][T[a]] = b[d[a]]
											end
										else
											if U ~= 39 then
												b[T[a]] = not b[d[a]]
											else
												local Pb, Tb, ob = o[a], _[a], d[a]
												local db, mb = f(Tb, 4294967295), f(ob, 4294967295)
												local Ab, _b, Vb, lb = f(db, 65535), Y(db, 16), f(mb, 65535), Y(mb, 16)
												Tb = f(Ab * Vb + M(f(Ab * lb + _b * Vb, 65535), 16), 4294967295)
												lb = nil
												repeat
													ob = Tb % 4294967296
													if ob ~= ob then
														lb = 0
														break
													end
													lb = ob - ob % 1
												until true
												b[Pb] = lb
											end
										end
									end
								else
									if U >= 52 then
										if U >= 54 then
											if U < 55 then
												b[T[a]] = m[a] + l[a]
											elseif U == 56 then
												b[d[a]] = b[T[a]] + o[a]
											else
												return b[d[a]]
											end
										else
											if U ~= 53 then
												a = if b[d[a]] <= T[a] then o[a] else a
											else
												b[T[a]] = b[d[a]][o[a]]
											end
										end
									else
										if U >= 49 then
											if U >= 50 then
												if U ~= 51 then
													W, X = o[a], d[a]
													y = { n = X - W + 1 }
													u(b, W, X, 1, y)
													b[T[a]] = y
												else
													W, X = o[a], b[T[a]]
													b[W + 1] = X
													b[W] = X[m[a]]
												end
											else
												local Pb, Tb, ob = d[a], _[a], b[o[a]]
												local db, mb = f(Tb, 4294967295), f(ob, 4294967295)
												local Tb, Ab, _b, Vb = f(db, 65535), Y(db, 16), f(mb, 65535), Y(mb, 16)
												ob = f(Tb * _b + M(f(Tb * Vb + Ab * _b, 65535), 16), 4294967295)
												mb = nil
												repeat
													Tb = ob % 4294967296
													if Tb ~= Tb then
														mb = 0
														break
													end
													mb = Tb - Tb % 1
												until true
												b[Pb] = mb
											end
										else
											if U == 48 then
												b[o[a]] = b[T[a]] == d[a]
											else
												W, X, y = T[a], d[a], o[a]
												c = b[W]
												u(b, W + 1, W + X, y + 1, c)
											end
										end
									end
								end
							else
								if U >= 66 then
									if U < 71 then
										if U < 68 then
											if U ~= 67 then
												W, X, y = o[a], d[a], T[a]
												c, J, Q = W + y - 1, W + X, v(b[W](h(b, W + 1, W + X)))
												u(Q, 1, y, W, b)
											else
												W = s[o[a]]
												W[6][W[5]][b[d[a]]] = b[T[a]]
											end
										else
											if U >= 69 then
												if U ~= 70 then
													b[T[a]] = b[d[a]] / b[o[a]]
												else
													b[T[a]] = k(o[a])
												end
											else
												b[d[a]](b[T[a]])
											end
										end
									else
										if U < 73 then
											if U == 72 then
												a = b[d[a]]
											else
												W = s[T[a]]
												W[6][W[5]][b[o[a]]] = m[a]
											end
										else
											if U < 74 then
												b[T[a]](b[o[a]], h(b[d[a]], 1, b[d[a]].n))
											elseif U ~= 75 then
												b[T[a]] = P[d[a]]
											else
												b[T[a]] = b[o[a]] % m[a]
											end
										end
									end
								else
									if U < 61 then
										if U >= 59 then
											if U ~= 60 then
												W = s[o[a]]
												b[d[a]] = W[6][W[5]][b[T[a]]]
											else
												b[o[a]] = d[a] * b[T[a]]
											end
										else
											if U == 58 then
												b[d[a]] = b[T[a]] + b[o[a]]
											else
												b[d[a]] = -b[T[a]]
											end
										end
									else
										if U >= 63 then
											if U < 64 then
												b[d[a]] = b[o[a]]
											elseif U == 65 then
												b[T[a]] = b[o[a]](m[a])
											else
												b[T[a]] = T
											end
										else
											if U ~= 62 then
												b[o[a]][b[T[a]]] = b[d[a]]
											else
												X, W = o[a], d[a] + 1
												for Pb = 1, T[a], 1 do
													X = f(z(X, (M(X, 13))), 536870911)
													X = z(X, (Y(X, 13)))
													X = f(z(X, (M(X, 14))), 536870911)
													o[W] = z(o[W], (f(Y(X, 0), 127)))
													d[W] = z(d[W], (f(Y(X, 7), 127)))
													T[W] = z(T[W], (f(Y(X, 14), 127)))
													H[W] = z(H[W], (f(Y(X, 21), 127)))
													W = W + 1
												end
												H[a] = 42
											end
										end
									end
								end
							end
						else
							if U >= 19 then
								if U < 28 then
									if U < 23 then
										if U < 21 then
											if U ~= 20 then
												b[T[a]] = #b[o[a]]
											else
												b[T[a]] = m[a]
											end
										elseif U == 22 then
											b[T[a]] = b[d[a]] % o[a]
										else
											b[d[a]]()
										end
									elseif U >= 25 then
										if U >= 26 then
											if U ~= 27 then
												b[o[a]] = b[T[a]][m[a]]
											else
												b[T[a]] = V
											end
										else
											b[d[a]] = K[l[a]]
										end
									elseif U == 24 then
										b[d[a]] = b[T[a]][b[o[a]]]
									else
										b[o[a]] = s[d[a]]
									end
								else
									if U < 33 then
										if U >= 30 then
											if U < 31 then
												b[d[a]] = b[T[a]] // b[o[a]]
											elseif U == 32 then
												b[d[a]] = b[T[a]] * b[o[a]]
											else
												b[d[a]] = b[T[a]](h(b[o[a]], 1, b[o[a]].n))
											end
										else
											if U == 29 then
												W = s[o[a]]
												b[T[a]] = W[6][W[5]][m[a]]
											else
												b[o[a]] = b[T[a]] >= b[d[a]]
											end
										end
									else
										if U >= 35 then
											if U >= 36 then
												if U == 37 then
													b[d[a]](b[o[a]], b[T[a]])
												else
													W, X, y = T[a], { ... }, d[a]
													u(X, 1, W - 1, y, b)
													b[y + W - 1] = v(C(W, ...))
												end
											else
												b[d[a]](l[a], _[a])
											end
										else
											if U ~= 34 then
												local C, Pb, Tb = T[a], d[a], V[5]
												local ob = z(Tb[C], 43364404)
												Tb[C] = ob
												Tb, C = V[4], ob + 1
												ob = O(Tb, C)
												local db, mb
												if ob < 128 then
													db, mb = ob, C + 1
												else
													local Ab = O(Tb, C + 1)
													if Ab < 128 then
														db, mb = (ob - 128) * 128 + Ab, C + 2
													else
														local _b = O(Tb, C + 2)
														if _b < 128 then
															db, mb = (ob - 128) * 16384 + (Ab - 128) * 128 + _b, C + 3
														else
															local Vb = O(Tb, C + 3)
															db, mb =
																(ob - 128) * 128
																	+ (Ab - 128)
																	+ (_b - 128) * 16384
																	+ Vb % 128 * 2097152
																	+ (Vb - Vb % 128) * 2097152,
																C + 4
														end
													end
												end
												C, ob = Pb * 16843009, mb + db
												local Ab = ob - db % 4
												for db = mb, Ab - 1, 4 do
													i(Tb, db, (z(x(Tb, db), C)))
												end
												for C = Ab, ob - 1, 1 do
													Z(Tb, C, (z(O(Tb, C), Pb)))
												end
												T[a] = 188
												d[a] = 60
												o[a] = 213
												H[a] = 42
											else
												b[o[a]] = b[T[a]] < d[a]
											end
										end
									end
								end
							else
								if U < 9 then
									if U >= 4 then
										if U < 6 then
											if U ~= 5 then
												b[T[a]] = b[d[a]] <= o[a]
											else
												a = T[a]
											end
										else
											local C = a
											if U < 7 then
												L = T[C]
												a = o[C] + 1
												break
											elseif U ~= 8 then
												b[d[C]] = b[T[C]]()
											else
												W = s[d[C]]
												b[T[C]] = W[6][W[5]]
											end
										end
									else
										if U < 2 then
											if U == 1 then
												b[T[a]] = b[o[a]] - b[d[a]]
											else
												W = s[T[a]]
												W[6][W[5]] = l[a]
											end
										else
											if U ~= 3 then
												b[o[a]] = b[T[a]] <= b[d[a]]
											else
												b[T[a]] = b[o[a]](b[d[a]])
											end
										end
									end
								else
									if U < 14 then
										if U < 11 then
											if U ~= 10 then
												W = T[a]
												X, y, c = b[W], b[W + 1], b[W + 2]
												b[W] = X(y, c)
											else
												W, X = { ... }, d[a]
												u(W, 1, T[a], X, b)
											end
										else
											if U < 12 then
												b[T[a]](l[a])
											elseif U == 13 then
												b[o[a]] = b[d[a]] == b[T[a]]
											else
												b[T[a]](b[d[a]], l[a])
											end
										end
									else
										if U < 16 then
											if U ~= 15 then
												W = s[o[a]]
												W[6][W[5]][_[a]] = b[d[a]]
											else
												b[o[a]] = d[a] - b[T[a]]
											end
										else
											if U < 17 then
												b[d[a]] = {}
											else
												if U ~= 18 then
													W, X, y = T[a], o[a], d[a]
													c = W + X
													b[W] = v(b[W](h(b, W + 1, c)))
												else
													W = s[T[a]]
													W[6][W[5]] = b[o[a]]
												end
											end
										end
									end
								end
							end
						end
						a = a + 1
					end
				else
					a, L = I, E
				end
				if L == 242 then
					while true do
						local E = H[a]
						if E < 59 then
							if E < 29 then
								if E >= 14 then
									if E < 21 then
										if E >= 17 then
											if E >= 19 then
												if E ~= 20 then
													b[T[a]] = b[o[a]]
													W = T[a + 1]
													X, y, c = b[W], b[W + 1], b[W + 2]
													b[W] = X(y, c)
													a = a + 1
												else
													b[o[a]] = b[T[a]] * d[a]
												end
											else
												if E == 18 then
													b[T[a]] = b[d[a]] == l[a]
												else
													a = if b[T[a]] < d[a] then o[a] else a
												end
											end
										else
											if E < 15 then
												local I, C, U = o[a], b[T[a]]
												repeat
													local Pb = C % 4294967296
													if Pb ~= Pb then
														U = 0
														break
													end
													U = Pb - Pb % 1
												until true
												b[I] = U
											elseif E == 16 then
												b[T[a]] = b[d[a]] > o[a]
											else
												local I, C, U = d[a], b[T[a]], l[a]
												local Pb, Tb = f(C, 4294967295), f(U, 4294967295)
												local ob, db, mb, Ab = f(Pb, 65535), Y(Pb, 16), f(Tb, 65535), Y(Tb, 16)
												C = f(ob * mb + M(f(ob * Ab + db * mb, 65535), 16), 4294967295)
												Pb = nil
												repeat
													U = C % 4294967296
													if U ~= U then
														Pb = 0
														break
													end
													Pb = U - U % 1
												until true
												b[I] = Pb
											end
										end
									else
										if E < 25 then
											if E < 23 then
												if E == 22 then
													b[T[a]] = b[o[a]] * m[a]
												else
													b[d[a]] = b[o[a]] / T[a]
												end
											else
												if E == 24 then
													X, W = (z(o[a], (f(z(w, (f(Y(w, 29), 7))), 536870911)))), d[a] + 1
													for I = 1, T[a], 1 do
														X = f(z(X, (M(X, 13))), 536870911)
														X = z(X, (Y(X, 13)))
														X = f(z(X, (M(X, 14))), 536870911)
														d[W] = z(d[W], (f(Y(X, 0), 127)))
														o[W] = z(o[W], (f(Y(X, 7), 127)))
														T[W] = z(T[W], (f(Y(X, 14), 127)))
														H[W] = z(H[W], (f(Y(X, 21), 127)))
														W = W + 1
													end
													H[a] = 55
												else
													W = s[o[a]]
													W[6][W[5]][b[d[a]]] = b[T[a]]
												end
											end
										else
											if E < 27 then
												if E ~= 26 then
													b[d[a]] = l[a]
												else
													b[d[a]] = b[o[a]](_[a])
												end
											else
												if E ~= 28 then
													t, W, X = { [7] = t, [9] = S, [8] = e, [6] = R }, T[a], G(p)
													X(P, b[W], b[W + 1], b[W + 2])
													a, R = d[a], X
												else
													W, X, y, c =
														d[a], T[a], z(r, f(Y(r, 14), 262143), (f(Y(r, 28), 15))), o[a]
													J = W < 2097152 and 7 or 14
													Q, n = Y(W, J), f(W, M(1, J) - 1)
													H[a] = z(Q, 97, (f(Y(y, 21), 127)))
													d[a] = z(n, 1, (f(y, 127)))
													T[a] = z(X, 71, (f(Y(y, 14), 127)))
													o[a] = z(c, 15, (f(Y(y, 7), 127)))
													a = a - 1
												end
											end
										end
									end
								else
									if E >= 7 then
										if E >= 10 then
											if E < 12 then
												if E ~= 11 then
													b[T[a]] = b[d[a]] // o[a]
												else
													b[o[a]](b[d[a]], _[a])
												end
											elseif E == 13 then
												b[T[a]] = P[d[a]]
											else
												b[d[a]] = d
											end
										else
											if E < 8 then
												W = s[d[a]]
												W[6][W[5]] = b[o[a]]
											else
												if E == 9 then
													b[T[a]](b[d[a]])
												else
													a = if b[d[a]] then o[a] else T[a]
												end
											end
										end
									else
										if E < 3 then
											if E < 1 then
												b[T[a]] = b[o[a]]
											elseif E ~= 2 then
												local I = o[a]
												if N then
													local C = N[I]
													if C then
														C[6] = C
														C[4] = b[I]
														C[5] = 4
														N[I] = nil
													end
												end
											else
												b[T[a]] = b[d[a]] < b[o[a]]
											end
										else
											if E < 5 then
												if E ~= 4 then
													b[d[a]](b[T[a]], b[o[a]])
												else
													b[T[a]] = b[d[a]] == o[a]
												end
											else
												if E ~= 6 then
													a = d[a]
												else
													W, X = T[a], b[o[a]]
													b[W + 1] = X
													b[W] = X[m[a]]
												end
											end
										end
									end
								end
							else
								if E < 44 then
									if E < 36 then
										if E < 32 then
											if E >= 30 then
												if E ~= 31 then
													local I, C, U = d[a], T[a], b[o[a]]
													local Pb, Tb = f(C, 4294967295), f(U, 4294967295)
													local C, ob, db, mb =
														f(Pb, 65535), Y(Pb, 16), f(Tb, 65535), Y(Tb, 16)
													U = f(C * db + M(f(C * mb + ob * db, 65535), 16), 4294967295)
													Tb = nil
													repeat
														db = U % 4294967296
														if db ~= db then
															Tb = 0
															break
														end
														Tb = db - db % 1
													until true
													b[I] = Tb
												else
													b[o[a]] = b[T[a]] < d[a]
												end
											else
												b[T[a]][o[a]] = b[d[a]]
											end
										elseif E >= 34 then
											if E == 35 then
												b[o[a]] = B
											else
												b[o[a]] = m[a] == _[a]
											end
										elseif E ~= 33 then
											local I, C, U = d[a], l[a], T[a]
											local Pb, Tb = f(C, 4294967295), f(U, 4294967295)
											local C, U, ob, db = f(Pb, 65535), Y(Pb, 16), f(Tb, 65535), Y(Tb, 16)
											Tb = f(C * ob + M(f(C * db + U * ob, 65535), 16), 4294967295)
											Pb = nil
											repeat
												U = Tb % 4294967296
												if U ~= U then
													Pb = 0
													break
												end
												Pb = U - U % 1
											until true
											b[I] = Pb
										else
											b[o[a]] = _[a] + b[d[a]]
										end
									elseif E < 40 then
										if E >= 38 then
											if E == 39 then
												b[d[a]] = b[T[a]] == b[o[a]]
											else
												b[d[a]][l[a]] = b[T[a]]
											end
										elseif E ~= 37 then
											local I, C, U = o[a], _[a], m[a]
											local Pb, Tb = f(C, 4294967295), f(U, 4294967295)
											local C, U, ob, db = f(Pb, 65535), Y(Pb, 16), f(Tb, 65535), Y(Tb, 16)
											Pb = f(C * ob + M(f(C * db + U * ob, 65535), 16), 4294967295)
											U = nil
											repeat
												ob = Pb % 4294967296
												if ob ~= ob then
													U = 0
													break
												end
												U = ob - ob % 1
											until true
											b[I] = U
										else
											if N then
												for I in g, N, nil do
													if N then
														local C = N[I]
														if C then
															C[6] = C
															C[4] = b[I]
															C[5] = 4
															N[I] = nil
														end
													end
												end
											end
											if q then
												for I, C in g, q, nil do
													local U = C[4]
													if q then
														local C = q[I]
														if C then
															local Pb = k(U)
															u(b, I, I + U - 1, 1, Pb)
															C[6] = Pb
															C[5] = 1
															q[I] = nil
														end
													end
												end
											end
											return b[o[a]]
										end
									elseif E < 42 then
										if E == 41 then
											b[d[a]] = b[o[a]] <= b[T[a]]
										else
											b[o[a]] = d[a] - b[T[a]]
										end
									elseif E ~= 43 then
										b[d[a]] = o[a] + b[T[a]]
									else
										b[o[a]] = T[a] * b[d[a]]
									end
								else
									if E >= 51 then
										if E < 55 then
											if E >= 53 then
												if E ~= 54 then
													b[d[a]] = T[a]
													b[T[a + 1]] = b[o[a + 1]]
													a += 1
												else
													b[o[a]] = b[d[a]] - b[T[a]]
												end
											else
												if E == 52 then
													W, X, y = T[a], o[a], d[a]
													c = W + X
													b[W] = v(b[W](h(b, W + 1, c)))
												else
													b[T[a]] = o
												end
											end
										else
											if E < 57 then
												if E ~= 56 then
												else
													W, X, y = d[a], o[a], T[a]
													c, J, Q = W + y - 1, W + X, v(b[W](h(b, W + 1, W + X)))
													u(Q, 1, y, W, b)
												end
											else
												if E ~= 58 then
													W = s[d[a]]
													W[6][W[5]] = l[a]
												else
													b[T[a]] = b[o[a]]()
												end
											end
										end
									else
										if E < 47 then
											if E >= 45 then
												if E ~= 46 then
													local I, C = l[a]
													if I then
														local U = #I / 3
														if U > 0 then
															C = {}
															local Pb, Tb = N, q
															for ob = 1, U, 1 do
																local U = (ob - 1) * 3
																local db, mb = I[U + 3], I[U + 2]
																if db == 1 then
																	Pb = if not Pb then {} else Pb
																	local Ab = Pb[mb]
																	if not Ab then
																		Ab = { [5] = mb, [6] = b }
																		Pb[mb] = Ab
																	else
																	end
																	C[ob] = Ab
																else
																	if db == 0 then
																		C[ob] = b[mb]
																	else
																		if db == 2 then
																			C[ob] = s[mb]
																		else
																			if db == 3 then
																				Tb = if not Tb then {} else Tb
																				local db = Tb[mb]
																				if not db then
																					db =
																						{ [6] = b, [5] = mb, [4] = I[U + 1] }
																					Tb[mb] = db
																				else
																				end
																				C[ob] = db
																			else
																			end
																		end
																	end
																end
															end
															N, q = Pb, Tb
														else
														end
													else
													end
													X = m[a](C)
													F(X, K)
													b[T[a]] = X
													W = C
												else
													local I, C, U = d[a], b[T[a]], o[a]
													local Pb, Tb = f(C, 4294967295), f(U, 4294967295)
													local U, ob, db, mb =
														f(Pb, 65535), Y(Pb, 16), f(Tb, 65535), Y(Tb, 16)
													Pb = f(U * db + M(f(U * mb + ob * db, 65535), 16), 4294967295)
													U = nil
													repeat
														C = Pb % 4294967296
														if C ~= C then
															U = 0
															break
														end
														U = C - C % 1
													until true
													b[I] = U
												end
											else
												b[T[a]] = b[o[a]] // b[d[a]]
											end
										else
											if E < 49 then
												if E == 48 then
													if N then
														for I in g, N, nil do
															if N then
																local C = N[I]
																if C then
																	C[6] = C
																	C[4] = b[I]
																	C[5] = 4
																	N[I] = nil
																end
															end
														end
													end
													if q then
														for I, C in g, q, nil do
															local U = C[4]
															if q then
																local C = q[I]
																if C then
																	local Pb = k(U)
																	u(b, I, I + U - 1, 1, Pb)
																	C[6] = Pb
																	C[5] = 1
																	q[I] = nil
																end
															end
														end
													end
													return
												else
													b[d[a]] = b[T[a]] >= o[a]
												end
											else
												if E ~= 50 then
													w = b[T[a]]
												else
													b[d[a]] = T[a]
												end
											end
										end
									end
								end
							end
						else
							if E < 89 then
								if E < 74 then
									if E >= 66 then
										if E < 70 then
											if E >= 68 then
												if E == 69 then
													b[o[a]] = b[T[a]][m[a]]
												else
													b[d[a]] = b[o[a]] > b[T[a]]
												end
											elseif E == 67 then
												local I, C, U = d[a], b[T[a]], b[o[a]]
												local Pb, Tb = f(C, 4294967295), f(U, 4294967295)
												local C, U, ob, db = f(Pb, 65535), Y(Pb, 16), f(Tb, 65535), Y(Tb, 16)
												Tb = f(C * ob + M(f(C * db + U * ob, 65535), 16), 4294967295)
												db = nil
												repeat
													ob = Tb % 4294967296
													if ob ~= ob then
														db = 0
														break
													end
													db = ob - ob % 1
												until true
												b[I] = db
											else
												b[d[a]] = b[T[a]][b[o[a]]]
											end
										else
											if E < 72 then
												if E == 71 then
													W = T[a]
													X, y, c = b[W], b[W + 1], b[W + 2]
													b[W] = X(y, c)
												else
													local I, C, U =
														d[a], z(o[a], (f(z(w, (f(Y(w, 29), 7))), 536870911))), V[5]
													local Pb = z(U[I], 43364404)
													U[I] = Pb
													I, U = V[4], Pb + 1
													Pb = O(I, U)
													local Tb, ob
													if Pb < 128 then
														Tb, ob = Pb, U + 1
													else
														local db = O(I, U + 1)
														if db < 128 then
															Tb, ob = (Pb - 128) * 128 + db, U + 2
														else
															local mb = O(I, U + 2)
															if mb < 128 then
																Tb, ob =
																	(Pb - 128) * 16384 + (db - 128) * 128 + mb, U + 3
															else
																local Ab = O(I, U + 3)
																Tb, ob =
																	(Pb - 128) * 128
																		+ (db - 128)
																		+ (mb - 128) * 16384
																		+ Ab % 128 * 2097152
																		+ (Ab - Ab % 128) * 2097152,
																	U + 4
															end
														end
													end
													Pb, U = C * 16843009, ob + Tb
													local db = U - Tb % 4
													for Tb = ob, db - 1, 4 do
														i(I, Tb, (z(x(I, Tb), Pb)))
													end
													for Pb = db, U - 1, 1 do
														Z(I, Pb, (z(O(I, Pb), C)))
													end
													d[a] = 26
													o[a] = 240
													T[a] = 140
													H[a] = 55
												end
											else
												if E ~= 73 then
													b[d[a]] = b[T[a]] + b[o[a]]
												else
													b[d[a]] = #b[T[a]]
												end
											end
										end
									else
										if E < 62 then
											if E < 60 then
												b[T[a]] = k(d[a])
											else
												a = if E == 61 then b[d[a]] else if b[d[a]] == T[a] then o[a] else a
											end
										else
											if E < 64 then
												if E ~= 63 then
													local I, C, U = o[a], m[a], b[T[a]]
													local Pb, Tb = f(C, 4294967295), f(U, 4294967295)
													local C, ob, db, mb =
														f(Pb, 65535), Y(Pb, 16), f(Tb, 65535), Y(Tb, 16)
													U = f(C * db + M(f(C * mb + ob * db, 65535), 16), 4294967295)
													Tb = nil
													repeat
														ob = U % 4294967296
														if ob ~= ob then
															Tb = 0
															break
														end
														Tb = ob - ob % 1
													until true
													b[I] = Tb
												else
													P[d[a]] = b[o[a]]
												end
											else
												if E ~= 65 then
													X, W = T[a], d[a] + 1
													for I = 1, o[a], 1 do
														X = f(z(X, (M(X, 13))), 536870911)
														X = z(X, (Y(X, 13)))
														X = f(z(X, (M(X, 14))), 536870911)
														d[W] = z(d[W], (f(Y(X, 0), 127)))
														o[W] = z(o[W], (f(Y(X, 7), 127)))
														T[W] = z(T[W], (f(Y(X, 14), 127)))
														H[W] = z(H[W], (f(Y(X, 21), 127)))
														W = W + 1
													end
													H[a] = 55
												else
													a = if b[d[a]] <= o[a] then T[a] else a
												end
											end
										end
									end
								else
									if E >= 81 then
										if E >= 85 then
											if E >= 87 then
												if E ~= 88 then
													local I, C, U = o[a], d[a], V[5]
													local Pb = z(U[I], 43364404)
													U[I] = Pb
													I, U = V[4], Pb + 1
													Pb = O(I, U)
													local Tb, ob
													if Pb < 128 then
														Tb, ob = Pb, U + 1
													else
														local db = O(I, U + 1)
														if db < 128 then
															Tb, ob = (Pb - 128) * 128 + db, U + 2
														else
															local mb = O(I, U + 2)
															if mb < 128 then
																Tb, ob =
																	(Pb - 128) * 16384 + (db - 128) * 128 + mb, U + 3
															else
																local Ab = O(I, U + 3)
																Tb, ob =
																	(Pb - 128) * 128
																		+ (db - 128)
																		+ (mb - 128) * 16384
																		+ Ab % 128 * 2097152
																		+ (Ab - Ab % 128) * 2097152,
																	U + 4
															end
														end
													end
													Pb, U = C * 16843009, ob + Tb
													local db = U - Tb % 4
													for Tb = ob, db - 1, 4 do
														i(I, Tb, (z(x(I, Tb), Pb)))
													end
													for Pb = db, U - 1, 1 do
														Z(I, Pb, (z(O(I, Pb), C)))
													end
													o[a] = 172
													d[a] = 170
													T[a] = 130
													H[a] = 55
												else
													b[o[a]] = b[T[a]] * b[d[a]]
												end
											elseif E ~= 86 then
												b[d[a]] = b[o[a]] - _[a]
											else
												b[T[a]] = m[a] + l[a]
											end
										else
											if E >= 83 then
												if E ~= 84 then
													local I, C, U =
														d[a], z(o[a], (f(z(r, (f(Y(r, 29), 7))), 536870911))), V[5]
													local Pb = z(U[I], 43364404)
													U[I] = Pb
													U, I = V[4], Pb + 1
													Pb = O(U, I)
													local Tb, ob
													if Pb < 128 then
														Tb, ob = Pb, I + 1
													else
														local db = O(U, I + 1)
														if db < 128 then
															Tb, ob = (Pb - 128) * 128 + db, I + 2
														else
															local mb = O(U, I + 2)
															if mb < 128 then
																Tb, ob =
																	(Pb - 128) * 16384 + (db - 128) * 128 + mb, I + 3
															else
																local Ab = O(U, I + 3)
																Tb, ob =
																	(Pb - 128) * 128
																		+ (db - 128)
																		+ (mb - 128) * 16384
																		+ Ab % 128 * 2097152
																		+ (Ab - Ab % 128) * 2097152,
																	I + 4
															end
														end
													end
													I, Pb = C * 16843009, ob + Tb
													local db = Pb - Tb % 4
													for Tb = ob, db - 1, 4 do
														i(U, Tb, (z(x(U, Tb), I)))
													end
													for I = db, Pb - 1, 1 do
														Z(U, I, (z(O(U, I), C)))
													end
													d[a] = 110
													o[a] = 18
													T[a] = 124
													H[a] = 55
												else
													b[T[a]] = b[o[a]]
													b[T[a + 1]] = b[o[a + 1]]
													a += 1
												end
											else
												if E ~= 82 then
													b[d[a]] = r
												else
													b[T[a]]()
												end
											end
										end
									else
										if E >= 77 then
											if E < 79 then
												if E == 78 then
													b[o[a]] = w
												else
													b[d[a]] = b[o[a]] - T[a]
												end
											elseif E ~= 80 then
												b[d[a]] = b[o[a]] + _[a]
											else
												b[d[a]] = P[_[a]]
											end
										else
											if E >= 75 then
												if E == 76 then
													a = if T[a] < b[o[a]] then d[a] else a
												else
													b[o[a]] = b[T[a]] + d[a]
												end
											else
												b[o[a]](_[a], m[a])
											end
										end
									end
								end
							else
								if E >= 104 then
									if E < 111 then
										if E < 107 then
											if E >= 105 then
												if E ~= 106 then
													W, X, y, c =
														o[a], T[a], d[a], z(r, f(Y(r, 14), 262143), (f(Y(r, 28), 15)))
													J = y < 16384 and 7 or (y < 2097152 and 14 or 21)
													Q, n = Y(y, J), f(y, M(1, J) - 1)
													H[a] = z(Q, 114, (f(Y(c, 21), 127)))
													o[a] = z(W, 14, (f(Y(c, 7), 127)))
													d[a] = z(n, 103, (f(c, 127)))
													T[a] = z(X, 20, (f(Y(c, 14), 127)))
													a = a - 1
												else
													b[T[a]] = b[o[a]](h(b[d[a]], 1, b[d[a]].n))
												end
											else
												b[o[a]] = m[a] % b[T[a]]
											end
										else
											if E >= 109 then
												if E ~= 110 then
													X, W = (z(o[a], (f(z(r, (f(Y(r, 29), 7))), 536870911)))), d[a] + 1
													for I = 1, T[a], 1 do
														X = f(z(X, (M(X, 13))), 536870911)
														X = z(X, (Y(X, 13)))
														X = f(z(X, (M(X, 14))), 536870911)
														d[W] = z(d[W], (f(Y(X, 0), 127)))
														o[W] = z(o[W], (f(Y(X, 7), 127)))
														T[W] = z(T[W], (f(Y(X, 14), 127)))
														H[W] = z(H[W], (f(Y(X, 21), 127)))
														W = W + 1
													end
													H[a] = 55
												else
													b[d[a]] = b[T[a]][o[a]]
												end
											else
												if E ~= 108 then
													R, S, e = t[6], t[9], t[8]
													t = t[7]
												else
													b[d[a]] = P
												end
											end
										end
									else
										if E < 115 then
											if E < 113 then
												if E == 112 then
													b[T[a]][b[d[a]]] = o[a]
												else
													W = T[a]
													local I, C, U = R()
													if I then
														b[W + 1] = C
														b[W + 2] = U
														a = o[a]
													else
													end
													X, y, c = I, C, U
												end
											else
												if E ~= 114 then
													b[d[a]] = b[T[a]] <= o[a]
												else
													b[o[a]] = not b[d[a]]
												end
											end
										else
											local I = a
											if E < 117 then
												if E ~= 116 then
													L = T[I]
													a = d[I] + 1
													break
												else
													W = s[T[I]]
													W[6][W[5]][b[d[I]]] = o[I]
												end
											else
												if E == 118 then
													W = T[I]
													X, y, c, J = b[W], b[W + 1], b[W + 2], b[W + 3]
													b[W] = X(y, c, J)
												else
													B = b[T[I]]
												end
											end
										end
									end
								else
									if E < 96 then
										if E < 92 then
											if E >= 90 then
												if E == 91 then
													W, X, y = T[a], o[a], d[a]
													c = b[W]
													u(b, W + 1, W + X, y + 1, c)
												else
													b[d[a]] = b[T[a]] >= l[a]
												end
											else
												W = s[d[a]]
												b[T[a]] = W[6][W[5]]
											end
										else
											if E < 94 then
												if E == 93 then
													b[o[a]] = H
												else
													b[o[a]] = b[d[a]] >= b[T[a]]
												end
											else
												if E == 95 then
													W = s[T[a]]
													b[d[a]] = W[6][W[5]][b[o[a]]]
												else
													r = b[T[a]]
												end
											end
										end
									else
										if E >= 100 then
											if E >= 102 then
												if E == 103 then
													b[d[a]] = b[T[a]] % o[a]
												else
													b[o[a]] = b[d[a]](b[T[a]])
												end
											else
												if E ~= 101 then
													b[T[a]] = P[d[a]]
													b[d[a + 1]] = T[a + 1]
													a += 1
												else
													b[d[a]] = {}
												end
											end
										else
											if E < 98 then
												if E == 97 then
													b[d[a]] = -b[T[a]]
												else
													b[o[a]] = b[T[a]] % b[d[a]]
												end
											elseif E ~= 99 then
												b[o[a]][b[d[a]]] = b[T[a]]
											else
												b[o[a]] = b[d[a]] ~= T[a]
											end
										end
									end
								end
							end
						end
						a = a + 1
					end
				else
				end
				if L == 43 then
					while true do
						local E = o[a]
						if E >= 59 then
							if E < 89 then
								if E >= 74 then
									if E >= 81 then
										if E >= 85 then
											if E >= 87 then
												if E ~= 88 then
													W, X, y = H[a], d[a], T[a]
													c = W + X
													J = b[c]
													Q = J.n
													n = X + Q - 1
													J.n = n
													u(J, 1, Q, X, J)
													u(b, W + 1, c - 1, 1, J)
													b[W] = v(b[W](h(J, 1, J.n)))
												else
													b[H[a]] = b[T[a]] - m[a]
												end
											else
												if E == 86 then
													W = s[d[a]]
													b[H[a]] = W[6][W[5]][b[T[a]]]
												else
													b[H[a]] = b
												end
											end
										else
											if E < 83 then
												if E ~= 82 then
													R, S, e = t[6], t[9], t[8]
													t = t[7]
												else
													W, X, y = H[a], d[a], T[a]
													c, J = W + y - 1, W + X
													Q = b[J]
													n = Q.n
													D = X + n - 1
													Q.n = D
													u(Q, 1, n, X, Q)
													u(b, W + 1, J - 1, 1, Q)
													j = v(b[W](h(Q, 1, Q.n)))
													u(j, 1, y, W, b)
												end
											else
												if E ~= 84 then
													a = if b[T[a]] <= H[a] then d[a] else a
												else
													B = b[T[a]]
												end
											end
										end
									else
										if E >= 77 then
											if E < 79 then
												if E == 78 then
													b[T[a]] = {}
												else
													W = H[a]
													local I, C, U = R()
													if I then
														b[W + 1] = C
														b[W + 2] = U
														a = T[a]
													else
													end
													X, y, c = I, C, U
												end
											else
												if E == 80 then
													b[T[a]] = b[H[a]] - b[d[a]]
												else
													b[d[a]] = b[T[a]]()
												end
											end
										else
											if E < 75 then
												b[d[a]] = _[a]
											else
												if E == 76 then
													W = s[H[a]]
													W[6][W[5]] = b[T[a]]
												else
													b[T[a]] = b[H[a]] * b[d[a]]
												end
											end
										end
									end
								else
									if E >= 66 then
										if E < 70 then
											if E >= 68 then
												if E ~= 69 then
													b[T[a]] = K[m[a]]
												else
													local I, C, U = H[a], b[d[a]]
													repeat
														local Pb = C % 4294967296
														if Pb ~= Pb then
															U = 0
															break
														end
														U = Pb - Pb % 1
													until true
													b[I] = U
												end
											else
												if E == 67 then
													a = H[a]
												else
													b[d[a]] = r
												end
											end
										else
											if E < 72 then
												if E == 71 then
													b[d[a]] = b[H[a]] ~= T[a]
												else
													a = if b[d[a]] == H[a] then T[a] else a
												end
											else
												if E == 73 then
													b[H[a]] = d[a] + b[T[a]]
												else
													W = b[H[a]]
													b[T[a]] = v(h(W, d[a], W.n))
												end
											end
										end
									else
										if E < 62 then
											if E >= 60 then
												if E == 61 then
													b[T[a]] = b[d[a]] * H[a]
												else
													W, X, y, c =
														d[a], H[a], T[a], z(r, f(Y(r, 14), 262143), (f(Y(r, 28), 15)))
													J = X < 2097152 and 7 or 14
													Q, n = Y(X, J), f(X, M(1, J) - 1)
													o[a] = z(Q, 6, (f(Y(c, 21), 127)))
													d[a] = z(W, 96, (f(c, 127)))
													T[a] = z(y, 28, (f(Y(c, 14), 127)))
													H[a] = z(n, 26, (f(Y(c, 7), 127)))
													a = a - 1
												end
											else
												b[d[a]] = b[T[a]](A[a])
											end
										else
											if E >= 64 then
												if E ~= 65 then
													W, X, y = H[a], d[a], T[a]
													c = W + X
													b[W] = v(b[W](h(b, W + 1, c)))
												else
													b[d[a]] = b[H[a]] + b[T[a]]
												end
											else
												if E ~= 63 then
													b[T[a]](b[H[a]], b[d[a]])
												else
													b[d[a]][H[a]] = b[T[a]]
												end
											end
										end
									end
								end
							else
								if E < 104 then
									if E >= 96 then
										if E < 100 then
											if E < 98 then
												if E == 97 then
													b[T[a]] = not b[H[a]]
												else
													b[d[a]](_[a])
												end
											elseif E ~= 99 then
												b[H[a]](b[d[a]])
											else
												b[d[a]] = b[T[a]] // H[a]
											end
										else
											if E < 102 then
												if E ~= 101 then
													W, X, y = T[a], H[a], d[a]
													c, J, Q = W + y - 1, W + X, v(b[W](h(b, W + 1, W + X)))
													u(Q, 1, y, W, b)
												else
													b[d[a]] = b[H[a]] >= b[T[a]]
												end
											else
												if E == 103 then
													local I, C, U = T[a], m[a], b[H[a]]
													local Pb, Tb = f(C, 4294967295), f(U, 4294967295)
													local C, ob, db, mb =
														f(Pb, 65535), Y(Pb, 16), f(Tb, 65535), Y(Tb, 16)
													U = f(C * db + M(f(C * mb + ob * db, 65535), 16), 4294967295)
													Pb = nil
													repeat
														C = U % 4294967296
														if C ~= C then
															Pb = 0
															break
														end
														Pb = C - C % 1
													until true
													b[I] = Pb
												else
													X, W = (z(H[a], (f(z(r, (f(Y(r, 29), 7))), 536870911)))), d[a] + 1
													for I = 1, T[a], 1 do
														X = f(z(X, (M(X, 13))), 536870911)
														X = z(X, (Y(X, 13)))
														X = f(z(X, (M(X, 14))), 536870911)
														d[W] = z(d[W], (f(Y(X, 0), 127)))
														H[W] = z(H[W], (f(Y(X, 7), 127)))
														T[W] = z(T[W], (f(Y(X, 14), 127)))
														o[W] = z(o[W], (f(Y(X, 21), 127)))
														W = W + 1
													end
													o[a] = 106
												end
											end
										end
									else
										if E >= 92 then
											if E < 94 then
												if E == 93 then
													b[H[a]] = b[d[a]] + T[a]
												else
													a = if b[d[a]] then T[a] else H[a]
												end
											else
												if E ~= 95 then
													W, X, y, c =
														z(r, f(Y(r, 14), 262143), (f(Y(r, 28), 15))), d[a], H[a], T[a]
													J = c < 16384 and 7 or (c < 2097152 and 14 or 21)
													Q, n = Y(c, J), f(c, M(1, J) - 1)
													o[a] = z(Q, 113, (f(Y(W, 21), 127)))
													H[a] = z(y, 63, (f(Y(W, 7), 127)))
													d[a] = z(X, 87, (f(W, 127)))
													T[a] = z(n, 53, (f(Y(W, 14), 127)))
													a = a - 1
												else
													b[T[a]] = b[H[a]] < b[d[a]]
												end
											end
										else
											if E < 90 then
												b[H[a]] = B
											elseif E ~= 91 then
												b[d[a]] = _[a] + b[H[a]]
											else
												b[d[a]] = b[T[a]] <= b[H[a]]
											end
										end
									end
								else
									if E >= 111 then
										if E < 115 then
											if E >= 113 then
												if E == 114 then
													b[H[a]] = P[T[a]]
												else
													a = if T[a] < b[H[a]] then d[a] else a
												end
											else
												if E ~= 112 then
													b[T[a]] = b[d[a]] * A[a]
												else
													X, W = T[a], H[a] + 1
													for I = 1, d[a], 1 do
														X = f(z(X, (M(X, 13))), 536870911)
														X = z(X, (Y(X, 13)))
														X = f(z(X, (M(X, 14))), 536870911)
														d[W] = z(d[W], (f(Y(X, 0), 127)))
														H[W] = z(H[W], (f(Y(X, 7), 127)))
														T[W] = z(T[W], (f(Y(X, 14), 127)))
														o[W] = z(o[W], (f(Y(X, 21), 127)))
														W = W + 1
													end
													o[a] = 106
												end
											end
										else
											if E < 117 then
												if E ~= 116 then
													for I = H[a], d[a], 1 do
														b[I] = nil
													end
												else
													b[d[a]] = b[H[a]] == T[a]
												end
											elseif E ~= 118 then
												b[d[a]] = z(b[H[a]], b[T[a]])
											else
												if N then
													for I in g, N, nil do
														if N then
															local n = N[I]
															if n then
																n[6] = n
																n[4] = b[I]
																n[5] = 4
																N[I] = nil
															end
														end
													end
												end
												if q then
													for I, n in g, q, nil do
														local C = n[4]
														if q then
															local n = q[I]
															if n then
																local B = k(C)
																u(b, I, I + C - 1, 1, B)
																n[6] = B
																n[5] = 1
																q[I] = nil
															end
														end
													end
												end
												return b[d[a]], b[H[a]]
											end
										end
									else
										if E >= 107 then
											if E >= 109 then
												if E ~= 110 then
													W, X, y = T[a], d[a], H[a]
													c, J = b[W], W + X
													Q = b[J]
													u(b, W + 1, J - 1, y + 1, c)
													u(Q, 1, Q.n, y + X, c)
												else
													b[T[a]] = d[a]
												end
											else
												if E ~= 108 then
													b[H[a]](b[T[a]], m[a])
												else
													local I, n, C =
														d[a], z(H[a], (f(z(w, (f(Y(w, 29), 7))), 536870911))), V[5]
													local B = z(C[I], 43364404)
													C[I] = B
													I, C = V[4], B + 1
													B = O(I, C)
													local U, Pb
													if B < 128 then
														U, Pb = B, C + 1
													else
														local Tb = O(I, C + 1)
														if Tb < 128 then
															U, Pb = (B - 128) * 128 + Tb, C + 2
														else
															local ob = O(I, C + 2)
															if ob < 128 then
																U, Pb = (B - 128) * 16384 + (Tb - 128) * 128 + ob, C + 3
															else
																local db = O(I, C + 3)
																U, Pb =
																	(B - 128) * 128
																		+ (Tb - 128)
																		+ (ob - 128) * 16384
																		+ db % 128 * 2097152
																		+ (db - db % 128) * 2097152,
																	C + 4
															end
														end
													end
													C, B = n * 16843009, Pb + U
													local Tb = B - U % 4
													for U = Pb, Tb - 1, 4 do
														i(I, U, (z(x(I, U), C)))
													end
													for C = Tb, B - 1, 1 do
														Z(I, C, (z(O(I, C), n)))
													end
													d[a] = 129
													H[a] = 103
													T[a] = 133
													o[a] = 106
												end
											end
										else
											if E >= 105 then
												if not (E == 106) then
													b[H[a]] = _[a] + m[a]
												end
											else
												b[d[a]][A[a]] = _[a]
											end
										end
									end
								end
							end
						else
							if E >= 29 then
								if E < 44 then
									if E >= 36 then
										if E < 40 then
											if E < 38 then
												if E ~= 37 then
													b[T[a]][A[a]] = b[d[a]]
												else
													b[T[a]] = d[a]
													b[T[a + 1]] = d[a + 1]
													a += 1
												end
											else
												if E == 39 then
													local I, n, C = T[a], H[a], V[5]
													local B = z(C[I], 43364404)
													C[I] = B
													C, I = V[4], B + 1
													B = O(C, I)
													local U, Pb
													if B < 128 then
														U, Pb = B, I + 1
													else
														local Tb = O(C, I + 1)
														if Tb < 128 then
															U, Pb = (B - 128) * 128 + Tb, I + 2
														else
															local ob = O(C, I + 2)
															if ob < 128 then
																U, Pb = (B - 128) * 16384 + (Tb - 128) * 128 + ob, I + 3
															else
																local db = O(C, I + 3)
																U, Pb =
																	(B - 128) * 128
																		+ (Tb - 128)
																		+ (ob - 128) * 16384
																		+ db % 128 * 2097152
																		+ (db - db % 128) * 2097152,
																	I + 4
															end
														end
													end
													I, B = n * 16843009, Pb + U
													local Tb = B - U % 4
													for U = Pb, Tb - 1, 4 do
														i(C, U, (z(x(C, U), I)))
													end
													for I = Tb, B - 1, 1 do
														Z(C, I, (z(O(C, I), n)))
													end
													T[a] = 250
													H[a] = 215
													d[a] = 14
													o[a] = 106
												else
													W = s[T[a]]
													b[d[a]] = W[6][W[5]]
												end
											end
										else
											if E >= 42 then
												if E == 43 then
													b[d[a]] = H[a] * b[T[a]]
												else
													b[H[a]] = b[d[a]]
												end
											else
												if E ~= 41 then
													a = b[H[a]]
												else
													b[d[a]] = b[H[a]] < T[a]
												end
											end
										end
									else
										if E < 32 then
											if E >= 30 then
												if E == 31 then
													local I, n, C =
														d[a], z(H[a], (f(z(r, (f(Y(r, 29), 7))), 536870911))), V[5]
													local B = z(C[I], 43364404)
													C[I] = B
													C, I = V[4], B + 1
													B = O(C, I)
													local U, Pb
													if B < 128 then
														U, Pb = B, I + 1
													else
														local Tb = O(C, I + 1)
														if Tb < 128 then
															U, Pb = (B - 128) * 128 + Tb, I + 2
														else
															local ob = O(C, I + 2)
															if ob < 128 then
																U, Pb = (B - 128) * 16384 + (Tb - 128) * 128 + ob, I + 3
															else
																local db = O(C, I + 3)
																U, Pb =
																	(B - 128) * 128
																		+ (Tb - 128)
																		+ (ob - 128) * 16384
																		+ db % 128 * 2097152
																		+ (db - db % 128) * 2097152,
																	I + 4
															end
														end
													end
													I, B = n * 16843009, Pb + U
													local Tb = B - U % 4
													for U = Pb, Tb - 1, 4 do
														i(C, U, (z(x(C, U), I)))
													end
													for I = Tb, B - 1, 1 do
														Z(C, I, (z(O(C, I), n)))
													end
													d[a] = 14
													H[a] = 195
													T[a] = 23
													o[a] = 106
												else
													b[H[a]] = k(T[a])
												end
											else
												b[T[a]] = d[a] - b[H[a]]
											end
										else
											if E < 34 then
												if E ~= 33 then
													b[T[a]] = P
												else
													P[H[a]] = b[T[a]]
												end
											else
												if E == 35 then
													b[T[a]] = b[d[a]] == b[H[a]]
												else
													local I
													local n = A[a]
													if n then
														local C = #n / 3
														if C > 0 then
															I = {}
															local B, U = N, q
															for Pb = 1, C, 1 do
																local C = (Pb - 1) * 3
																local Tb, ob = n[C + 3], n[C + 2]
																if Tb == 1 then
																	B = if not B then {} else B
																	local db = B[ob]
																	if not db then
																		db = { [5] = ob, [6] = b }
																		B[ob] = db
																	else
																	end
																	I[Pb] = db
																else
																	if Tb == 0 then
																		I[Pb] = b[ob]
																	else
																		if Tb == 2 then
																			I[Pb] = s[ob]
																		else
																			if Tb == 3 then
																				U = if not U then {} else U
																				local Tb = U[ob]
																				if not Tb then
																					Tb =
																						{ [6] = b, [5] = ob, [4] = n[C + 1] }
																					U[ob] = Tb
																				else
																				end
																				I[Pb] = Tb
																			else
																			end
																		end
																	end
																end
															end
															N, q = B, U
														else
														end
													else
													end
													X = m[a](I)
													F(X, K)
													b[T[a]] = X
													W = I
												end
											end
										end
									end
								else
									if E >= 51 then
										if E >= 55 then
											if E >= 57 then
												if E ~= 58 then
													if N then
														for I in g, N, nil do
															if N then
																local n = N[I]
																if n then
																	n[6] = n
																	n[4] = b[I]
																	n[5] = 4
																	N[I] = nil
																end
															end
														end
													end
													if q then
														for I, n in g, q, nil do
															local C = n[4]
															if q then
																local n = q[I]
																if n then
																	local F, B = I + C, k(C)
																	u(b, I, F - 1, 1, B)
																	n[6] = B
																	n[5] = 1
																	q[I] = nil
																end
															end
														end
													end
													return A[a]
												else
													b[H[a]] = b[T[a]] <= d[a]
												end
											elseif E == 56 then
												b[H[a]] = b[d[a]] ~= _[a]
											else
												b[d[a]] = b[H[a]] % T[a]
											end
										elseif E >= 53 then
											if E ~= 54 then
												b[d[a]] = b[T[a]](b[H[a]])
											else
												b[H[a]][b[T[a]]] = b[d[a]]
											end
										elseif E ~= 52 then
											if N then
												for I in g, N, nil do
													if N then
														local n = N[I]
														if n then
															n[6] = n
															n[4] = b[I]
															n[5] = 4
															N[I] = nil
														end
													end
												end
											end
											if q then
												for I, n in g, q, nil do
													local C = n[4]
													if q then
														local n = q[I]
														if n then
															local F = k(C)
															u(b, I, I + C - 1, 1, F)
															n[6] = F
															n[5] = 1
															q[I] = nil
														end
													end
												end
											end
											return
										else
											b[H[a]][b[T[a]]] = d[a]
										end
									else
										if E >= 47 then
											if E < 49 then
												if E ~= 48 then
													local I, n, C = T[a], A[a], m[a]
													local F, B = f(n, 4294967295), f(C, 4294967295)
													local C, U, Pb, Tb = f(F, 65535), Y(F, 16), f(B, 65535), Y(B, 16)
													B = f(C * Pb + M(f(C * Tb + U * Pb, 65535), 16), 4294967295)
													U = nil
													repeat
														n = B % 4294967296
														if n ~= n then
															U = 0
															break
														end
														U = n - n % 1
													until true
													b[I] = U
												else
													b[T[a]] = b[d[a]] - H[a]
												end
											else
												if E == 50 then
													t, W, X = { [7] = t, [9] = S, [8] = e, [6] = R }, T[a], G(p)
													X(P, b[W], b[W + 1], b[W + 2])
													a, R = d[a], X
												else
													W, X, y = T[a], H[a], d[a]
													c = b[W]
													u(b, W + 1, W + X, y + 1, c)
												end
											end
										else
											if E >= 45 then
												if E == 46 then
													local I, n, S = H[a], b[T[a]], b[d[a]]
													local t, e = f(n, 4294967295), f(S, 4294967295)
													local n, S, R, C = f(t, 65535), Y(t, 16), f(e, 65535), Y(e, 16)
													e = f(n * R + M(f(n * C + S * R, 65535), 16), 4294967295)
													n = nil
													repeat
														S = e % 4294967296
														if S ~= S then
															n = 0
															break
														end
														n = S - S % 1
													until true
													b[I] = n
												else
													local I, n, S = d[a], T[a], b[H[a]]
													local t, e = f(n, 4294967295), f(S, 4294967295)
													local S, R, C, G = f(t, 65535), Y(t, 16), f(e, 65535), Y(e, 16)
													e = f(S * C + M(f(S * G + R * C, 65535), 16), 4294967295)
													R = nil
													repeat
														n = e % 4294967296
														if n ~= n then
															R = 0
															break
														end
														R = n - n % 1
													until true
													b[I] = R
												end
											else
												a = b[H[a]]
											end
										end
									end
								end
							else
								if E >= 14 then
									if E >= 21 then
										if E < 25 then
											if E < 23 then
												if E ~= 22 then
													b[H[a]] = b[T[a]] + m[a]
												else
													b[T[a]][b[d[a]]] = A[a]
												end
											else
												if E == 24 then
													X, W = (z(H[a], (f(z(w, (f(Y(w, 29), 7))), 536870911)))), d[a] + 1
													for I = 1, T[a], 1 do
														X = f(z(X, (M(X, 13))), 536870911)
														X = z(X, (Y(X, 13)))
														X = f(z(X, (M(X, 14))), 536870911)
														d[W] = z(d[W], (f(Y(X, 0), 127)))
														H[W] = z(H[W], (f(Y(X, 7), 127)))
														T[W] = z(T[W], (f(Y(X, 14), 127)))
														o[W] = z(o[W], (f(Y(X, 21), 127)))
														W = W + 1
													end
													o[a] = 106
												else
													P[_[a]] = A[a]
												end
											end
										else
											if E >= 27 then
												if E ~= 28 then
													b[H[a]] = b[T[a]] == m[a]
												else
													if N then
														for I in g, N, nil do
															if N then
																local n = N[I]
																if n then
																	n[6] = n
																	n[4] = b[I]
																	n[5] = 4
																	N[I] = nil
																end
															end
														end
													end
													if q then
														for I, n in g, q, nil do
															local S = n[4]
															if q then
																local n = q[I]
																if n then
																	local t = k(S)
																	u(b, I, I + S - 1, 1, t)
																	n[6] = t
																	n[5] = 1
																	q[I] = nil
																end
															end
														end
													end
													return b[H[a]]
												end
											elseif E == 26 then
												b[d[a]](A[a], _[a])
											else
												b[H[a]] = w
											end
										end
									else
										if E < 17 then
											if E < 15 then
												W, X, y = T[a], H[a], d[a]
												c, J, Q = W + y - 1, W + X, v(b[W](h(b, W + 1, W + X)))
												u(Q, 1, y, W, b)
												b[H[a + 1]] = b[d[a + 1]]
												a = a + 1
											else
												if E == 16 then
													r = b[T[a]]
												else
													b[H[a]] = b[d[a]]
													b[H[a + 1]] = b[d[a + 1]]
													a = a + 1
												end
											end
										else
											local I = a
											if E < 19 then
												if E ~= 18 then
													L = d[I]
													a = T[I] + 1
													break
												else
													W, X = d[I], b[T[I]]
													b[W + 1] = X
													b[W] = X[A[I]]
												end
											else
												if E == 20 then
													w = b[T[I]]
												else
													b[T[I]] = b[d[I]][b[H[I]]]
												end
											end
										end
									end
								else
									if E >= 7 then
										if E >= 10 then
											if E >= 12 then
												if E ~= 13 then
													local I = H[a]
													if N then
														local w = N[I]
														if w then
															w[6] = w
															w[4] = b[I]
															w[5] = 4
															N[I] = nil
														end
													end
												else
													local I, w, n = H[a], b[T[a]], d[a]
													local S, r = f(w, 4294967295), f(n, 4294967295)
													local w, n, t, e = f(S, 65535), Y(S, 16), f(r, 65535), Y(r, 16)
													S = f(w * t + M(f(w * e + n * t, 65535), 16), 4294967295)
													n = nil
													repeat
														t = S % 4294967296
														if t ~= t then
															n = 0
															break
														end
														n = t - t % 1
													until true
													b[I] = n
												end
											elseif E ~= 11 then
												b[H[a]] = b[T[a]][m[a]]
											else
												b[d[a]][_[a]] = H[a]
											end
										elseif E >= 8 then
											if E == 9 then
												b[d[a]]()
											else
												b[d[a]] = b[T[a]][H[a]]
											end
										else
											b[T[a]] = b[d[a]] // b[H[a]]
										end
									else
										if E >= 3 then
											if E < 5 then
												if E ~= 4 then
													W = s[d[a]]
													W[6][W[5]] = A[a]
												else
													b[H[a]][T[a]] = d[a]
												end
											else
												if E ~= 6 then
													local I, w, n = T[a], H[a], m[a]
													local S, r = f(w, 4294967295), f(n, 4294967295)
													local n, t, e, R = f(S, 65535), Y(S, 16), f(r, 65535), Y(r, 16)
													w = f(n * e + M(f(n * R + t * e, 65535), 16), 4294967295)
													n = nil
													repeat
														S = w % 4294967296
														if S ~= S then
															n = 0
															break
														end
														n = S - S % 1
													until true
													b[I] = n
												else
													b[T[a]] = f(b[d[a]], H[a])
												end
											end
										else
											if E < 1 then
												b[H[a]] = #b[T[a]]
											else
												if E ~= 2 then
													b[T[a]] = d[a]
													b[H[a + 1]] = b[d[a + 1]]
													a += 1
												else
													b[d[a]] = P[_[a]]
												end
											end
										end
									end
								end
							end
						end
						a = a + 1
					end
				else
				end
				if L == 136 then
					while true do
						K = T[a]
						if K < 16 then
							if K >= 8 then
								if K >= 12 then
									if K < 14 then
										if K == 13 then
											b[o[a]] = not b[d[a]]
										else
											b[H[a]] = b[o[a]] % d[a]
										end
									elseif K ~= 15 then
										b[H[a]] = P[l[a]]
									else
										b[H[a]] = o[a]
									end
								else
									if K < 10 then
										if K == 9 then
											local _, E, I = o[a], H[a], V[5]
											j = z(I[_], 43364404)
											I[_] = j
											I, D = V[4], j + 1
											_ = O(I, D)
											local V, w
											if _ < 128 then
												V, w = _, D + 1
											else
												local j = O(I, D + 1)
												if j < 128 then
													V, w = (_ - 128) * 128 + j, D + 2
												else
													local n = O(I, D + 2)
													if n < 128 then
														V, w = (_ - 128) * 16384 + (j - 128) * 128 + n, D + 3
													else
														local S = O(I, D + 3)
														V, w =
															(_ - 128) * 128
																+ (j - 128)
																+ (n - 128) * 16384
																+ S % 128 * 2097152
																+ (S - S % 128) * 2097152,
															D + 4
													end
												end
											end
											local j, n = E * 16843009, w + V
											_ = n - V % 4
											for V = w, _ - 1, 4 do
												i(I, V, (z(x(I, V), j)))
											end
											for V = _, n - 1, 1 do
												Z(I, V, (z(O(I, V), E)))
											end
											o[a] = 63
											H[a] = 108
											d[a] = 129
											T[a] = 20
										else
											local T, _, V = H[a], m[a], b[o[a]]
											local E, I = f(_, 4294967295), f(V, 4294967295)
											local _, w, j, n = f(E, 65535), Y(E, 16), f(I, 65535), Y(I, 16)
											V = f(_ * j + M(f(_ * n + w * j, 65535), 16), 4294967295)
											n = nil
											repeat
												I = V % 4294967296
												if I ~= I then
													n = 0
													break
												end
												n = I - I % 1
											until true
											b[T] = n
										end
									else
										if K == 11 then
											b[d[a]] = b[o[a]] + H[a]
										else
											W = s[d[a]]
											W[6][W[5]] = b[H[a]]
										end
									end
								end
							else
								if K >= 4 then
									if K >= 6 then
										if K ~= 7 then
											W, X, y = d[a], H[a], o[a]
											c, J, Q = W + y - 1, W + X, v(b[W](h(b, W + 1, W + X)))
											u(Q, 1, y, W, b)
										else
											a = b[d[a]]
										end
									else
										if K ~= 5 then
											if N then
												for T in g, N, nil do
													if N then
														local _ = N[T]
														if _ then
															_[6] = _
															_[4] = b[T]
															_[5] = 4
															N[T] = nil
														end
													end
												end
											end
											if q then
												for T, _ in g, q, nil do
													local V = _[4]
													if q then
														local _ = q[T]
														if _ then
															local E = k(V)
															u(b, T, T + V - 1, 1, E)
															_[6] = E
															_[5] = 1
															q[T] = nil
														end
													end
												end
											end
											return
										else
											W = s[d[a]]
											b[o[a]] = W[6][W[5]]
										end
									end
								else
									if K < 2 then
										if K == 1 then
											if N then
												for T in g, N, nil do
													if N then
														local _ = N[T]
														if _ then
															_[6] = _
															_[4] = b[T]
															_[5] = 4
															N[T] = nil
														end
													end
												end
											end
											if q then
												for T, _ in g, q, nil do
													local V = _[4]
													if q then
														local _ = q[T]
														if _ then
															local E = k(V)
															u(b, T, T + V - 1, 1, E)
															_[6] = E
															_[5] = 1
															q[T] = nil
														end
													end
												end
											end
											return b[d[a]]
										else
											P[o[a]] = b[H[a]]
										end
									else
										if K == 3 then
											a = if b[d[a]] then H[a] else o[a]
										else
											b[o[a]] = b[d[a]] + b[H[a]]
										end
									end
								end
							end
						else
							if K >= 24 then
								if K < 28 then
									if K >= 26 then
										if K ~= 27 then
											b[d[a]]()
										else
											if N then
												for T in g, N, nil do
													if N then
														local _ = N[T]
														if _ then
															_[6] = _
															_[4] = b[T]
															_[5] = 4
															N[T] = nil
														end
													end
												end
											end
											if q then
												for T, _ in g, q, nil do
													local V = _[4]
													if q then
														local _ = q[T]
														if _ then
															local E = k(V)
															u(b, T, T + V - 1, 1, E)
															_[6] = E
															_[5] = 1
															q[T] = nil
														end
													end
												end
											end
											return m[a]
										end
									elseif K ~= 25 then
										local T, _, V = d[a], b[H[a]], b[o[a]]
										local E, I = f(_, 4294967295), f(V, 4294967295)
										local V, w, j, n = f(E, 65535), Y(E, 16), f(I, 65535), Y(I, 16)
										_ = f(V * j + M(f(V * n + w * j, 65535), 16), 4294967295)
										w = nil
										repeat
											V = _ % 4294967296
											if V ~= V then
												w = 0
												break
											end
											w = V - V % 1
										until true
										b[T] = w
									else
										if N then
											for T in g, N, nil do
												if N then
													local _ = N[T]
													if _ then
														_[6] = _
														_[4] = b[T]
														_[5] = 4
														N[T] = nil
													end
												end
											end
										end
										if q then
											for T, _ in g, q, nil do
												local V = _[4]
												if q then
													local _ = q[T]
													if _ then
														local E = k(V)
														u(b, T, T + V - 1, 1, E)
														_[6] = E
														_[5] = 1
														q[T] = nil
													end
												end
											end
										end
										return h(b[o[a]], 1, b[o[a]].n)
									end
								elseif K >= 30 then
									if K >= 31 then
										if K == 32 then
											b[d[a]] = b[H[a]](l[a])
										else
											b[o[a]](m[a], A[a])
										end
									else
										b[d[a]] = o[a] * b[H[a]]
									end
								elseif K ~= 29 then
									local T = H[a]
									if N then
										local m = N[T]
										if m then
											m[6] = m
											m[4] = b[T]
											m[5] = 4
											N[T] = nil
										end
									end
								else
									local T, m, A = o[a], b[d[a]]
									repeat
										local _ = m % 4294967296
										if _ ~= _ then
											A = 0
											break
										end
										A = _ - _ % 1
									until true
									b[T] = A
								end
							else
								if K >= 20 then
									if K >= 22 then
										if K ~= 23 then
											b[H[a]] = P[d[a]]
										else
											if N then
												for T in g, N, nil do
													if N then
														local m = N[T]
														if m then
															m[6] = m
															m[4] = b[T]
															m[5] = 4
															N[T] = nil
														end
													end
												end
											end
											if q then
												for T, m in g, q, nil do
													local A = m[4]
													if q then
														local m = q[T]
														if m then
															local _, V = T + A, k(A)
															u(b, T, _ - 1, 1, V)
															m[6] = V
															m[5] = 1
															q[T] = nil
														end
													end
												end
											end
											return b[d[a]](h(b[o[a]], 1, b[o[a]].n))
										end
									elseif K == 21 then
										P[l[a]] = b[d[a]]
									end
								else
									if K < 18 then
										if K ~= 17 then
											b[H[a]] = b[d[a]](b[o[a]])
										else
											a = H[a]
										end
									else
										if K ~= 19 then
											b[o[a]] = b[H[a]]
										else
											W = s[H[a]]
											W[6][W[5]] = l[a]
										end
									end
								end
							end
						end
						a = a + 1
					end
				end
			end
		end
	end,
	BH = function(P, T, o, d, m, A, _)
		if o <= 28 then
			if o <= 27 then
				local V = buffer.readu8(A, _ + 2)
				return V < 128 and 29 or 30, _, d, V
			else
				return 13, _, d, T
			end
		elseif o <= 29 then
			local o = 16384 * (d - 128)
			local V = 128 * (m - 128) + (o + T)
			return 0, 3 + _, V, T
		else
			local o = buffer.readu8(A, _ + 3)
			local P, A, V, l = (d - 128) * 128, m - 128, (T - 128) * 16384, 2097152 * (o % 128)
			local d = A + (o - o % 128) * 2097152 + (V + (P + l))
			return 0, _ + 4, d, T
		end
	end,
	[13] = table.concat,
	[38] = function(P, P, P, P)
		return function(P, T, T)
			local T = buffer.writei8
			local o = P[2]
			local d = P[3]
			local m = P[4]
			local A = P[5]
			return function()
				local P = 0
				while true do
					local _ = P <= 0
					if _ then
						local _, V = true
						T[6][T[5]] = _
						local T, T = o[6][o[5]][nil]
						d[6][d[5]](85620560, 4)
						local T, o = 442358735
						m[6][m[5]] = T
						A[6][A[5]]()
						P = 1
					else
						return
					end
				end
			end
		end
	end,
	[111] = function(P, T, T, T)
		return function(T, o, o)
			local o = T[1]
			local d = T[2]
			local m = T[3]
			local A = T[4]
			local _ = T[5]
			local V = T[6]
			local l = T[7]
			local E = T[8]
			local a = T[9]
			local I = T[10]
			local H = T[11]
			return function()
				local T
				local T = o
				local W, w = T.Settings.Visuals, o
				local o, j, n, y = w.Alive and W.Enabled, W.ShowNames or W.ShowRoles or W.ShowDistance, pairs
				local y, S, S = d
				for S, r in n(y) do
					w, T = not o
					if w then
						T = w
					else
						local t
						t, T = m, S.Parent ~= m
					end
					local t = T or S.Character ~= r.Character or not r.Character.Parent
					if t then
						A[6][A[5]](S)
					end
				end
				if not o then
					return
				end
				local S
				w = _
				y = w.CurrentCamera
				T, o, n = y and y.CFrame.Position, ipairs, m
				w = table.pack(n:GetPlayers())
				for m, _ in o(P:vH(w)) do
					local P
					m = V
					if _ == m then
						continue
					end
					m = W.PlayerOverrides[tostring(_.UserId)]
					n = m and m.OverlayEnabled == false
					if n then
						A[6][A[5]](_)
						continue
					end
					local P = _.Character
					local o, w = P and (P:FindFirstChildOfClass("Humanoid")), P and (P:FindFirstChild("Head"))
					local n = w or P and (P:FindFirstChild("HumanoidRootPart"))
					n = if n and not n:IsA("BasePart") then nil else n
					local S = n and T and (n.Position - T).Magnitude
					local T, r = W.MaxDistance == 0 or S and S <= W.MaxDistance
					local r = l[6][l[5]][_.Name] or l[6][l[5]][tostring(_.UserId)]
					local l = not P
						or not P.Parent
						or not o
						or o.Health <= 0
						or r
						or not T
						or not (W.Chams or W.Outlines or W.BoxStyle ~= "Off" or j and n)
					if l then
						A[6][A[5]](_)
						continue
					end
					local A
					l = E[6][E[5]](_) or "Unknown"
					l = if l == "Murderer" then "Murder" else l
					local A, E, r, t =
						(l == "Murder" or l == "Sheriff" or l == "Hero") and l or "Innocent",
						m and m.CustomColor and m.Color
					if E then
						r = E
					else
						m, o = l == "Unknown"
						if m then
							T = a
							o = T.TextSecondary
						else
							o = m
						end
						r = o or W[A .. "Color"]
					end
					local t
					E = I
					m = E[A]
					T = not m or m.Color ~= r
					if T then
						m = { Color = r, Outline = r:Lerp(Color3.new(1, 1, 1), 0.45) }
						o = I
						o[A] = m
					else
					end
					T = d
					r = T[_]
					T = not r
					if T then
						r = { Character = P }
						E = d
						E[_] = r
						A = Instance.new("Frame")
						A.Name = tostring(_.UserId)
						A.BackgroundTransparency = 1
						A.Visible = false
						local d
						o = H
						A.Parent = o
						for d = 1, 8, 1 do
							local I = Instance.new("Frame")
							I.Name = tostring(d)
							I.BorderSizePixel = 0
							I.Parent = A
						end
						r.Box = A
					else
					end
					r.Color = m.Color
					r.Occluded = false
					A = y and n
					if A then
						o, T = { P }, V
						E = T.Character
						if E then
							table.insert(o, V.Character)
						end
						r.Occluded = #y:GetPartsObscuringTarget({ n.Position }, o) > 0
					end
					if W.Chams or W.Outlines then
						if not r.Highlight or r.Highlight.Parent ~= P then
							if r.Highlight then
								r.Highlight:Destroy()
							end
							E = Instance.new("Highlight")
							E.Name = "HeadShotHighlight"
							E.Adornee = P
							E.Parent = P
							r.Highlight = E
						end
						A = r.Highlight
						A.FillColor = m.Color
						A.OutlineColor = W.CustomOutlineColor and W.OutlineColor or m.Outline
						A.FillTransparency = W.Chams
								and 1 - (1 - W.FillTransparency) * (r.Occluded and W.OccludedOpacity or 1)
							or 1
						A.OutlineTransparency = W.Outlines and 0.1 or 1
						A.DepthMode = W.ThroughWalls and Enum.HighlightDepthMode.AlwaysOnTop
							or Enum.HighlightDepthMode.Occluded
					elseif r.Highlight then
						r.Highlight:Destroy()
						r.Highlight = nil
					end
					o = j and n
					if o then
						A = not r.Billboard or r.Billboard.Parent ~= P
						if A then
							if r.Billboard then
								r.Billboard:Destroy()
							end
							T = Instance.new("BillboardGui")
							T.Name = "HeadShotPlayerBillboard"
							T.Size = UDim2.fromOffset(200, 54)
							T.LightInfluence = 0
							T.Parent = P
							E = Instance.new("TextLabel")
							E.Name = "Info"
							E.Size = UDim2.fromScale(1, 1)
							E.BackgroundTransparency = 1
							local P = a
							E.FontFace = P.FaceSemiBold
							E.TextSize = 13
							E.TextTruncate = Enum.TextTruncate.AtEnd
							E.TextStrokeTransparency = 0.15
							P = a
							E.TextStrokeColor3 = P.Background
							E.Parent = T
							r.Billboard = T
						end
						local P = {}
						if W.ShowNames then
							table.insert(P, _.DisplayName)
						end
						if W.ShowRoles then
							table.insert(P, l)
						end
						if W.ShowDistance and S then
							table.insert(P, string.format("%d studs", math.round(S)))
						end
						local T = r.Billboard
						T.Adornee = n
						T.StudsOffset = Vector3.new(0, n == w and 2.2 or 4, 0)
						T.AlwaysOnTop = W.ThroughWalls
						T.MaxDistance = W.MaxDistance == 0 and 1 / 0 or W.MaxDistance
						local o = table.concat(P, "\10")
						if T.Info.Text ~= o then
							T.Info.Text = o
						end
						if T.Info.TextColor3 ~= m.Color then
							T.Info.TextColor3 = m.Color
						end
					elseif r.Billboard then
						r.Billboard:Destroy()
						r.Billboard = nil
					end
				end
			end
		end
	end,
	l = function(P, T, o, d, m, A, _, V, l, E, a, I, H, W)
		if E <= 36 then
			if E <= 35 then
				local w, j, n, y = buffer.readu8(H, a + 3), (T - 128) * 128, W - 128, 16384 * (o - 128)
				return 73, d, 2097152 * (w % 128) + ((w - w % 128) * 2097152 + (y + (n + j))), 4 + a, a, A, _, I, m
			else
				local o = A - 14129
				local w, j, n = table.create(o), table.create(o), 1 + 0
				local y = 1 - n
				return 115, { o + 0, y, nil, d, n }, T, W, a, w, j, I, m
			end
		elseif E <= 37 then
			local o = l + (I - 128) * 128
			return 76, d, T, W, a + 2, A, _, o, m
		elseif E <= 38 then
			V[I] = l
			return 69, d, T, W, a, A, _, I, m
		else
			local o = buffer.readu8(H, 1 + a)
			return 128 > o and 131 or 66, d, T, W, a, A, _, I, o
		end
	end,
	[66] = buffer.copy,
	[67] = buffer.create,
	U = function(P, T, o, d, m, A, _, V, l, E, a, I)
		if m <= 11 then
			if m <= 10 then
				local H = (E - 128) * 16384
				local W = l + 128 * (o - 128) + H
				return 90, d, T, a + 3, A, W
			else
				local o = buffer.readu8(I, a)
				return 128 > o and 100 or 7, o, T, a, A, E
			end
		elseif m <= 12 then
			local o = buffer.readu8(I, a + 3)
			local l, H, W, w, j = (A - 128) * 128, V - 128, (_ - 128) * 16384, 2097152 * (o % 128), o % 128
			local _ = 2097152 * (o - j)
			j = w + H + (l + W + _)
			return 104, d, T, 4 + a, j, E
		elseif m <= 13 then
			local o = buffer.readu8(I, a + 2)
			return o < 128 and 102 or 35, d, o, a, A, E
		else
			return 124, d, T, a + 1, A, E
		end
	end,
	[95] = function(P, P, P, P)
		return function(P)
			local T = buffer.writei8
			local o = P[2]
			return function(P, d)
				local m, A = ipairs
				local A = T
				for T, _ in m(A) do
					T = P:FindFirstChild(_)
					local P, m = T and (T:IsA("BasePart"))
					if P then
						local A
						_ = o
						m = _(T.Position)
					else
						m = P
					end
					if m then
						if (T.Position - d.Position).Magnitude > 6 then
							return T, true
						end
						break
					end
				end
				return d, false
			end
		end
	end,
	k = function(P, T, o, d, m, A, _, V, l)
		if m <= 32 then
			local E, a = (T - 128) * 16384, (_ - 128) * 128
			return 56, a + (E + d), 3, A, V
		elseif m <= 33 then
			local d = buffer.readu8(l, _ + 2)
			return not (d >= 128) and 53 or 153, T, _, d, V
		else
			local P, d, m = o[1], o[3], o[4]
			local l, E = P + d, d <= 0
			d, P = l >= m, l <= m
			m = E and d or not E and P
			o[1] = l
			if m then
				return 24, T, _, A, l
			else
				return 146, T, _, A, V
			end
		end
	end,
	[110] = function(P, P, P, P)
		return function(P, T)
			local T = buffer.writei8
			local o = P[2]
			local d = P[3]
			return function(P)
				local m, A, A = not P
				if m then
					local _
					local _, V = T, o
					A = _(V.CurrentSnapshot)
				else
					A = m
				end
				if A then
					P = o
					return P.CurrentSnapshot
				end
				local P
				m = d
				return m()
			end
		end
	end,
	[102] = UDim.new,
	[52] = function(P, P, P, P)
		return function(P)
			return function(P)
				return Vector3.new(P.X, 0, P.Z)
			end
		end
	end,
	[10] = vector.create,
	w = function(P, T, o, d, m, A, _, V, l)
		if o <= 97 then
			if o <= 96 then
				local E = buffer.readu8(V, _ + 3)
				local a, I, H, W, w =
					128 * (d - 128), T - 128, (A - 128) * 16384, E % 128 * 2097152, 2097152 * (E - E % 128)
				return 41, m, a + I + (w + W + H), 4 + _, T, l
			else
				local A = buffer.readu8(V, _ + 2)
				return not (A < 128) and 79 or 67, m, d, _, T, A
			end
		elseif o <= 98 then
			local A = buffer.readu8(V, 1)
			return 128 > A and 18 or 51, m, d, A, T, l
		elseif o <= 99 then
			return 61, m, d, _, buffer.readu8(V, _ + 1), l
		else
			return 73, _ + 1, d, _, T, l
		end
	end,
	[114] = 0,
	[100] = buffer.writef64,
	[2] = function(P, P, P, P)
		return function(P, T, T)
			local T = buffer.writei8
			local o = P[2]
			local d = P[3]
			local m = P[4]
			local A = P[5]
			local _ = P[6]
			local V = P[7]
			return function()
				local P
				local P = T
				local l, E = P.Settings.Visuals, T
				local T, a = not E.Alive or not l.Enabled or not l.GunESP
				if T then
					o[6][o[5]]()
					return
				end
				local a
				T, P = d[6][d[5]]()
				E = not T or not P or not P:IsA("BasePart") or not P.Parent
				if E then
					o[6][o[5]]()
					return
				end
				local d
				E = m
				local d = E.CurrentCamera
				E = d and (P.Position - d.CFrame.Position).Magnitude
				d = l.MaxDistance > 0 and (not E or E > l.MaxDistance)
				if d then
					o[6][o[5]]()
					return
				end
				local o
				d = not A[6][A[5]] or A[6][A[5]].Parent ~= T
				if d then
					local o = A[6][A[5]]
					if o then
						A[6][A[5]]:Destroy()
					end
					o = Instance.new("Highlight")
					o.Name = "HeadShotGunHighlight"
					o.OutlineTransparency = 0.05
					o.Parent = T
					A[6][A[5]] = o
				end
				A[6][A[5]].Adornee = (T:IsA("Model") or T:IsA("BasePart")) and T or P
				A[6][A[5]].FillColor = l.GunColor
				A[6][A[5]].OutlineColor = l.GunColor:Lerp(Color3.new(1, 1, 1), 0.45)
				A[6][A[5]].FillTransparency = l.GunFillTransparency
				A[6][A[5]].DepthMode = l.ThroughWalls and Enum.HighlightDepthMode.AlwaysOnTop
					or Enum.HighlightDepthMode.Occluded
				local o, m = not l.GunLabel
				if o then
					T = _[6][_[5]]
					if T then
						_[6][_[5]]:Destroy()
						_[6][_[5]] = nil
					end
					return
				end
				o = not _[6][_[5]] or _[6][_[5]].Adornee ~= P or _[6][_[5]].Parent ~= P
				if o then
					T = _[6][_[5]]
					if T then
						_[6][_[5]]:Destroy()
					end
					d = Instance.new("BillboardGui")
					d.Name = "HeadShotGunBillboard"
					d.Size = UDim2.fromOffset(120, 38)
					d.LightInfluence = 0
					d.StudsOffset = Vector3.new(0, 1.6, 0)
					d.Adornee = P
					d.Parent = P
					local P = Instance.new("TextLabel")
					P.Name = "GunLabel"
					P.Size = UDim2.fromScale(1, 1)
					P.BackgroundTransparency = 1
					local T
					local T = V
					P.FontFace = T.FaceBold
					P.TextSize = 14
					P.TextStrokeTransparency = 0
					P.TextStrokeColor3 = Color3.fromRGB(15, 15, 20)
					P.Parent = d
					_[6][_[5]] = d
				end
				_[6][_[5]].AlwaysOnTop = l.ThroughWalls
				_[6][_[5]].MaxDistance = l.MaxDistance == 0 and 1 / 0 or l.MaxDistance
				_[6][_[5]].GunLabel.TextColor3 = l.GunColor
				_[6][_[5]].GunLabel.TextSize = 14
				_[6][_[5]].GunLabel.Text = "Gun"
					.. (l.ShowDistance and E and string.format("\10%d studs", math.round(E)) or "")
			end
		end
	end,
	UH = function(P)
		return true, 3, nil, nil, nil, nil, nil, nil, nil, nil, nil
	end,
	[33] = string.find,
	[51] = coroutine.create,
	[105] = function(P, P, P, P)
		return function(P, T, T)
			local T = buffer.writei8
			return function(P, o, d, m)
				local A, _, V, l, E, a, I, H, W, w = 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
				for j = #P, 1, -1 do
					local n = P[j]
					j = n.Time - o
					if j < -d then
						break
					end
					local y = n.Position
					n = y.Y + 0.5 * m * j * j
					A, _, V, l, E, a, I, H, W, w =
						A + 1, _ + j, V + j * j, l + y.X, E + n, a + y.Z, I + j * y.X, H + j * n, W + j * y.Z, j
				end
				if A < 3 then
					return nil, 0
				end
				local j = A * V - _ * _
				if j < 1.0E-9 then
					return nil, 0
				end
				local V = Vector3.new((A * I - _ * l) / j, (A * H - _ * E) / j, (A * W - _ * a) / j)
				local I
				j = T
				if not j(V) or V.Magnitude > 400 then
					return nil, 0
				end
				j = _ / A
				local T, _ = Vector3.new(l / A, E / A, a / A) - V * j, 0
				for l = #P, 1, -1 do
					j = P[l]
					l = j.Time - o
					if l < -d then
						break
					end
					local P = j.Position
					local o = Vector3.new(P.X, P.Y + 0.5 * m * l * l, P.Z) - (T + V * l)
					_ += o.X * o.X + o.Z * o.Z
				end
				return V, -w, math.sqrt(_ / A)
			end
		end
	end,
	[45] = function(P, P, P, P, P, P)
		return function(P)
			return function(P, T, o)
				local d = P.Oscillation
				if not d then
					return nil
				end
				P = d.Period
				local m = d.LastFlip + P - T
				while m < 0 do
					m += P
				end
				local A, _, V = 1, 0, 0
				for l = 1, 64, 1 do
					T = math.min(m, o)
					V += A * d.Speed * (T - _)
					if T >= o then
						_ = T
						break
					end
					A = -A
					m, _ = m + P, T
				end
				return d.Direction * V
			end
		end
	end,
	[56] = coroutine.wrap,
	[7] = type,
	[42] = buffer.readf64,
	e = function(P, T, o, d, m, A, _, V, l)
		if l <= 139 then
			local E = buffer.readu8(_, o + 3)
			local P, _, a, I = (V - 128) * 128, A - 128, (d - 128) * 16384, E % 128 * 2097152
			local d = (E - E % 128) * 2097152 + a + (P + _ + I)
			return 83, m, 4 + o, d
		elseif l <= 140 then
			local P, d, A = T[4], T[3], T[1]
			local _, l = P + d, d <= 0
			P, d = _ >= A, _ <= A
			A = l and P or not l and d
			T[4] = _
			if A then
				return 126, m, _, V
			else
				return 46, m, o, V
			end
		else
			return 136, m + 1, o, V
		end
	end,
	n = {},
	iH = function(P, T, o, d, m, A, _, V, l, E, a, I, H)
		if E <= 5 then
			if E <= 4 then
				local W = (d - 128) * 16384
				local w = 128 * (m - 128) + T + W
				return 26, H, V, l, 3 + o, w
			else
				return 9, H, P[34](A), l, o, d
			end
		elseif E <= 6 then
			local T, m = a[5][I], a[4]
			local A = 1 + T
			T = buffer.readu8(m, A)
			return not not (T >= 128) and 12 or 34, H, V, m, A, T
		elseif E <= 7 then
			local P, T = d - 1, 1 + 0
			local m = _ - T
			return 15, { nil, T, H, P + 0, m }, V, l, o, d
		else
			return 0, H, V + 1, l, o, d
		end
	end,
	[6] = function(P, P, P, P)
		return function(P, T)
			local T = buffer.writei8
			local o = P[2]
			local d = P[3]
			local m = P[4]
			local A = P[5]
			local _ = P[6]
			local V = P[7]
			return function(P, l, E, a)
				local I
				local I = T
				local H, W = I.VelocityHistory[P]
				if H then
					I = nil
					I, W = T, H.Frame == T.Frame
				else
					W = H
				end
				if W then
					return
				end
				I = l.Parent
				if not I then
					return
				end
				W = T
				local w, j = W.GetMotionAnchor(I, l)
				local n, y = w.Position
				W = o
				I = not W(n)
				if I then
					W = T
					W.VelocityHistory[P] = nil
					return
				end
				I, W = not H or H.RootPart ~= l or H.Anchor ~= w
				if I then
					W = I
				else
					local y
					y, W = T, H.Generation ~= T.Generation
				end
				I = W or a - H.UpdatedAt > 0.3
				if I then
					H = { RootPart = l, Anchor = w }
					W = T
					H.Generation = W.Generation
					H.Samples = {}
					H.Velocity = Vector3.new(0.0, 0.0, 0.0)
					H.RawVelocity = Vector3.new(0.0, 0.0, 0.0)
					H.ObservedVelocity = Vector3.new(0.0, 0.0, 0.0)
					H.Acceleration = Vector3.new(0.0, 0.0, 0.0)
					H.Position = n
					H.UpdatedAt = a
					H.StableSince = a
					H.Frame = -1
					H.Mode = "Ground"
					H.LastAirborne = false
					H.Confidence = 0
					H.VelocityConfidence = 0
					H.BallisticConfidence = 0
					H.PositionDriven = false
					H.SuppressUntil = 0
					H.Spoofed = false
					H.Desynced = j
					H.MismatchSince = nil
					H.AirSince = nil
					H.JumpLog = {}
					H.JumpVelocity = 0
					H.GroundGap = 0
					H.GroundSince = nil
					H.GroundY = nil
					H.GroundAt = 0
					H.JumpPeriod = nil
					H.FlipLog = {}
					H.CruiseSpeed = 0
					H.FlipRate = 0
					H.Oscillation = nil
					H.Flips = {}
					H.FlipReference = Vector3.new(0.0, 0.0, 0.0)
					H.Jitter = false
					H.MeanOffset = Vector3.new(0.0, 0.0, 0.0)
					H.JitterSpread = 0
					H.Residual = 0
					local y = T
					y.VelocityHistory[P] = H
					y = T
					y.MotionRevision = y.MotionRevision + 1
				else
				end
				I = H.Samples
				P = I[#I]
				if P then
					W = a - P.Time
					local y = W < 0.0033333333333333335
					if y then
						local S = T
						H.Frame = S.Frame
						return
					end
					y = (n - P.Position).Magnitude > 10 + 60 * W
					if y then
						table.clear(I)
						H.StableSince = a
						local y = T
						y.MotionRevision = y.MotionRevision + 1
					end
				end
				table.insert(I, { Time = a, Position = n })
				while I[1] and a - I[1].Time > 0.3 do
					table.remove(I, 1)
				end
				local y, S = l.AssemblyLinearVelocity, o
				local o, r, t, X = S(y) and y.Magnitude < 250 and not l.Anchored and not j, j and 3
				if r then
					t = r
				else
					S = nil
					S, t = d, l.Size.Y * 0.5 + d(E and E.HipHeight, 2, 0, 6)
				end
				S = T
				local X, J, e =
					S.GetGroundDistance(w, t, a), o and y.Y > 6, fitted ~= nil and span >= 0.05 and fitted.Y < -14
				w, W = X > t + 1.2 or J or e and X > t + 0.45
				if w then
					local R, q = d
					e = m
					W = R(e.Gravity, 196.2, 0, 500)
				else
					W = w
				end
				local m, R = W or 0
				W = A
				S, e, r = W(I, a, 0.11, m)
				if w then
					H.AirSince = H.AirSince or a
					W = a - H.AirSince
					local R = W >= 0.04 and S
					if R then
						local R = A
						local A = R(I, a, math.min(W, 0.3), m)
						S = if A then Vector3.new(S.X, A.Y, S.Z) else S
					else
					end
				else
					H.AirSince = nil
				end
				W = false
				if o then
					if S and e >= 0.05 then
						local A, R = Vector3.new(y.X, 0, y.Z), Vector3.new(S.X, 0, S.Z)
						W = (A - R).Magnitude < 7 + R.Magnitude * 0.35
							and math.abs(y.Y - S.Y) < 14 + math.abs(S.Y) * 0.4
					else
						W = true
					end
				else
				end
				local A = S ~= nil and e >= 0.05 and not W
				if A then
					H.MismatchSince = H.MismatchSince or a
				else
					H.MismatchSince = nil
				end
				local R, q, c =
					not o and not l.Anchored or A and a - (H.MismatchSince or a) > 0.15,
					if l.Anchored
						then (Vector3.new(0.0, 0.0, 0.0))
						else if W then S and e >= 0.05 and y:Lerp(S, 0.2) or y else S or H.Velocity,
					not w
				q = if c then Vector3.new(q.X, math.clamp(q.Y, -8, 8), q.Z) else q
				local N, Q = c and R and E
				if N then
					local Q, Q, D = d, math.max(d(E.WalkSpeed, 16, 0, 200) * 1.15, 8), _
					l = D(q)
					q = if l.Magnitude > Q then l.Unit * Q + Vector3.new(0, q.Y, 0) else q
				else
				end
				q = if c and Vector3.new(q.X, 0, q.Z).Magnitude < 0.6 then Vector3.new(0, q.Y, 0) else q
				E, N, l = H.Flips, o and not R, _
				local Q, D, K, s = l(N and y or q), N and 0 or 0.055, H.FlipReference, H.FlipLog
				if Q.Magnitude > 3 then
					if K.Magnitude > 3 and K.Unit:Dot(Q.Unit) < -0.2 then
						table.insert(E, a - D)
						table.insert(s, a - D)
					end
					H.FlipReference = Q
					H.CruiseSpeed = H.CruiseSpeed + (Q.Magnitude - H.CruiseSpeed) * 0.15
				end
				while E[1] and a - E[1] > 0.45 do
					table.remove(E, 1)
				end
				while s[1] and a - s[1] > 2.5 do
					table.remove(s, 1)
				end
				H.Oscillation = nil
				if #s >= 4 and Q.Magnitude > 3 then
					K, l = #s - 1, 0
					for k = 2, #s, 1 do
						l += s[k] - s[k - 1]
					end
					N, A = l / K, 0
					for k = 2, #s, 1 do
						A += (s[k] - s[k - 1] - N) ^ 2
					end
					D = math.sqrt(A / K) / N
					if D < 0.3 and N > 0.07 and N < 1.3 and a - s[#s] < N * 1.6 then
						H.Oscillation =
							{ Period = N, LastFlip = s[#s], Speed = H.CruiseSpeed, Direction = Q.Unit, Spread = D }
					end
				end
				H.FlipRate = #s / 2.5
				D = #E >= 2
				H.Jitter = D
				H.MeanOffset = Vector3.new(0.0, 0.0, 0.0)
				H.JitterSpread = 0
				A = D and not H.Oscillation
				if A then
					local A
					E = V
					l, K, Q = E(I, a, 0.4)
					if l then
						N = _
						H.MeanOffset = N(l - n)
						H.JitterSpread = Q
						D = _
						q = D(K) + Vector3.new(0, q.Y, 0)
					else
					end
				else
				end
				D = d
				H.Residual = D(r, 0, 0, 5)
				K = H.JumpLog
				if c then
					H.GroundSince = H.GroundSince or a
					H.GroundY = n.Y
					H.GroundAt = a
				end
				if
					w
					and not H.LastAirborne
					and (q.Y > 8 or o and y.Y > 8 or J)
					and a - (H.GroundSince or a) >= 0.04
					and (not K[1] or a - K[#K] > 0.3)
				then
					table.insert(K, a)
				end
				if w then
					H.GroundSince = nil
				end
				H.GroundGap = math.max(0, X - t)
				if w and q.Y > H.JumpVelocity * 0.5 then
					H.JumpVelocity = math.max(H.JumpVelocity * 0.98, q.Y)
				end
				while K[1] and a - K[1] > 4 do
					table.remove(K, 1)
				end
				H.JumpPeriod = nil
				if #K >= 3 then
					c, s = #K - 1, 0
					for d = 2, #K, 1 do
						s += K[d] - K[d - 1]
					end
					D, r = s / c, 0
					for d = 2, #K, 1 do
						r += (K[d] - K[d - 1] - D) ^ 2
					end
					if math.sqrt(r / c) / D < 0.3 and D > 0.3 and D < 2.5 and a - K[#K] < D * 1.5 then
						H.JumpPeriod = D
					end
				end
				E, K, s = w and "Air" or "Ground", Vector3.new(H.Velocity.X, 0, H.Velocity.Z), Vector3.new(q.X, 0, q.Z)
				r = E ~= H.Mode
					or K.Magnitude > 3 and s.Magnitude > 3 and K.Unit:Dot(s.Unit) < 0.3
					or K.Magnitude > 3 ~= (s.Magnitude > 3)
				if r then
					H.StableSince = a
					K = T
					K.MotionRevision = K.MotionRevision + 1
				end
				r = P and math.max(a - P.Time, 0.0033333333333333335) or 0.016666666666666666
				H.Acceleration = H.Acceleration:Lerp((q - H.Velocity) / r, 0.25)
				H.Velocity, H.RawVelocity, H.ObservedVelocity = q, o and y or Vector3.new(0.0, 0.0, 0.0), S or q
				t = T
				H.Position, H.UpdatedAt, H.Frame = n, a, t.Frame
				H.Mode = E
				H.LastAirborne = w
				H.Airborne = w
				H.Gravity = m
				H.Spoofed = R
				H.Desynced = j
				H.Trusted = W
				H.Confidence = W and 1 or (S and math.clamp(e / 0.1, 0, 1) or 0)
				H.VelocityConfidence = H.Confidence
				H.BallisticConfidence = w and H.Confidence or 0
				H.PositionDriven = not W and S ~= nil
			end
		end
	end,
	F = function(P, T, o, d, m, A, _, V, l)
		if d <= 92 then
			if d <= 91 then
				return 2
			else
				local E = buffer.readu8(m, V + 2)
				return 1, not (E < 128) and 44 or 17, A, V, o, E
			end
		elseif d <= 93 then
			return 1, 41, A, 1 + V, o, _
		elseif d <= 94 then
			return 1, 15, A + 1, V, o, _
		else
			local d = buffer.readu8(m, A + 3)
			local P, m, E, a, I = (o - 128) * 128, T - 128, (l - 128) * 16384, 2097152 * (d % 128), d % 128
			local T = (d - I) * 2097152
			I = m + a + T + E + P
			return 1, 111, A + 4, V, I, _
		end
	end,
	[18] = bit32.countrz,
	Y = {},
	[116] = rawget,
	ZH = function(P, T, o, d, m, A, _, V, l)
		if m <= 33 then
			if m <= 32 then
				local E = l + 128 * (A - 128)
				return 18, _, T + 2, E, A
			else
				return 34, _, l, T + 1, A
			end
		elseif m <= 34 then
			local E = buffer.create(d)
			buffer.copy(E, 0, l, T, d)
			local a = d + T
			V[A] = E
			E = buffer.readu8(l, a)
			if not (E < 128) then
				return 26, _, l, a, E
			else
				return 14, _, a, E, A
			end
		elseif m <= 35 then
			return 2, _[5], l, T, A
		else
			A[d] = o
			return 6, _, l, T, A
		end
	end,
	[121] = function(P, P, P, P)
		return function(P, T)
			local T = buffer.writei8
			local o = P[2]
			local d = P[3]
			local m = P[4]
			return function(P)
				local A
				local A = T
				local _ = not A.Loaded
				if _ then
					local V
					o[6][o[5]]()
				end
				A = os.clock()
				local o
				_ = d
				_.ResolveShotEcho(A)
				local o
				A, _ = m[6][m[5]](P), T
				local o, m = _.Lo, T
				P = m.Hi
				A = if P and o > 0
					then if P - o > 0.04 then o + (P - o) * 0.4 else P
					else P or (if o > 0 then math.max(A, o + 0.05) else A)
				m = T
				P, o = m.Pending
				if P then
					o = P.At
				else
					_ = T
					o = _.ConfirmedAt
				end
				_, P = o == -1 / 0
				if _ then
					m = d
					P = m.LastShotRequestAt or -1 / 0
				else
					P = o
				end
				return P + A + 0.02
			end
		end
	end,
	p = {},
	X = function(P, T, o, d, m, A, _, V, l)
		if d <= 160 then
			local E = buffer.readu8(o, 2 + l)
			return 128 > E and 85 or 81, E, A
		elseif d <= 161 then
			A[m] = V
			return 34, T, A
		else
			local d = buffer.readu8(o, _ + 1)
			return not (d >= 128) and 37 or 135, T, d
		end
	end,
	[8] = table.insert,
	[57] = buffer.tostring,
	_H = function(P, T, o)
		local d, m, A, _, V, l, E, a, I, H, W, w, j, n, y, S, r, t, X, J, e, R, q = P:h()
		local c, N, Q, D, K, s, k, L, f, Y, M, u, v, h, z, C, O, i, x, Z, G, p, g, F =
			m, A, o, T, _, V, l, E, a, I, H, W, w, j, n, y, S, r, t, X, J, e, R, q
		while d do
			if c <= 80 then
				if c <= 39 then
					if c <= 19 then
						if c <= 9 then
							if c <= 4 then
								c, Q, K, k, L, u = P:B(M, k, Q, K, Y, L, c, u, f)
							else
								c, K, k, i, Z, p = P:x(k, Z, Q, K, p, F, c, g, i)
							end
						elseif c <= 14 then
							c, D, s, k, L, h = P:U(s, z, D, c, L, M, Y, C, h, k, Q)
						else
							c, Q, s, k, f, O = P:S(c, s, K, k, f, i, x, Q, O)
						end
					elseif c <= 29 then
						if c <= 24 then
							if c <= 21 then
								c, s, k, i = P:H(k, x, i, Z, s, c, Q)
							else
								c, K, k, f, v, p = P:K(M, h, p, Q, f, Y, v, K, z, k, c)
							end
						else
							c, Q, D, K, s, k, f = P:q(c, s, K, D, h, i, k, M, L, u, x, Z, C, z, f, Q, Y, O, v)
						end
					elseif c <= 34 then
						if c <= 31 then
							c, Q, k, Y, M = P:v(k, Y, Q, M, K, u, c)
						else
							c, s, k, v, G = P:k(s, N, L, c, v, k, G, Q)
						end
					else
						c, N, D, K, k, h, z, i, g = P:l(D, s, N, g, h, z, C, x, c, k, i, Q, K)
					end
				elseif c <= 59 then
					if c <= 49 then
						if c <= 44 then
							c, N, k, L, f, C, O, x = P:C(Q, i, C, L, G, k, x, N, f, O, c, Z)
						else
							c, N, k, h, z, O = P:A(Y, f, c, Q, h, L, z, N, i, O, k)
						end
					elseif c <= 54 then
						c, k, L, Y, M = P:G(Y, Q, c, L, C, v, k, O, h, u, M)
					else
						c, N, D, K, s, k, L, Y, M, u = P:Z(k, N, c, u, K, L, Y, s, M, D, Q)
					end
				elseif c <= 69 then
					if c <= 64 then
						c, N, k, h, G = P:z(h, k, N, G, c, L, Q)
					elseif c <= 66 then
						c, i, F = P:b(i, c, k, Q, F)
					else
						c, K, h, i = P:_(i, N, z, h, C, c, K)
					end
				elseif c <= 74 then
					c, N, D, K, s, k, M, C = P:y(D, k, K, Q, N, s, O, M, C, c)
				elseif c <= 77 then
					c, D, K, v, x = P:r(x, Q, K, k, c, v, D)
				else
					c, k, h, i, x = P:J(z, i, c, C, Q, h, Z, k, x)
				end
			elseif c <= 121 then
				if c <= 100 then
					if c <= 90 then
						if c <= 85 then
							c, N, Q, K, k, v, C, O = P:R(N, h, k, K, Q, c, C, O, s, f, v, Y)
						else
							c, N, k, M, v, h = P:O(z, c, k, N, h, M, v, Q)
						end
					elseif c <= 95 then
						V, A, j, R, T, o = P:F(Y, f, c, Q, K, x, k, M)
						if V == 2 then
							return D, Q, k
						elseif V == 1 then
							c, K, k, f, x = A, j, R, T, o
						end
					else
						c, K, s, k, L, C = P:w(L, c, s, K, f, k, Q, C)
					end
				elseif c <= 110 then
					if c <= 105 then
						c, D, K, s, k, Y, z = P:Q(K, Q, Y, L, c, k, z, s, D)
					else
						c, N, k, L, u, h, C, p = P:o(g, N, Q, C, h, z, k, F, L, c, Y, u, p)
					end
				elseif c <= 115 then
					c, k, C, O = P:I(O, f, Q, C, M, k, L, D, N, c)
				elseif c <= 118 then
					c, L, v, z = P:P(N, k, L, c, v, z, Q)
				else
					c, K, k, i, G = P:M(f, k, Z, G, c, i, K, Q, x)
				end
			elseif c <= 141 then
				if c <= 131 then
					if c <= 126 then
						c, k, f, M, x = P:E(x, Q, M, Z, f, c, K, k, G)
					else
						c, k, M, h, x, p = P:T(M, k, x, K, p, g, Q, c, h)
					end
				elseif c <= 136 then
					c, D, k, Y, Z = P:f(N, c, L, K, Q, k, s, D, Y, Z)
				elseif c <= 138 then
					c, N, k, Y = P:D(Q, c, u, N, k, Y, M)
				else
					c, K, k, C = P:e(N, k, i, K, O, Q, C, c)
				end
			elseif c <= 151 then
				if c <= 146 then
					c, N, Q, k, L, f, Y, C = P:d(K, N, Q, c, L, k, f, C, Y)
				else
					c, N, k, L, Y, M, x, Z = P:g(k, M, Q, Y, c, L, N, Z, x, u)
				end
			elseif c <= 156 then
				if c <= 153 then
					c, k, M, h = P:W(Q, C, k, c, h, v, M, u, z)
				else
					c, Q, K, k, M, x = P:a(Z, c, f, M, k, K, Q, x, G)
				end
			elseif c <= 159 then
				c, k, f, x, Z = P:L(Q, Z, k, f, c, G, x)
			else
				c, Y, x = P:X(Y, Q, c, G, x, k, p, K)
			end
		end
	end,
	z = function(P, T, o, d, m, A, _, V)
		if A <= 61 then
			if A <= 60 then
				local l = buffer.readu8(V, o + 2)
				return not not (128 <= l) and 125 or 43, d, o, T, l
			else
				return not (_ >= 128) and 58 or 158, d, o, T, m
			end
		elseif A <= 62 then
			return 75, d[5], o, T, m
		elseif A <= 63 then
			return 36, d, 1 + o, T, m
		else
			local T = buffer.readu8(V, 1 + o)
			return not (T < 128) and 101 or 82, d, o, T, m
		end
	end,
	[37] = buffer.writei16,
	[14340] = function(P, T, T, T)
		return function(T, o, o)
			local o = T[1]
			local d = T[2]
			local m = T[3]
			return function()
				local T, A, _, V, l, E, a, I, H, W, w, j, n, y, S = 11
				while true do
					local r, t, X = T <= 5
					if r then
						if T <= 2 then
							if T <= 0 then
								local r = A[3]
								T, A = 1, r
							elseif T <= 1 then
								return w
							else
								t = bit32.band(l + 1, 255)
								X = bit32.band(E + W[t], 255)
								W[t], W[X] = W[X], W[t]
								local r = W[bit32.band(W[t] + W[X], 255)]
								buffer.writeu8(w, _, (bit32.bxor(buffer.readu8(a, I + _), r)))
								T, l, E = 3, t, X
							end
						elseif T <= 3 then
							local r, J, e = A[5], A[1], A[2]
							local R, q = r + J, J <= 0
							r, J = R >= e, R <= e
							e = q and r or not q and J
							A[5] = R
							if e then
								T, _ = 2, R
							else
								T = 0
							end
						elseif T <= 4 then
							local r = bit32.band(S, 255)
							W[y], W[r] = W[r], W[y]
							local J = bit32.bor(_, l, E, V, (bit32.lshift(W[bit32.band(W[y] + W[r], 255)], 24)))
							buffer.writeu32(w, n, (bit32.bxor(buffer.readu32(a, I + n), J)))
							T, _, V, l, E = 9, y, r, y, r
						else
							local r = A[1]
							T, A = 8, r
						end
					else
						local r = T <= 8
						if r then
							if T <= 6 then
								local r = bit32.band(V + W[y], 255)
								W[y], W[r] = W[r], W[y]
								local J
								V, T, J = bit32.lshift(W[bit32.band(W[y] + W[r], 255)], 16), 4, bit32.band(y + 1, 255)
								y, S = J, r + W[J]
							elseif T <= 7 then
								local S, r = 0, bit32.band(l + 1, 255)
								local J = bit32.band(E + W[r], 255)
								W[r], W[J] = W[J], W[r]
								T, _, V, l, E = 10, S, J, bit32.lshift(W[bit32.band(W[r] + W[J], 255)], 0), r + 1
							else
								local _, S = H - 1, 1 + 0
								local r = j - S
								local J = { S, _ + 0, A, nil, r }
								T, A = 3, J
							end
						else
							local _ = T <= 9
							if _ then
								local _, S, r = A[2], A[3], A[5]
								local J, e = _ + S, S <= 0
								_, S = J >= r, J <= r
								r = e and _ or not e and S
								A[2] = J
								if r then
									T, n = 7, J
								else
									T = 5
								end
							else
								local _ = T <= 10
								if _ then
									local _ = bit32.band(E, 255)
									local n = bit32.band(V + W[_], 255)
									W[_], W[n] = W[n], W[_]
									local S
									E, T, V, S =
										bit32.lshift(W[bit32.band(W[_] + W[n], 255)], 8), 6, n, bit32.band(_ + 1, 255)
									y = S
								else
									local _
									local _, V = o[6][o[5]]
									local o = d[6][d[5]]
									local d, V, V, n, y = buffer.len(_) - o
									V, t, X, n, y = m[6][m[5]], 0, 0, buffer.create(d), d - d % 4
									local P, m = y - 1, 4 + 0
									local S, r = 0 - m
									r, T = { A, S, m, nil, P + 0 }, 9
									A, l, E, a, I, H, W, w, j = r, 0, 0, _, o, d, V, n, y
								end
							end
						end
					end
				end
			end
		end
	end,
	[126] = table.move,
	[39] = coroutine.status,
	s = function(P, ...)
		(...)[...] = nil
	end,
	[22] = buffer.writestring,
	E = function(P, T, o, d, m, A, _, V, l, E)
		if _ <= 123 then
			if _ <= 122 then
				local a = (T - 128) * 128 + m
				return 38, l + 2, A, d, a
			else
				return 90, l + 1, A, d, T
			end
		elseif _ <= 124 then
			local a = buffer.readu8(o, l)
			return not not (128 <= a) and 108 or 9, l, A, a, T
		elseif _ <= 125 then
			local _ = buffer.readu8(o, 3 + l)
			local a, I, H, W, w = (T - 128) * 128, m - 128, (E - 128) * 16384, _ % 128 * 2097152, _ % 128
			local m = 2097152 * (_ - w)
			_ = H + W + (a + I + m)
			return 38, l + 4, A, d, _
		else
			local m = buffer.readu8(o, V)
			return not (m < 128) and 59 or 68, l, m, d, T
		end
	end,
	[5] = function(P, P, P)
		return function(P)
			local T = buffer.writei8
			local o = P[2]
			local d = P[3]
			local m = P[4]
			local A = P[5]
			local _ = P[6]
			local V = P[7]
			local l = table.insert
			local E = P[9]
			local a = vector.create
			return function(P)
				local I
				local I = T[6][T[5]]()
				local T
				local T = o
				local H, W = T.Alive and I.Crosshair
				if H then
					T = o
					W = not T.IsOpen
				else
					W = H
				end
				local o
				T = d
				T.Visible = W
				local o
				T = m
				H = T:GetMouse()
				local o, w = W and H.Icon:find("79658449", 1, true) ~= nil
				if o then
					T = A
					T.SavedIcon = H.Icon
					H.Icon = ""
				else
					local w, j = not W
					if w then
						local n = A
						j = n.SavedIcon
					else
						j = w
					end
					if j then
						w = m
						local m = w.Character
						local w = H.Icon == "" and m and m:FindFirstChild("Gun")
						if w then
							m = A
							H.Icon = m.SavedIcon
						end
						w = A
						w.SavedIcon = nil
					end
				end
				if not W then
					return
				end
				local m
				W, o = _[6][_[5]](), d
				o.Position = UDim2.fromOffset(W.X, W.Y)
				local m, _, w, j, n =
					I.CrosshairSize, I.CrosshairGap, I.CrosshairThickness, I.CrosshairColor, I.CrosshairStyle
				local y, S = n == "Cross" or n == "T-shape"
				T = V
				for V, S in pairs(T) do
					S.Visible = y and not (n == "T-shape" and V == "Top")
					S.BackgroundColor3 = j
					S.Size = (V == "Top" or V == "Bottom") and UDim2.fromOffset(w, m) or UDim2.fromOffset(m, w)
					o = _ + m / 2
					S.Position = V == "Top" and UDim2.fromOffset(0, -o)
						or V == "Bottom" and UDim2.fromOffset(0, o)
						or V == "Left" and UDim2.fromOffset(-o, 0)
						or UDim2.fromOffset(o, 0)
				end
				local V
				T = l
				T.Visible = I.CrosshairDot or n == "Dot"
				W = l
				W.BackgroundColor3 = j
				o = l
				o.Size = UDim2.fromOffset(w + 1, w + 1)
				local V
				W = E
				W.Visible = n == "Circle"
				o = E
				o.Size = UDim2.fromOffset((_ + m) * 2, (_ + m) * 2)
				local V
				T = a
				T.Color = j
				H = a
				H.Thickness = w
				H = I.CrosshairSpin and n ~= "Circle"
				if H then
					_, T = A, A
					_.Spin = (T.Spin + P * 160) % 360
					m, o = d, A
					m.Rotation = o.Spin
				else
					I = d
					I.Rotation = 0
				end
			end
		end
	end,
	[58] = bit32.bnot,
	[119] = function(P, T, T, T, T)
		return function(T, o)
			local o = T[1]
			local d = T[2]
			return function()
				local T
				local T = o
				local m, A = T.Settings.Player.SpeedBoost
				if m then
					A = m
				else
					T = o
					A = T.Settings.Player.JumpBoost
				end
				T = nil
				if A then
					T = A
				else
					m = o
					T = m.Settings.Player.SpeedHack
				end
				A = nil
				if T then
					A = T
				else
					m = nil
					m, A = o, next(o.PlayerMovement.HumanoidDefaults) ~= nil
				end
				if A then
					m = o
					m.PlayerMovement.ApplyBoosts()
				end
				A = o
				m, T = A.Settings.Player.Noclip
				if m then
					A = o
					T = not A.FlingRuntime.ProtectionSuspended
				else
					T = m
				end
				if T then
					A = o
					A.PlayerMovement.SetNoclip(true)
				end
				m = o
				T, A = m.Settings.Player.AntiFling
				if T then
					m = o
					A = not m.FlingRuntime.ProtectionSuspended
				else
					A = T
				end
				if A then
					m = o
					m.PlayerMovement.StabilizeAntiFling()
				end
				A = o
				T = A.Settings.Player.Fly
				if T then
					m = o
					m.PlayerMovement.UpdateFly()
				else
					A = o
					local _, V = A.PlayerMovement.FlyRuntime
					if _ then
						local l = o
						V = l.PlayerMovement.FlyRuntime.BodyVelocity ~= nil
					else
						V = _
					end
					if V then
						_ = o
						_.PlayerMovement.StopFly()
					end
				end
				m = o
				A, T = m.PlayerMovement, o
				local _, V = T.Settings.Player.AntiVoid
				if _ then
					T = d
					m = T.FallenPartsDestroyHeight
					local T = m == m
					if T then
						local T = bit32.bxor(136371693, 0)
						T = P:zH(T + 46271208)
						A.OriginalDestroyHeight = m
						local m
						m, T = pcall, P:zH(T + 223290208)
						m(function()
							local T = d
							T.FallenPartsDestroyHeight = 0 / 0
						end)
					end
				else
					local T, m = A.OriginalDestroyHeight
					if T then
						local _ = o
						m = not _.FlingRuntime.Busy
					else
						m = T
					end
					if m then
						local o = bit32.bxor(251829136, 0)
						local m = A.OriginalDestroyHeight
						o = P:zH(o + 325274717)
						A.OriginalDestroyHeight = nil
						T = nil
						T, o = pcall, P:zH(o - 155586006)
						T(function()
							local P = d
							P.FallenPartsDestroyHeight = m
						end)
					end
				end
			end
		end
	end,
	jH = function(P, P, T)
		local o, d, m = T[5], T[2], T[4]
		local A, _ = o + d, d <= 0
		o, d = A >= m, A <= m
		m = _ and o or not _ and d
		T[5] = A
		if m then
			return 33, A
		else
			return 16, P
		end
	end,
	[54] = select,
	[98] = buffer.writei32,
	[104] = buffer.readi16,
	[4] = function(P, P, P)
		return function(P)
			local T = buffer.writei8
			local o = P[2]
			local d = P[3]
			return function(P, m, A, _)
				local V
				local V = T
				local T = V.GetShootProtocol(m, P, A)
				if not T then
					return nil
				end
				local l, E, a = T == "Pair" or T == "Handle", _ and _.Gun == P
				if E then
					a = _
				else
					local I
					V = o
					a = (V(true))
				end
				if not a or a.Gun ~= P then
					return nil
				end
				local o
				V = d
				E, T = V:GetShootCFrames(false, l, a)
				if not E then
					return nil
				end
				V = d
				_ = V:BuildShootArguments(m, P, E, T, A, a.TargetPart)
				if not _ then
					return nil
				end
				return a, E, T, _, l and a.Penetration
			end
		end
	end,
	uH = function(P, T, o, d, m, A)
		local _ = buffer.readu8(d, m + 3)
		local P, d, V, l, E = (o - 128) * 128, T - 128, 16384 * (A - 128), _ % 128 * 2097152, _ % 128
		A = (_ - E) * 2097152
		_ = l + V + d + (P + A)
		return 26, m + 4, _
	end,
	[75] = buffer.readu16,
	[77] = bit32.bxor,
	[27] = function(P, T, T, T)
		return function(T, o)
			local o = T[1]
			local d = T[2]
			local m = T[3]
			local A = T[4]
			local _ = T[5]
			local V = T[6]
			local l = T[7]
			local E = T[8]
			local a = T[9]
			local I = T[10]
			local H = T[11]
			local W = T[12]
			local w = T[13]
			local j = T[14]
			local n = T[15]
			local y = T[16]
			return function()
				local T
				o[6][o[5]] += 1
				local T = os.clock()
				local S
				local S, r = T - d[6][d[5]] >= 0.5
				if S then
					m[6][m[5]], o[6][o[5]], d[6][d[5]] =
						math.clamp(math.round(o[6][o[5]] / math.max(0.001, T - d[6][d[5]])), 1, 999), 0, T
				end
				local o, o, o
				local o, d = A[6][A[5]] and _[6][_[5]] and _[6][_[5]].Visible and T - V[6][V[5]] >= 0.25
				if o then
					local d = bit32.bxor(318360127, 0)
					V[6][V[5]] = T
					d = P:zH(d + 486463432)
					local _ = 0
					d = P:zH(d - 431209466)
					S = not pcall(function()
						local d
						d, _ = l, math.round(l:GetNetworkPing() * 1000)
					end) or _ <= 0
					if S then
						local d = game:GetService("Stats")
						local V = d
							and d:FindFirstChild("PerformanceStats")
							and d.PerformanceStats:FindFirstChild("Ping")
						if V then
							_ = math.round(V:GetValue())
						else
						end
					else
					end
					local d = "--:--"
					pcall(function()
						local V = DateTime.now():ToLocalTime()
						d = string.format("%02d:%02d", V.Hour, V.Minute)
					end)
					A[6][A[5]].Text = string.format(
						'Head<font color="rgb(107,181,235)">Shot</font>   %d ms   %d fps   %s',
						_,
						m[6][m[5]],
						d
					)
				end
				local d
				S = E
				local d, m = S.Settings.Aimbot
				local m, A, _ = d.AutoWin and a[6][a[5]]() or false, d.Enabled and (d.ForceShoot or d.AutoShoot)
				S, o = A and I[6][I[5]]() or false, E
				m = o.Settings.Aimbot.AutoWin and m
				local A, A
				if m then
					d = H
					A = not d.AutoWinRunning
				else
					A = m
				end
				o = nil
				if A then
					d = H
					o = T - d.LastAutoWinAt >= 0.4
				else
					o = A
				end
				if o then
					local m, _ = bit32.bxor(203690527, 0), H
					_.LastAutoWinAt = T
					_ = H
					_.AutoWinRunning = true
					m = P:zH(m + 53278799)
					A = nil
					A, m = task.spawn, P:zH(m + 360045683)
					A(function()
						local P
						pcall(W[6][W[5]])
						local P = H
						P.AutoWinRunning = false
					end)
				end
				o = E
				A, d = o.Settings.Aimbot.Enabled
				if A then
					o = E
					local P = o.Settings.Aimbot.ForceShoot
					if P then
						d = P
					else
						local P = E
						d = P.Settings.Aimbot.AutoShoot
					end
				else
					d = A
				end
				S = d and S
				if S then
					local P
					w[6][w[5]]()
					A = H
					d = A.CurrentSnapshot
					if d then
						o = E
						o.PredictedTargetPosition = d.PredictedPosition
						local P = E
						P.TargetMurder = d.Player
					else
						local P = E
						P.PredictedTargetPosition = nil
						P = E
						P.TargetMurder = nil
						P = H
						local m, _ = P.AutoEquippedGun
						if m then
							P = l
							_ = P.Character
						else
							_ = m
						end
						if _ then
							m = l
							P = m.Character:FindFirstChildOfClass("Humanoid")
							if P then
								P:UnequipTools()
							end
							local P = H
							P.AutoEquippedGun = nil
						end
					end
				else
					local P = E
					P.PredictedTargetPosition = nil
					P = E
					P.TargetMurder = nil
					P = H
					local m, _ = P.AutoEquippedGun
					if m then
						P = l
						_ = P.Character
					else
						_ = m
					end
					if _ then
						m = l
						P = m.Character:FindFirstChildOfClass("Humanoid")
						if P then
							P:UnequipTools()
						end
						local P = H
						P.AutoEquippedGun = nil
					end
				end
				o = E
				A = o.Settings.Visuals.Enabled
				if A then
					local P
					d = T - j[6][j[5]] >= 0.1
					if d then
						j[6][j[5]] = T
						local P
						n[6][n[5]]()
						local P
						y[6][y[5]]()
					end
				end
			end
		end
	end,
	[88] = string.gmatch,
	R = function(P, T, o, d, m, A, _, V, l, E, a, I, H)
		if _ <= 82 then
			if _ <= 81 then
				local W = buffer.readu8(A, m + 3)
				local w, j, n, y, S = 128 * (d - 128), a - 128, 16384 * (H - 128), 2097152 * (W % 128), W % 128
				local r = (W - S) * 2097152
				W = n + j + (y + (r + w))
				return 15, T, A, 4 + m, W, I, V, l
			else
				local W = (I - 128) * 128 + o
				return 45, T, A, m, d + 2, W, V, l
			end
		elseif _ <= 83 then
			local o = V - 14129
			local W, w, j = table.create(o), table.create(o), 1 + 0
			local P = 1 - j
			return 69, { nil, T, o + 0, P, j }, A, m, d, I, W, w
		elseif _ <= 84 then
			if not (1 == E) then
				return 91, T, m, m, d, I, V, l
			else
				return 11, T, A, m, d, I, V, l
			end
		else
			local P, o = 16384 * (d - 128), 128 * (a - 128)
			local d = P + H + o
			return 15, T, A, m + 3, d, I, V, l
		end
	end,
	m = function(P, T, o, d)
		local m
		local A, _, V, l, E, a, I, H, W, w, j, n, y, S, r, t, X, J, e, R, q, c, N, Q, D, K, s, k, L =
			buffer.readu8,
			buffer.tostring,
			buffer.create,
			buffer.writeu8,
			P.c,
			bit32.bxor,
			buffer.readu16,
			buffer.writeu32,
			buffer.readu32,
			P.n,
			P.Y,
			buffer.readi32,
			string.sub,
			buffer.copy,
			string.rep,
			buffer.readf32,
			Vector2.new,
			buffer.readi16,
			buffer.readstring,
			buffer.readf64,
			table.create,
			P.m,
			buffer.fill,
			bit32.band,
			bit32.rshift,
			Vector3.new,
			P.p,
			6
		local f
		local Y, M, u, v, h, z, C, O, i, x, Z, G = T, o, d
		while true do
			if k <= 17 then
				if k <= 8 then
					if k <= 3 then
						k, u, h, z, C = P:sH(z, O, i, x, u, C, k, h)
					else
						k, L, u, v, h, z = P:iH(O, h, z, C, m, Z, u, v, k, Y, M, L)
					end
				elseif k <= 12 then
					local T, p, g, F, B, b, U, Pb = P:NH(M, v, h, Y, i, u, C, k, x, z)
					if T == 1 then
						k, Y, M, u, z, C, x = p, g, F, B, b, U, Pb
					elseif T == 2 then
						return Y, M
					end
				elseif k <= 14 then
					k, u, O = P:tH(v, h, u, O, k, m)
				elseif k <= 15 then
					k, z = P:jH(z, L)
				elseif k <= 16 then
					d = L[3]
					m = Y
					k, L, M = m[7] and 5 or 28, d, 6
				else
					k = P:VH(u, v, h, i, C, z)
				end
			elseif k <= 26 then
				if k <= 21 then
					if k <= 19 then
						if k <= 18 then
							f = m[5]
							o = {
								__index = function(T, d)
									local Y, p = 85
									local g, F, B, b, U, Pb, Tb, ob, db, mb, Ab, _b, Vb, lb = T, d
									while true do
										T, d = nil
										if Y <= 88 then
											local Eb, ab, Ib
											if Y <= 43 then
												if Y <= 21 then
													if Y <= 10 then
														if Y <= 4 then
															if Y <= 1 then
																if Y <= 0 then
																	local Hb, Wb = Tb - 1, 1 + 0
																	local wb = { nil, Vb - Wb, Wb, p, Hb + 0 }
																	Y, p = 36, wb
																else
																	local Hb, Wb, wb =
																		(Pb - 128) * 16384, (Tb - 128) * 128
																	wb, Y, b = Wb + Hb + ob, 139, b + 3
																	Pb = wb
																end
															elseif Y <= 2 then
																Y, B, b = 154, 128 * (B - 128) + b, 2
															elseif Y <= 3 then
																local Hb = b + 1
																local Wb = A(Tb, Hb)
																Y, b, U = not (Wb >= 128) and 171 or 90, Hb, Wb
															else
																local Hb, Wb = 9, 181
																Eb = (B + 25) % 256
																local wb, jb, nb = V(U), 421075225, U - U % 4
																local yb, Sb = nb - 1, 4 + 0
																local rb = 0 - Sb
																local tb = { yb + 0, rb, Sb, p, nil }
																Y, p, B, Pb, ob, db, mb, Ab, _b, Vb =
																	53, tb, Eb, 25, _, Hb, Wb, wb, jb, nb
															end
														elseif Y <= 7 then
															if Y <= 5 then
																Ab(_b, db, (lb(Vb, mb, b)))
																local Hb = 1
																l(E, Hb, (a((Tb * mb + ob) % 256, A(Pb, Hb + B), b)))
																Y, B = 161, I(E, U)
															elseif Y <= 6 then
																local I, Hb = 3 * (U - 1), A(Ab, b)
																Y, U, Pb = not (Hb < 128) and 35 or 19, I, Hb
															else
																local I = A(Pb, 3 + B)
																local Hb, Wb, wb, jb, nb =
																	128 * (b - 128),
																	U - 128,
																	16384 * (Tb - 128),
																	2097152 * (I % 128),
																	I % 128
																local yb, Sb, rb = 2097152 * (I - nb), wb + jb
																rb, Y, B = Sb + (Hb + (yb + Wb)), 120, B + 4
																b = rb
															end
														elseif Y <= 8 then
															local I, Hb, Wb = p[3], p[2], p[1]
															local wb, jb = I + Hb, Hb <= 0
															Hb, I = wb >= Wb, wb <= Wb
															Wb = jb and Hb or not jb and I
															p[3] = wb
															if Wb then
																Y, U = 71, wb
															else
																Y = 122
															end
														elseif Y <= 9 then
															local I, Hb, Wb = (ob - 128) * 16384, (db - 128) * 128
															Wb, Y, b = mb + (Hb + I), 149, 3 + b
															ob = Wb
														else
															Y = not (56 > ob) and 127 or 157
														end
													elseif Y <= 15 then
														if Y <= 12 then
															if Y <= 11 then
																Y, B = 110, B + 1
															else
																local I = A(Pb, 2 + B)
																Y, Tb = not (I >= 128) and 44 or 87, I
															end
														elseif Y <= 13 then
															Y, Pb, U =
																112, 16384 * (Tb - 128) + (Pb + 128 * (ob - 128)), 3 + U
														elseif Y <= 14 then
															local I, Hb, Wb = 1 + b, (204 + B) % 256, 0
															local Wb = W(Pb, 0 + I)
															H(E, 0, (a(3435973836, w[Hb], Wb)))
															I = j[Hb]
															Y, B = 52, n(E, U)
														else
															Y = not not (Tb == 191) and 57 or 96
														end
													elseif Y <= 18 then
														if Y <= 16 then
															local I, n, Hb = y(B, Tb % U + 1, Tb % U + 2), 1 + Tb, 1 + 0
															local Wb = { nil, n - Hb, p, Pb + 0, Hb }
															Y, p, Tb = 86, Wb, I
														elseif Y <= 17 then
															local I = A(Pb, B + 3)
															local n, Hb, Wb, wb, jb =
																128 * (b - 128),
																U - 128,
																16384 * (Tb - 128),
																I % 128 * 2097152,
																I % 128
															local nb, yb, Sb = 2097152 * (I - jb), Wb + Hb
															Sb, Y, B = yb + (wb + nb + n), 110, B + 4
															b = Sb
														else
															local I, n, Hb = b + 1, 9, 181
															local Wb, wb = 0, (n * ((B + 138) % 256) + Hb) % 256
															Y, B, b, U, ob, db, mb, Ab, _b, Vb, lb =
																91, I, 138, n, Hb, Wb, wb, l, E, A(Tb, Wb + I), a
														end
													elseif Y <= 19 then
														Y, b = 139, 1 + b
													elseif Y <= 20 then
														local I, n, Hb, Wb = b + 1, (254 + B) % 256, 4278124286, 0
														local wb = W(Pb, Wb + I)
														H(E, Wb, (a(Hb, w[n], wb)))
														wb = j[n]
														Wb = 4
														Y, B, b, Tb, ob, db, mb, Ab, _b, Vb =
															145, I, Hb, wb, Wb, H, E, W(Pb, I + Wb), w[wb], a
													else
														local I, n, n = b + 1, 0, (9 * ((211 + B) % 256) + 181) % 256
														l(E, 0, (a(n, A(Tb, 0 + I), 211)))
														Y, B = 161, A(E, Pb)
													end
												elseif Y <= 32 then
													if Y <= 26 then
														if Y <= 23 then
															if Y <= 22 then
																local I = V(b)
																S(I, 0, Tb, B, b)
																local n = B + b
																Y, B = 161, I
															else
																local I = A(Tb, 2 + b)
																Y, ob = not not (I >= 128) and 79 or 101, I
															end
														elseif Y <= 24 then
															ab = 0
															local I = 1 + 0
															local n = 1 - I
															local S = { Pb + 0, p, nil, I, n }
															Y, p, b = 45, S, ab
														elseif Y <= 25 then
															local I = A(Tb, 3 + b)
															local n, S, Hb, Wb, wb =
																128 * (Pb - 128),
																ob - 128,
																16384 * (db - 128),
																2097152 * (I % 128),
																I % 128
															local jb, nb, yb, Sb = 2097152 * (I - wb), Hb + n
															yb, Sb, Y = nb + (jb + S + Wb), 4 + b, 24
															Pb = yb
														else
															local I, n, S = p[1], ob(Ab), b + U
															local Hb = A(Pb, S)
															if 128 > Hb then
																Y, p, B, b, U, Pb = 69, I, n, r, S, Hb
															else
																Y, p, B, b, U, Tb = 176, I, n, r, S, Hb
															end
														end
													elseif Y <= 29 then
														if Y <= 27 then
															local I, n, S = p[3], p[1], p[5]
															local r, Hb = I + n, n <= 0
															I, n = r >= S, r <= S
															S = Hb and I or not Hb and n
															p[3] = r
															if S then
																Y, _b = 114, r
															else
																Y = 165
															end
														elseif Y <= 28 then
															local I = A(Tb, 3 + B)
															local n, S, r, Hb, Wb, wb =
																(b - 128) * 128,
																U - 128,
																16384 * (Pb - 128),
																I % 128 * 2097152,
																I % 128
															wb, Y, B =
																Hb + (n + (I - Wb) * 2097152) + (S + r), 22, 4 + B
															b = wb
														else
															Y, U, b = 4, Pb + 128 * (U - 128), 2 + b
														end
													elseif Y <= 30 then
														local I = W(Tb, b + lb)
														H(Ab, lb, (a(w[B], _b, I)))
														Eb = j[B]
														Y, B = 53, Eb
													elseif Y <= 31 then
														local I = A(Pb, B + 2)
														Y, Tb = not (I < 128) and 7 or 98, I
													else
														local I = 1 + b
														local n = A(Pb, I)
														Y, b, U = not not (128 <= n) and 70 or 61, I, n
													end
												elseif Y <= 37 then
													if Y <= 34 then
														if Y <= 33 then
															local I, n = p[4], A(Ab, U)
															Y, p, B = not (n >= 128) and 92 or 72, I, n
														else
															local I = A(Ab, b + 2)
															Y, mb = not (128 > I) and 166 or 9, I
														end
													elseif Y <= 35 then
														local I = A(Ab, 1 + b)
														Y, Tb = not not (128 <= I) and 155 or 134, I
													elseif Y <= 36 then
														local I, n, S = p[2], p[3], p[5]
														local r, Hb = I + n, n <= 0
														n, I = r >= S, r <= S
														S = Hb and n or not Hb and I
														p[2] = r
														if S then
															Y, Tb = 42, r
														else
															Y = 33
														end
													else
														local I, n, S = b + 1, 9, 181
														local r, Hb = 0, (S + (204 + B) % 256 * n) % 256
														Y, B, b, Tb, ob, db, mb, Ab, _b, Vb, lb =
															5, I, 204, n, S, r, Hb, l, E, A(Pb, I + r), a
													end
												elseif Y <= 40 then
													if Y <= 38 then
														Y, U, b = 4, ob + (16384 * (U - 128) + 128 * (Pb - 128)), 3 + b
													elseif Y <= 39 then
														H(Ab, lb, (a(W(Tb, b + lb), _b, w[B])))
														T = j[B]
														Y, B = 48, T
													else
														local I
														Pb, Y, I = Tb + 128 * (Pb - 128), 24, 2 + b
													end
												elseif Y <= 41 then
													Y, U, b = 131, (U - 128) * 128 + Pb, 2 + b
												elseif Y <= 42 then
													Ib = (B * db + mb) % 256
													l(Ab, Tb, (a(ob, A(Pb, Tb + b), Ib)))
													Y, B = 36, Ib
												else
													Y, b = 131, b + 1
												end
											elseif Y <= 65 then
												if Y <= 54 then
													if Y <= 48 then
														if Y <= 45 then
															if Y <= 44 then
																local I, n, S = 16384 * (b - 128), 128 * (U - 128)
																S, Y, B = n + Tb + I, 137, B + 3
																b = S
															else
																local I, n, S = p[5], p[4], p[1]
																local r, Hb = I + n, n <= 0
																n, I = r >= S, r <= S
																S = Hb and n or not Hb and I
																p[5] = r
																if S then
																	Y, Tb = 16, r
																else
																	Y = 68
																end
															end
														elseif Y <= 46 then
															local I = W(Tb, ob + B)
															H(E, ob, (a(b, w[U], I)))
															local I, I = j[U], X(t(E, Pb), (t(E, 4)))
															Y, B = 161, I
														elseif Y <= 47 then
															Y = not not (ob < 91) and 3 or 18
														else
															local I, n, S = p[2], p[5], p[1]
															local r, X = I + n, n <= 0
															I, n = r >= S, r <= S
															S = X and I or not X and n
															p[2] = r
															if S then
																Y, lb = 39, r
															else
																Y = 146
															end
														end
													elseif Y <= 51 then
														if Y <= 49 then
															local I, n, S = p[2], p[5], p[3]
															local r, X = I + n, n <= 0
															I, n = r >= S, r <= S
															S = X and I or not X and n
															p[2] = r
															if S then
																Y, lb = 64, r
															else
																Y = 177
															end
														elseif Y <= 50 then
															local I, n = 9, 181
															Ib = (58 + B) % 256
															local S, r, X = V(Tb), 976894522, Tb - Tb % 4
															local Hb, Wb = X - 1, 4 + 0
															local wb = { p, 0 - Wb, Hb + 0, nil, Wb }
															Y, p, B, ob, db, mb, Ab, _b, Vb =
																49, wb, Ib, 58, I, n, S, r, X
														else
															local I = A(Tb, 2 + B)
															Y, Pb = not (128 <= I) and 65 or 28, I
														end
													elseif Y <= 52 then
														local I
														do
															I = true
														end
														Y = I and 161 or 102
													elseif Y <= 53 then
														local I, n, S = p[2], p[3], p[1]
														local r, X = I + n, n <= 0
														n, I = r >= S, r <= S
														S = X and n or not X and I
														p[2] = r
														if S then
															Y, lb = 30, r
														else
															Y = 168
														end
													else
														local I = A(Pb, 1 + B)
														Y, U = not not (128 <= I) and 55 or 178, I
													end
												elseif Y <= 59 then
													if Y <= 56 then
														if Y <= 55 then
															local I = A(Pb, B + 2)
															Y, Tb = not (128 <= I) and 162 or 17, I
														else
															local I = A(Pb, 2 + b)
															Y, ob = I < 128 and 170 or 133, I
														end
													elseif Y <= 57 then
														local I, n, S = 1 + b, (B + 159) % 256, 0
														H(E, 0, (a(2678038431, W(Pb, 0 + I), w[n])))
														I = j[n]
														Y, B = 161, t(E, U)
													elseif Y <= 58 then
														local I = A(Tb, 2 + b)
														if not not (I >= 128) then
															Y, db = 25, I
														else
															Y, Tb = 152, I
														end
													else
														local I = A(Tb, 1 + b)
														Y, Pb = not (128 <= I) and 41 or 23, I
													end
												elseif Y <= 62 then
													if Y <= 60 then
														local I = A(Pb, 2 + b)
														Y, db = not not (I >= 128) and 124 or 78, I
													elseif Y <= 61 then
														Y, b = 141, b + 1
													else
														B[1 + U] = ob
														B[3 + U] = Pb
														B[2 + U] = Tb
														Y = 97
													end
												elseif Y <= 63 then
													local I
													I, Y = (B - 128) * 16384, 154
													B, b = U + (b - 128) * 128 + I, 3
												elseif Y <= 64 then
													local I = W(Pb, lb + b)
													H(Ab, lb, (a(w[B], I, _b)))
													Ib = j[B]
													Y, B = 49, Ib
												else
													Y, b, B = 22, Pb + (16384 * (b - 128) + 128 * (U - 128)), B + 3
												end
											elseif Y <= 76 then
												if Y <= 70 then
													if Y <= 67 then
														if Y <= 66 then
															ab = b + 1
															Y, b = 86, ab
														else
															Y, b = 50, b + 1
														end
													elseif Y <= 68 then
														local I = p[2]
														Y, p, B = 161, I, b
													elseif Y <= 69 then
														Y, U = 112, U + 1
													else
														local I = A(Pb, 1 + b)
														Y, Tb = not not (128 <= I) and 56 or 118, I
													end
												elseif Y <= 73 then
													if Y <= 71 then
														Eb = (db * B + mb) % 256
														l(Ab, U, (a(Pb, Eb, (A(Tb, b + U)))))
														Y, B = 8, Eb
													elseif Y <= 72 then
														local I = A(Ab, 1)
														Y, b = I < 128 and 2 or 80, I
													else
														Y = not (ob <= 48) and 117 or 164
													end
												elseif Y <= 74 then
													local I, n, S = p[4], p[2], p[5]
													local r, X = I + n, n <= 0
													n, I = r >= S, r <= S
													S = X and n or not X and I
													p[4] = r
													if S then
														Y, lb = 103, r
													else
														Y = 143
													end
												elseif Y <= 75 then
													local I, n = U - 1, 1 + 0
													local S = { p, nil, Vb - n, n, I + 0 }
													Y, p = 163, S
												else
													Y, ob, b = 149, 128 * (ob - 128) + db, 2 + b
												end
											elseif Y <= 82 then
												if Y <= 79 then
													if Y <= 77 then
														local I, n = U - 1, 1 + 0
														local S = { n, nil, Vb - n, p, I + 0 }
														Y, p = 27, S
													elseif Y <= 78 then
														local I, n, S = 16384 * (Tb - 128), 128 * (ob - 128)
														S, Y, b = db + n + I, 50, 3 + b
														Tb = S
													else
														local I = A(Tb, b + 3)
														local n, S, r, X, Eb =
															(U - 128) * 128,
															Pb - 128,
															16384 * (ob - 128),
															2097152 * (I % 128),
															I - I % 128
														local I, ab, Ib = 2097152 * Eb + X, r + S
														Ib, Y, b = I + (n + ab), 131, 4 + b
														U = Ib
													end
												elseif Y <= 80 then
													local I = A(Ab, 2)
													Y, U = not (I < 128) and 126 or 63, I
												elseif Y <= 81 then
													local I = b + 1
													local n = A(Pb, I)
													Y, B, b = not (128 > n) and 128 or 115, I, n
												else
													Y = not (Tb > 191) and 175 or 111
												end
											elseif Y <= 85 then
												if Y <= 83 then
													local I = b + 1
													local n = A(Tb, I)
													Y, b, U = not (n < 128) and 59 or 43, I, n
												elseif Y <= 84 then
													Y = not not (69 >= ob) and 106 or 47
												else
													local I = g[0][F]
													local n, S, r = f[I], m, 0
													local X = S[4]
													local f, Eb = A(X, n), n + 1
													if not not (f <= 91) then
														Y, B, b, U, Pb, Tb, ob = 73, I, n, S, r, X, f
													else
														Y, B, b, U, Pb, Tb = 82, I, n, r, X, f
													end
												end
											elseif Y <= 86 then
												local I, n, S = p[2], p[5], p[4]
												local r, X = I + n, n <= 0
												n, I = r >= S, r <= S
												S = X and n or not X and I
												p[2] = r
												if S then
													Y, ob = 93, r
												else
													Y = 88
												end
											elseif Y <= 87 then
												local I = A(Pb, 3 + B)
												local n, S, r, X, f, Eb =
													(b - 128) * 128,
													U - 128,
													16384 * (Tb - 128),
													2097152 * (I % 128),
													I % 128
												Eb, Y, B = r + (X + (n + (S + (I - f) * 2097152))), 137, B + 4
												b = Eb
											else
												local I = p[3]
												Y, p = 45, I
											end
										elseif Y <= 133 then
											if Y <= 110 then
												if Y <= 99 then
													if Y <= 93 then
														if Y <= 90 then
															if Y <= 89 then
																local I = A(Pb, 2 + U)
																if 128 > I then
																	Y, Pb = 13, I
																else
																	Y, db = 150, I
																end
															else
																local I = A(Tb, b + 1)
																Y, Pb = not not (128 <= I) and 144 or 29, I
															end
														elseif Y <= 91 then
															Ab(_b, db, (lb(Vb, mb, b)))
															local I = 1
															l(E, I, (a((U * mb + ob) % 256, A(Tb, B + I), b)))
															Y, B = 161, J(E, Pb)
														elseif Y <= 92 then
															Y, b = 154, 1
														else
															Y = not not (Tb ~= y(B, ob % U + 1, 2 + ob % U)) and 86
																or 66
														end
													elseif Y <= 96 then
														if Y <= 94 then
															Y = ob < 48 and 21 or 121
														elseif Y <= 95 then
															local I = b + 1
															local n = A(Pb, I)
															Y, b, Tb = 128 > n and 67 or 125, I, n
														else
															local I, n, n = 1 + b, 0, (181 + (B + 135) % 256 * 9) % 256
															l(E, 0, (a(n, 135, (A(Pb, I + 0)))))
															I = -A(E, U)
															Y, B = 161, I
														end
													elseif Y <= 97 then
														local I, n, y = p[4], p[3], p[2]
														local S, r = I + n, n <= 0
														I, n = S >= y, S <= y
														y = r and I or not r and n
														p[4] = S
														if y then
															Y, U = 6, S
														else
															Y = 105
														end
													elseif Y <= 98 then
														local I, n, y = 16384 * (b - 128), 128 * (U - 128)
														y, Y, B = n + I + Tb, 120, B + 3
														b = y
													else
														Y = not (Tb <= 236) and 108 or 37
													end
												elseif Y <= 104 then
													if Y <= 101 then
														if Y <= 100 then
															Y = not (ob <= 29) and 94 or 83
														else
															local I, n, y = (U - 128) * 16384, 128 * (Pb - 128)
															y, Y, b = ob + (n + I), 131, 3 + b
															U = y
														end
													elseif Y <= 102 then
														local I, I = 1 + b
														do
															I = true
														end
														Y = I and 24 or 71
													elseif Y <= 103 then
														local I = W(Pb, b + lb)
														H(Ab, lb, (a(w[B], _b, I)))
														d = j[B]
														Y, B = 74, d
													else
														Y = 20 == ob and 136 or 142
													end
												elseif Y <= 107 then
													if Y <= 105 then
														local I = p[1]
														Y, p = 161, I
													elseif Y <= 106 then
														local I, n, y = 1 + b, (12 + B) % 256, 0
														H(E, 0, (a(W(Tb, I + 0), 202116108, w[n])))
														I = j[n]
														Y, B = 161, W(E, Pb)
													else
														Y = not (115 < Tb) and 81 or 15
													end
												elseif Y <= 108 then
													Y = not (Tb ~= 254) and 14 or 160
												elseif Y <= 109 then
													local I = A(Pb, B + 1)
													Y, U = not (128 > I) and 12 or 156, I
												else
													Y, B = 52, e(Pb, B, b)
												end
											elseif Y <= 121 then
												if Y <= 115 then
													if Y <= 112 then
														if Y <= 111 then
															Y = not not (Tb > 226) and 99 or 147
														else
															local I = b(B, Pb, U)
															Y, B = 161, I
														end
													elseif Y <= 113 then
														local I, n = U - 1, 1 + 0
														local y = Vb - n
														local S = { I + 0, n, y, nil, p }
														Y, p = 8, S
													elseif Y <= 114 then
														T = (db * B + mb) % 256
														l(Ab, _b, (a(Pb, T, (A(Tb, b + _b)))))
														Y, B = 27, T
													else
														Y, B = 120, 1 + B
													end
												elseif Y <= 118 then
													if Y <= 116 then
														local I = A(Ab, b)
														Y, ob = not (I < 128) and 138 or 123, I
													elseif Y <= 117 then
														Y = not (ob <= 56) and 84 or 10
													else
														Y, U, b = 141, 128 * (U - 128) + Tb, b + 2
													end
												elseif Y <= 119 then
													local I, n = j[b], 4
													local y = W(Tb, B + n)
													H(E, n, (a(U, w[I], y)))
													n = j[I]
													Y, B = 161, R(E, Pb)
												elseif Y <= 120 then
													local I = q(b, A(Pb, B), B + 1)
													Y, B = 161, I
												else
													local I = c(P, U, B, 112)
													Y, B = 161, I
												end
											elseif Y <= 127 then
												if Y <= 124 then
													if Y <= 122 then
														local I = p[5]
														Y, p, B = 161, I, ob(Ab)
													elseif Y <= 123 then
														Y, b = 149, b + 1
													else
														local I = A(Pb, 3 + b)
														local n, y, S, r, X =
															(Tb - 128) * 128,
															ob - 128,
															(db - 128) * 16384,
															I % 128 * 2097152,
															I % 128
														local J, e, R = 2097152 * (I - X), S + y
														R, Y, b = r + (e + (n + J)), 50, 4 + b
														Tb = R
													end
												elseif Y <= 125 then
													local I = A(Pb, b + 1)
													Y, ob = 128 > I and 158 or 60, I
												elseif Y <= 126 then
													local I = A(Ab, 3)
													local n, y, S, r
													n, y, S, r, Y =
														128 * (B - 128),
														b - 128,
														(U - 128) * 16384,
														I % 128 * 2097152,
														154
													B, b = 2097152 * (I - I % 128) + (y + S) + n + r, 4
												else
													local I = b + 1
													local n = A(Tb, I)
													Y, B, b = 128 > n and 148 or 159, I, n
												end
											elseif Y <= 130 then
												if Y <= 128 then
													local I = A(Pb, B + 1)
													Y, U = not (I >= 128) and 169 or 31, I
												elseif Y <= 129 then
													Y, Pb, U = 112, Pb + 128 * (Tb - 128), U + 2
												else
													local I = A(Tb, 3 + b)
													local n, y, S, r, X =
														128 * (U - 128),
														Pb - 128,
														(ob - 128) * 16384,
														2097152 * (I % 128),
														I - I % 128
													local I, J, e = 2097152 * X + r, n + y
													e, Y, b = I + (J + S), 4, 4 + b
													U = e
												end
											elseif Y <= 131 then
												local I, n = 9, 181
												T = (B + 25) % 256
												local y, S, r = V(U), 421075225, U - U % 4
												local X, J = r - 1, 4 + 0
												local e = 0 - J
												local R = { X + 0, e, p, nil, J }
												Y, p, B, Pb, ob, db, mb, Ab, _b, Vb = 48, R, T, 25, _, I, n, y, S, r
											elseif Y <= 132 then
												local T = A(Ab, 3 + b)
												local I, n, y, S, r =
													(Pb - 128) * 128,
													Tb - 128,
													16384 * (ob - 128),
													T % 128 * 2097152,
													T % 128
												local X, J, e = (T - r) * 2097152, I + n
												e, Y, b = S + (J + (X + y)), 139, b + 4
												Pb = e
											else
												local T = A(Pb, 3 + b)
												local I, n, y, S, r, X =
													(U - 128) * 128,
													Tb - 128,
													16384 * (ob - 128),
													T % 128 * 2097152,
													T % 128
												X, Y, b = y + (I + (S + (2097152 * (T - r) + n))), 141, 4 + b
												U = X
											end
										elseif Y <= 155 then
											if Y <= 144 then
												if Y <= 138 then
													if Y <= 135 then
														if Y <= 134 then
															Y, Pb, b = 139, 128 * (Pb - 128) + Tb, b + 2
														else
															local T = 1 + b
															local I = A(Pb, T)
															Y, B, b = 128 > I and 173 or 109, T, I
														end
													elseif Y <= 136 then
														local T, I, n, y = b + 1, (190 + B) % 256, 3200171710, 0
														local S = W(Tb, T + y)
														H(E, y, (a(w[I], S, n)))
														S = j[I]
														y = 4
														Y, B, b, U, ob = 46, T, n, S, y
													elseif Y <= 137 then
														local T, I, I = A(Pb, B), B + 1, V(b)
														N(I, 0, T)
														Y, B = 161, I
													else
														local T = A(Ab, b + 1)
														Y, db = not (128 <= T) and 76 or 34, T
													end
												elseif Y <= 141 then
													if Y <= 139 then
														local T, I, n = Q(3, Pb), D(Pb, 2), 4
														if T == 3 then
															Y, Pb, Tb = 116, T, I
														else
															Y, Pb, Tb, ob = 62, T, I, n
														end
													elseif Y <= 140 then
														local T, I = q(3 * B), 1 + 0
														local n = 1 - I
														local y = { p, B + 0, I, n, nil }
														Y, p, B = 97, y, T
													else
														local T, I = 9, 181
														d = (25 + B) % 256
														local n, y, S = V(U), 421075225, U - U % 4
														local V, r = S - 1, 4 + 0
														local X = { nil, r, p, 0 - r, V + 0 }
														Y, p, B, Tb, ob, db, mb, Ab, _b, Vb =
															74, X, d, 25, _, T, I, n, y, S
													end
												elseif Y <= 142 then
													local T, _, V, I = b + 1, (130 + B) % 256, 2189591170, 0
													H(E, I, (a(V, W(Tb, I + T), w[_])))
													Y, B, b, U = 119, T, _, V
												elseif Y <= 143 then
													local T = p[3]
													Y, p = 75, T
												else
													local T = A(Tb, 2 + b)
													Y, ob = not not (128 <= T) and 130 or 38, T
												end
											elseif Y <= 149 then
												if Y <= 146 then
													if Y <= 145 then
														db(mb, ob, (Vb(b, _b, Ab)))
														local T, _ = j[Tb], 8
														local V = W(Pb, _ + B)
														H(E, _, (a(b, w[T], V)))
														V, _ = j[T], K(t(E, U), t(E, 4), (t(E, 8)))
														Y, B = 161, _
													else
														local T = p[3]
														Y, p = 77, T
													end
												elseif Y <= 147 then
													Y = not (Tb == 217) and 95 or 32
												elseif Y <= 148 then
													Y, B = 22, 1 + B
												else
													local T = ob + 1
													Y, ob = 62, T
												end
											elseif Y <= 152 then
												if Y <= 150 then
													local T = A(Pb, U + 3)
													local _, V, I, H, W, w =
														128 * (Tb - 128),
														ob - 128,
														(db - 128) * 16384,
														T % 128 * 2097152,
														T % 128
													w, Y, U = _ + (H + (I + (V + (T - W) * 2097152))), 112, 4 + U
													Pb = w
												elseif Y <= 151 then
													Y = not (100 ~= Tb) and 135 or 20
												else
													local T, _, V, I = 16384 * (Pb - 128), 128 * (ob - 128)
													V, I, Y = _ + (Tb + T), 3 + b, 24
													Pb = V
												end
											elseif Y <= 153 then
												d = (mb + B * db) % 256
												l(Ab, _b, (a(A(Pb, _b + b), d, Tb)))
												Y, B = 163, d
											elseif Y <= 154 then
												if not (0 < B) then
													Y, B = 161, s
												else
													Y = 140
												end
											else
												local T = A(Ab, 2 + b)
												Y, ob = not not (T >= 128) and 132 or 1, T
											end
										elseif Y <= 166 then
											if Y <= 160 then
												if Y <= 157 then
													if Y <= 156 then
														Y, b, B = 137, U + 128 * (b - 128), B + 2
													else
														local T, d, d = 1 + b, 0, (181 + (8 + B) % 256 * 9) % 256
														l(E, 0, (a(d, A(Tb, T + 0), 8)))
														T = not (252 == A(E, Pb))
														Y, B = 161, T
													end
												elseif Y <= 158 then
													Y, Tb, b = 50, (Tb - 128) * 128 + ob, 2 + b
												elseif Y <= 159 then
													local T = A(Tb, 1 + B)
													Y, U = not (128 > T) and 51 or 174, T
												else
													local T = 1 + b
													local d = A(Pb, T)
													Y, B, b = not (128 > d) and 54 or 11, T, d
												end
											elseif Y <= 163 then
												if Y <= 161 then
													g[F] = B
													Y = 172
												elseif Y <= 162 then
													local T, d, _ = (b - 128) * 16384, 128 * (U - 128)
													_, Y, B = Tb + d + T, 110, B + 3
													b = _
												else
													local T, d, _ = p[3], p[4], p[5]
													local V, l = T + d, d <= 0
													d, T = V >= _, V <= _
													_ = l and d or not l and T
													p[3] = V
													if _ then
														Y, _b = 153, V
													else
														Y = 26
													end
												end
											elseif Y <= 164 then
												Y = not (ob <= 20) and 100 or 104
											elseif Y <= 165 then
												local T, d, _ = p[4], ob(Ab), b + U
												local V = A(Tb, _)
												Y, p, B, b, Pb = 128 > V and 102 or 167, T, d, _, V
											else
												local T = A(Ab, b + 3)
												local d, _, V, l, E =
													(ob - 128) * 128,
													db - 128,
													(mb - 128) * 16384,
													T % 128 * 2097152,
													T - T % 128
												local T, a, I = 2097152 * E + d, l + V
												I, Y, b = T + a + _, 149, b + 4
												ob = I
											end
										elseif Y <= 172 then
											if Y <= 169 then
												if Y <= 167 then
													local T = A(Tb, 1 + b)
													if not (128 <= T) then
														Y, Tb = 40, T
													else
														Y, ob = 58, T
													end
												elseif Y <= 168 then
													local T = p[4]
													Y, p = 113, T
												else
													Y, b, B = 120, U + 128 * (b - 128), B + 2
												end
											elseif Y <= 170 then
												local T, d, _ = 16384 * (U - 128), (Tb - 128) * 128
												_, Y, b = ob + d + T, 141, b + 3
												U = _
											elseif Y <= 171 then
												Y, b = 4, b + 1
											else
												return B
											end
										elseif Y <= 175 then
											if Y <= 173 then
												Y, B = 137, B + 1
											elseif Y <= 174 then
												Y, b, B = 22, U + (b - 128) * 128, 2 + B
											else
												Y = not (100 < Tb) and 151 or 107
											end
										elseif Y <= 176 then
											local T = A(Pb, U + 1)
											if T < 128 then
												Y, Pb = 129, T
											else
												Y, ob = 89, T
											end
										elseif Y <= 177 then
											local T = p[1]
											Y, p = 0, T
										else
											Y, b, B = 110, U + (b - 128) * 128, 2 + B
										end
									end
								end,
							}
							m[6] = o
							k, u = 21, o
						else
							k, h, z = P:uH(C, z, v, h, O)
						end
					else
						k, u, z = P:pH(C, k, z, u)
					end
				else
					k, L, M, u, C, O, i, x, Z = P:hH(Z, k, L, z, M, u, O, x, i, C)
				end
			elseif k <= 30 then
				k, u, z, O = P:BH(O, k, z, C, i, u)
			else
				k, M, u, h, G = P:xH(k, i, h, O, C, z, G, x, u, v, M, L)
			end
		end
	end,
	bH = function(P, T, o)
		local d = bit32.band
		T, o = d(T, 4294967295), d(o, 4294967295)
		local m, A = d(T, 65535), bit32.rshift
		local _, V, l = A(T, 16), d(o, 65535), A(o, 16)
		A = d(m * V + bit32.lshift(d(m * l + _ * V, 65535), 16), 4294967295)
		V = nil
		repeat
			l = A % 4294967296
			if l ~= l then
				V = 0
				break
			end
			V = l - l % 1
		until true
		return V
	end,
	[96] = bit32.lrotate,
	[99] = UDim2.new,
	[65] = function(P, T, T)
		return function(T, o)
			local o = T[1]
			local d = T[2]
			local m = T[3]
			local A = T[4]
			local _ = T[5]
			local V = T[6]
			local l = T[7]
			local E = T[8]
			return function()
				local T = bit32.bxor(293115201, 0)
				local a
				local a = o
				local I = a.Character
				local H, W, w = not I
				if H then
					W = H
				else
					a = d
					W = not a.Alive
				end
				if W then
					return false
				end
				W = I:FindFirstChildOfClass("Humanoid")
				if not W or W.Health <= 0 then
					return false
				end
				local w
				a = m[6][m[5]]()
				H = nil
				local m = not a
				if m then
					local w = o
					local j = w:FindFirstChildOfClass("Backpack")
					if j then
						local n, y = ipairs, table.pack(j:GetChildren())
						for j, j in n(P:vH(y)) do
							local n
							w = A[6][A[5]]
							if w(j) then
								H = j
								break
							end
						end
					else
					end
				else
				end
				local A = a or H
				if not A then
					return false
				end
				local w
				local w = _
				local j, n = w.ShotStates[A], _
				local y, y, S = d, n.FiniteNumber(d.Settings.Aimbot.ShotDelay, 0, 0, 1000) / 1000, _
				w, n = S.GunReadyAt(A) + y, _
				S, y = d, n.FiniteNumber(d.Settings.Aimbot.MaxWait, 250, 0, 300) / 1000
				if j and j.Busy or os.clock() < w - y then
					return false
				end
				local S
				y = V
				j = y(true)
				y = not j or not j.Player or not j.PredictedPosition
				if y then
					n = _
					local V, S = n.AutoEquippedGun and a
					if V then
						local r = _
						S = a == r.AutoEquippedGun
					else
						S = V
					end
					if S then
						W:UnequipTools()
						V = _
						V.AutoEquippedGun = nil
					end
					return false
				end
				y = _
				n = y.ShouldFire
				if n then
					y = _
					if not y.ShouldFire(j, os.clock(), w) then
						return false
					end
				elseif os.clock() < w then
					return false
				end
				n = d
				w, y = n:GetShootCFrames(false, false, j)
				n = not y
				if n then
					local V = _
					local S, r = V.AutoEquippedGun and a
					if S then
						V = _
						r = a == V.AutoEquippedGun
					else
						r = S
					end
					if r then
						W:UnequipTools()
						V = _
						V.AutoEquippedGun = nil
					end
					return false
				end
				n = m and H
				if n then
					W:EquipTool(H)
					m = _
					m.AutoEquippedGun = H
					if H.Parent ~= I then
						task.wait()
					end
					A = H
				else
				end
				if not A or A.Parent ~= I then
					return false
				end
				local V, V
				V, T = l[6][l[5]], bit32.bxor(T, 255544951)
				I, n = V(A), _
				V = n.NativeShootRemote == I
				T = P:zH(
					P:bH(2704926227, T)
						+ P:bH(2704926227, 240997227)
						+ (P:bH(1590041070, (bit32.bor(T, 240997227))) + P:bH(1590041068, (bit32.band(T, 240997227))))
				)
				m = nil
				if V then
					W = _
					m = W.NativeShootGun == A
				else
					m = V
				end
				n = nil
				if m then
					W = _
					n = W.NativeShootArgs
				else
					n = nil
				end
				local function T()
					local l = bit32.bxor(187772018, 0)
					local S = l
					local r = _
					l = bit32.bxor(S, 307176570)
					S = r.UnequipTask
					if S then
						pcall(task.cancel, _.UnequipTask)
						r = _
						r.UnequipTask = nil
					end
					r = _
					l =
						P:zH(
							P:bH(1442277437, l)
								+ P:bH(1442277437, 283101457)
								+ (
									P:bH(1410412422, (bit32.bor(l, 283101457)))
									+ P:bH(1442277438, (bit32.bxor(l, 283101457)))
								)
						)
					r.UnequipTask = task.delay(0.12, function()
						local P = _
						P.UnequipTask = nil
						P = _
						local l, S = P.AutoEquippedGun
						if l then
							P = o
							S = P.Character
						else
							S = l
						end
						if S then
							P = o
							l = P.Character:FindFirstChildOfClass("Humanoid")
							if l then
								l:UnequipTools()
							end
							local P = _
							P.AutoEquippedGun = nil
						end
					end)
				end
				if I then
					V = _
					W, H = V.PrepareShot, if a then j else nil
					local P, o, l, S, r = W(A, I, n, H)
					m = P and o and l and S
					if m then
						local W = _
						local n = W.ReserveShot(A)
						if n then
							task.spawn(_.SendPreparedShot, I, P, o, l, S, r, n)
							T()
							return true
						end
					end
				end
				H = _
				local P = H.ReserveShot(A)
				if not P then
					return false
				end
				P.NativeActivationUntil = os.clock() + 0.2
				local o
				E[6][E[5]](A, w or CFrame.new(j.OriginPosition), y, d.Settings.Aimbot.Penetration == true)
				m = pcall(A.Activate, A)
				V, H = not m
				if V then
					a = _
					H = a.ShotStates[A] == P
				else
					H = V
				end
				if H then
					j = _
					j.ShotStates[A] = nil
				end
				task.delay(0.2, function()
					if P.NativeActivationUntil then
						P.NativeActivationUntil = nil
						P.Busy = false
					end
				end)
				if m then
					T()
				end
				return m
			end
		end
	end,
	o = function(P, T, o, d, m, A, _, V, l, E, a, I, H, W)
		if a <= 107 then
			if a <= 106 then
				local w = buffer.readu8(d, 3 + V)
				local j, n, y, S, r = 128 * (W - 128), T - 128, 16384 * (l - 128), 2097152 * (w % 128), w % 128
				local T = (w - r) * 2097152
				w = n + (y + (S + j)) + T
				return 161, o, 4 + V, E, H, A, m, w
			else
				local T = buffer.readu8(d, V + 2)
				return not (T < 128) and 152 or 10, o, V, E, H, A, T, W
			end
		elseif a <= 108 then
			local T = buffer.readu8(d, V + 1)
			return T < 128 and 147 or 33, o, V, E, T, A, m, W
		elseif a <= 109 then
			return 42, o[2], I, V, H, A, m, W
		else
			local P = _ + (A - 128) * 128
			return 36, o, V + 2, E, H, P, m, W
		end
	end,
	[9] = function(P, P, P)
		return function(P)
			local T = buffer.writei8
			local o = P[2]
			local d = P[3]
			local m = P[4]
			local A = P[5]
			return function()
				local P
				local P = T[6][T[5]]
				if not P then
					return
				end
				local T
				P = o
				local T = P.Character
				local o, _ = T and (T:FindFirstChild("HumanoidRootPart"))
				T = o and d[6][d[5]]
				if T then
					o.CFrame = d[6][d[5]]
					local T
					P = m
					local T = P.VelocityApplied
					if T then
						local P = m
						P.VelocityApplied = false
						P = m
						o.AssemblyLinearVelocity = P.RealVelocity
						local T
						P = A
						P.PlayerMovement.SpoofVelocity = nil
					end
				end
			end
		end
	end,
	[30] = ipairs,
	[80] = function(P, T, T, T)
		return function(T)
			local o = T[1]
			local d = T[2]
			local m = T[3]
			return function()
				local T
				local T = o
				local o = T.Settings.Visuals
				local A, _ = not o.Enabled or o.BoxStyle == "Off"
				if A then
					T = d
					for _, _ in pairs(T) do
						if _.Box then
							_.Box.Visible = false
						end
					end
					return
				end
				local _
				T = m
				local m, _ = T.CurrentCamera, d
				for d, V in pairs(_) do
					local _ = bit32.bxor(385692575, 0)
					local l = V.Box
					if not l then
						continue
					end
					l.Visible = false
					if not m or not o.Enabled or o.BoxStyle == "Off" or not V.Character.Parent then
						continue
					end
					if V.Occluded and not o.ThroughWalls then
						continue
					end
					A, T = V.Character:GetBoundingBox()
					local E, a, I, H = 1 / 0, 1 / 0, -1 / 0, -1 / 0
					_ = bit32.bxor(_, 221342622)
					_ =
						P:zH(
							P:bH(1564718619, _)
								+ P:bH(1564718619, 304056075)
								+ (
									P:bH(2730248678, (bit32.bor(_, 304056075)))
									+ P:bH(2730248676, (bit32.band(_, 304056075)))
								)
						)
					d = false
					for P = -1, 1, 2 do
						for _ = -1, 1, 2 do
							for W = -1, 1, 2 do
								local w = m:WorldToViewportPoint(
									A:PointToWorldSpace(Vector3.new(T.X * P / 2, T.Y * _ / 2, T.Z * W / 2))
								)
								d, E, a, I =
									if w.Z <= 0 then true else d, math.min(E, w.X), math.min(a, w.Y), math.max(I, w.X)
								H = math.max(H, w.Y)
							end
						end
					end
					if d or I < 0 or H < 0 or E > m.ViewportSize.X or a > m.ViewportSize.Y then
						continue
					end
					local P, T = I - E, H - a
					l.Position = UDim2.fromOffset(E, a)
					l.Size = UDim2.fromOffset(P, T)
					l.Visible = true
					local d, m =
						o.BoxStyle == "Full" and P / 2 or math.min(P / 4, 18),
						o.BoxStyle == "Full" and T / 2 or math.min(T / 4, 18)
					local function A(_, E, a, I, H)
						local W = l[tostring(_)]
						W.Position = UDim2.fromOffset(E, a)
						W.Size = UDim2.fromOffset(I, H)
						W.BackgroundColor3 = V.Color
						W.BackgroundTransparency = V.Occluded and 1 - o.OccludedOpacity or 0
					end
					A(1, 0, 0, d, 1)
					A(2, 0, 0, 1, m)
					A(3, P - d, 0, d, 1)
					A(4, P - 1, 0, 1, m)
					A(5, 0, T - 1, d, 1)
					A(6, 0, T - m, 1, m)
					A(7, P - d, T - 1, d, 1)
					A(8, P - 1, T - m, 1, m)
				end
			end
		end
	end,
	[41] = buffer.readi32,
	[103] = function(P, P, P, P)
		return function(P, T, T)
			local T = buffer.writei8
			local o = P[2]
			local d = P[3]
			local m = P[4]
			return function(P, A, _, V, l, E, a)
				local I
				local I = T
				A = I(A, 0, 0, 0.8)
				local H
				I = o
				local o, H = I(V) and V.Magnitude > 0.01 and V.Unit or Vector3.new(0.0, 0.0, 1.0)
				I = d
				local H, W = I(_ - o * _:Dot(o)).Magnitude, l - (P.StableSince or l)
				V = W < 0.25
				if V then
					I = nil
					I, H = T, math.max(H, T(P.CruiseSpeed, 0, 0, 200) * 0.8)
				else
				end
				V, I = W < 0.12 and 0.45 or (W < 0.3 and 0.22 or 0.1)
				I, V = T, math.max(V, math.min(0.7, T(P.FlipRate, 0, 0, 20) * A * 0.8))
				local w
				W = m
				local m, w, j = 0.012 + W.GetRoundTrip(l) * 0.12, P.Acceleration
				if w then
					I = d
					j = I(P.Acceleration - o * P.Acceleration:Dot(o)).Magnitude
				else
					j = w
				end
				l, w = j or 0, T
				j, I, o = w(P.Residual, 0, 0, 5), P.Oscillation
				if I then
					W = P.Oscillation
					o = 0.2 + j + W.Speed * W.Period * (0.06 + W.Spread * 0.4)
				else
					w = P.Jitter
					if w then
						local d
						d, o = T, math.max(T(P.JitterSpread, 0, 0, 10) * 0.6, 0.25) + H * m
					else
						o = math.sqrt(j * j + (H * (m + A * V)) ^ 2 + (math.min(l, 120) * 0.25 * A * A) ^ 2) + 0.08
					end
				end
				o = if P.Spoofed and not P.Jitter then o + 0.35 else o
				l = P.JumpPeriod and 1.2 or 0.15
				l = if P.Airborne then 1.4 + math.abs(_.Y) * A * 0.18 + (P.JumpPeriod and 0.4 or 0) else l
				P = T
				E = P(E, 0.9, 0.3, 3)
				I = T
				a = I(a, 2, 0.5, 4)
				m = (1 - math.exp(-(E * E) / (2 * o * o))) * (1 - math.exp(-(a * a) / (2 * l * l)))
				return math.clamp(m, 0, 1), o, l
			end
		end
	end,
	[20] = Rect.new,
	[69] = bit32.rrotate,
	zH = function(P, P)
		P %= 4294967296
		if P ~= P then
			return 0
		end
		return P - P % 1
	end,
	[12093] = function(P, T, T, T, T)
		return function(T, o)
			local o = T[1]
			local d = T[2]
			return function(T, m, A)
				local _, V = 0
				local l, E, a, I, H, W, w, j, n, y, S, r = T, m, A
				while true do
					m = _ <= 14
					if m then
						if _ <= 6 then
							if _ <= 2 then
								if _ <= 0 then
									A, T = l[5][E], l[4]
									local m = A + 1
									local A = buffer.readu8(T, m)
									_, I, H, W = A < 128 and 3 or 10, T, m, A
								elseif _ <= 1 then
									return l, E
								else
									local T = buffer.readu8(I, H + 3)
									_, W, H =
										21,
										(W - 128) * 128
											+ (w - 128)
											+ (j - 128) * 16384
											+ T % 128 * 2097152
											+ (T - T % 128) * 2097152,
										H + 4
								end
							elseif _ <= 4 then
								if _ <= 3 then
									_, H = 21, H + 1
								else
									local T = buffer.readu8(n, a + 3)
									_, W =
										15,
										(W - 128) * 128
											+ (w - 128)
											+ (j - 128) * 16384
											+ T % 128 * 2097152
											+ (T - T % 128) * 2097152
								end
							elseif _ <= 5 then
								local T = buffer.readu8(n, a + 3)
								_, w, a =
									23,
									(w - 128) * 128
										+ (j - 128)
										+ (y - 128) * 16384
										+ T % 128 * 2097152
										+ (T - T % 128) * 2097152,
									a + 4
							else
								local T = buffer.readu8(n, a + 2)
								_, j = T < 128 and 12 or 4, T
							end
						elseif _ <= 10 then
							if _ <= 8 then
								if _ <= 7 then
									_, w, a = 23, (w - 128) * 16384 + (j - 128) * 128 + y, a + 3
								else
									_, W, H = 21, (W - 128) * 16384 + (w - 128) * 128 + j, H + 3
								end
							elseif _ <= 9 then
								local T = V[2]
								l[6] = P[34](l)
								local m, A, t = P:_H(l, n)
								local X = buffer.readu8(n, t)
								_, V, l, E, a, W = X < 128 and 14 or 25, T, m, A, t, X
							else
								local T = buffer.readu8(I, H + 1)
								_, w = T < 128 and 16 or 17, T
							end
						elseif _ <= 12 then
							if _ <= 11 then
								_, W, a = 19, (W - 128) * 128 + w, a + 2
							else
								_, W, a = 19, (W - 128) * 16384 + (w - 128) * 128 + j, a + 3
							end
						elseif _ <= 13 then
							local T = V[2]
							_, V = 22, T
						else
							_, a = 19, a + 1
						end
					else
						local T, m = _ <= 22
						if T then
							if _ <= 18 then
								if _ <= 16 then
									if _ <= 15 then
										_, a = 19, a + 4
									else
										_, W, H = 21, (W - 128) * 128 + w, H + 2
									end
								elseif _ <= 17 then
									local T = buffer.readu8(I, H + 2)
									_, j = T < 128 and 8 or 2, T
								else
									local T = buffer.readu8(n, a + 1)
									_, j = T < 128 and 24 or 28, T
								end
							elseif _ <= 20 then
								if _ <= 19 then
									local T = buffer.readu8(n, a)
									_, w = T < 128 and 26 or 18, T
								else
									local T, A, l = V[1], V[5], V[4]
									local t, X = T + A, A <= 0
									T, A = t >= l, t <= l
									l = X and T or not X and A
									V[1] = t
									if l then
										_, r = 30, t
									else
										_ = 13
									end
								end
							elseif _ <= 21 then
								local T, A = 233, 61
								m = (a + E) % 256
								local l, t, X = buffer.create(W), a * 16843009, W - W % 4
								local J, e = X - 1, 4 + 0
								local R = { 0 - e, V, nil, J + 0, e }
								_, V, E, w, j, n, y, S = 20, R, m, T, A, l, t, X
							else
								local T, A = W - 1, 1 + 0
								local l = { S - A, V, A, T + 0, nil }
								_, V = 27, l
							end
						else
							local T = _ <= 26
							if T then
								if _ <= 24 then
									if _ <= 23 then
										local T, A = buffer.readu8(n, a), a + 1
										buffer.fill(I, H + W, T, w)
										_ = 1
									else
										_, w, a = 23, (w - 128) * 128 + j, a + 2
									end
								elseif _ <= 25 then
									local T = buffer.readu8(n, a + 1)
									_, w = T < 128 and 11 or 6, T
								else
									_, a = 23, a + 1
								end
							else
								local T = _ <= 28
								if T then
									if _ <= 27 then
										local T, A, l = V[1], V[3], V[4]
										local S, t = T + A, A <= 0
										A, T = S >= l, S <= l
										l = t and A or not t and T
										V[1] = S
										if l then
											_, W = 29, S
										else
											_ = 9
										end
									else
										local T = buffer.readu8(n, a + 2)
										_, y = T < 128 and 7 or 5, T
									end
								else
									local T = _ <= 29
									if T then
										m = (w * E + j) % 256
										buffer.writeu8(n, W, (bit32.bxor(buffer.readu8(I, H + W), a, m)))
										_, E = 27, m
									else
										local T, A = buffer.writeu32, buffer.readu32(I, H + r)
										local V
										local V = o[6][o[5]][E]
										T(n, r, (bit32.bxor(A, V, y)))
										local P
										m = d[6][d[5]][E]
										_, E = 20, m
									end
								end
							end
						end
					end
				end
			end
		end
	end,
	[115] = buffer.readbits,
	[35] = function(P, P, P)
		return function(P, T)
			local T = buffer.writei8
			local o = P[2]
			local d = P[3]
			local m = P[4]
			local A = P[5]
			local _ = P[6]
			return function()
				local P
				local P = T
				local T = P.Character
				local V, l = T and (T:FindFirstChildOfClass("Humanoid")), T and (T:FindFirstChildOfClass("Tool"))
				local E, a, I, I = l and (l:FindFirstChild("Handle")), T and (T:FindFirstChild("UpperTorso"))
				P = not V
					or V.Health <= 0
					or not a
					or not E
					or not E:IsA("BasePart")
					or not o[6][o[5]](l)
					or not d[6][d[5]]()
				if P then
					return
				end
				local o
				P = m[6][m[5]](T, "Left")
				if not P then
					return
				end
				local o
				l, V = A[6][A[5]](P.Shoulder)
				local o, d = A[6][A[5]](P.Elbow)
				local m, I = A[6][A[5]](P.Wrist)
				if not l or not o or not m then
					return
				end
				local A, H, W =
					math.abs(V.Position.Y)
						+ math.abs(o.Position.Y)
						+ math.abs(d.Position.Y)
						+ math.abs(m.Position.Y)
						+ math.abs(I.Position.Y),
					a.CFrame * l,
					T:FindFirstChild("RightHand")
				if not W then
					return
				end
				local w
				a, m, l = _, W.Position + E.CFrame.UpVector * (A * _.Lead)
				l, m = _, m - (m - H.Position).Unit * _.Pull
				o = H:PointToObjectSpace(m)
				if o.Magnitude < 0.001 then
					return
				end
				W = o.Unit
				l = Vector3.new(0, 0, -1):Cross(W)
				l = if l.Magnitude < 1.0E-4 then Vector3.new(1.0, 0.0, 0.0) else l
				d, I, E, V =
					H * CFrame.fromAxisAngle(l.Unit, math.acos(math.clamp(-W.Z, -1, 1))),
					(m - H.Position).Unit,
					T:FindFirstChild("LeftHand"),
					_
				l, W = V.Correction or Vector3.new(0.0, 0.0, 0.0), _
				V = W.LastTarget
				local a, w = E and V
				if a then
					W = _
					w = W.LastCharacter == T
				else
					w = a
				end
				if w then
					l += (V - E.Position) * 0.5
					l = if l.Magnitude > 3 then l.Unit * 3 else l
				else
					l = (Vector3.new(0.0, 0.0, 0.0))
				end
				a, E, W = _, _, _
				a.Correction = l
				E.LastTarget = m
				W.LastCharacter = T
				T = d * CFrame.Angles(1.5707963267948966, 0, 0)
				P.Shoulder.Transform = H:ToObjectSpace(T + I * (o.Magnitude - A) + l)
				P.Elbow.Transform = CFrame.identity
				P.Wrist.Transform = CFrame.identity
			end
		end
	end,
	kH = function(P, T, o, d, m, A, _, V, l, E, ...)
		if m <= 14 then
			if m <= 13 then
				local a = A + (16384 * (V - 128) + 128 * (l - 128))
				return 34, d, o, T, E + 3, _, a, l, A
			else
				return 18, d, 1 + o, T, E, _, V, l, A
			end
		elseif m <= 15 then
			local a = buffer.readu8(o, 2 + E)
			return a < 128 and 13 or 22, d, o, T, E, _, V, l, a
		elseif m <= 16 then
			local m = buffer.readu8(o, E + 2)
			return not not (m >= 128) and 25 or 23, d, o, T, E, _, V, m, A
		else
			local T = d[4]
			P.t = ...
			local o, d, m = P.t, P[114], {}
			local _, E = buffer.readu8(o, d), 1 + d
			m[7] = 0 ~= _
			d = buffer.readu8(o, E)
			return not (128 <= d) and 19 or 5, T, o, m, E, d, V, l, A
		end
	end,
	[40] = function(P, P, P, P)
		return function(P, T, T, T)
			local T = buffer.writei8
			return function(P, o, d, m)
				local A = P.JumpPeriod
				if not A or P.JumpVelocity < 8 or m <= 0 then
					return 0
				end
				local _ = P.JumpLog[#P.JumpLog] + A - o
				while _ < -0.05 do
					_ += A
				end
				o = P.Airborne
				if o then
					local V, l = P.Velocity.Y
					local l = T
					local T = l(P.GroundGap, 0, 0, 50)
					_ = if _ < (V + math.sqrt(math.max(V * V + 2 * m * T, 0))) / m then _ + A else _
				else
				end
				o = d - math.max(_, 0)
				if o <= 0 then
					return 0
				end
				o = math.min(o, 2 * P.JumpVelocity / m)
				return math.max(0, P.JumpVelocity * o - 0.5 * m * o * o)
			end
		end
	end,
	d = function(P, T, o, d, m, A, _, V, l, E)
		if m <= 143 then
			if m <= 142 then
				local a, I = buffer.readu32(d, _), _ + 4
				local H = a / 2
				if not (a % 2 == 0) then
					return 149, o, d, I, H, V, E, l
				else
					return 49, o, d, I, A, V, H, l
				end
			else
				local a = buffer.readu8(d, T + 1)
				if not (128 <= a) then
					return 155, o, a, _, A, V, E, l
				else
					return 30, o, d, _, A, V, a, l
				end
			end
		elseif m <= 144 then
			local a = buffer.readu8(d, _)
			return not (a < 128) and 114 or 129, o, d, _, A, V, E, a
		elseif m <= 145 then
			local m = buffer.readu8(d, T + 1)
			return 128 > m and 121 or 160, o, d, _, A, m, E, l
		else
			return 25, o[5], d, _, A, V, E, l
		end
	end,
	[97] = buffer.readu32,
	[24] = buffer.len,
	[3] = function(P, P, P, P)
		return function(P)
			local T = buffer.writei8
			return function(P, o, d)
				local m, A, _, V = 0, (Vector3.new(0.0, 0.0, 0.0))
				for l = #P, 1, -1 do
					local E = P[l]
					if o - E.Time > d then
						break
					end
					m, A, _, V = m + 1, A + E.Position, E, V or E
				end
				if m < 3 or not _ or V.Time - _.Time < 0.08 then
					return nil
				end
				local l, E, a = A / m, #P, 0
				for m = E, 1, -1 do
					local A = P[m]
					if o - A.Time > d then
						break
					end
					local P, P
					P, a = T, math.max(a, T(A.Position - l).Magnitude)
				end
				return l, (V.Position - _.Position) / (V.Time - _.Time), a
			end
		end
	end,
	[84] = function(P, T, T)
		return function(T, o, o)
			local o = T[1]
			local d = T[2]
			local m = T[3]
			local A = T[4]
			local _ = T[5]
			local V = T[6]
			local l = T[7]
			local E = T[8]
			local a = T[9]
			return function()
				local T
				local T = o
				local I, H = T.Alive
				if I then
					T = o
					local W = T.Settings.Player.VelocitySpoof
					if W then
						H = W
					else
						local W = o
						H = W.Settings.Player.FakePosition
					end
				else
					H = I
				end
				I = not H
				if I then
					local H
					d[6][d[5]]()
					return
				end
				local d
				T = m
				I = T.Character
				local d = I and (I:FindFirstChild("HumanoidRootPart"))
				if not d then
					return
				end
				local m, H = o
				I = m.Settings.Player.VelocitySpoof and not A[6][A[5]]
				if I then
					local H = bit32.bxor(499680467, 0)
					A[6][A[5]] = true
					m = o
					T = m.Settings.Player.VelocitySpoofType or "Low"
					H = bit32.bxor(H, 434499297)
					local W = d.AssemblyLinearVelocity
					local w = d.AssemblyAngularVelocity
					local j = Vector3.new(0.0, 0.0, 0.0)
					j = if T == "High"
						then Vector3.new(
							math.random(1, 2) == 1 and -16384 or 16384,
							math.random(1, 2) == 1 and -14384 or 16384,
							math.random(1, 2) == 1 and -16384 or 16384
						)
						else if T == "Low"
							then Vector3.new(
								math.random(1, 2) == 1 and -300 or 300,
								math.random(1, 2) == 1 and -300 or 300,
								math.random(1, 2) == 1 and -300 or 300
							)
							else j
					d.AssemblyLinearVelocity = j
					local n = o
					n.PlayerMovement.SpoofVelocity = j
					H =
						P:zH(
							P:bH(1746885405, H)
								+ P:bH(1746885405, 214798439)
								+ (
									P:bH(801196486, (bit32.bor(H, 214798439)))
									+ P:bH(1746885406, (bit32.bxor(H, 214798439)))
								)
						)
					task.spawn(function()
						local P
						local P = _
						P.RenderStepped:Wait()
						P = o
						P.PlayerMovement.SpoofVelocity = nil
						if d and d.Parent then
							d.AssemblyLinearVelocity = W
							d.AssemblyAngularVelocity = w
						end
						A[6][A[5]] = false
					end)
				end
				m = o
				I, T = m.FlingRuntime
				if I then
					m = o
					T = m.FlingRuntime.Busy
				else
					T = I
				end
				m = nil
				if T then
					m = T
				else
					I = o
					local P = I.KillSelectedRuntime
					if P then
						local A = o
						m = A.KillSelectedRuntime.Busy
					else
						m = P
					end
				end
				T = o
				local P, A, A = T.Settings.Player.FakePosition and not m
				if P then
					V[6][V[5]] = true
					m = o
					m.PlayerMovement.FakePositionUntil = os.clock() + 0.25
					I, T = o, math.max(o.Settings.Player.FakePositionRange or 9, 3)
					l[6][l[5]] = d.CFrame
					local P
					local P = E
					P.Hold = P.Hold - 1
					P = E
					local m = P.Hold <= 0
					if m then
						P = E
						local A, _, I, H =
							P.Angle + math.rad(100 + math.random() * 160) * (math.random(2) == 1 and 1 or -1),
							T * (0.65 + math.random() * 0.35),
							E,
							E
						I.Up = not H.Up
						I, H = T * (5 + math.random() * 3), E
						local T, W = H.Up and I or -I
						H = a
						local a = H.FallenPartsDestroyHeight + 60
						T = if l[6][l[5]].Position.Y + T < a then I else T
						I = E
						I.Angle = A
						a = E
						a.Offset = Vector3.new(math.cos(A) * _, T, math.sin(A) * _)
						_ = E
						_.Hold = math.random(1, 4)
						_ = E
						_.Velocity = Vector3.new(math.cos(A), 0, math.sin(A)) * (60 + math.random() * 60)
							+ Vector3.new(0, (math.random() * 2 - 1) * 40, 0)
					end
					P = E
					P.RealVelocity = d.AssemblyLinearVelocity
					P = nil
					P, d.CFrame = E, l[6][l[5]] + E.Offset
					m = o
					P = not m.Settings.Player.VelocitySpoof
					if P then
						m = E
						d.AssemblyLinearVelocity = m.Velocity
						local P, T = o
						T, P.PlayerMovement.SpoofVelocity = E, E.Velocity
						P = E
						P.VelocityApplied = true
					end
				else
					local P = V[6][V[5]]
					if P then
						V[6][V[5]] = false
						local P = l[6][l[5]] and d
						if P then
							d.CFrame = l[6][l[5]]
						end
						l[6][l[5]] = nil
					end
				end
			end
		end
	end,
	[50] = function(P, P, P, P, P)
		return function(P, T)
			local T = buffer.writei8
			local o = P[2]
			return function(P, d, m)
				local A, A
				local A, A, A, _ = T, T, pcall(T.Raycast, T, P.Position, Vector3.new(0, -(d + 12), 0), o[6][o[5]](m))
				if not A or not _ then
					return 1 / 0
				end
				return _.Distance
			end
		end
	end,
	[63] = bit32.countlz,
	B = function(P, T, o, d, m, A, _, V, l, E)
		if V <= 1 then
			if V <= 0 then
				local a = buffer.readu8(d, o + 2)
				return not not (128 <= a) and 137 or 31, d, m, o, _, a
			else
				local a = (E - 128) * 16384
				return 136, (A - 128) * 128 + (d + a), m + 3, o, _, l
			end
		elseif V <= 2 then
			local a = A + 128 * (_ - 128)
			return 104, d, m, o + 2, a, l
		elseif V <= 3 then
			local V = buffer.readu8(d, 3 + m)
			local P, a, I, H = 128 * (E - 128), A - 128, 16384 * (T - 128), 2097152 * (V % 128)
			return 136, (V - V % 128) * 2097152 + (H + P + (I + a)), 4 + m, o, _, l
		else
			return 151, d, m, o + 1, _, l
		end
	end,
	[49] = function(P, P, P, P, P)
		return function(P)
			local T = buffer.writei8
			local o = P[2]
			local d = P[3]
			local m = P[4]
			return function(P, A, _, V, l, E)
				local a
				local a = T
				l = a(l, 0, 0, 0.8)
				local I, H, W = l <= 0
				if I then
					H = I
				else
					a = o
					H = not a(_)
				end
				if H then
					return Vector3.new(0.0, 0.0, 0.0), false
				end
				H = T
				V = H(V, 0, 0, 500)
				if _.Magnitude * l + V * l * l < 0.01 then
					return Vector3.new(0.0, 0.0, 0.0), false
				end
				local W
				a = d
				local d, W, w =
					a.MakeQueryParams(E, true),
					Vector3.new(math.max(0.2, A.X - 0.3), math.max(0.2, A.Y - 0.5), math.max(0.2, A.Z - 0.3)),
					math.clamp(math.ceil(l / 0.03), 2, 12)
				A, I = l / w, _
				a, E = P, false
				for l = 1, w, 1 do
					H = I - Vector3.new(0, V * A, 0)
					_ = (I + H) * (0.5 * A)
					I = H
					for l = 1, 2, 1 do
						if _.Magnitude < 0.001 then
							break
						end
						local H
						local H, H, H, w = m, m, pcall(m.Blockcast, m, CFrame.new(a), W, _, d)
						l = a
						if not H or not w then
							a = l + _
							break
						end
						H = T
						local T, d = H(w.Distance, 0, 0, _.Magnitude), _.Unit
						a = l + d * math.max(0, T - 0.05)
						H = o
						local o, m = H(w.Normal) and w.Normal or -d, _ - d * T
						m -= o * m:Dot(o)
						I = if I:Dot(o) < 0 then I - o * I:Dot(o) else I
						if o.Y > 0.6 then
							I = Vector3.new(I.X, 0, I.Z)
							m, E, V = Vector3.new(m.X, 0, m.Z), true, 0
						else
						end
						_ = m
					end
					if (a - P).Magnitude > 30 then
						break
					end
				end
				A = a - P
				return if A.Magnitude > 30 then A.Unit * 30 else A, E
			end
		end
	end,
	[16] = tonumber,
	[19] = function(P, P, P, P, P)
		return function(P, T)
			local T = buffer.writei8
			local o = P[2]
			local d = P[3]
			local m = P[4]
			return function(P)
				local A
				local A = T
				local T, _ = not A.Alive or not P
				if T then
					_ = T
				else
					local V, V
					V, _ = o, P.Parent ~= o.Character
				end
				if _ then
					return nil
				end
				_ = os.clock()
				local o
				A = d
				local o, V = A.ShotStates[P]
				T = m[6][m[5]](P)
				if o and o.Busy and _ - o.StartedAt < 0.5 then
					return nil
				end
				A = d
				if _ < A.GunReadyAt(P) or o and _ - o.StartedAt < math.min(T, 0.18) then
					return nil
				end
				T, o = { Busy = true, StartedAt = _ }, d
				T.Generation = o.Generation
				T.Gun = P
				o = d
				o.ShotStates[P] = T
				return T
			end
		end
	end,
	[122] = string.gsub,
	xH = function(P, T, o, d, m, A, _, V, l, E, a, I, H)
		if T <= 32 then
			if T <= 31 then
				buffer.writeu32(o, V, (bit32.bxor(l, buffer.readu32(a, d + V), P.n[I])))
				return 35, P.Y[I], E, d, V
			else
				return 17, I, 1 + E, d, V
			end
		elseif T <= 33 then
			local l = (I * A + m) % 256
			buffer.writeu8(o, _, (bit32.bxor(buffer.readu8(a, d + _), l, E)))
			return 15, l, E, d, V
		elseif T <= 34 then
			return 26, I, E, d + 1, V
		else
			local P, T, o = H[2], H[1], H[4]
			local m, A = P + T, T <= 0
			T, P = m >= o, m <= o
			o = A and T or not A and P
			H[2] = m
			if o then
				return 31, I, E, d, m
			else
				return 22, I, E, d, V
			end
		end
	end,
	[117] = function(P, P, P, P, P)
		return function(P, T)
			local T = buffer.writei8
			local o = P[2]
			local d = P[3]
			local m = P[4]
			local A = P[5]
			local _ = P[6]
			local V = P[7]
			local l = table.insert
			local E = P[9]
			return function()
				local P
				local P = T
				P.Frame = P.Frame + 1
				local a
				P = o
				local a, I = not P.Settings.Aimbot.Enabled
				if a then
					P = T
					local I, H = P.Sampling
					if I then
						H = I
					else
						local W = T
						H = W.CurrentSnapshot
					end
					I = nil
					if H then
						I = H
					else
						local W = T
						I = W.LockPlayer
					end
					if I then
						H = o
						H.InvalidateAimSnapshot()
					end
					H = T
					H.Sampling = false
					d[6][d[5]] = nil
					return
				end
				local I, H, H = T
				P, a = m, not I.GetLivingPlayer(m) or not A[6][A[5]]()
				if a then
					I = T
					local P, m = I.Sampling
					if P then
						m = P
					else
						local A = T
						m = A.CurrentSnapshot
					end
					P = nil
					if m then
						P = m
					else
						local A = T
						P = A.LockPlayer
					end
					if P then
						m = o
						m.InvalidateAimSnapshot()
					end
					m = T
					m.Sampling = false
					return
				end
				a = T
				a.Sampling = true
				a, I = os.clock(), T
				I.RefreshPing(a)
				I = T
				local P, o, o = I.Roles.Revision
				local o, m = a >= _[6][_[5]] or P ~= V[6][V[5]] or not d[6][d[5]]
				if o then
					m = o
				else
					local A, A
					A, m = l, d[6][d[5]].Parent ~= l
				end
				if m then
					local A
					d[6][d[5]], V[6][V[5]] = E[6][E[5]](), P
					_[6][_[5]] = a + 0.1
				end
				o = d[6][d[5]]
				P = not o
				if P then
					I = T
					I.CurrentSnapshot = nil
					return
				end
				P = T
				local d, d, A = P.GetLivingPlayer(o, true)
				if d then
					m = T
					m.SampleMotion(o, d, A, a)
				else
					I = T
					I.CurrentSnapshot = nil
					_[6][_[5]] = 0
				end
			end
		end
	end,
	H = function(P, T, o, d, m, A, _, V)
		if _ <= 20 then
			local _ = buffer.readu8(V, T)
			return not (128 <= _) and 93 or 99, _, T, d
		else
			local _ = buffer.readu8(V, 3 + T)
			local P, V, l, E, a = 128 * (d - 128), o - 128, (m - 128) * 16384, 2097152 * (_ % 128), _ % 128
			local o = 2097152 * (_ - a)
			a = E + P + (l + (o + V))
			return 76, A, T + 4, a
		end
	end,
	[17] = string.sub,
	G = function(P, T, o, d, m, A, _, V, l, E, a, I)
		if d <= 51 then
			if d <= 50 then
				return 45, 1 + V, m, T, I
			else
				local H = buffer.readu8(o, 2)
				return not (128 > H) and 105 or 32, V, H, T, I
			end
		elseif d <= 52 then
			local P = 128 * (T - 128) + I
			return 124, 2 + V, m, P, I
		elseif d <= 53 then
			local P = (I - 128) * 16384
			local o = 128 * (a - 128) + _ + P
			return 55, V + 3, m, T, o
		else
			E[A] = l
			return 115, V, m, T, I
		end
	end,
	C = function(P, T, o, d, m, A, _, V, l, E, a, I, H)
		if I <= 41 then
			if I <= 40 then
				local W = 16384 * (d - 128)
				local w = o + (128 * (a - 128) + W)
				return 83, l, _ + 3, m, E, w, a, V
			else
				local W, w, j = buffer.readu32(T, _), 4 + _, 1 + 0
				local n = 1 - j
				return 134, { W + 0, l, nil, n, j }, w, 1, {}, d, a, V
			end
		elseif I <= 42 then
			return 134, l, _, 1 + m, E, d, a, V
		elseif I <= 43 then
			local I = 16384 * (V - 128)
			local W = (H - 128) * 128 + A + I
			return 38, l, 3 + _, m, E, d, a, W
		else
			local A = buffer.readu8(T, _ + 3)
			local P, T, I, H = (a - 128) * 128, o - 128, 16384 * (V - 128), 2097152 * (A % 128)
			local o = P + (I + (2097152 * (A - A % 128) + T)) + H
			return 54, l, _ + 4, m, E, d, o, V
		end
	end,
	[7571] = function(P, P, P, P)
		return function(P)
			local T = buffer.writei8
			local o = P[2]
			return function()
				local P = 0
				while true do
					local d, m = P <= 1
					if d then
						local d = P <= 0
						if d then
							T[6][T[5]] = (219881 * T[6][T[5]] + 243122229) % 268435456
							T[6][T[5]] = (997249 * T[6][T[5]] + 29473679) % 268435456
							T[6][T[5]] = (611993 * T[6][T[5]] + 193786479) % 268435456
							T[6][T[5]], P = (743233 * T[6][T[5]] + 51338857) % 268435456, 3
						else
							return
						end
					else
						local d = P <= 2
						if d then
							T[6][T[5]] = (38425 * T[6][T[5]] + 132314989) % 268435456
							T[6][T[5]] = (198843 * T[6][T[5]] + 30567183) % 268435456
							T[6][T[5]] = (959193 * T[6][T[5]] + 45963201) % 268435456
							T[6][T[5]], P = (583433 * T[6][T[5]] + 255685969) % 268435456, 1
						else
							T[6][T[5]] = (1040641 * T[6][T[5]] + 82925181) % 268435456
							T[6][T[5]] = (285727 * T[6][T[5]] + 61184273) % 268435456
							local d
							o[6][o[5]] = (1 * o[6][o[5]] + 255097152) % 268435456
							T[6][T[5]], P = (645561 * T[6][T[5]] + 239874649) % 268435456, 2
						end
					end
				end
			end
		end
	end,
	[59] = buffer.writebits,
	[107] = string.char,
	x = function(P, T, o, d, m, A, _, V, l, E)
		if V <= 6 then
			if V <= 5 then
				local a = (A - 128) * 16384
				local I = 128 * (l - 128) + (a + _)
				return 161, m, T + 3, E, o, I
			else
				local _ = buffer.readu8(d, 1 + T)
				return _ < 128 and 47 or 92, m, T, _, o, A
			end
		elseif V <= 7 then
			local _ = buffer.readu8(d, T + 1)
			return not (128 > _) and 13 or 77, _, T, E, o, A
		elseif V <= 8 then
			local _ = buffer.readu8(d, 1 + T)
			return _ < 128 and 80 or 120, m, T, E, _, A
		else
			return 55, m, 1 + T, E, o, A
		end
	end,
	[90] = coroutine.yield,
	KH = function(P, T, o, d, m, A, _, V)
		if A <= 6 then
			local l, E, a = d[3], d[4], d[1]
			local I, H = l + E, E <= 0
			l, E = I >= a, I <= a
			a = H and l or not H and E
			d[3] = I
			if a then
				return 1, d, T, I
			else
				return 35, d, T, m
			end
		elseif A <= 7 then
			local A = (_ + o * V) % 256
			local l = (V * A + _) % 256
			local E = (V * l + _) % 256
			local a = (V * E + _) % 256
			local V, I, H, W = P.n, l * 256, E * 65536, 16777216 * a
			V[o] = H + (I + A + W)
			P.Y[o] = a
			return 31, d, T, m
		else
			local o = T - 93819
			local T = table.create(o)
			_[5] = T
			local P = 1 + 0
			local A = 1 - P
			return 6, { o + 0, nil, A, P, d }, T, m
		end
	end,
	[123] = pairs,
	[44] = function(P, P, P, P)
		return function(P, T)
			local T = buffer.writei8
			local o = P[2]
			local d = P[3]
			local m = P[4]
			local A = P[5]
			local _ = P[6]
			local V = P[7]
			local l = table.insert
			local E = P[9]
			local a = vector.create
			local I = P[11]
			return function(P, ...)
				local H
				local H = type(T[6][T[5]])
				if H ~= "function" then
					return nil
				end
				local W
				H = o
				local W = not H.Alive
				if W then
					H = T[6][T[5]]
					return H(P, ...)
				end
				local w
				H = d
				W = H()
				local d
				H = m
				local d = H()
					or typeof(P) ~= "Instance"
					or not (
						W == "FireServer" and P:IsA("RemoteEvent")
						or W == "InvokeServer" and P:IsA("RemoteFunction")
					)
				if d then
					W = T[6][T[5]]
					return W(P, ...)
				end
				local m, w = P.Name == "KnifeThrown" or P.Name == "ThrowKnife"
				if m then
					H = A
					H.CapturedKnifeThrowRemote = P
				end
				local w
				m = not (P == _[6][_[5]] or P.Name == "Shoot" or P.Name == "ShootGun" or P.Name == "GunBeam")
				if m then
					d = T[6][T[5]]
					return d(P, ...)
				end
				H = o
				W = not H.Settings.Aimbot.Enabled
				if W then
					m = T[6][T[5]]
					return m(P, ...)
				end
				local w
				m = V[6][V[5]]()
				W = not m
				if W then
					d = T[6][T[5]]
					return d(P, ...)
				end
				H, W = table.pack(...), A
				d = W.GetShootProtocol(P, m, H)
				W = not d
				if W then
					local V = T[6][T[5]]
					return V(P, ...)
				end
				local V, w = A, A
				V.NativeShootRemote = P
				w.NativeShootGun = m
				W, V = A, A
				W.NativeShootArgs = H
				V.NativeShootProtocol = d
				_[6][_[5]] = P
				local _, j = m, o
				l[6][l[5]] = _
				d = not j.Settings.Aimbot.Penetration
				if d then
					local o
					W = E
					j = W(true)
					local o
					w = not j or not a[6][a[5]](j, false, false)
					if w then
						V = T[6][T[5]]
						return V(P, ...)
					end
				end
				j, W = os.clock(), A
				V, d = j - (W.LastShotRequestAt or 0) < 0.12
				if V then
					W = A
					d = W.LastShotRequestGun == m
				else
					d = V
				end
				V = nil
				if d then
					V = d
				else
					w = A
					V = j - (w.LastManualActionTime or 0) < 0.12
				end
				if V then
					return nil
				end
				local o, o, _, l, E, a, n = A, pcall(A.PrepareShot, m, P, H)
				w = not o or not _
				if w then
					d = T[6][T[5]]
					return d(P, ...)
				end
				_ = A
				V = _.ShotStates[m]
				if V and V.NativeActivationUntil then
					V.NativeActivationUntil = nil
					V.Busy = false
				end
				_ = not V or not V.Busy
				if _ then
					V = { Busy = false }
					d = A
					V.Generation = d.Generation
					V.Gun = m
					H = A
					H.ShotStates[m] = V
				else
				end
				V.StartedAt = j
				d = A
				d.LastManualActionTime = j
				local o
				I[6][I[5]](m, l, E, n)
				W = T[6][T[5]]
				return W(P, table.unpack(a, 1, a.n))
			end
		end
	end,
	vH = function(P, T)
		return P[48](T, 1, T.n)
	end,
	[78] = coroutine.isyieldable,
	[92] = function(P, P, P, P, P)
		return function(P, T)
			local T = buffer.writei8
			local o = P[2]
			local d = P[3]
			local m = P[4]
			return function(P)
				if type(P) ~= "table" or type(P.CreatedAt) ~= "number" then
					return false
				end
				local A = os.clock() - P.CreatedAt
				local _, V, l = A ~= A or A < 0
				if _ then
					V = _
				else
					local l, E = T
					E, V = T, A > l.FiniteNumber(T.SnapshotLifetime, 0.35, 0, 1)
				end
				A = nil
				if V then
					A = V
				else
					_ = nil
					_, A = T, P.Generation ~= T.Generation
				end
				V = nil
				if A then
					V = A
				else
					_ = nil
					_, V = T, P.RoundGeneration ~= T.Roles.Generation
				end
				_ = nil
				if V then
					_ = V
				else
					A = nil
					A, _ = T, P.AimRevision ~= (T.AimRevision or 0)
				end
				V = nil
				if _ then
					V = _
				else
					A = nil
					A, V = T, P.Player ~= T.LockPlayer
				end
				_ = nil
				if V then
					_ = V
				else
					A = T
					_ = not A.IsFiniteVector(P.OriginPosition)
				end
				A = nil
				if _ then
					A = _
				else
					V = T
					A = not V.IsFiniteVector(P.PredictedPosition)
				end
				_ = nil
				if A then
					_ = A
				else
					V = T
					_ = not V.IsFiniteVector(P.RootPosition)
				end
				A = nil
				if _ then
					A = _
				else
					V = T
					A = not V.IsFiniteVector(P.LocalRootPosition)
				end
				_ = nil
				if A then
					_ = A
				else
					V = T
					_ = not V.IsFiniteVector(P.TargetPosition)
				end
				A = nil
				if _ then
					A = _
				else
					V = T
					A = not V.IsFiniteVector(P.BodyCenter)
				end
				V = nil
				if A then
					V = A
				else
					_ = T
					V = not _.IsFiniteVector(P.BodySize)
				end
				A, _ = V or P.BodySize.Magnitude > 32 or math.min(P.BodySize.X, P.BodySize.Y, P.BodySize.Z) <= 0
				if A then
					_ = A
				else
					V = T
					_ = not V.IsFiniteVector(P.RawVelocity)
				end
				if _ then
					return false
				end
				local l
				V = o
				A = V.Settings.Aimbot
				if
					P.Enabled ~= A.Enabled
					or P.Penetration ~= A.Penetration
					or P.PredictionOffset ~= A.PredictionOffset
					or P.HeightOffset ~= A.HeightOffset
				then
					return false
				end
				local o, l = T
				A = d
				V, _ = o.GetLivingPlayer(A)
				local d
				o = not _
					or V ~= P.LocalCharacter
					or _ ~= P.LocalRoot
					or m[6][m[5]]() ~= P.Gun
					or not P.Gun
					or P.Gun.Parent ~= V
					or (_.Position - P.LocalRootPosition).Magnitude > 25
				if o then
					return false
				end
				if typeof(P.Player) ~= "Instance" or not P.Player:IsA("Player") then
					return false
				end
				A = T
				o, V = A.GetLivingPlayer(P.Player, true)
				A, _ = not V
					or o ~= P.Character
					or V ~= P.RootPart
					or typeof(P.TargetPart) ~= "Instance"
					or not P.TargetPart:IsA("BasePart")
					or not P.TargetPart:IsDescendantOf(o)
					or not P.TargetPart.CanQuery
				if A then
					_ = A
				else
					o = T
					_ = not o.IsFiniteVector(P.TargetPart.Position)
				end
				if
					_
					or (V.Position - P.RootPosition).Magnitude > 25
					or (P.TargetPart.Position - P.TargetPosition).Magnitude > 25
				then
					return false
				end
				if P.TargetAnchored ~= V.Anchored then
					return false
				end
				V = T
				A = V.ReadMuzzlePosition(P.Gun)
				return A ~= nil and (A - P.OriginPosition).Magnitude <= 10
			end
		end
	end,
	HH = function(P, T, o, d, m, A, _)
		if d <= 4 then
			local d = buffer.readu8(m, 3 + A)
			local V, l, E, a, I = (T - 128) * 128, o - 128, 16384 * (_ - 128), d % 128 * 2097152, d % 128
			local T = 2097152 * (d - I)
			d = a + V + (T + (E + l))
			return 18, A + 4, d, o
		else
			local T = buffer.readu8(m, 1 + A)
			return not (T < 128) and 16 or 21, m, A, T
		end
	end,
	[112] = string.unpack,
	_ = function(P, P, T, o, d, m, A, _)
		if A <= 67 then
			local V = (d - 128) * 16384
			return 103, _, m + 128 * (o - 128) + V, P
		elseif A <= 68 then
			return 111, _ + 1, d, P
		else
			local o, m, A = T[4], T[5], T[3]
			local V, l = o + m, m <= 0
			o, m = V >= A, V <= A
			A = l and o or not l and m
			T[4] = V
			if A then
				return 130, _, d, V
			else
				return 89, _, d, P
			end
		end
	end,
	[86] = function(P, P, P, P)
		return function(P, T, T, T)
			local T = buffer.writei8
			local o = P[2]
			local d = P[3]
			local m = P[4]
			return function(P, A, A, _, V, l, E)
				local a
				local a = T
				local I, H, W = not a.Alive
				if I then
					H = I
				else
					a = nil
					a, H = o, E.Generation ~= o.Generation
				end
				I = nil
				if H then
					I = H
				else
					a = o
					I = a.ShotStates[E.Gun] ~= E
				end
				if I then
					E.Busy = false
					a = o
					H = a.ShotStates[E.Gun] == E
					if H then
						local W = o
						W.ShotStates[E.Gun] = nil
					end
					return false
				end
				local W
				d[6][d[5]](E.Gun, A, _, l)
				a = o
				local d, W = a.LastShotRequestAt
				a = m[6][m[5]](P, table.unpack(V, 1, V.n))
				E.Busy = false
				A = T
				V, _ = not A.Alive
				if V then
					_ = V
				else
					A = nil
					A, _ = o, E.Generation ~= o.Generation
				end
				if _ then
					return false
				end
				H, I = not a
				if H then
					_ = o
					I = _.LastShotRequestAt == d
				else
					I = H
				end
				V = nil
				if I then
					l = o
					V = l.LastShotRequestGun == E.Gun
				else
					V = I
				end
				if V then
					E = o
					E.LastShotVisualTarget = nil
				end
				return a
			end
		end
	end,
	Q = function(P, T, o, d, m, A, _, V, l, E)
		if A <= 102 then
			if A <= 101 then
				local a = buffer.readu8(o, 2 + _)
				return not (128 <= a) and 23 or 88, E, T, l, _, d, a
			else
				local a = (E - 128) * 16384
				return 73, (T - 128) * 128 + (a + l), _ + 3, l, _, d, V
			end
		elseif A <= 103 then
			return 36, E, T, l, 3 + _, d, V
		elseif A <= 104 then
			local A = buffer.readu8(o, _)
			return not not (A >= 128) and 154 or 14, E, T, l, _, A, V
		else
			local A = buffer.readu8(o, 3)
			local P, o, a, I, H =
				128 * (l - 128), _ - 128, (m - 128) * 16384, A % 128 * 2097152, (A - A % 128) * 2097152
			return 56, E, T, P + a + (o + H + I), 4, d, V
		end
	end,
	[32] = function(P, P, P, P, P, P)
		return function(P, T, T)
			local T = buffer.writei8
			local o = P[2]
			local d = P[3]
			local m = P[4]
			local A = P[5]
			local _ = P[6]
			return function(P)
				local V
				local V = T
				if not V.Alive then
					return
				end
				local l
				V = o
				local l, E = V.Weather
				V = d
				local d = V.Holder
				if d then
					local E
					V = m
					V(math.min(P, 0.1))
				end
				local m
				V = A
				P = V.CurrentCamera
				V = l and P
				if V then
					local m, A = P.CFrame.Position
					A, l.CFrame =
						T, CFrame.new(m + Vector3.new(0, T.Settings.World.Weather == "Fireflies" and -4 or 32, 0))
				end
				V = o
				local T, m = V.Trail
				P = T and _[6][_[5]]().TrailRainbow
				if P then
					l, V = os.clock(), o
					d = l - V.LastRainbow > 0.05
					if d then
						local P = o
						P.LastRainbow = l
						local d, m = o, o
						d.LastHue = (m.LastHue + 0.02) % 1
						m, P = nil
						m, P, T.Color =
							o,
							o,
							ColorSequence.new(
								Color3.fromHSV(o.LastHue, 0.8, 1),
								Color3.fromHSV((o.LastHue + 0.25) % 1, 0.8, 1)
							)
					end
				end
			end
		end
	end,
	[89] = buffer.writef32,
	Z = function(P, T, o, d, m, A, _, V, l, E, a, I)
		if d <= 56 then
			if d <= 55 then
				local H = E - 14129
				local W, w, j = table.create(H), table.create(H), 1 + 0
				return 117, { 1 - j, H + 0, nil, j, o }, a, A, l, T, _, V, W, w
			else
				local H
				local W = a[6]
				if l == 0 then
					return 20, o, a, W, l, T, _, V, E, m
				else
					return 84, o, H, A, l, T, W, V, E, m
				end
			end
		elseif d <= 57 then
			local H = buffer.readu8(I, 1 + T)
			return not (H < 128) and 87 or 2, o, a, A, l, T, _, H, E, m
		elseif d <= 58 then
			return 41, o, a, A, _ + (l - 128) * 128, 2 + T, _, V, E, m
		else
			local d = buffer.readu8(I, 1 + A)
			return not not (128 <= d) and 128 or 28, o, a, A, l, T, _, d, E, m
		end
	end,
	GH = function(P, T, o, d, m, A, _, V)
		if _ <= 28 then
			if _ <= 27 then
				return 36, 1 + m, o, d, T
			else
				local l = buffer.readu8(A, m + 1)
				return not not (l >= 128) and 15 or 29, m, o, l, T
			end
		elseif _ <= 29 then
			local l = d + (o - 128) * 128
			return 34, 2 + m, l, d, T
		elseif _ <= 30 then
			local _ = buffer.readu8(A, 2 + m)
			return not not (_ >= 128) and 20 or 11, m, o, d, _
		else
			local P, A, _ = V[1], V[2], V[3]
			local l, E = P + A, A <= 0
			A, P = l >= _, l <= _
			_ = E and A or not E and P
			V[1] = l
			if _ then
				return 7, l, o, d, T
			else
				return 17, m, o, d, T
			end
		end
	end,
	AH = function(P, T, o, d, m, A, _)
		if _ <= 24 then
			local V = buffer.readu8(A, T + 2)
			if not not (V >= 128) then
				return 4, A, T, m, o, V
			else
				return 12, V, T, m, o, d
			end
		elseif _ <= 25 then
			local _ = buffer.readu8(A, 3 + T)
			local V, l, E, a = (m - 128) * 128, o - 128, 16384 * (d - 128), _ % 128 * 2097152
			local I = 2097152 * (_ - _ % 128) + (l + E) + (a + V)
			return 8, A, T + 4, I, o, d
		else
			local _ = buffer.readu8(A, T + 1)
			if not (128 <= _) then
				return 32, _, T, m, o, d
			else
				return 24, A, T, m, _, d
			end
		end
	end,
	g = function(P, T, o, d, m, A, _, V, l, E, a)
		if A <= 148 then
			if A <= 147 then
				local I = 128 * (o - 128) + a
				return 55, V, T + 2, _, m, I, E, l
			else
				return 116, V[2], T, _, m, o, E, l
			end
		elseif A <= 149 then
			local a, I = buffer.readu32(d, T), T + 4
			local H, W, w, j = buffer.readu32(d, I), 4 + I, _ - _ % 1, 1 + 0
			return 74, { nil, V, w - j, j, a + 0 }, a, H, W, o, E, l
		elseif A <= 150 then
			local d = o + ((_ - 128) * 16384 + 128 * (m - 128))
			return 104, V, T + 3, d, m, o, E, l
		else
			local d = E - 14129
			local A, l, E = table.create(d), table.create(d), 1 + 0
			return 34, { 1 - E, nil, E, d + 0, V }, T, _, m, o, A, l
		end
	end,
	J = function(P, T, o, d, m, A, _, V, l, E)
		if d <= 78 then
			local a = buffer.readu8(A, l)
			return not (a < 128) and 162 or 16, l, _, a, E
		elseif d <= 79 then
			local d = buffer.readu8(A, 3 + l)
			local P, A, a, I, H = (_ - 128) * 128, T - 128, (m - 128) * 16384, 2097152 * (d % 128), d % 128
			local T = (d - H) * 2097152
			H = P + (a + A + (T + I))
			return 36, 4 + l, H, o, E
		else
			local P = (E - 128) * 128 + V
			return 151, l + 2, _, o, P
		end
	end,
	N = { 61810, 1113988368, 1023977617, 1829177801, 949247640, 2912562325, 2640111628, 1232547363, 57569153 },
	K = function(P, T, o, d, m, A, _, V, l, E, a, I)
		if I <= 22 then
			local H = (A - 128) * 16384 + (T + 128 * (_ - 128))
			return 111, l + 3, a, H, V, d
		elseif I <= 23 then
			local T = (V - 128) * 16384
			local _ = E + ((o - 128) * 128 + T)
			return 45, l, a + 3, A, _, d
		else
			local T = buffer.readu8(m, a)
			return not (128 > T) and 39 or 132, l, a, A, V, T
		end
	end,
	[127] = function(P, P, P, P, P)
		return function(P, T)
			local T = buffer.writei8
			local o = P[2]
			local d = P[3]
			return function()
				local P
				local P = T
				local m, A = P.Model
				if m then
					local P, _, _ = T
					_, A = o, P.Character == o.Character
				else
					A = m
				end
				if A then
					local P
					d[6][d[5]](T.Character, true)
				end
			end
		end
	end,
	[113] = buffer.writeu32,
	NH = function(P, T, o, d, m, A, _, V, l, E, a)
		if l <= 10 then
			if l <= 9 then
				m[T] = _
				local I, H, W = P:_H(m, A)
				local w = buffer.readu8(A, W)
				return 1, 128 > w and 8 or 1, I, H, W, w, V, E
			else
				return 2
			end
		elseif l <= 11 then
			local l = buffer.readu8(A, 2 + _)
			return 1, not (128 <= l) and 24 or 2, m, T, _, a, V, l
		else
			local A = buffer.readu8(o, 1 + d)
			return 1, not (128 > A) and 14 or 3, m, T, _, a, A, E
		end
	end,
	j = function(P, ...)
		return (...)()
	end,
	O = function(P, T, o, d, m, A, _, V, l)
		if o <= 87 then
			if o <= 86 then
				local E = 128 * (A - 128) + T
				return 90, m, d + 2, _, V, E
			else
				local E = buffer.readu8(l, 2 + d)
				return not (E < 128) and 12 or 150, m, d, E, V, A
			end
		elseif o <= 88 then
			local E = buffer.readu8(l, d + 3)
			local P, l, a, I = (V - 128) * 128, A - 128, (T - 128) * 16384, E % 128 * 2097152
			local T = (E - E % 128) * 2097152 + I + (a + P + l)
			return 45, m, d + 4, _, T, A
		elseif o <= 89 then
			return 78, m[2], d, _, V, A
		else
			_[V] = A
			return 117, m, d, _, V, A
		end
	end,
	[48] = unpack,
	[11] = function(P, P, P)
		return function(P, T)
			local T = buffer.writei8
			local o = P[2]
			local d = P[3]
			local m = P[4]
			local A = P[5]
			local _ = P[6]
			return function()
				local P
				local P, V = T, T
				P.BuiltFrame = V.Frame
				P = T
				P.CurrentSnapshot = nil
				V = os.clock()
				local l
				local l, E = o[6][o[5]]()
				if not l or not E then
					return nil
				end
				local o, a = T
				P = d
				local d, a = o.GetLivingPlayer(P)
				local I
				o = m[6][m[5]]()
				if not a or not o or o.Parent ~= d then
					return nil
				end
				P = T
				local m = P.ReadMuzzlePosition(o)
				if not m then
					return nil
				end
				P = o:FindFirstChild("Handle") or o:FindFirstChildWhichIsA("BasePart")
				P = if P and not P:IsA("BasePart") then nil else P
				local I = T
				local H, W, w = I.GetLivingPlayer(l, true)
				if not W then
					return nil
				end
				I = T
				I.SampleMotion(l, W, w, V)
				I = T
				local j = I.VelocityHistory[l]
				if not j then
					return nil
				end
				local n, y = j.Anchor or W, T
				local S, r = y.GetBodyBounds(H, W)
				if not S then
					S, r = n.Position, Vector3.new(2, 5, 1)
				else
				end
				local t, X, J, e =
					W.Anchored and Vector3.new(0.0, 0.0, 0.0) or j.Velocity, j.Airborne == true, j.Mode or "Ground", T
				I = e.FiniteNumber(j.Confidence, 0, 0, 1)
				e = nil
				if X then
					y = T
					e = y.FiniteNumber(j.Gravity, 0, 0, 500)
				else
					e = X
				end
				local R, q = e or 0, T
				local c, N, Q, D = q.GetLeadTime(V), j.Desynced
				if N then
					Q, D = S, r
				else
					e = T
					Q, D = e.GetMotionBounds(H, W, w)
				end
				N = T
				w, q = N.PredictPath(Q, D, t, R, c, H), j.GroundY
				w = if q
						and V - (j.GroundAt or 0) < 2
						and n.Position.Y + w.Y < q - 0.3
					then Vector3.new(w.X, q - n.Position.Y, w.Z)
					else w
				local K, s = T
				y, N, e = T, A, K.JumpOffset(j, V, c, T.FiniteNumber(A.Gravity, 196.2, 0, 500))
				w = if e > 0 then w + Vector3.new(0, e, 0) else w
				q = T
				D = q.OscillationOffset(j, V, c)
				if D then
					w = Vector3.new(D.X, w.Y, D.Z)
				else
					Q, q = j.Jitter
					if Q then
						e = T
						q = e.IsFiniteVector(j.MeanOffset)
					else
						q = Q
					end
					w = if q then w + j.MeanOffset else w
				end
				local A
				q, D, K, e = T, _, Vector3.new(0, T.FiniteNumber(_.Settings.Aimbot.HeightOffset, 0, -2, 2), 0), T
				local A, y = e.MakeQueryParams(H, false)
				Q, e = ipairs, T
				local q, N = e.BodyNames, E
				for D, s in Q(q) do
					D = H:FindFirstChild(s)
					E, s = D and D:IsA("BasePart") and D.CanQuery
					if E then
						e = T
						s = e.IsFiniteVector(D.Position)
					else
						s = E
					end
					if s then
						local s, k = D.Position + w, T
						local L = k.IsBoxClear(s, Vector3.new(0.12, 0.12, 0.12), y)
						k = nil
						if L then
							local f = T
							k = f.IsSegmentClear(m, s, A)
						else
							k = L
						end
						if k then
							N = D
							break
						end
					end
				end
				y = N.Position
				E, q = y + w + K, T
				if not q.IsFiniteVector(E) then
					return nil
				end
				q, e = j.RawVelocity, T
				A, Q = e.EstimateHitChance(j, c, t, E - m, V, math.max(r.X, r.Z) * 0.38, r.Y * 0.42)
				e = _
				local _, D, s, k, L = e.Settings.Aimbot, T, table.freeze, { CreatedAt = V }, T
				k.Frame = L.Frame
				e = T
				k.Generation = e.Generation
				K = T
				k.RoundGeneration = K.Roles.Generation
				K = T
				k.AimRevision = K.AimRevision or 0
				L = T
				k.MotionRevision = L.MotionRevision
				k.Enabled = _.Enabled
				k.Penetration = _.Penetration
				k.PredictionOffset = _.PredictionOffset
				k.HeightOffset = _.HeightOffset
				k.AnchorPart = n
				k.PredictedAnchor = n.Position + w
				k.Spoofed = j.Spoofed == true
				k.Jitter = j.Jitter == true
				k.Oscillating = j.Oscillation ~= nil
				k.HitChance = A
				k.Uncertainty = Q
				k.Desynced = j.Desynced == true
				k.LocalCharacter = d
				k.LocalRoot = a
				k.LocalRootPosition = a.Position
				k.Player = l
				k.Character = H
				k.RootPart = W
				k.RootPosition = W.Position
				k.Gun = o
				k.GunHandle = P
				k.OriginPosition = m
				k.PredictedPosition = E
				k.BodyCenter = S + w
				k.BodySize = r
				k.TargetPart = N
				k.TargetPosition = y
				k.MotionDirection = t.Magnitude > 0.75 and t.Unit or Vector3.new(0.0, 0.0, 0.0)
				k.Velocity = t
				k.RawVelocity = q
				k.MotionMode = J
				k.TargetAnchored = W.Anchored
				k.Acceleration = Vector3.new(0, -R, 0)
				k.Confidence = I
				k.VelocityConfidence = I
				k.PositionDriven = j.PositionDriven == true
				k.Airborne = X
				k.VerticalPhase = not X and "Grounded" or (t.Y > 3 and "Rising" or (t.Y < -3 and "Falling" or "Apex"))
				k.Ballistic = R > 0
				k.LeadTime = c
				R = T
				k.Stable = V - (R.LockStartedAt or V) >= 0.035 and V - (j.StableSince or V) >= 0.05 and I >= 0.3
				D.CurrentSnapshot = s(k)
				H = T
				return H.CurrentSnapshot
			end
		end
	end,
	yH = function(P, T, o, d)
		local m = coroutine.yield
		m()
		for P, A in T, o, d do
			m(true, P, A)
		end
	end,
	[21] = coroutine.close,
	[31] = tostring,
	W = function(P, T, o, d, m, A, _, V, l, E)
		if m <= 152 then
			local m = buffer.readu8(T, 3 + d)
			local a, I, H, W, w = (A - 128) * 128, E - 128, (o - 128) * 16384, m % 128 * 2097152, m % 128
			local o = (m - w) * 2097152
			m = H + a + W + (I + o)
			return 90, d + 4, V, m
		else
			local o = buffer.readu8(T, 3 + d)
			local P, T, m, E, a = 128 * (V - 128), l - 128, (_ - 128) * 16384, o % 128 * 2097152, o % 128
			local _ = (o - a) * 2097152
			o = E + m + (_ + P) + T
			return 55, d + 4, o, A
		end
	end,
	[81] = bit32.band,
	h = function(P)
		return true,
			70,
			nil,
			nil,
			nil,
			nil,
			nil,
			nil,
			nil,
			nil,
			nil,
			nil,
			nil,
			nil,
			nil,
			nil,
			nil,
			nil,
			nil,
			nil,
			nil,
			nil,
			nil
	end,
	q = function(P, T, o, d, m, A, _, V, l, E, a, I, H, W, w, j, n, y, S, r)
		if T <= 26 then
			if T <= 25 then
				a[0] = l
				H[0] = I
				S[0] = W
				w[0] = A
				P[53](a, d)
				P[53](H, d)
				P[53](S, d)
				P[53](w, d)
				return 91, r, P[o](P, j, l, I, A, w, S, a, m, nil, H, E, y, nil, _, W), d, o, V, j
			else
				return 38, n, m, d, o, 1 + V, j
			end
		elseif T <= 27 then
			local A = buffer.readu8(n, d)
			return not (A >= 128) and 94 or 145, n, m, d, o, A, j
		elseif T <= 28 then
			local P = y + (j - 128) * 128
			return 111, n, m, d + 2, o, V, P
		else
			local P = 16384 * (o - 128)
			return 41, n, m, d, (E - 128) * 128 + (P + j), V + 3, j
		end
	end,
	[47] = rawset,
	f = function(P, T, o, d, m, A, _, V, l, E, a)
		if o <= 133 then
			if o <= 132 then
				return 161, l, 1 + _, E, a
			else
				return 54, l, _ + 1, E, a
			end
		elseif o <= 134 then
			local I, H, W = T[4], T[5], T[1]
			local w, j = I + H, H <= 0
			H, I = w >= W, w <= W
			W = j and H or not j and I
			T[4] = w
			if W then
				return 142, l, _, w, a
			else
				return 148, l, _, E, a
			end
		elseif o <= 135 then
			local T = buffer.readu8(A, 2 + _)
			return 128 > T and 119 or 21, l, _, E, T
		else
			V[0] = l
			P[53](V, d)
			return 91, P[_](P, V, nil), m, E, a
		end
	end,
	[64] = typeof,
	[12] = error,
	[23] = buffer.fill,
	rH = function(P, T, o, d)
		local m, A, _, V, l, E, a, I = P[12], P[7], string.match, 5, T, d, o
		while true do
			if V <= 3 then
				if V <= 1 then
					if V <= 0 then
						E(a .. I .. ": " .. l, 0)
						V = 1
					else
						return
					end
				elseif V <= 2 then
					m(l, 0)
					V = 1
				else
					d = E[a]
					if d then
						V, E, a, I = 0, m, "LPH:", d
					else
						V, E, a = 7, m, "LPH:"
					end
				end
			elseif V <= 5 then
				if V <= 4 then
					m(l, 1)
					V = 1
				else
					V = A(l) == "string" and 6 or 4
				end
			elseif V <= 6 then
				V = _(l, ":[^%w%W]-(%d+)[\10\13:]") and 3 or 2
			else
				V, I = 0, "?"
			end
		end
	end,
	[29] = next,
	[94] = buffer.writeu8,
	[120] = function(P, P, P, P, P)
		return function(P)
			local T = buffer.writei8
			local o = P[2]
			local d = P[3]
			return function()
				local P
				local P = T
				local m, A = P.PlayerMovement, T
				local _, V = A.Settings.Player
				P = o
				A = P.Character
				local o, V = A and (A:FindFirstChild("HumanoidRootPart")), A and (A:FindFirstChildOfClass("Humanoid"))
				if not _.AntiFling or not o or not V or V.Health <= 0 then
					m.AntiFlingSafe = nil
					return
				end
				P = T
				local l, E = P.FlingRuntime.ProtectionSuspended
				if l then
					E = l
				else
					P = T
					E = P.FlingRuntime.Busy
				end
				if E or _.Fly or o.Anchored then
					m.AntiFlingSafe = nil
					return
				end
				_, P, E = o.AssemblyLinearVelocity, o.AssemblyAngularVelocity, m.SpoofVelocity
				if E and (_ - E).Magnitude < 5 then
					return
				end
				local T, a, I, H, W, w =
					os.clock() < (m.FakePositionUntil or 0),
					Vector3.new(_.X, 0, _.Z).Magnitude,
					math.max(90, V.WalkSpeed * 3 + 40),
					math.max,
					V.UseJumpPower and V.JumpPower
				if W then
					w = W
				else
					local W, W
					W, w = d, math.sqrt(2 * d.Gravity * V.JumpHeight)
				end
				l = H(140, w * 1.25 + 20)
				if a > I or l < _.Y or P.Magnitude > 45 or _.X ~= _.X or _.Y ~= _.Y or _.Z ~= _.Z then
					E = m.AntiFlingSafe
					for d, d in ipairs(A:GetDescendants()) do
						if d:IsA("BasePart") then
							d.AssemblyLinearVelocity = Vector3.new(0.0, 0.0, 0.0)
							d.AssemblyAngularVelocity = Vector3.new(0.0, 0.0, 0.0)
						end
					end
					if E then
						o.CFrame = E
					end
					V:ChangeState(Enum.HumanoidStateType.GettingUp)
					m.AntiFlingHitAt = os.clock()
				elseif a < I * 0.5 and math.abs(_.Y) < 80 and P.Magnitude < 15 then
					if o.CFrame.UpVector.Y > 0.7 and not T then
						m.AntiFlingSafe = o.CFrame
					end
				end
			end
		end
	end,
	[46] = setfenv,
	[3434] = Vector2.new,
	[53] = setmetatable,
	[74] = string.match,
	[28] = xpcall,
	[16342] = function(P, P, P)
		return function(P)
			local T = buffer.writei8
			local o = P[2]
			return function()
				local P = 0
				while true do
					local d = P <= 0
					if d then
						local d
						T[6][T[5]] = T[6][T[5]] - T[6][T[5]] % 2 + 1
						local T
						o[6][o[5]], P = (816449 * o[6][o[5]] + 122014399) % 268435456, 1
					else
						return
					end
				end
			end
		end
	end,
	[43] = bit32.lshift,
	[118] = coroutine.resume,
	[83] = buffer.readstring,
	[91] = table.create,
	SH = function(P, T, o, d, m, A, _, V, l)
		if l <= 1 then
			if l <= 0 then
				return 2
			else
				local E = buffer.readu8(d, V)
				return 1, not (128 <= E) and 27 or 10, m, d, _, A, T, E
			end
		elseif l <= 2 then
			local l = buffer.readu8(d, V)
			return 1, 128 > l and 33 or 28, m, d, _, 4, l, o
		else
			local P = 1 + 0
			return 1, 31, { 0 - P, P, 255 + 0, m, nil }, 9, 181, A, T, o
		end
	end,
	[60] = string.rep,
	[68] = buffer.fromstring,
	[6081] = Vector3.new,
	[93] = assert,
	lH = function(P, T, o, d, m, A, _, V, l, E)
		if E <= 19 then
			if E <= 18 then
				P[114] = V
				return 0, P:m(_, m, 112)(P.u), m, d, o
			else
				return 8, V, m + 1, d, o
			end
		elseif E <= 20 then
			local _, E, a, I = buffer.readu8(V, m + 3), (o - 128) * 128, l - 128, (T - 128) * 16384
			local P = 2097152 * (_ % 128) + (2097152 * (_ - _ % 128) + I) + (E + a)
			return 36, V, m + 4, d, P
		else
			local P = (d - 128) * 128 + A
			return 8, V, 2 + m, P, o
		end
	end,
	u = {},
	b = function(P, T, o, d, m, A)
		if o <= 65 then
			local o = buffer.readu8(m, 2 + d)
			return not (o < 128) and 139 or 40, o, A
		else
			local o = buffer.readu8(m, d + 2)
			return not (o < 128) and 106 or 5, T, o
		end
	end,
	a = function(P, T, o, d, m, A, _, V, l, E)
		if o <= 154 then
			local a = buffer.readu8(V, 1 + A)
			return a < 128 and 52 or 0, V, _, A, a, l
		elseif o <= 155 then
			return 136, (d - 128) * 128 + V, _ + 2, A, m, l
		else
			local P = (l - 128) * 16384
			local o = E + (T - 128) * 128 + P
			return 151, V, _, 3 + A, m, o
		end
	end,
	[0] = function(P, P, P, P, P, P)
		return function(P, T, T)
			local T = buffer.writei8
			local o = P[2]
			local d = P[3]
			return function(P)
				local m
				local m, A = T
				local T = o
				local o, A = m(T.Settings.Aimbot.PredictionOffset, 0, -100, 200) / 1000
				T = d
				local m, A, _, V = T.GetRoundTrip(P), d
				_, V, A.InterpolationDelay =
					d, d, math.clamp(d.InterpolationBase + d.InterpolationScale * m, 0.05, 0.35)
				T = d
				return math.clamp(m + T.InterpolationDelay + o, 0, 0.8)
			end
		end
	end,
	[76] = table.pack,
	[14] = getmetatable,
	y = function(P, T, o, d, m, A, _, V, l, E, a)
		if a <= 71 then
			if a <= 70 then
				local I = buffer.readu8(m, 0)
				return not not (I >= 128) and 98 or 72, A, T, nil, I, o, l, E
			else
				local m = V + (E - 128) * 128
				return 83, A, T, d, _, 2 + o, l, m
			end
		elseif a <= 72 then
			return 56, A, T, d, _, 1, l, E
		elseif a <= 73 then
			local m, V, a = table.create(T), table.create(T), 1 + 0
			local P = 1 - a
			return 140, { T + 0, A, a, P, nil }, m, d, V, o, l, E
		else
			local P, m, V = A[3], A[4], A[5]
			local a, I = P + m, m <= 0
			m, P = a >= V, a <= V
			V = I and m or not I and P
			A[3] = a
			if V then
				return 113, A, T, d, _, o, a, E
			else
				return 109, A, T, d, _, o, l, E
			end
		end
	end,
}, {}):JH(...)
