#encoding: UTF-8

Dir.chdir(File.dirname(File.dirname(__FILE__)))
$LOAD_PATH.unshift("lib")     
require "pdf/writer"

require 'rmagick'

pdf = PDF::Writer.new(paper: 'LETTER', orientation: :portrait)

# load image
img_path = "images/bluesmoke.jpg"
if File.file?(img_path)
  img = Magick::Image::read(img_path).first
  x = ((pdf.page_width / 2) - (img.columns / 2)).to_i
  pdf.add_image(img.to_blob { self.format = 'JPG' }, x, 250)
end

# pdf.render
Dir.mkdir('tmp') unless File.directory?('tmp')
pdf_path = 'tmp/test_image_rmagick.pdf'
File.unlink(pdf_path) if File.file?(pdf_path)
pdf.save_as(pdf_path)

`open #{pdf_path}`
