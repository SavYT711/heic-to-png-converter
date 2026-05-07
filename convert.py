from pathlib import Path
from PIL import Image
import pillow_heif
import sys

pillow_heif.register_heif_opener()

def convert(file_path):
    path = Path(file_path)

    if not path.exists():
        print("File not found:", path)
        return

    if path.suffix.lower() not in [".heic", ".heif"]:
        print("Not HEIC:", path.name)
        return

    output = path.with_suffix(".png")

    try:
        img = Image.open(path)
        img.save(output, "PNG")
        print("Converted:", path.name)
    except Exception as e:
        print("Error:", e)

if __name__ == "__main__":
    for f in sys.argv[1:]:
        convert(f)