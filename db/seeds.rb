# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)





Webseries.delete_all
Comedy.delete_all
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'webseries'")
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'comedy'")

# SERIES & SHOWS

# P.O.R.N
Webseries.create([{ :url => 'cNSN8_-PkCg', :metadata => 'Play on Repeat Now (P.O.R.N) Ep.12', :thumbimg => 'pornE12.png' },
	{ :url => 'Nvh-r6vUFTA', :metadata => 'Play on Repeat Now (P.O.R.N) Ep.11', :thumbimg => 'pornE11.png' },
	{ :url => 'qhXBHDbk7Lk', :metadata => 'Play on Repeat Now (P.O.R.N) Ep.10', :thumbimg => 'pornE10.png' },
	{ :url => 'dFOs2B1tAy8', :metadata => 'Play on Repeat Now (P.O.R.N) Ep.09', :thumbimg => 'pornE09.png' },
	{ :url => 'upFA-ge6NkI', :metadata => 'Play on Repeat Now (P.O.R.N) Ep.08', :thumbimg => 'pornE08.png' },
	{ :url => '7X98CZG8MAg', :metadata => 'Play on Repeat Now (P.O.R.N) Ep.07', :thumbimg => 'pornE07.png' },
	{ :url => 'mfm8DDuIbQE', :metadata => 'Play on Repeat Now (P.O.R.N) Ep.06', :thumbimg => 'pornE06.png' },
	{ :url => 'oQkgoDI8N20', :metadata => 'Play on Repeat Now (P.O.R.N) Ep.05', :thumbimg => 'pornE05.png' },
	{ :url => 'mwbbMUX7qqg', :metadata => 'Play on Repeat Now (P.O.R.N) Ep.04', :thumbimg => 'pornE04.png' },
	{ :url => 'p2RnWhOrtA4', :metadata => 'Play on Repeat Now (P.O.R.N) Ep.03', :thumbimg => 'pornE03.png' },
	{ :url => 'rHh1FdLL7dU', :metadata => 'Play on Repeat Now (P.O.R.N) Ep.02', :thumbimg => 'pornE02.png' },
	{ :url => '8DvMELHKCXg', :metadata => 'Play on Repeat Now (P.O.R.N) Ep.01', :thumbimg => 'pornE01.png' },
	# Gidi Up
	{ :url => 'FDR82qo3tdk', :metadata => 'Gidi Up Season 2: Ep.12', :thumbimg => 'gidiupS2E12.png' },
	{ :url => 'NfP_E25KBZc', :metadata => 'Gidi Up Season 2: Ep.11', :thumbimg => 'gidiupS2E00.png' },
	{ :url => 'SB-m7bOlMIg', :metadata => 'Gidi Up Season 2: Ep.10', :thumbimg => 'gidiupS2E00.png' },
	{ :url => 'EjBI-Pkekzg', :metadata => 'Gidi Up Season 2: Ep.09', :thumbimg => 'gidiupS2E00.png' },
	{ :url => 'Z1OcPkRjVc4', :metadata => 'Gidi Up Season 2: Ep.08', :thumbimg => 'gidiupS2E00.png' },
	{ :url => '2-qKDOifJZg', :metadata => 'Gidi Up Season 2: Ep.07', :thumbimg => 'gidiupS2E00.png' },
	{ :url => '8TGOyPDT3yw', :metadata => 'Gidi Up Season 2: Ep.06', :thumbimg => 'gidiupS2E00.png' },
	{ :url => 'XSySFJcjzQk', :metadata => 'Gidi Up Season 2: Ep.05', :thumbimg => 'gidiupS2E00.png' },
	{ :url => 'VvTHSKaloCw', :metadata => 'Gidi Up Season 2: Ep.04', :thumbimg => 'gidiupS2E00.png' },
	{ :url => 'g9P-8tSf5gE', :metadata => 'Gidi Up Season 2: Ep.03', :thumbimg => 'gidiupS2E00.png' },
	{ :url => 'HbtqHo_Y1wE', :metadata => 'Gidi Up Season 2: Ep.02', :thumbimg => 'gidiupS2E00.png' },
	{ :url => 'WiDzAZo64Ho', :metadata => 'Gidi Up Season 2: Ep.01', :thumbimg => 'gidiupS2E00.png' },
	{ :url => 'e4htIXm6ACA', :metadata => 'Gidi Up: A Web Series centered on the adventures of four friends in pursuit of happiness, independence, and success. Complete Season 1.', :thumbimg => 'gidiupSeason1Full.png' },
	# The Juice
	{ :url => '8gCxG1fEcCI', :metadata => 'The Juice Season 2: Basketmouth', :thumbimg => 'thejuiceBasketmouth.png' },
	{ :url => 'sngxjRC5XYk', :metadata => 'The Juice Season 2: Bovi', :thumbimg => 'thejuiceBovi.png' },
	{ :url => 'wT9v25W5eco', :metadata => 'The Juice Season 2: Timaya', :thumbimg => 'thejuiceTimaya.png' },
	{ :url => '-vzzktHqF3E', :metadata => 'The Juice Season 2: Kcee', :thumbimg => 'thejuiceKcee.png' },
	{ :url => '95tlx57RfJM', :metadata => 'The Juice Season 2: Kate Henshaw', :thumbimg => 'thejuiceKate.png' },
	{ :url => 'pC4xfc-F9F4', :metadata => 'The Juice Season 2: Davido', :thumbimg => 'thejuiceDavido2.png' },
	{ :url => 'SbWHZRINrlY', :metadata => 'The Juice Season 2: 2Face Idibia', :thumbimg => 'thejuice2face2.png' },


	{ :url => 'FyccTeQWx4E', :metadata => 'The Juice Season 1: Tiwa Savage', :thumbimg => 'thejuiceTiwaS.png' },
	{ :url => 'DwDEdEYKre4', :metadata => 'The Juice Season 1: Davido', :thumbimg => 'thejuiceDavido.png' },
	{ :url => 'rCUaMC0Ll_8', :metadata => 'The Juice Season 1: Olamide', :thumbimg => 'thejuiceOlamide.png' },
	{ :url => 'J3jFpKv392Q', :metadata => 'The Juice Season 1: Denrele (Tribute to Goldie)', :thumbimg => 'thejuiceDenrele.png' },
	{ :url => 'xVyx7E8DWEM', :metadata => 'The Juice Season 1: Ice Prince', :thumbimg => 'thejuiceIceprince.png' },
	{ :url => 'pF6U6_qO3Zw', :metadata => 'The Juice Season 1: Dbanj - Part 3', :thumbimg => 'thejuiceDbanj.png' },
	{ :url => 'a7h_8PlqYwo', :metadata => 'The Juice Season 1: Dbanj - Part 2', :thumbimg => 'thejuiceDbanj.png' },
	{ :url => 'akGSVhm7Nw8', :metadata => 'The Juice Season 1: Dbanj - Part 1', :thumbimg => 'thejuiceDbanj.png' },
	{ :url => 'NEefJ1NBMYo', :metadata => 'The Juice Season 1: Nollywood Actress Tonto Dikeh', :thumbimg => 'thejuiceTonto.png' },
	{ :url => 'BLmm2qE2pY0', :metadata => 'The Juice Season 1: Wizkid', :thumbimg => 'thejuiceWizkid.png' },
	{ :url => 'NzaZGz3isr4', :metadata => 'The Juice Season 1: Iyanya', :thumbimg => 'thejuiceIyanya.png' },
	{ :url => 'CxKaWvGqSZc', :metadata => 'The Juice Season 1: Linda Ikeji', :thumbimg => 'thejuiceLinda.png' },
	{ :url => 'e-VAS75g0ss', :metadata => 'The Juice Season 1: Don Jazzy', :thumbimg => 'thejuiceDonjazzy.png' },
	{ :url => 'vrvarkT0Q7o', :metadata => 'The Juice Season 1: 2Face Idibia', :thumbimg => 'thejuice2face.png' },
	{ :url => 'MApzrLQPwTY', :metadata => 'The Juice Season 1: Burna Boy', :thumbimg => 'thejuiceBurna.png' },
	{ :url => '_WRK5-sqoSg', :metadata => 'The Juice Season 1: Rita Dominic', :thumbimg => 'thejuiceRita.png' },
	{ :url => 'WbB00YHlJXI', :metadata => 'The Juice Season 1: Omotola Jalade Ekeinde', :thumbimg => 'thejuiceOmotola.png' },

	# Moments with Mo
	{ :url => 'jLdOco9wjOA', :metadata => 'Moments with Mo: Inspiring Interview With CEO Alade Oluwafemi, Founder Of Mobile Phone & Tablet Manufacturing Company: Pliris Mobile', :thumbimg => 'momentswithmoPliris.png' },

	# The Ngee Show
	{ :url => 'HRtX7XaK0Yg', :metadata => 'The Ngee Show Webisode: Nigerian 2015 Elections', :thumbimg => 'ngeeShowE2015e.png' },
	{ :url => 'Y0Uc9l0afxQ', :metadata => 'The Ngee Show Webisode: Growing Up In The 90s In Nigeria Part 2', :thumbimg => 'ngeeShowE90s.png' },
	{ :url => 'RPJ6_POJcvk', :metadata => 'The Ngee Show Webisode: Growing Up In The 90s In Nigeria', :thumbimg => 'ngeeShowE90s.png' },
	{ :url => 'GpOxKEODK3E', :metadata => 'The Ngee Show Webisode: Pecking', :thumbimg => 'ngeeShow.png' },
	{ :url => 'sPs2z47nN90', :metadata => 'The Ngee Show Webisode: Nollywood', :thumbimg => 'ngeeShow.png' },
	{ :url => 'WBKaFmwEwdI', :metadata => 'The Ngee Show Webisode 22 : Something For The Nigerian Youth With Guest Author, Chude Jideowo Part 2', :thumbimg => 'ngeeShowE22.png' },
	{ :url => 'ZKgB8Dh0YGk', :metadata => 'The Ngee Show Webisode 22 : Something For The Nigerian Youth With Guest Author, Chude Jideowo', :thumbimg => 'ngeeShowE22.png' },
	{ :url => 'K-uXo4uR4-4', :metadata => 'The Ngee Show Webisode 21 : 2014 Mid Year Review', :thumbimg => 'ngeeShow.png' },
	{ :url => 'QgJLETzX_4Q', :metadata => 'The Ngee Show Webisode 21: Weirdest Superstitions', :thumbimg => 'ngeeShowE21.png' },
	{ :url => 'OByMfm5NhM8', :metadata => 'The Ngee Show Webisode 20: Dress How You Want To Be Addressed', :thumbimg => 'ngeeShow.png' },
	{ :url => 'qePyOR_WPGU', :metadata => 'The Ngee Show Webisode 19: Modern Parenting', :thumbimg => 'ngeeShowE19.png' },
	{ :url => '7d1AOyj28gU', :metadata => 'The Ngee Show Webisode 18: Etiquette Part 2', :thumbimg => 'ngeeShow.png' },
	{ :url => 'esMlb05TnT4', :metadata => 'The Ngee Show Webisode 17: Insta(gram)madness', :thumbimg => 'ngeeShowE17.png' },
	{ :url => 'DYd2AJ6okq4', :metadata => 'The Ngee Show Webisode 16: Dos & Don\'ts In A Relationship', :thumbimg => 'ngeeShowE16.png' },
	{ :url => 'mdy6jFQhozs', :metadata => 'The Ngee Show Webisode 15: Brighter Grammer', :thumbimg => 'ngeeShow.png' },
	{ :url => 'JwNe5BIW3HE', :metadata => 'The Ngee Show Webisode 14: Westernization of Nigeria', :thumbimg => 'ngeeShowE14.png' },
	{ :url => 'N6hcFYgNXkQ', :metadata => 'The Ngee Show Webisode 13: Hybrids and Dulicated Words', :thumbimg => 'ngeeShow.png' },
	{ :url => '9Aw8yNP6lKc', :metadata => 'The Ngee Show Webisode 12: Combo Of Nigeria Things', :thumbimg => 'ngeeShow.png' },
	{ :url => '8HcDfR7Rtx0', :metadata => 'The Ngee Show Webisode 11: Phonetics With Guest, Chigul', :thumbimg => 'ngeeShowE11.png' },
	{ :url => 'bUSNIpEC2EM', :metadata => 'The Ngee Show Webisode 10: Skin Bleaching With Guest, Amaka', :thumbimg => 'ngeeShowE10.png' },
	{ :url => '1-a7Wtyh3mI', :metadata => 'The Ngee Show Webisode 09: Hygiene', :thumbimg => 'ngeeShow.png' },
	{ :url => 'HzTuxxiVpFY', :metadata => 'The Ngee Show Webisode 08: Team Weave Vs. Team Natural', :thumbimg => 'ngeeShowE08.png' },
	{ :url => 'xLt33cMCGPM', :metadata => 'The Ngee Show Webisode 07 Part 2: 10 Things To Stop Doing In Your 30s', :thumbimg => 'ngeeShow.png' },
	{ :url => 'dkuGVaKLlK8', :metadata => 'The Ngee Show Webisode 07: 10 Things To Stop Doing In Your 30s', :thumbimg => 'ngeeShow.png' },
	{ :url => 'MWio5KRXMhY', :metadata => 'The Ngee Show Webisode 06: Pronounciation & Colonial Words', :thumbimg => 'ngeeShowE06.png' },
	{ :url => 'jMf9NIZv5ZU', :metadata => 'The Ngee Show Webisode 05: Acronymn & Greestions', :thumbimg => 'ngeeShow.png' },
	{ :url => '6NGj6_GWuQM', :metadata => 'The Ngee Show Webisode 04: Nigerian Fashion Fads', :thumbimg => 'ngeeShowE04.png' },
	{ :url => 'InYui0OOYpY', :metadata => 'The Ngee Show Webisode 03 Part 2: Etiquette', :thumbimg => 'ngeeShowE03.png' },
	{ :url => 'VEIJmR9wJjo', :metadata => 'The Ngee Show Webisode 03: Etiquette', :thumbimg => 'ngeeShowE03.png' },
	{ :url => 'CZ5FVms9puo', :metadata => 'The Ngee Show Webisode 02: Selfies', :thumbimg => 'ngeeShowE02.png' },
	{ :url => 'mow3Nk9Ws70', :metadata => 'The Ngee Show Webisode 01: Nigerian \'IT\' Wedding', :thumbimg => 'ngeeShowE01.png' },

	])


# COMEDIES
# The AY SHOW

Comedy.create([{ :url => 'Ej16wkg5lpY', :mdata => 'AY Live Concert: Suicide and Naija Police', :img => 'ayPolice.png' },
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

	])

