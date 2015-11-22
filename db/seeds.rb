# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Video.delete_all
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'video'")

# COMEDIES
# The AY SHOW

Video.create([{ :url => 'Ej16wkg5lpY', :mdata => 'AY Live Concert: Suicide and Naija Police', :img => 'ayPolice.png' },
	{ :url => 'zY6VHLiHgEI', :mdata => 'AY and Genevieve in Hot Romance', :img => 'ayGenevieve.png' },
	{ :url => 'WgTpVJa4urU', :mdata => 'AY Comedy Skit: Ay and Mike Ezuruonye Kidnap Naija Oyibos', :img => 'ayKidnappers.png' },
	{ :url => 'Ko45e2bP4R0', :mdata => 'AY Comedy Skit: Ay Colludes With Chidi Mokeme To Toasts Genevieve', :img => 'ayGenevieve2.png' },
	{ :url => 'gSGG1cTKSus', :mdata => 'AY Comedy Skit: Ay The House Boy', :img => 'ayHouseboy.png' },
	{ :url => 'XMjmdUxpkf8', :mdata => 'AY Comedy Skit: Ay Shops With Ini Edo', :img => 'aySkits.png' },
	{ :url => 'TOX77yxV_yQ', :mdata => 'AY Comedy Skit: Ay Fuels Tiwa Sawage\'s Bicycle', :img => 'ayTiwa.png' },
	{ :url => 'BuMg1SzlvUo', :mdata => 'AY Comedy Skit: Ay and Funke Akindele\'s Daughter', :img => 'ayFunke.png' },
	{ :url => 'GfcotDh1IDI', :mdata => 'AY Comedy Skit: Ay and Tonto Dikeh Caught In The Closet', :img => 'aySkits.png' },
	{ :url => 'AwQSmN9q9zQ', :mdata => 'AY Comedy Skit: Nadia Buari Caught In Bed With Prophet Ay', :img => 'ayNadia.png' },
	{ :url => '2LCZUvFEbG8', :mdata => 'AY Live Concert: Seyilaw Cracks Audience ', :img => 'aySkits.png' },
	{ :url => 'jk4wqis2QqU', :mdata => 'AY Comedy Skit: The Oppressor', :img => 'aySkits.png' },
	{ :url => '9tEKS0siVaY', :mdata => 'AY Live Concert: Helen Paul Cracks The Audience At Abuja Invasion', :img => 'ayHelen.png' },
	{ :url => 'dIXBBesxsSY', :mdata => 'AY Comedy Skit: Tom & Jerry', :img => 'ayTomjerry.png' },
	{ :url => 'Aj9b55SlAD8', :mdata => 'AY Comedy Skit: Who Wants To Be A Billioniare With Seyilaw', :img => 'ayBillionaireseyi.png' },
	{ :url => 'KJFqINjWJwU', :mdata => 'AY Comedy Skit: Who Wants To Be A Billioniare With Mallam', :img => 'ayBillionairemallam.png' },
	{ :url => 'WJyEbqTSqoc', :mdata => 'AY Comedy Skit: Your Waist Remix Video', :img => 'ayWaist.png' },
	{ :url => '9h4rOOqBURg', :mdata => 'AY Comedy Skit: Ay Fights Ghanian Actor John Dumelo', :img => 'ayJohndumelo.png' },
	{ :url => 'ioLj2vlUPg8', :mdata => 'AY\'s Crib: August Visitor', :img => 'ayAugustvisitor.png' },
	{ :url => 'KYdhkUxYj7g', :mdata => 'AY Comedy Skit: Kim Kardashian Talks About Her Visit To Nigeria', :img => 'ayKardashian.png' },
	{ :url => 'VXDFB8Wq1tA', :mdata => 'AY\'s Crib: Episode 2 - House Girl Wanted', :img => 'ayHousegirlwanted.png' },
	{ :url => 'GCB65OOavvE', :mdata => 'AY Comedy Skit: Helen Paul Gets Delivered After Jim Iyke', :img => 'ayHelendeliverance.png' },
	{ :url => 'g_pATtRD3WA', :mdata => 'AY Comedy Skit: Ay With Juliet Ibrahim & Chris Attoh', :img => 'ayJulietchris.png' },
	{ :url => 'FKhs2tu9H2o', :mdata => 'AY Live Concert: Okey Bakassi In Search Of Who Wrote Things Fall Apart ', :img => 'ayOkeybakassi.png' },
	{ :url => '8X0tfrCMUB8', :mdata => 'AY Live Concert: I Go Dye Thrills the Audience ', :img => 'ayIgodye.png' },
	{ :url => '2QoDnuZIHOg', :mdata => 'AY Comedy Skit: Use Your Head', :img => 'ayUseyourhead.png' },
	{ :url => '2LCZUvFEbG8', :mdata => 'AY Live Concert: Seyilaw Cracks Audience ', :img => 'aySkits.png' },
	{ :url => 'jk4wqis2QqU', :mdata => 'AY Comedy Skit: The Oppressor', :img => 'aySkits.png' },
	{ :url => '9tEKS0siVaY', :mdata => 'AY Live Concert: Helen Paul Cracks The Audience At Abuja Invasion', :img => 'ayHelen.png' },
	{ :url => 'dIXBBesxsSY', :mdata => 'AY Comedy Skit: Tom & Jerry', :img => 'ayTomjerry.png' },
	{ :url => 'Aj9b55SlAD8', :mdata => 'AY Comedy Skit: Who Wants To Be A Billioniare With Seyilaw', :img => 'ayBillionaireseyi.png' },
	{ :url => 'KJFqINjWJwU', :mdata => 'AY Comedy Skit: Who Wants To Be A Billioniare With Mallam', :img => 'ayBillionairemallam.png' },
	{ :url => 'WJyEbqTSqoc', :mdata => 'AY Comedy Skit: Your Waist Remix Video', :img => 'ayWaist.png' },
	{ :url => '9h4rOOqBURg', :mdata => 'AY Comedy Skit: Ay Fights Ghanian Actor John Dumelo', :img => 'ayJohndumelo.png' },
	{ :url => 'ioLj2vlUPg8', :mdata => 'AY\'s Crib: August Visitor', :img => 'ayAugustvisitor.png' },
	{ :url => 'KYdhkUxYj7g', :mdata => 'AY Comedy Skit: Kim Kardashian Talks About Her Visit To Nigeria', :img => 'ayKardashian.png' },
	{ :url => 'VXDFB8Wq1tA', :mdata => 'AY\'s Crib: Episode 2 - House Girl Wanted', :img => 'ayHousegirlwanted.png' },
	{ :url => 'GCB65OOavvE', :mdata => 'AY Comedy Skit: Helen Paul Gets Delivered After Jim Iyke', :img => 'ayHelendeliverance.png' },
	{ :url => 'g_pATtRD3WA', :mdata => 'AY Comedy Skit: Ay With Juliet Ibrahim & Chris Attoh', :img => 'ayJulietchris.png' },
	{ :url => 'FKhs2tu9H2o', :mdata => 'AY Live Concert: Okey Bakassi In Search Of Who Wrote Things Fall Apart ', :img => 'ayOkeybakassi.png' },
	{ :url => '8X0tfrCMUB8', :mdata => 'AY Live Concert: I Go Dye Thrills the Audience ', :img => 'ayIgodye.png' },
	{ :url => '2QoDnuZIHOg', :mdata => 'AY Comedy Skit: Use Your Head', :img => 'ayUseyourhead.png' },

	])

