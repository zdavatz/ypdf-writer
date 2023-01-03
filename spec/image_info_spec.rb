$LOAD_PATH.unshift("lib")     
require "pdf/writer"

describe PDF::Writer::Graphics::ImageInfo do
  
  it "should get jpeg image info" do 
    img_path = "images/bluesmoke.jpg"
    file_data = File.open(img_path, 'rb') {|io| io.read }
    
    image_info = PDF::Writer::Graphics::ImageInfo.new(file_data)
    image_info.should_not be_nil
    
    image_info.format.should eql(PDF::Writer::Graphics::ImageInfo::Formats::JPEG)
    
    image_info.width.should_not be_nil
    image_info.height.should_not be_nil
    
    image_info.width.should be > 0
    image_info.height.should be > 0
    
    puts "jpg image_info size: #{image_info.width} x #{image_info.height}"
  end
  
  it "should get png image info" do 
    img_path = "images/chunkybacon.png"
    file_data = File.open(img_path, 'rb') {|io| io.read }
    
    image_info = PDF::Writer::Graphics::ImageInfo.new(file_data)
    image_info.should_not be_nil
    
    image_info.format.should eql(PDF::Writer::Graphics::ImageInfo::Formats::PNG)
    
    image_info.width.should_not be_nil
    image_info.height.should_not be_nil
    
    image_info.width.should be > 0
    image_info.height.should be > 0
    
    puts "png image_info size: #{image_info.width} x #{image_info.height}"
  end
  
  it "should get rmagick image info" do 
    img_path = "images/bluesmoke.jpg"
    
    require 'rmagick'
    img = Magick::Image::read(img_path).first
    image_info = PDF::Writer::Graphics::ImageInfo.new(img.to_blob { self.format 'JPG' })
    image_info.should_not be_nil
    
    image_info.format.should eql(PDF::Writer::Graphics::ImageInfo::Formats::JPEG)
    
    image_info.width.should_not be_nil
    image_info.height.should_not be_nil
    
    image_info.width.should be > 0
    image_info.height.should be > 0
    
    puts "rmagick image_info size: #{image_info.width} x #{image_info.height}"
  end
  
end
