from pathlib import Path
from PIL import Image
import pillow_heif
import sys

pillow_heif.register_heif_opener()

def convert_heic_to_png(file_path):
    path = Path(file_path)

    if not path.exists():
        print(f"File not found: {file_path}")
        return

    if path.suffix.lower() not in [".heic", ".heif"]:
        print(f"Skipped non-HEIC file: {file_path}")
        return

    output_path = path.with_suffix(".png")
                                   
    try:
        image = Image.open(path)
        image.save(output_path, "PNG")

        print(f"Converted: {path.name}")

    except Exception as e:
        print(f"Error converting {path.name}: {e}")


if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage:")
        print("Drag HEIC files onto this executable")
    else:
        for file in sys.argv[1:]:
            convert_heic_to_png(file)