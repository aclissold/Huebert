package main

import (
	"code.google.com/p/biogo.graphics/palette"
	"fmt"
	"image"
	"image/png"
	"log"
	"os"
)

var size uint
var filename string

func check(err error) {
	if err != nil {
		log.Fatal(err)
	}
}

// Draws a size x size color spectrum icon from left to right.
func main() {
	// Get the size and filename
	fmt.Print("Enter the width (pixels) of the icon to generate: ")
	_, err := fmt.Scanln(&size); check(err)
	fmt.Print("Enter the filename to save it as (without extension): ")
	_, err = fmt.Scanln(&filename); check(err)
	filename += ".png"

	// Initialize the image and hue
	icon := image.NewRGBA(image.Rect(0, 0, int(size), int(size)))
	hue := &palette.HSVA{0, 1, 1, 1}

	// Loop, using the indices as the coordinates at which to draw
	for x := 0; x < int(size); x++ {
		for y := 0; y < int(size); y++ {
			hue.H = float64(x) / float64(size)
			icon.Set(x, y, hue)
		}
	}

	// Open a PNG for writing and write the image to it
	file, err := os.Create(filename); check(err)
	err = png.Encode(file, icon); check(err)

	fmt.Println("Successfully generated " + filename + ".")
}
