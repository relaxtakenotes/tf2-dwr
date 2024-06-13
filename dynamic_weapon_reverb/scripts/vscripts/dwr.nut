// TODO:
// explosion reverb -- most likely not possible. is there a way to catch explosions?

local MASK_SHOT = 2 + 1 + 32768 + 262144;
local RECIPIENT_FILTER_SINGLE_PLAYER = 4;

local files = ["dwr\\kleiner.wav", "dwr\\bulletcracks\\close\\1.wav", "dwr\\bulletcracks\\close\\2.wav", "dwr\\bulletcracks\\close\\3.wav", "dwr\\bulletcracks\\close\\4.wav", "dwr\\bulletcracks\\close\\5.wav", "dwr\\bulletcracks\\close\\6.wav", "dwr\\bulletcracks\\close\\7.wav", "dwr\\bulletcracks\\close\\8.wav", "dwr\\bulletcracks\\distant\\1.wav", "dwr\\bulletcracks\\distant\\2.wav", "dwr\\bulletcracks\\distant\\3.wav", "dwr\\bulletcracks\\distant\\4.wav", "dwr\\bulletcracks\\distant\\5.wav", "dwr\\bulletcracks\\distant\\6.wav", "dwr\\bulletcracks\\distant\\7.wav", "dwr\\bulletcracks\\distant\\8.wav", "dwr\\bulletcracks\\distant\\f1.wav", "dwr\\bulletcracks\\distant\\f2.wav", "dwr\\bulletcracks\\distant\\f3.wav", "dwr\\bulletcracks\\distant\\f4.wav", "dwr\\bulletcracks\\distant\\f5.wav", "dwr\\357\\indoors\\close\\1.wav", "dwr\\357\\indoors\\close\\2.wav", "dwr\\357\\indoors\\close\\3.wav", "dwr\\357\\indoors\\close\\4.wav", "dwr\\357\\indoors\\close\\5.wav", "dwr\\357\\indoors\\close\\6.wav", "dwr\\357\\indoors\\distant\\1.wav", "dwr\\357\\indoors\\distant\\2.wav", "dwr\\357\\indoors\\distant\\3.wav", "dwr\\357\\indoors\\distant\\4.wav", "dwr\\357\\indoors\\distant\\5.wav", "dwr\\357\\indoors\\distant\\6.wav", "dwr\\357\\outdoors\\close\\1.wav", "dwr\\357\\outdoors\\close\\10.wav", "dwr\\357\\outdoors\\close\\2.wav", "dwr\\357\\outdoors\\close\\3.wav", "dwr\\357\\outdoors\\close\\4.wav", "dwr\\357\\outdoors\\close\\5.wav", "dwr\\357\\outdoors\\close\\6.wav", "dwr\\357\\outdoors\\close\\7.wav", "dwr\\357\\outdoors\\close\\8.wav", "dwr\\357\\outdoors\\close\\9.wav", "dwr\\357\\outdoors\\distant\\1.wav", "dwr\\357\\outdoors\\distant\\10.wav", "dwr\\357\\outdoors\\distant\\2.wav", "dwr\\357\\outdoors\\distant\\3.wav", "dwr\\357\\outdoors\\distant\\4.wav", "dwr\\357\\outdoors\\distant\\5.wav", "dwr\\357\\outdoors\\distant\\6.wav", "dwr\\357\\outdoors\\distant\\7.wav", "dwr\\357\\outdoors\\distant\\8.wav", "dwr\\357\\outdoors\\distant\\9.wav", "dwr\\ar2\\indoors\\close\\1.wav", "dwr\\ar2\\indoors\\close\\2.wav", "dwr\\ar2\\indoors\\close\\3.wav", "dwr\\ar2\\indoors\\close\\4.wav", "dwr\\ar2\\indoors\\close\\5.wav", "dwr\\ar2\\indoors\\close\\6.wav", "dwr\\ar2\\indoors\\distant\\1.wav", "dwr\\ar2\\indoors\\distant\\2.wav", "dwr\\ar2\\indoors\\distant\\3.wav", "dwr\\ar2\\indoors\\distant\\4.wav", "dwr\\ar2\\indoors\\distant\\5.wav", "dwr\\ar2\\indoors\\distant\\6.wav", "dwr\\ar2\\outdoors\\close\\1.wav", "dwr\\ar2\\outdoors\\close\\10.wav", "dwr\\ar2\\outdoors\\close\\2.wav", "dwr\\ar2\\outdoors\\close\\3.wav", "dwr\\ar2\\outdoors\\close\\4.wav", "dwr\\ar2\\outdoors\\close\\5.wav", "dwr\\ar2\\outdoors\\close\\6.wav", "dwr\\ar2\\outdoors\\close\\7.wav", "dwr\\ar2\\outdoors\\close\\8.wav", "dwr\\ar2\\outdoors\\close\\9.wav", "dwr\\ar2\\outdoors\\distant\\1.wav", "dwr\\ar2\\outdoors\\distant\\10.wav", "dwr\\ar2\\outdoors\\distant\\2.wav", "dwr\\ar2\\outdoors\\distant\\3.wav", "dwr\\ar2\\outdoors\\distant\\4.wav", "dwr\\ar2\\outdoors\\distant\\5.wav", "dwr\\ar2\\outdoors\\distant\\6.wav", "dwr\\ar2\\outdoors\\distant\\7.wav", "dwr\\ar2\\outdoors\\distant\\8.wav", "dwr\\ar2\\outdoors\\distant\\9.wav", "dwr\\buckshot\\indoors\\close\\1.wav", "dwr\\buckshot\\indoors\\close\\2.wav", "dwr\\buckshot\\indoors\\close\\3.wav", "dwr\\buckshot\\indoors\\close\\4.wav", "dwr\\buckshot\\indoors\\close\\5.wav", "dwr\\buckshot\\indoors\\close\\6.wav", "dwr\\buckshot\\indoors\\close\\7.wav", "dwr\\buckshot\\indoors\\close\\8.wav", "dwr\\buckshot\\indoors\\distant\\1.wav", "dwr\\buckshot\\indoors\\distant\\2.wav", "dwr\\buckshot\\indoors\\distant\\3.wav", "dwr\\buckshot\\indoors\\distant\\4.wav", "dwr\\buckshot\\indoors\\distant\\5.wav", "dwr\\buckshot\\indoors\\distant\\6.wav", "dwr\\buckshot\\indoors\\distant\\7.wav", "dwr\\buckshot\\indoors\\distant\\8.wav", "dwr\\buckshot\\outdoors\\close\\1.wav", "dwr\\buckshot\\outdoors\\close\\2.wav", "dwr\\buckshot\\outdoors\\close\\3.wav", "dwr\\buckshot\\outdoors\\close\\4.wav", "dwr\\buckshot\\outdoors\\close\\5.wav", "dwr\\buckshot\\outdoors\\close\\6.wav", "dwr\\buckshot\\outdoors\\close\\7.wav", "dwr\\buckshot\\outdoors\\close\\8.wav", "dwr\\buckshot\\outdoors\\distant\\1.wav", "dwr\\buckshot\\outdoors\\distant\\2.wav", "dwr\\buckshot\\outdoors\\distant\\3.wav", "dwr\\buckshot\\outdoors\\distant\\4.wav", "dwr\\buckshot\\outdoors\\distant\\5.wav", "dwr\\buckshot\\outdoors\\distant\\6.wav", "dwr\\buckshot\\outdoors\\distant\\7.wav", "dwr\\buckshot\\outdoors\\distant\\8.wav", "dwr\\explosions\\indoors\\close\\1.wav", "dwr\\explosions\\indoors\\close\\2.wav", "dwr\\explosions\\indoors\\close\\3.wav", "dwr\\explosions\\indoors\\close\\4.wav", "dwr\\explosions\\indoors\\close\\5.wav", "dwr\\explosions\\indoors\\close\\6.wav", "dwr\\explosions\\indoors\\close\\7.wav", "dwr\\explosions\\indoors\\close\\8.wav", "dwr\\explosions\\indoors\\distant\\1.wav", "dwr\\explosions\\indoors\\distant\\2.wav", "dwr\\explosions\\indoors\\distant\\3.wav", "dwr\\explosions\\indoors\\distant\\4.wav", "dwr\\explosions\\indoors\\distant\\5.wav", "dwr\\explosions\\indoors\\distant\\6.wav", "dwr\\explosions\\indoors\\distant\\7.wav", "dwr\\explosions\\indoors\\distant\\8.wav", "dwr\\explosions\\outdoors\\close\\1.wav", "dwr\\explosions\\outdoors\\close\\2.wav", "dwr\\explosions\\outdoors\\close\\3.wav", "dwr\\explosions\\outdoors\\close\\4.wav", "dwr\\explosions\\outdoors\\close\\5.wav", "dwr\\explosions\\outdoors\\close\\6.wav", "dwr\\explosions\\outdoors\\distant\\1.wav", "dwr\\explosions\\outdoors\\distant\\2.wav", "dwr\\explosions\\outdoors\\distant\\3.wav", "dwr\\explosions\\outdoors\\distant\\4.wav", "dwr\\explosions\\outdoors\\distant\\5.wav", "dwr\\explosions\\outdoors\\distant\\6.wav", "dwr\\explosions\\outdoors\\distant\\7.wav", "dwr\\explosions\\outdoors\\distant\\8.wav", "dwr\\other\\indoors\\close\\1.wav", "dwr\\other\\indoors\\close\\2.wav", "dwr\\other\\indoors\\close\\3.wav", "dwr\\other\\indoors\\close\\4.wav", "dwr\\other\\indoors\\close\\5.wav", "dwr\\other\\indoors\\close\\6.wav", "dwr\\other\\indoors\\distant\\1.wav", "dwr\\other\\indoors\\distant\\2.wav", "dwr\\other\\indoors\\distant\\3.wav", "dwr\\other\\indoors\\distant\\4.wav", "dwr\\other\\indoors\\distant\\5.wav", "dwr\\other\\indoors\\distant\\6.wav", "dwr\\other\\outdoors\\close\\1.wav", "dwr\\other\\outdoors\\close\\2.wav", "dwr\\other\\outdoors\\close\\3.wav", "dwr\\other\\outdoors\\close\\4.wav", "dwr\\other\\outdoors\\close\\5.wav", "dwr\\other\\outdoors\\close\\6.wav", "dwr\\other\\outdoors\\distant\\1.wav", "dwr\\other\\outdoors\\distant\\2.wav", "dwr\\pistol\\indoors\\close\\1.wav", "dwr\\pistol\\indoors\\close\\2.wav", "dwr\\pistol\\indoors\\close\\3.wav", "dwr\\pistol\\indoors\\close\\4.wav", "dwr\\pistol\\indoors\\close\\5.wav", "dwr\\pistol\\indoors\\close\\6.wav", "dwr\\pistol\\indoors\\distant\\1.wav", "dwr\\pistol\\indoors\\distant\\2.wav", "dwr\\pistol\\indoors\\distant\\3.wav", "dwr\\pistol\\indoors\\distant\\4.wav", "dwr\\pistol\\indoors\\distant\\5.wav", "dwr\\pistol\\indoors\\distant\\6.wav", "dwr\\pistol\\outdoors\\close\\1.wav", "dwr\\pistol\\outdoors\\close\\2.wav", "dwr\\pistol\\outdoors\\close\\3.wav", "dwr\\pistol\\outdoors\\distant\\1.wav", "dwr\\pistol\\outdoors\\distant\\2.wav", "dwr\\smg1\\indoors\\close\\1.wav", "dwr\\smg1\\indoors\\close\\2.wav", "dwr\\smg1\\indoors\\close\\3.wav", "dwr\\smg1\\indoors\\close\\4.wav", "dwr\\smg1\\indoors\\close\\5.wav", "dwr\\smg1\\indoors\\close\\6.wav", "dwr\\smg1\\indoors\\distant\\1.wav", "dwr\\smg1\\indoors\\distant\\2.wav", "dwr\\smg1\\indoors\\distant\\3.wav", "dwr\\smg1\\indoors\\distant\\4.wav", "dwr\\smg1\\indoors\\distant\\5.wav", "dwr\\smg1\\indoors\\distant\\6.wav", "dwr\\smg1\\outdoors\\close\\1.wav", "dwr\\smg1\\outdoors\\close\\2.wav", "dwr\\smg1\\outdoors\\close\\3.wav", "dwr\\smg1\\outdoors\\close\\4.wav", "dwr\\smg1\\outdoors\\close\\5.wav", "dwr\\smg1\\outdoors\\close\\6.wav", "dwr\\smg1\\outdoors\\distant\\1.wav", "dwr\\smg1\\outdoors\\distant\\2.wav"];

foreach (path in files) {
    printf("%s\n", path);
    PrecacheSound(path);
}

local EntryCache = {};
local OcclusionCache = [];
local PositionStateTime = {};
local PositionStateCache = {};

function GetEntryStartingWith(pattern) {
	if (pattern in EntryCache) {
		return EntryCache[pattern];
	}

	local Temp = []

	foreach (path in files) {
		path = path.tolower();
		pattern = pattern.tolower();
		if (startswith(path, pattern)) {
			Temp.push(path);
			//printf("%s %s\n", path, pattern);
		}
	}

	return Temp[RandomInt(0, Temp.len() - 1)];
}

function TraceableToSky(origin, offset, ignored)
{
	local max_offset = {
		start = origin,
		end = origin + offset,
		ignore = ignored,
		mask = MASK_SHOT
	};

	TraceLineEx(max_offset);

	//DebugDrawLine(max_offset.start, max_offset.endpos, 255, 255, 0, false, 2);

	local data = {
		start = max_offset.endpos,
		end = max_offset.endpos + Vector(0, 0, 32768),
		ignore = ignored,
		mask = MASK_SHOT
	};

	TraceLineEx(data);

	//DebugDrawLine(data.start, data.endpos, 255, 255, 255, false, 2);

	if ("startsolid" in data && data.startsolid) {
		return false;
	}

	return (!data.hit || data.surface_name == "TOOLS/TOOLSSKYBOX");
}

function GetOutdoorsState(pos, ignore)
{
    local tr_1 = TraceableToSky(pos, Vector(0,0,0), ignore);
	if (tr_1) {
		return true;
	}

    local tr_2 = TraceableToSky(pos, Vector(120,0,0), ignore);
	if (tr_2) {
		return true;
	}

    local tr_3 = TraceableToSky(pos, Vector(0,120,0), ignore);
	if (tr_3) {
		return true;
	}

    local tr_4 = TraceableToSky(pos, Vector(-120,0,0), ignore);
	if (tr_4) {
		return true;
	}

    local tr_5 = TraceableToSky(pos, Vector(0,-120,0), ignore);
	if (tr_5) {
		return true;
	}

	return false;
}

function GetPositionState(ent)
{
	if (GetOutdoorsState(ent.Weapon_ShootPosition(), ent)) {
		return "outdoors";
	} else {
		return "indoors";
	}
}

function DirectlyVisible(pos1, pos2)
{
	local Visible = {
		start = pos1,
		end = pos2,
		mask = MASK_SHOT
	};

	TraceLineEx(Visible);

	return Visible.fraction > 0.97;
}

function ReflectVector(pVector, normal) {
	local dn = 2 * pVector.Dot(normal);
	return pVector - normal * dn;
}

function TraceableToPos(earpos, pos, offset)
{
	local BounceLimit = 0;
	local LastTraceNormal = null;
	local LastTraceEndPos = null;
	local maxdistance = 99999;
	local TotalDistance = 0;

	earpos = earpos + Vector(0,0,10);
	pos = pos + Vector(0,0,10);

	local TraceToOffset = {
		start = earpos,
		end = earpos + offset,
		mask = MASK_SHOT
	};
	TraceLineEx(TraceToOffset);

	//DebugDrawLine(TraceToOffset.start, TraceToOffset.endpos, 255, 255, 255, false, 2);

	LastTraceNormal = TraceToOffset.plane_normal;
	LastTraceEndPos = TraceToOffset.endpos;

	for (local t = 0; t < BounceLimit; t++) {
		local BounceTrace = {
	        start = LastTraceEndPos,
	        end = LastTraceEndPos + ReflectVector(LastTraceEndPos, LastTraceNormal) * 40000,
	        mask = MASK_SHOT
		};

		TraceLineEx(BounceTrace);

	    if (("allsolid" in BounceTrace && BounceTrace.allsolid) || ("startsolid" in BounceTrace && BounceTrace.startsolid))
		{
			break;
		}

		//DebugDrawLine(BounceTrace.start, BounceTrace.endpos, 0, 255, 255, false, 2);

		LastTraceNormal = BounceTrace.plane_normal;
		LastTraceEndPos = BounceTrace.endpos;
	}

	local TraceLastTraceToPos = {
        start = LastTraceEndPos,
        end = pos,
        mask = MASK_SHOT
    };

    TraceLineEx(TraceLastTraceToPos);

	//DebugDrawLine(TraceLastTraceToPos.start, TraceLastTraceToPos.endpos, 0, 0, 255, false, 2);

    return (TraceLastTraceToPos.endpos - pos).Length2D() < 7;
}

function boolToInt(value)
{
	if (value) {
		return 1;
	}

	return 0;
}


function inverted_boolToInt(value)
{
	if (value) {
		return 0;
	}

	return 1;
}

function GetOcclusionPercent(earpos, pos) {
	local traceAmount = 4;
	local degrees = 360 / traceAmount;
	local successfulTraces = 0;
	local failedTraces = 0;

	for (local j = 0; j < 4; j++) {
		local singletrace = Vector(40000, 0, 0);
		local angle = QAngle();

		if (j==1) {
			angle = QAngle(degrees, 0, 0);
		}

		if (j==2) {
			angle = QAngle(degrees, degrees, 0);
		}

		if (j==3) {
			angle = QAngle(-degrees, degrees, 0);
		}

		if (j==4) {
			angle = QAngle(0, degrees, 0);
		}

		for (local k = 0; k < traceAmount; k++) {
			singletrace = RotatePosition(Vector(0, 0, 0), angle, singletrace);
			local traceToPos = TraceableToPos(earpos, pos, singletrace);
			if (traceToPos) {
				successfulTraces = successfulTraces + 1;
			} else {
				failedTraces = failedTraces + 1;
			}
		}
	}


	local percentageOfFailedTraces = (failedTraces * 1.0) / (traceAmount * 4.0);

	//printf("%0.2f %0.2f %0.2f\n", failedTraces, traceAmount * 4.0, percentageOfFailedTraces);

	return percentageOfFailedTraces;
}

function Clamp(number, min, max)
{
	if (number < min) {
		number = min;
	}

	if (number > max) {
		number = max;
	}

	return number;
}

function GetOcclusionCached(ent1, ent2)
{
	local o = 0.0;

	foreach (i, entry in OcclusionCache) {
		if (Time() - entry.time > 0.2 && entry.ent1 == ent1.entindex() && entry.ent2 == ent2.entindex()) {
			local entry_o = entry.occlusion;
			OcclusionCache.remove(i);
			return entry_o;
		}
	}

	o = GetOcclusionPercent(ent1.Weapon_ShootPosition(), ent2.Weapon_ShootPosition());

	OcclusionCache.push({
		time = Time(),
		ent1 = ent1.entindex(),
		ent2 = ent2.entindex(),
		occlusion = o
	})

	return o;
}

// p1 - starting point of the line
// p0 - our point against which we'll try to find the line
// a - normalized vector of our lines direction
function FindScalar(p1, p0, a)
{
    local t = (-a.x * (p1.x - p0.x) - a.y * (p1.y - p0.y) - a.z * (p1.z - p0.z)) / (a.x * a.x + a.y * a.y + a.z * a.z);
	return t;
}

function FindNearestLinePoint(start, end, point)
{
	local normalized = start - end;
	normalized.Norm();
	local t = FindScalar(start, point, normalized);
	return start + normalized * t;
}
// https://wiki.alliedmods.net/Team_fortress_2_item_definition_indexes#Primary_.5BSlot_0.5D
local WeaponData = {
	tf_weapon_scattergun = {
		volume = 1,
		ammotype = "Buckshot"
	},
	tf_weapon_pep_brawler_blaster = {
		volume = 1,
		ammotype = "Buckshot"
	},
	tf_weapon_handgun_scout_primary = {
		volume = 1,
		ammotype = "SMG1"
	},
	tf_weapon_soda_popper = {
		volume = 1,
		ammotype = "SMG1"
	},
	tf_weapon_pistol = {
		volume = 1,
		ammotype = "Pistol"
	},
	tf_weapon_pistol_scout = {
		volume = 1,
		ammotype = "Pistol"
	},
	tf_weapon_handgun_scout_secondary = {
		volume = 1,
		ammotype = "Pistol"
	},
	tf_weapon_shotgun_soldier = {
		volume = 1,
		ammotype = "Buckshot"
	},
	tf_weapon_shotgun = {
		volume = 1,
		ammotype = "Buckshot"
	},
	tf_weapon_shotgun_pyro = {
		volume = 1,
		ammotype = "Buckshot"
	},
	tf_weapon_minigun = {
		volume = 1,
		ammotype = "AR2"
	},
	tf_weapon_shotgun_hwg = {
		volume = 1,
		ammotype = "Buckshot"
	},
	tf_weapon_shotgun_primary = {
		volume = 1,
		ammotype = "Buckshot"
	},
	tf_weapon_sentry_revenge = {
		volume = 1,
		ammotype = "Buckshot"
	},
	tf_weapon_shotgun_building_rescue = {
		volume = 0.5,
		ammotype = "Pistol"
	},
	tf_weapon_syringegun_medic = {
		volume = 0.2,
		ammotype = "Pistol"
	},
	tf_weapon_crossbow = {
		volume = 0.15,
		ammotype = "357"
	},
	tf_weapon_sniperrifle = {
		volume = 1,
		ammotype = "AR2"
	},
	tf_weapon_sniperrifle_decap = {
		volume = 1,
		ammotype = "SMG1"
	},
	tf_weapon_sniperrifle_classic = {
		volume = 1,
		ammotype = "Pistol"
	},
	tf_weapon_smg = {
		volume = 1,
		ammotype = "SMG1"
	},
	tf_weapon_charged_smg = {
		volume = 0.3,
		ammotype = "SMG1"
	},
	tf_weapon_revolver = {
		volume = 1,
		ammotype = "357"
	},
}

function CheckWeaponFire()
{
	local fire_time = NetProps.GetPropFloat(self, "m_flLastFireTime");
	if (fire_time > last_fire_time)
	{
		if (self.GetName() in WeaponData) {
			local owner = self.GetOwner();

			if (owner) {
				local OwnerShootPos = owner.Weapon_ShootPosition();
				local OwnerShootPosDir = owner.EyeAngles().Forward();

				local ImaginaryBullet = {
					start = OwnerShootPos,
					end = OwnerShootPos + OwnerShootPosDir * 32000,
					mask = MASK_SHOT
				}
				TraceLineEx(ImaginaryBullet);
				//DebugDrawLine(ImaginaryBullet.start, ImaginaryBullet.endpos, 255, 0, 0, false, 5);

				::MaxPlayers <- MaxClients().tointeger();
				for (local p = 1; p <= MaxPlayers ; p++)
				{
					local player = PlayerInstanceFromIndex(p);
					if (player == null) continue;

					local PlayerShootPos = player.Weapon_ShootPosition();

					local AmmoType = WeaponData[self.GetName()].ammotype;

					if (!(owner.entindex() in PositionStateTime)) {
						PositionStateTime[owner.entindex()] <- 0.0;
					}
					if (!(player.entindex() in PositionStateTime)) {
						PositionStateTime[player.entindex()] <- 0.0;
					}
					if (Time() - PositionStateTime[owner.entindex()] > 0.2) {
						PositionStateCache[owner.entindex()] <- GetPositionState(owner);
						PositionStateTime[owner.entindex()] <- Time();
					}
					if (Time() - PositionStateTime[player.entindex()] > 0.2) {
						PositionStateCache[player.entindex()] <- GetPositionState(player);
						PositionStateTime[player.entindex()] <- Time();
					}
					local PositionState = PositionStateCache[owner.entindex()];
					local LocalPositionState = PositionStateCache[player.entindex()];

					local distance = (PlayerShootPos - OwnerShootPos).Length();

					local DistanceState = "";
					if (distance > 7874) {
						DistanceState = "far";
					} else {
						DistanceState = "close";
					}

					local volume = WeaponData[self.GetName()].volume * 0.8;

					if (DistanceState == "close") {
						local mult = Clamp(5000 / distance, 0, 1);
						volume = volume * mult;
					}

					if (DistanceState == "distant") {
						local mult = Clamp(10000 / distance, 0, 1);
						if (PositionState == "outdoors") {
							volume = volume * mult * 2;
						} else {
							volume = volume * mult * 0.5;
						}
					}

					local dsp = 0;

					local Occlusion = 0.0;
					if (!DirectlyVisible(PlayerShootPos, OwnerShootPos)) {
						Occlusion = GetOcclusionCached(player, owner);
						if (PositionState != "outdoors" || LocalPositionState != "outdoors") {
							if (Occlusion > 0.99) {
								dsp = 30;
							}
						}
						volume = volume * (1 - Clamp(Occlusion - 0.5, 0, 0.5));
					}

					if (volume > 0) {
						if (owner.entindex() != player.entindex()) {
							local NearestPoint = FindNearestLinePoint(ImaginaryBullet.start, ImaginaryBullet.endpos, PlayerShootPos);
							if ((NearestPoint - PlayerShootPos).Length() < 230) {
								if (DirectlyVisible(PlayerShootPos, NearestPoint)) {
									EmitSoundEx({
										sound_name = GetEntryStartingWith("dwr\\bulletcracks\\" + DistanceState),
										channel = 0, // CHAN_AUTO
										volume = 1,
										sound_level = 75,
										flags = 0,
										pitch = 100,
										special_dsp = 0,
										origin = NearestPoint,
										delay = 0.0,
										sound_time = 0.0,
										entity = player,
										speaker_entity = null,
										filter_type = RECIPIENT_FILTER_SINGLE_PLAYER,
										filter_param = -1
									});
								}
							}
						}

						EmitSoundEx({
							sound_name = GetEntryStartingWith("dwr\\" + AmmoType + "\\" + PositionState  + "\\" + DistanceState),
							channel = 0, // CHAN_AUTO
							volume = volume,
							sound_level = 75,
							flags = 0,
							pitch = RandomFloat(94.0, 107.0),
							special_dsp = dsp,
							origin = owner.Weapon_ShootPosition(),
							delay = 0.0,
							sound_time = 0.0,
							entity = player,
							speaker_entity = owner,
							filter_type = RECIPIENT_FILTER_SINGLE_PLAYER,
							filter_param = -1
						});
					}
				}
			}
		}

		last_fire_time = fire_time;
	}
	return -1;
}


function InitPlayer(player)
{
	for (local i = 0; i < 8; i++)
	{
		local weapon = NetProps.GetPropEntityArray(player, "m_hMyWeapons", i);
		if (weapon == null || weapon.IsMeleeWeapon())
			continue;

		weapon.ValidateScriptScope();
		weapon.GetScriptScope().last_fire_time <- Time() + 1;
		weapon.GetScriptScope().CheckWeaponFire <- CheckWeaponFire;
		AddThinkToEnt(weapon, "CheckWeaponFire");
	}
}

::MaxPlayers <- MaxClients().tointeger();

for (local p = 1; p <= MaxPlayers ; p++)
{
	local player = PlayerInstanceFromIndex(p);
	if (player == null) continue;

	InitPlayer(player);
}

ClearGameEventCallbacks();

function OnGameEvent_player_spawn(params)
{
	local player = GetPlayerFromUserID(params.userid);
	if (!player)
		return;

	InitPlayer(player);
}

__CollectGameEventCallbacks(this);