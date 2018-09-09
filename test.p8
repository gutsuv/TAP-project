pico-8 cartridge // http://www.pico-8.com
version 16
__lua__
player = {}
player.x = 55
player.y = 65
player.sprite = 1
player.speed = 1.2
player.moving = false
player.moved_this_frame = false
player.frame = 0
player.step = 0
player.steptwo = 0
player.stepthree = 0

player_up = 17
player_down = 1
player_left = 49
player_right = 33

array_down = {0, 1, 2}
array_up = {16, 17, 18}
array_right = {32, 33, 34}
array_left = {48, 49, 50}


function move(sprite)
    player.moved_this_frame = true
	
	if(player.step % 3 == 0) then 
		player.frame += 1 
	end
	if(player.frame > 7) then
		
		if player.steptwo > 2 then
			player.steptwo = 0
		end
		
		player.steptwo += 1
		
		if sprite == 49 then
			player.sprite = array_left[player.steptwo]
		end
		
		if sprite == 33 then
			player.sprite = array_right[player.steptwo]
		end
		
		if sprite == 17 then
			player.sprite = array_up[player.steptwo]
		end
		
		if sprite == 1 then
			player.sprite = array_down[player.steptwo]
		end
		
		//player.sprite += 1
		//if player.sprite > (sprite + 1) then
		//	player.sprite = (sprite - 1)
		//end

		player.frame = 0
	end
end

function _update()
	player.moved_this_frame = false
	
	// move left
	if btn(0) then
		if not player.moving then 
			player.sprite = player_left
		end
		
		player.x -= player.speed
		move(player_left)
	end
	
	// move right
	if btn(1) then
		if not player.moving then 
			player.sprite = player_right
		end
		
		player.x += player.speed
		move(player_right)
	end
	
	// move up
	if btn(2) then
		if not player.moving then 
			player.sprite = player_up
		end
		
		player.y -= player.speed
		move(player_up)
	end
	
	// move down
	if btn(3) then
		if not player.moving then 
			player.sprite = player_down
		end
		
		player.y += player.speed
		move(player_down)
	end 
	
	if player.moved_this_frame then
		player.moving = true
	else
		player.moving = false
	
		if (player.sprite == 48 or player.sprite == 49 or player.sprite == 50) then
			player.sprite = 49
		end
		
		if (player.sprite == 32 or player.sprite == 33 or player.sprite == 34) then
			player.sprite = 33
		end
		
		if (player.sprite == 16 or player.sprite == 17 or player.sprite == 18) then
			player.sprite = 17
		end
		
		if (player.sprite == 0 or player.sprite == 1 or player.sprite == 2) then
			player.sprite = 1
		end
	end
end

function _draw()
	cls()
	map(0, 48, 0, 0)
	spr(player.sprite, player.x, player.y)
end


__gfx__
00dd220000dd220000dd22000000000000000000ffffffffffffffffffffffffffffffffffffffffffffffffcccccccccccccccc333333333333333333333333
00d5520000d5520000d552000000000000000000ffffffffffffffffffffffffffffffffffffffffffffffffcccccccccccccccc333333333333333333333333
00d5520000d5520000d552000000000000000000ffffffffffffffffffffffffffffffffffffffffffffffffcccccccccccccccc333333333333333333333333
0dddd2200dddd2200dddd2200000000000000000fffff55555555555555ffffffffff55555555555555fffffcccccccccccccccc333335555555555555533333
0fddd2f00fddd2f00fddd2f00000000000000000ffff5cccccccccccccc5ffffffff5333333333333335ffffccccc555555ccccc33335cccccccccccccc53333
00dd220000dd220000dd22000000000000000000fff5cccccccccccccccc5ffffff533333333333333335fffcccc53333335cccc3335cccccccccccccccc5333
00d2220000d2220000d222000000000000000000fff5cccccccccccccccc5ffffff533333333333333335fffcccc53333335cccc3335cccccccccccccccc5333
0000050000500500005000000000000000000000fff5cccccccccccccccc5ffffff533333333333333335fffcccc53333335cccc3335cccccccccccccccc5333
00dddd0000dddd0000dddd000000000000000000fff5cccccccccccccccc5ffffff533333333333333335fffcccc53333335cccc3335cccccccccccccccc5333
00ddd20000ddd20000ddd2000000000000000000fff5cccccccccccccccc5ffffff533333333333333335fffcccc53333335cccc3335cccccccccccccccc5333
00ddd20000ddd20000ddd2000000000000000000fff5cccccccccccccccc5ffffff533333333333333335fffcccc53333335cccc3335ccccc6cccccccccc5333
0dddd2200dddd2200dddd2200000000000000000fff5cccccccccccccccc5ffffff533333333333333335fffccccc555555ccccc3335cccccccccccccccc5333
0fddd2f00fddd2f00fddd2f00000000000000000fff5cccccccccccccccc5ffffff533333333333333335fffcccccccccccccccc3335cccccccccccccccc5333
00dd220000dd220000dd22000000000000000000fff5cccccccccccccccc5ffffff533333333333333335fffcccccccccccccccc3335ccccccccc6cccccc5333
00d2220000d2220000d222000000000000000000fff5cccccccccccccccc5ffffff533333333333333335fffcccccccccccccccc3335cccccccccccccccc5333
0000050000500500005000000000000000000000fff5cccccccccccccccc5ffffff533333333333333335fffcccccccccccccccc3335cccccccccccccccc5333
00dddd0000dddd0000dddd000000000000000000fff5cccccccccccccccc5ffffff533333333333333335fffcccccccccccccccc3335cccccccccccccccc5333
00dd550000dd550000dd55000000000000000000fff5cccccccccccccccc5ffffff533333333333333335fffcccccccccccccccc3335cccccccccccccccc5333
00dd550000dd550000dd55000000000000000000fff5cccccccccccccccc5ffffff533333333333333335fffcccccccccccccccc3335cccccccccccccccc5333
00ddd20000ddd20000ddd2000000000000000000ffff5cccccccccccccc5ffffffff5333333333333335ffffcccccccccccccccc33335cccccccccccccc53333
00ddf20000dfd20000fdd2000000000000000000fffff55555555555555ffffffffff55555555555555fffffcccccc5555cccccc333335555555555555533333
00dd220000dd220000dd22000000000000000000ffffffffffffffffffffffffffffffffffffffffffffffffccccc5ffff5ccccc333333333333333333333333
00d2220000d2220000d222000000000000000000ffffffffffffffffffffffffffffffffffffffffffffffffcccc5ffffff5cccc333333333333333333333333
0000050000050500000500000000000000000000ffffffffffffffffffffffffffffffffffffffffffffffffcccc5ffffff5cccc333333333333333333333333
00dddd0000dddd0000dddd000000000000000000ffffffffffffffff33335ffffff533333333333333333333cccc5ffffff5cccc333333333333333333333333
0055dd000055dd000055dd000000000000000000ffffffffffffffff33335ffffff533333333333333333333cccc5ffffff5cccc333333333333333333333333
0055dd000055dd000055dd000000000000000000ffffffffffffffff333335ffff5333333333333333333333ccccc5ffff5ccccc333333333333333333333333
00ddd20000ddd20000ddd2000000000000000000ffffffffffffffff33333355553333333333333333333333cccccc5555cccccc333333333333333333333333
00dddf0000ddf20000dfd2000000000000000000ffffffffffffffff33333333333333333333335555333333cccccccccccccccc333333333333333333333333
00dd220000dd220000dd22000000000000000000ffffffffffffffff3333333333333333333335ffff533333cccccccccccccccc333333333333333333333333
00d2220000d2220000d222000000000000000000ffffffffffffffff333333333333333333335ffffff53333cccccccccccccccc333333333333333333333333
0000500000505000005000000000000000000000ffffffffffffffff333333333333333333335ffffff53333cccccccccccccccc333333333333333333333333
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004141414141414141414141
41414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141
00000000000000000041000000000000000000000000000000000000000000000000000000000000000000000000000000414100414100004141414141414141
41414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141
41414141414141414141414141414141414141414141414141414141414141414141414141414141000000000000004141414100000000004141414141414141
41414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141
41414141414141414141414141414141414141414141414141414141414141414141414141414141000000000041414141000041000000004141414141414141
41414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141
41414141414141414141414141414141414141414141414141414141414141414141414141414141000000000041414141414100000000004141414141414141
41414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141
41414141414141414141414141414141414141414141414141414141414141414141414141414141000000000000004141414100000000004141414141414141
41414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141
41414141414141414141414141414141414141414141414141414141414141414141414141414141000000000000414141004100000000004141414141414141
41414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141
41414141414141414141414141414141414141414141414141414141414141414141414141414141000000000041000000004100000000004141414141414141
41414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141
41414141414141414141414141414141414141414141414141414141414141414141414141414141000000000000000000004100000000004141414141414141
41414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141
41414141414141414141414141414141414141414141414141414141414141414141414141414141000041000000000000414141000000004141414141414141
41414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141
41414141414141414141414141414141414141414141414141414141414141414141414141414141000000000000000000414100000000004141414141414141
41414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141
41414141414141414141414141414141414141414141414141414141414141414141414141414141000000000000004141410000000000004141414141414141
41414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141
41414141414141414141414141414141414141414141414141414141414141414141414141414141000000000000414141000000000000004141414141414141
41414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141
41414141414141414141414141414141414141414141414141414141414141414141414141414141000000000041414141004100000000004141414141414141
41414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141
41414141414141414141414141414141414141414141414141414141414141414141414141414141000000004141004100000000410000004141414141414141
41414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141
63638292a39191919191919191919191414141414141414141414141414141414141414141414141000000004100410000000000000000004141414141414141
41414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141
6070636382a391919191919191919191414141414141414141414141414141414141414141414141000000004100000000000000000041004141414141414141
41414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141
61b36070638191919191919193929292414141414141414141414141414141414141414141414141000000000000000000000000410041414141414141414141
41414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141
61e1e1715381919191919191a1535353414141414141414141414141414141414141414141414141000000000041414141414100410000004141414141414141
41414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141
e16161b37082a39191919193a2506060414141414141414141414141414141414141414141414141004141414141414141410041000000004141414141414141
41414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141
6161e1e171638292929292a2635161e1414141414141414141414141414141414141414141414141000041414141414141414141000041414141414141414141
41414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141
616161e1716363636363506060c36161414141414141414141414141414141414141414141414141000000410000000000000000004100004141414141414141
41414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141
61616161b37063636350c36161e16161414141414141414141414141414141414141414141414141004100000000000000000000410041004141414141414141
41414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141
e1e161e16171535350c3e1e1616161e1414141414141414141414141414141414141414141414141414141414141000041004100410000004141414141414141
41414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141
6161e161b27253535262c2b26262c261414141414141414141414141414141414141414141414141414141414141414141410041414100414141414141414141
41414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141
e1e1b2627280909090a0527280a05161414141414141414141414141414141414141414141414141414141414141414141410000000000004141414141414141
41414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141
61b2725380839191917390a082a251e1414141414141414141414141414141414141414141414141000000000000000000000000000000004141414141414141
41414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141
e171538083919191919193a25350c361414141414141414141414141414141414141414141414141000000000000000000000000000000004141414141414141
41414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141410000000000000000
61b3708292a391919191a15350c361e1414141414141414141414141414141414141414141414141000000000000000000000000000000004141414141414141
41414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141410000000000000000
61e1b370538292929292a250c3e16161414141414141414141414141414141414141414141414141000000000000000000000000000000004141414141414141
41414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141410000000000000000
616161b360606060606060c3616161e1414141414141414141414141414141414141414141414141000000000000000000000000000000004141414141414141
41414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141410000000000000000
e1e161e161e1e1616161e1e161e161e1414141414141414141414141414141414141414141414141000000000000000000000000000000004141414141414141
41414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141410000000000000000
__map__
1414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414140000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414140014141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414
1414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414140014141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414
1414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414140014141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414
1414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414140014141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414
1414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414140014141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414
1414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414140014141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414
1414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414140014141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414
1414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414140014141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414
1414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414140014141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414
1414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414140014141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414
1414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414140014141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414
1414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414140014141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414
1414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414140014141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414
1414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414140014141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414
1414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414140014141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414
1414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414140014141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414
1414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414140014141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414
1414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414140014141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414
1414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414140014141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414
1414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414140014141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414
1414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414
1414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414140014141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414
1414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414
1414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414140014141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414
1414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414140014141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414
1414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414140014141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414
1414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414140014141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414
1414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414140014141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414
1414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414140014141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414
1414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414140014141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414
1414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414140014141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414
__sfx__
0001000000000000002e05034050380500703002030220302203021030200202a0300b030050501a0601a070190701907000040000500a03008020080400e000140000e030160302a0101f020000400006000060
