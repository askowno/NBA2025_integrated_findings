# optimize-images.R
library(magick)

# Folder containing your source images
img_dir <- "images"  # adjust to your folder
files <- list.files(img_dir, pattern = "\\.(png|jpg|jpeg)$", full.names = TRUE, ignore.case = TRUE)

for (f in files) {
  message("Optimizing: ", f)
  img <- image_read(f)
  
  # Resize (choose your max width, e.g. 1200 px)
  img <- image_scale(img, "1200x")
  
  # Convert to WebP (smaller than PNG/JPEG)
  newf <- sub("\\.(png|jpg|jpeg)$", ".webp", f, ignore.case = TRUE)
  
  # Save with quality ~75
  image_write(img, newf, format = "webp", quality = 75)
}