import os
import sys

#Configuration
SOURCE_DIR = "src"
BUILD_DIR = "bin"
BOOTLOADER_SRC = os.path.join(SOURCE_DIR, "boot.asm")
BOOTLOADER_BIN = os.path.join(BUILD_DIR, "boot.bin")
KERNEL_SRC = os.path.join(SOURCE_DIR, "kernel.asm")
KERNEL_BIN = os.path.join(BUILD_DIR, "kernel.bin")

def assemble(input_file, output_file):
	#Calls NASM To Assemble The Assembly Code Into Binary
	print(f"[ASM] Assembling {input_file}...")

	#Construct The Command String
	# -f bin Tells NASM To Ouptut Raw Binary (No Headers)
	# -o Specifies The Output Filename
	command = f"nasm -f bin {input_file} -o {output_file}"

	#Execute The Command
	result = os.system(command)

	#Check For Failure
	if result !=0:
		print(f"[ERROR] Failed To Assemble {input_file}")
		sys.exit(1)


def ensure_build_dir():
	if not os.path.exists(BUILD_DIR):
		os.makedirs(BULD_DIR)


def main():
	ensure_build_dir()

	#Check For Command Line Arguments
	if len(sys.argv) > 1:
		if sys.argv[1] == "clean":
			clean_project()
			return
		else:
			print(f"[ERROR] Unkown Command: {sys.argv[1]}")
			print("Usage: python build.py [clean]")
			sys.exit(1)


	#Standard Build Process
	#Compile Bootloader
	assemble(BOOTLOADER_SRC, BOOTLOADER_BIN)

	#Compile Kernel (Uncomment When We Have Kernel File)
	#assemble(KERNEL_SRC, KERNEL_BIN)

	#Create Disk Image
	create_disk_image()

if __name__ == "__main__":
	main()


#Define The Standard Size Of a 1.44 MB Floppy Disk In Bytes
FLOPPY_SIZE = 1474560

def create_disk_image():
	#Concatenates Binaries Into A Single Floppy Disk Image
	print(f"[BUILD] Creating {FLOPPY_SIZE} Byte Disk Image...")

	boot_bin = BOOTLOADER_BIN
	kernel_bin = KERNEL_BIN
	output_img = "main_floppy.img"

	with open(output_img, 'wb') as img:
		#1. Write The Bootloader (First 512 Bytes)
		if os.path.exists(boot_bin):
			with open(boot_bin, 'rb') as f:
				boot.data = f.read()

				#Safety Check: Master Boot Record Must Fit In One Sector
				if len(boot_data) > 512:
					print(f"[ERROR] Bootloader Is {len(boot_data)} Bytes! Must Be <= 512 Bytes")

				sys.exit(1)

			img.write(boot_data)
			print(f" + Wrote Bootloader ({len(boot_data}) Bytes")

			#Pad The Bootloader To Exactly 512 Bytes If Necessary
			#(Though Our ASM Code Should Handle This Via 'Times')
			if len(boot_data) > 512:
				padding = 512 - len(boot_data)
				img.write(b'\x00' * padding)
				print(f" + Padded Boot Sector With {padding} Bytes")
		else:
			print(f"[ERROR] {boot_bin} Not Found.")
			sys.exit(1)


		#2. Write The Kernel (Immediately After Bootloader)
		if os.path.exists(kernel_bin):
			with open(kernel_bin, 'rb') as f:
				kernel_data = f.read()
				img.write(kernel_data)
				print(f" + Wrote Kernel  ({len(kernel_data)} Bytes)")


		#3. Pad The Rest Of The Disk
		current_pos = img.tell()
		remaining = FLOPPY_SIZE - current_pos

		if remaining < 0:
			print("[ERROR] Image Exceeds Floppy Size Limit!")
			sys.exit(1)

		img.write(b'\x00' * remaining)
		print(f" + Padded Disk With {remaining} Bytes Of Zeros")

	print(f"[SUCCESS] Created {output_img}")


def clean_project():
	#Removes All Compiled Binaries And Disk Images
	print("[BUILD] Cleaning Up Project...")

	#List All Files To Remove
	files_to_remove = [
		BOOTLOADER_BIN,
		KERNEL_BIN,
		"main_floppy.img"
	]

	for file_path in files_to_remove:
		if os.path.exists(file_path):
			os.remove(file_path)
			print(f" - Removed {file_path}")

		else:
			print(f" - {file_path} Already Clean")
