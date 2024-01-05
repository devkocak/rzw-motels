config = {}
config.wardrobe = 'illenium-appearance' -- choose your skin menu
config.target = false -- false = markers zones type. true = ox_target, qb-target
config.doorPlayingVideo = false -- Membuka Pintu Terdapat Animasi Video Membuka Pintu
config.business = false -- allowed players to purchase the motel
config.autokickIfExpire = false -- auto kick occupants if rent is due. if false owner of motel must kick the occupants
config.breakinJobs = { -- jobs can break in to door using gunfire in doors
	['police'] = true,
	['swat'] = true,
}
config.wardrobes = { -- skin menus
	['renzu_clothes'] = function()
		exports.renzu_clothes:OpenClotheInventory()
	end,
	['fivem-appearance'] = function()
		-- return exports['fivem-appearance']:startPlayerCustomization() -- you could replace this with outfits events
		return TriggerEvent('fivem-appearance:browseOutfitsRusun') -- you could replace this with outfits events
	end,
	['illenium-appearance'] = function()
		return TriggerEvent('illenium-appearance:client:openOutfitMenu')
	end,
	['qb-clothing'] = function()
		return TriggerEvent('qb-clothing:client:openOutfitMenu')
	end,
	['esx_skin'] = function()
		TriggerEvent('esx_skin:openSaveableMenu')
	end,
}

-- Shells Offsets and model name
config.shells = {
	['standard'] = {
		shell = `standardmotel_shell`, -- kambi shell
		offsets = {
			exit = vec3(-0.43,-2.51,1.16),
			stash = vec3(1.368164, -3.134506, 1.16),
			wardrobe = vec3(1.643646, 2.551102, 1.16),
		}
	},
	['modern'] = {
		shell = `modernhotel_shell`, -- kambi shell
		offsets = {
			exit = vec3(5.410095, 4.299301, 0.9),
			stash = vec3(-4.068207, 4.046188, 0.9),
			wardrobe = vec3(2.811829, -3.619385, 0.9),
		}
	},
}

config.messageApi = function(data) -- {title,message,motel}
	local motel = GlobalState.Motels[data.motel]
	local identifier = motel.owned -- owner identifier
	-- add your custom message here. ex. SMS phone 

	-- basic notification (remove this if using your own message system)
	local success = lib.callback.await('wl-motels:MessageOwner',false,{identifier = identifier, message = data.message, title = data.title, motel = data.motel})
	if success then
		Notify('Pesan Berhasil Dikirim', 'success')
	else
		Notify('Pesan Gagal Dikirim  \n  Pemilik Belum Tersedia', 'error')
	end
end

-- @shell string (shell type)
-- @Mlo string ( toggle MLO or shell type)
-- @hour_rate int ( per hour rates)
-- @motel string (Motel Index Name)
-- @rentcoord vec3 (coordinates of Rental Menu)
-- @radius float ( total size radius of motel )
-- @maxoccupants int (total player can rent in each Rooms)
-- @uniquestash bool ( Toggle Non Sharable / Stealable Stash Storage )
-- @doors table ( lists of doors feature coordinates. ex. stash, wardrobe) wardrobe,stash coords are only applicable in Mlo. using shells has offsets for stash and wardrobes.
-- @manual boolean ( accept walk in occupants only )
-- @businessprice int ( value of motel)
-- @door int (door hash or doormodel `model`) for MLO type

config.motels = {
	[1] = { -- index name of motel
		manual = false, -- set the motel to auto accept occupants or false only the owner of motel can accept Occupants
		Mlo = false, -- if MLO you need to configure each doors coordinates,stash etc. if false resource will use shells
		job = false, -- isi dengan array contoh : {'police', 'ambulance'} | jika tidak ada job tertentu isikan false
		shell = 'standard', -- shell type, configure only if using Mlo = true
		label = 'Rusun Kota',
		rental_period = 'day',-- hour, day, month
		rate = 30000, -- cost per period
		businessprice = 1000000,
		motel = 'rusun_kota',
		payment = 'money', -- money, bank
		door = `gabz_pinkcage_doors_front`, -- door hash for MLO type
		rentcoord = vec3(313.38,-225.20,54.212),
		coord = vec3(326.04,-210.47,54.086), -- center of the motel location
		radius = 50.0, -- radius of motel location
		maxoccupants = 1, -- maximum renters per room
		uniquestash = true, -- if true. each players has unique stash ID (non sharable and non stealable). if false stash is shared to all Occupants if maxoccupans is > 1
		doors = { -- doors and other function of each rooms
			[1] = { -- COORDINATES FOR GABZ PINKCAGE
				door = vec3(312.9697, -218.8400, 54.2218), -- Door requires when using MLO/Shells
				stash = vec3(307.01657104492,-207.91079711914,53.758548736572), --  requires when using MLO
				wardrobe = vec3(302.58380126953,-207.71691894531,54.598297119141), --  requires when using MLO
				fridge = vec3(305.00064086914,-206.12855529785,54.544868469238), --  requires when using MLO
				-- luckyme = vec3(0.0,0.0,0.0) -- extra
			},
			[2] = {
				door = vec3(310.8022, -218.0511, 54.2218),
				stash = vec3(310.91235351563,-198.10073852539,53.758598327637),
				wardrobe = vec3(306.25433349609,-197.75250244141,54.564342498779),
				fridge = vec3(308.79779052734,-196.23670959473,54.440326690674),
			},
			[3] = {
				door = vec3(307.2871, -216.6985, 54.2218),
				stash = vec3(321.10150146484,-194.42211914063,53.758399963379),
				wardrobe = vec3(321.42459106445,-189.79216003418,54.65941619873),
				fridge = vec3(322.92010498047,-192.31481933594,54.600353240967),
			},
			[4] = {
				door = vec3(307.5890, -213.2129, 54.2218),
				stash = vec3(309.6142578125,-220.16128540039,57.557399749756),
				wardrobe = vec3(309.21203613281,-224.6675567627,58.375194549561),
				fridge = vec3(307.6989440918,-222.11755371094,58.293560028076),
			},
			[5] = {
				door = vec3(309.4934, -207.9768, 54.2218),
				stash = vec3(306.89093017578,-207.88090515137,57.556159973145),
				wardrobe = vec3(302.57464599609,-207.71339416504,58.440250396729),
				fridge = vec3(305.044921875,-205.99066162109,58.394989013672),
			},
			[6] = {
				door = vec3(311.2289, -203.3996, 54.2218),
				stash = vec3(310.88967895508,-198.16856384277,57.556510925293),
				wardrobe = vec3(306.09225463867,-198.40795898438,58.27188873291),
				fridge = vec3(308.73110961914,-196.40968322754,58.407859802246),
			},
			[7] = {
				door = vec3(313.2970, -198.0382, 54.2218),
				stash = vec3(321.24801635742,-194.29737854004,57.556739807129),
				wardrobe = vec3(321.46688842773,-189.68632507324,58.422557830811),
				fridge = vec3(322.98544311523,-192.33996582031,58.386581420898),
			},
			[8] = {
				door = vec3(315.7133, -194.8880, 54.2264),
				stash = vec3(339.67279052734,-224.8221282959,53.759098052979),
				wardrobe = vec3(344.28637695313,-224.95460510254,54.527130126953),
				fridge = vec3(341.86477661133,-226.15287780762,54.642837524414),
			},
			[9] = {
				door = vec3(319.3286, -196.1820, 54.2265),
				stash = vec3(343.47601318359,-214.96635437012,53.758640289307),
				wardrobe = vec3(347.99655151367,-215.08934020996,54.489669799805),
				fridge = vec3(345.53387451172,-216.53938293457,54.698444366455),
			},
			[10] = {
				door = vec3(321.3982, -196.9940, 54.2264),
				stash = vec3(347.33102416992,-205.13743591309,53.759078979492),
				wardrobe = vec3(351.68756103516,-205.30010986328,54.674419403076),
				fridge = vec3(349.34033203125,-206.6258392334,54.639694213867),
			},
			[11] = {
				door = vec3(312.8741, -218.8873, 58.0192),
				stash = vec3(329.67590332031,-227.8233795166,57.556579589844),
				wardrobe = vec3(329.43222045898,-232.33073425293,58.42276763916),
				fridge = vec3(327.64138793945,-229.79788208008,58.355628967285),
			},
			[12] = {
				door = vec3(310.6287, -218.0372, 58.0192),
				stash = vec3(339.79351806641,-224.86245727539,57.55553817749),
				wardrobe = vec3(344.26574707031,-225.00813293457,58.302909851074),
				fridge = vec3(341.6985168457,-226.52975463867,58.367748260498),
			},
			[13] = {
				door = vec3(307.2661, -216.6487, 58.0192),
				stash = vec3(343.47412109375,-214.96145629883,57.55553817749),
				wardrobe = vec3(348.07550048828,-215.08416748047,58.288040161133),
				fridge = vec3(345.40502929688,-216.88189697266,58.281555175781),
			},
			[14] = {
				door = vec3(307.5093, -213.2684, 58.0192),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[15] = {
				door = vec3(309.5873, -207.9630, 58.0192),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[16] = {
				door = vec3(311.2470, -203.4226, 58.0192),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[17] = {
				door = vec3(313.2841, -198.1299, 58.0192),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[18] = {
				door = vec3(315.6981, -194.8177, 58.0192),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[19] = {
				door = vec3(319.3871, -196.2377, 58.0192),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[20] = {
				door = vec3(321.2913, -196.9549, 58.0192),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[21] = {
				door = vec3(329.3796, -225.1680, 54.2218),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[22] = {
				door = vec3(331.5052, -226.0654, 54.2218),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[23] = {
				door = vec3(334.9350, -227.3483, 54.2218),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[24] = {
				door = vec3(337.1175, -224.7262, 54.2218),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[25] = {
				door = vec3(339.1755, -219.5078, 54.2218),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[26] = {
				door = vec3(340.9780, -214.8573, 54.2218),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[27] = {
				door = vec3(342.9192, -209.5942, 54.2218),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[28] = {
				door = vec3(344.7447, -205.0832, 54.2218),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[29] = {
				door = vec3(346.7186, -199.9693, 54.2218),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[30] = {
				door = vec3(329.3664, -225.0915, 58.0193),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[31] = {
				door = vec3(331.4364, -225.8913, 58.0193),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[32] = {
				door = vec3(334.9432, -227.2407, 58.0193),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[33] = {
				door = vec3(337.1762, -224.7160, 58.0192),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[34] = {
				door = vec3(339.1416, -219.4442, 58.0192),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[35] = {
				door = vec3(340.9264, -214.7851, 58.0192),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[36] = {
				door = vec3(342.9297, -209.6180, 58.0192),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[37] = {
				door = vec3(344.7607, -204.9854, 58.0192),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[38] = {
				door = vec3(346.8224, -199.6326, 58.0192),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			
		},
	},

	[2] = { -- index name of motel
		manual = false, -- set the motel to auto accept occupants or false only the owner of motel can accept Occupants
		Mlo = false, -- if MLO you need to configure each doors coordinates,stash etc. if false resource will use shells
		job = false, -- isi dengan array contoh : {'police'} | jika tidak ada job tertentu isikan false
		shell = 'standard', -- shell type, configure only if using Mlo = true
		label = 'Rusun Paleto',
		rental_period = 'day',-- hour, day, month
		rate = 30000, -- cost per period
		businessprice = 1000000,
		motel = 'rusun_paleto',
		payment = 'money', -- money, bank
		door = `gabz_pinkcage_doors_front`, -- door hash for MLO type
		rentcoord = vec3(-96.7745, 6324.0674, 31.5762),
		coord = vec3(-96.7745, 6324.0674, 31.5762), -- center of the motel location
		radius = 50.0, -- radius of motel location
		maxoccupants = 1, -- maximum renters per room
		uniquestash = true, -- if true. each players has unique stash ID (non sharable and non stealable). if false stash is shared to all Occupants if maxoccupans is > 1
		doors = { -- doors and other function of each rooms
			[1] = {
				door = vec3(-111.1530, 6322.7681, 31.5762),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[2] = {
				door = vec3(-114.4061, 6326.0698, 31.5761),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[3] = {
				door = vec3(-120.2073, 6327.1528, 31.5759),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[4] = {
				door = vec3(-111.0913, 6322.7783, 35.5010),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[5] = {
				door = vec3(-114.4260, 6326.0679, 35.5010),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[6] = {
				door = vec3(-120.2127, 6327.2788, 35.5010),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[7] = {
				door = vec3(-103.3851, 6330.6274, 31.5762),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[8] = {
				door = vec3(-106.6144, 6333.9775, 31.5762),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[9] = {
				door = vec3(-107.5833, 6339.7715, 31.5759),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[10] = {
				door = vec3(-102.0085, 6345.3555, 31.0759),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[11] = {
				door = vec3(-98.8126, 6348.5620, 31.5759),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[12] = {
				door = vec3(-93.5073, 6353.9312, 31.5759),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[13] = {
				door = vec3(-90.2478, 6357.2461, 31.5759),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[14] = {
				door = vec3(-84.8505, 6362.5527, 31.5759),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[15] = {
				door = vec3(-103.5028, 6330.8716, 35.5008),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[16] = {
				door = vec3(-106.6147, 6333.9995, 35.5013),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[17] = {
				door = vec3(-107.5911, 6339.7974, 35.5008),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[18] = {
				door = vec3(-102.1412, 6345.2534, 35.5008),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[19] = {
				door = vec3(-98.9747, 6348.4761, 35.5008),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[20] = {
				door = vec3(-93.5128, 6353.8457, 35.5008),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[21] = {
				door = vec3(-90.1506, 6357.2251, 35.5008),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[22] = {
				door = vec3(-84.8761, 6362.5806, 35.5008),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
		},
	},

	[3] = { -- index name of motel
		manual = false, -- set the motel to auto accept occupants or false only the owner of motel can accept Occupants
		Mlo = false, -- if MLO you need to configure each doors coordinates,stash etc. if false resource will use shells
		job = false, -- isi dengan array contoh : {'police'} | jika tidak ada job tertentu isikan false
		shell = 'standard', -- shell type, configure only if using Mlo = true
		label = 'Rusun Shandy Short',
		rental_period = 'day',-- hour, day, month
		rate = 30000, -- cost per period
		businessprice = 1000000,
		motel = 'rusun_shandy_short',
		payment = 'money', -- money, bank
		door = `gabz_pinkcage_doors_front`, -- door hash for MLO type
		rentcoord = vec3(317.0422, 2622.8618, 44.4566),
		coord = vec3(356.9001, 2631.1055, 44.4977), -- center of the motel location
		radius = 50.0, -- radius of motel location
		maxoccupants = 1, -- maximum renters per room
		uniquestash = true, -- if true. each players has unique stash ID (non sharable and non stealable). if false stash is shared to all Occupants if maxoccupans is > 1
		doors = { -- doors and other function of each rooms
			[1] = {
				door = vec3(341.6791, 2615.0332, 44.6724),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[2] = {
				door = vec3(347.1224, 2618.1641, 44.6730),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[3] = {
				door = vec3(354.5148, 2619.8555, 44.6724),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[4] = {
				door = vec3(359.8183, 2622.8618, 44.6728),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[5] = {
				door = vec3(367.1436, 2624.5647, 44.6723),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[6] = {
				door = vec3(372.5561, 2627.6929, 44.6732),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[7] = {
				door = vec3(379.8605, 2629.3298, 44.6724),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[8] = {
				door = vec3(385.2327, 2632.4294, 44.6733),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[9] = {
				door = vec3(392.5658, 2634.0676, 44.6724),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[10] = {
				door = vec3(398.0020, 2637.2219, 44.6736),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
		},
	},
	[4] = { -- index name of motel
		manual = false, -- set the motel to auto accept occupants or false only the owner of motel can accept Occupants
		Mlo = false, -- if MLO you need to configure each doors coordinates,stash etc. if false resource will use shells
		job = {'police'}, -- isi dengan array contoh : {'police'} | jika tidak ada job tertentu isikan false
		shell = 'standard', -- shell type, configure only if using Mlo = true
		label = 'Rusun Polisi',
		rental_period = 'day',-- hour, day, month
		rate = 15000, -- cost per period
		businessprice = 1000000,
		motel = 'rusun_polisi',
		payment = 'money', -- money, bank
		door = `gabz_pinkcage_doors_front`, -- door hash for MLO type
		rentcoord = vec3(-80.9721, -1519.2034, 34.2453),
		coord = vec3(-66.6898, -1521.1729, 34.2446), -- center of the motel location
		radius = 50.0, -- radius of motel location
		maxoccupants = 1, -- maximum renters per room
		uniquestash = true, -- if true. each players has unique stash ID (non sharable and non stealable). if false stash is shared to all Occupants if maxoccupans is > 1
		doors = { -- doors and other function of each rooms
			[1] = {
				door = vec3(-77.6956, -1515.1833, 34.2453),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[2] = {
				door = vec3(-71.6964, -1508.0695, 33.4361),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[3] = {
				door = vec3(-65.1255, -1512.8315, 33.4361),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[4] = {
				door = vec3(-60.1128, -1517.0948, 33.4361),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[5] = {
				door = vec3(-53.0978, -1523.6703, 33.4361),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[6] = {
				door = vec3(-59.3347, -1531.0138, 34.2352),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[7] = {
				door = vec3(-62.2649, -1532.6548, 34.2352),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[8] = {
				door = vec3(-69.2907, -1526.7544, 34.2352),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[9] = {
				door = vec3(-77.8119, -1515.2157, 37.4196),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[10] = {
				door = vec3(-71.9805, -1508.2274, 36.6249),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[11] = {
				door = vec3(-65.2134, -1512.7797, 36.6249),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[12] = {
				door = vec3(-60.0180, -1517.0787, 36.6249),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[13] = {
				door = vec3(-53.2092, -1523.6538, 36.6249),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[14] = {
				door = vec3(-59.0352, -1530.7427, 37.4196),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[15] = {
				door = vec3(-62.2406, -1532.6708, 37.4196),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[16] = {
				door = vec3(-69.2967, -1526.7532, 37.4196),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
		},
	},
	[5] = { -- index name of motel
		manual = false, -- set the motel to auto accept occupants or false only the owner of motel can accept Occupants
		Mlo = false, -- if MLO you need to configure each doors coordinates,stash etc. if false resource will use shells
		job = {'ambulance'}, -- isi dengan array contoh : {'police'} | jika tidak ada job tertentu isikan false
		shell = 'standard', -- shell type, configure only if using Mlo = true
		label = 'Rusun EMS',
		rental_period = 'day',-- hour, day, month
		rate = 15000, -- cost per period
		businessprice = 1000000,
		motel = 'rusun_ems',
		payment = 'money', -- money, bank
		door = `gabz_pinkcage_doors_front`, -- door hash for MLO type
		rentcoord = vec3(-73.2817, -1613.6991, 31.4675),
		coord = vec3(-89.4626, -1619.5560, 29.5607), -- center of the motel location
		radius = 50.0, -- radius of motel location
		maxoccupants = 1, -- maximum renters per room
		uniquestash = true, -- if true. each players has unique stash ID (non sharable and non stealable). if false stash is shared to all Occupants if maxoccupans is > 1
		doors = { -- doors and other function of each rooms
			[1] = {
				door = vec3(-83.4838, -1622.8221, 31.4768),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[2] = {
				door = vec3(-89.5051, -1630.0145, 31.5056),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[3] = {
				door = vec3(-97.1337, -1639.2358, 32.1029),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[4] = {
				door = vec3(-105.6787, -1632.6160, 32.9069),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[5] = {
				door = vec3(-109.4894, -1628.3920, 32.9076),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[6] = {
				door = vec3(-97.7212, -1612.2311, 32.3123),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[7] = {
				door = vec3(-93.4907, -1607.1825, 32.3120),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[8] = {
				door = vec3(-87.9564, -1601.3978, 32.3120),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[9] = {
				door = vec3(-80.2223, -1607.9694, 31.4806),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[10] = {
				door = vec3(-83.7088, -1623.2113, 34.6892),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[11] = {
				door = vec3(-89.6248, -1630.1836, 34.6892),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[12] = {
				door = vec3(-97.0644, -1639.0219, 35.4891),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[13] = {
				door = vec3(-98.4148, -1638.5709, 35.4842),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[14] = {
				door = vec3(-105.8060, -1632.4749, 36.2891),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[15] = {
				door = vec3(-109.4039, -1628.2894, 36.2890),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[16] = {
				door = vec3(-97.7434, -1612.1752, 35.4892),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[17] = {
				door = vec3(-93.4382, -1607.0336, 35.4892),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[18] = {
				door = vec3(-87.7657, -1601.5756, 35.4892),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[19] = {
				door = vec3(-80.0972, -1607.9978, 34.6892),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
		},
	},
	[6] = { -- index name of motel
		manual = false, -- set the motel to auto accept occupants or false only the owner of motel can accept Occupants
		Mlo = false, -- if MLO you need to configure each doors coordinates,stash etc. if false resource will use shells
		job = {'mechanic'}, -- isi dengan array contoh : {'police'} | jika tidak ada job tertentu isikan false
		shell = 'standard', -- shell type, configure only if using Mlo = true
		label = 'Rusun Mekanik',
		rental_period = 'day',-- hour, day, month
		rate = 15000, -- cost per period
		businessprice = 1000000,
		motel = 'rusun_mekanik',
		payment = 'money', -- money, bank
		door = `gabz_pinkcage_doors_front`, -- door hash for MLO type
		rentcoord = vec3(-204.1684, -1604.2926, 34.8254),
		coord = vec3(-215.7107, -1599.0049, 35.3918), -- center of the motel location
		radius = 50.0, -- radius of motel location
		maxoccupants = 1, -- maximum renters per room
		uniquestash = true, -- if true. each players has unique stash ID (non sharable and non stealable). if false stash is shared to all Occupants if maxoccupans is > 1
		doors = { -- doors and other function of each rooms
			[1] = {
				door = vec3(-208.7079, -1600.6179, 34.8693),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[2] = {
				door = vec3(-210.0248, -1607.0316, 34.8693),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[3] = {
				door = vec3(-212.0080, -1617.3241, 34.8693),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[4] = {
				door = vec3(-213.4003, -1618.0743, 34.8693),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[5] = {
				door = vec3(-223.0688, -1617.5006, 34.8693),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[6] = {
				door = vec3(-223.1455, -1600.7441, 34.8827),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[7] = {
				door = vec3(-223.0614, -1585.4890, 34.8693),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[8] = {
				door = vec3(-219.1671, -1579.7285, 34.8693),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[9] = {
				door = vec3(-215.7964, -1576.2870, 34.8693),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[10] = {
				door = vec3(-205.6457, -1585.6758, 34.8693),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[11] = {},
			[12] = {
				door = vec3(-205.7466, -1585.7639, 38.0544),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[13] = {
				door = vec3(-215.6035, -1576.3192, 38.0545),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[14] = {
				door = vec3(-219.1862, -1579.8031, 38.0545),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[15] = {
				door = vec3(-223.0611, -1585.7610, 38.0545),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[16] = {
				door = vec3(-223.0689, -1600.9514, 38.0545),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[17] = {
				door = vec3(-223.1124, -1617.1709, 38.0558),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[18] = {
				door = vec3(-213.3319, -1618.1600, 38.0545),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[19] = {
				door = vec3(-212.0804, -1617.3090, 38.0545),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[20] = {
				door = vec3(-210.0404, -1607.1503, 38.049),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[21] = {
				door = vec3(-208.7907, -1600.8873, 38.0493),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
		},
	},
	[7] = { -- index name of motel
		manual = false, -- set the motel to auto accept occupants or false only the owner of motel can accept Occupants
		Mlo = false, -- if MLO you need to configure each doors coordinates,stash etc. if false resource will use shells
		job = {'pedagang'}, -- isi dengan array contoh : {'police'} | jika tidak ada job tertentu isikan false
		shell = 'standard', -- shell type, configure only if using Mlo = true
		label = 'Rusun Pedagang',
		rental_period = 'day',-- hour, day, month
		rate = 15000, -- cost per period
		businessprice = 1000000,
		motel = 'rusun_pedagang',
		payment = 'money', -- money, bank
		door = `gabz_pinkcage_doors_front`, -- door hash for MLO type
		rentcoord = vec3(-163.3942, -1537.9768, 35.0988),
		coord = vec3(-180.6801, -1545.1924, 34.9658), -- center of the motel location
		radius = 50.0, -- radius of motel location
		maxoccupants = 1, -- maximum renters per room
		uniquestash = true, -- if true. each players has unique stash ID (non sharable and non stealable). if false stash is shared to all Occupants if maxoccupans is > 1
		doors = { -- doors and other function of each rooms
			[1] = {
				door = vec3(-173.7693, -1547.3800, 35.1273),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[2] = {
				door = vec3(-179.7919, -1554.4240, 35.1239),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[3] = {
				door = vec3(-187.3330, -1563.4810, 35.7551),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[4] = {
				door = vec3(-192.2667, -1559.7190, 34.9548),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[5] = {
				door = vec3(-196.1545, -1555.5648, 34.9554),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[6] = {
				door = vec3(-184.4978, -1539.5061, 34.3592),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[7] = {
				door = vec3(-180.0098, -1534.2415, 34.3578),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[8] = {
				door = vec3(-174.3786, -1528.6573, 34.3538),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[9] = {
				door = vec3(-167.3644, -1534.6431, 35.0999),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[10] = {
				door = vec3(-173.7926, -1547.2870, 38.3343),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[11] = {
				door = vec3(-179.7261, -1554.4852, 38.3308),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[12] = {
				door = vec3(-187.0458, -1563.0795, 39.1303),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[13] = {
				door = vec3(-188.3973, -1562.9200, 39.1324),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[14] = {
				door = vec3(-192.3571, -1559.6956, 38.3351),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[15] = {
				door = vec3(-196.1434, -1555.5131, 38.3350),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[16] = {
				door = vec3(-184.1708, -1539.1906, 37.5350),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[17] = {
				door = vec3(-180.0701, -1534.2096, 37.5350),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[18] = {
				door = vec3(-167.2703, -1534.5399, 38.3298),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
		},
	},
	[8] = { -- index name of motel
		manual = false, -- set the motel to auto accept occupants or false only the owner of motel can accept Occupants
		Mlo = false, -- if MLO you need to configure each doors coordinates,stash etc. if false resource will use shells
		job = {'pemerintah'}, -- isi dengan array contoh : {'police'} | jika tidak ada job tertentu isikan false
		shell = 'standard', -- shell type, configure only if using Mlo = true
		label = 'Rusun Pemerintah',
		rental_period = 'day',-- hour, day, month
		rate = 15000, -- cost per period
		businessprice = 1000000,
		motel = 'rusun_pemerintah',
		payment = 'money', -- money, bank
		door = `gabz_pinkcage_doors_front`, -- door hash for MLO type
		rentcoord = vec3(-126.9499, -1568.7477, 34.1763),
		coord = vec3(-129.1472, -1585.6680, 32.2821), -- center of the motel location
		radius = 50.0, -- radius of motel location
		maxoccupants = 1, -- maximum renters per room
		uniquestash = true, -- if true. each players has unique stash ID (non sharable and non stealable). if false stash is shared to all Occupants if maxoccupans is > 1
		doors = { -- doors and other function of each rooms
			[1] = {
				door = vec3(-120.1369, -1574.4281, 34.1763),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[2] = {
				door = vec3(-114.2780, -1579.3142, 34.1771),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[3] = {
				door = vec3(-118.6829, -1585.9028, 34.2130),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[4] = {
				door = vec3(-122.9721, -1591.0090, 34.2073),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[5] = {},
			[6] = {
				door = vec3(-140.1485, -1599.6154, 34.8313),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[7] = {
				door = vec3(-147.8303, -1596.5044, 34.8313),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[8] = {
				door = vec3(-140.2795, -1587.5569, 34.2437),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[9] = {
				door = vec3(-134.4390, -1580.5977, 34.2079),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[10] = {
				door = vec3(-120.1840, -1574.3676, 37.4078),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[11] = {
				door = vec3(-114.0962, -1579.4686, 37.4078),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[12] = {
				door = vec3(-118.7045, -1585.9254, 37.4078),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[13] = {
				door = vec3(-122.9505, -1590.9808, 37.4078),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[14] = {},
			[15] = {
				door = vec3(-140.1911, -1599.6104, 38.212),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[16] = {
				door = vec3(-147.1935, -1597.1102, 38.2126),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[17] = {
				door = vec3(-147.6253, -1596.1219, 38.2126),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[18] = {
				door = vec3(-140.3947, -1587.5079, 37.4122),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
			[19] = {
				door = vec3(-134.5620, -1580.6074, 37.4078),
				stash = vec3(347.12841796875,-205.05494689941,57.55553817749),
				wardrobe = vec3(351.77719116211,-205.24267578125,58.351734161377),
				fridge = vec3(349.24819946289,-206.78134155273,58.326892852783),
			},
		},
	},
}
config.extrafunction = {
	['bed'] = function(data,identifier)
		TriggerEvent('luckyme')
	end,
	['fridge'] = function(data,identifier)
		TriggerEvent('ox_inventory:openInventory', 'stash', {id = 'fridge_'..data.motel..'_'..identifier..'_'..data.index, name = 'Fridge', slots = 30, weight = 20000, coords = GetEntityCoords(cache.ped)})
	end,
	['exit'] = function(data)
		local coord = LocalPlayer.state.lastloc or vec3(data.coord.x,data.coord.y,data.coord.z)
		DoScreenFadeOut(500)
		while not IsScreenFadedOut() do
			Wait(10)
		end
		if config.doorPlayingVideo then
			SendNUIMessage({
				type = 'door'
			})
		end
		return Teleport(coord.x,coord.y,coord.z,0.0,true)
	end,
}

config.Text = {
	['stash'] = 'Brankas',
	['fridge'] = 'Kulkas',
	['wardrobe'] = 'Pakaian',
	['bed'] = 'Sleep',
	['door'] = 'Pintu Rusun',
	['exit'] = 'Keluar',
}

config.icons = {
	['door'] = 'fas fa-door-open',
	['stash'] = 'fas fa-box',
	['wardrobe'] = 'fas fa-tshirt',
	['fridge'] = 'fas fa-ice-cream',
	['bed'] = 'fas fa-bed',
	['exit'] = 'fas fa-door-open',
}

config.stashblacklist = {
	['stash'] = { -- type of inventory
		blacklist = { -- list of blacklists items
			water = true,
		},
	},
	['fridge'] = { -- type of inventory
		blacklist = { -- list of blacklists items
			WEAPON_PISTOL = true,
		},
	},
}

PlayerData,ESX,QBCORE,zones,shelzones,blips = {},nil,nil,{},{},{}

function import(file)
	local name = ('%s.lua'):format(file)
	local content = LoadResourceFile(GetCurrentResourceName(),name)
	local f, err = load(content)
	return f()
end

if GetResourceState('es_extended') == 'started' then
	ESX = exports['es_extended']:getSharedObject()
elseif GetResourceState('qb-core') == 'started' then
	QBCORE = exports['qb-core']:GetCoreObject()
end