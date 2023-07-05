import os
import sys
import re
import shutil

games = ["bn6","exe6","bn6_soundmod","exe6_soundmod"]
patchnames = {
	"bn6": ["BR6E_00.bps","BR5E_00.bps"],
	"exe6": ["BR5J_00.bps","BR6J_00.bps"],
	"bn6_soundmod": ["BR6E_00.bps","BR5E_00.bps"],
	"exe6_soundmod": ["BR5J_00.bps","BR6J_00.bps"],
}
txt = ""
base = ""
latest = ""
for game in games:
	try:
		# load _versions file into memory and fetch the latest version number to print out
		with open("tango_patches/{}_versions.toml".format(game), 'r', encoding = 'utf-8') as file:
			txt = file.read()
			latest = re.findall("(?<=')\d\.\d\.\d(?='\])",txt)
			if len(latest) > 0:
				latest = latest[len(latest)-1]
			else:
				latest = "none"
		# get input from user in format X.Y.Z
		sys.stdout.write("New {} version? Latest Ver = {} \nFormat = X.Y.Z \n".format(game,latest))
		version = input()
	except IOError:
		print("part1 _versions: Could not open file.")
		continue
	try:
		with open("tango_patches/{}_versions.toml".format(game), 'a', encoding = 'utf-8') as file:

			# skip if user input is obviously invalid
			if version == "" or len(version) < 5:
				continue
			gamever = ""
			if "bn6" in game:
				gamever = "bn6"
			elif "exe6" in game:
				gamever = "exe6"
			append = "[versions.'{}']\n".format(version)
			append += "netplay_compatibility = \"bingus{}v{}\"\n".format(gamever,version)
			if not("[versions.'{}']".format(version) in txt):
				txt += append
				file.write(append)
	except IOError:
		print("part2 _versions: Could not open file.")
		continue

	# load the base of the info.toml file
	try:
		with open("tango_patches/{}_base.toml".format(game), 'r', encoding = 'utf-8') as file:
			base = file.read()

	except IOError:
		print("_base: Could not open file.")
		continue

	txt = base + txt
	folderpath = "tango_patches/{}_bingus/v{}".format(game,version)
	if not os.path.exists(folderpath):
		os.mkdir(folderpath,0o666)

	newfile = open("tango_patches/{}_bingus/info.toml".format(game,version), 'w', encoding = 'utf-8')
	bb = newfile.write(txt)
	newfile.close()

	for name in patchnames[game]:
		shutil.copy("{}/{}".format(game,name),"tango_patches/{}_bingus/v{}/{}".format(game,version,name))

	sys.stdout.write("\nSUCCESS: EXE {} v{} created in path \"{}/\"\n\n".format(game, version,folderpath))