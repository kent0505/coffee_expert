import base64






d= ''
image_data = base64.b64decode(d)
with open("assets/news1.png", "wb") as file:
    file.write(image_data)
print("Image saved as output_image.png")