import os
import sys
import re
import shutil

games = ["bn6","exe6"]
patchnames = {
	"bn6": ["MEGAMAN6_FXXBR6E_00.bps","MEGAMAN6_GXXBR5E_00.bps"],
	"exe6": ["ROCKEXE6_GXXBR5J_00.bps","ROCKEXE6_RXXBR6J_00.bps"],
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
		print("_versions: Could not open file.")
		continue
	try:
		with open("tango_patches/{}_versions.toml".format(game), 'a', encoding = 'utf-8') as file:

			# skip if user input is obviously invalid
			if version == "" or len(version) < 5:
				continue
			append = "[versions.'{}']\n".format(version)
			append += "netplay_compatibility = \"exe{}\"\n".format(game)
			txt += append
			file.write(append)
	except IOError:
		print("_versions: Could not open file.")
		continue

	# load the base of the info.toml file
	try:
		with open("tango_patches/{}_base.toml".format(game), 'r') as file:
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
		shutil.copy(name,"tango_patches/{}_bingus/v{}/{}".format(game,version,name))

	sys.stdout.write("\nSUCCESS: EXE {} v{} created in path \"{}/\"\n\n".format(game, version,folderpath))