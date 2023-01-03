$LOAD_PATH.unshift("lib")     
require "pdf/writer"

describe PDF::Writer::Graphics do
  
  let!(:pdf) { PDF::Writer.new }
  
  it "should render pdf with jpg image from file" do 
    # image_obj = pdf.add_image_from_file(image, x, y, width = nil, height = nil, link = nil)
    
    img_path = "images/bluesmoke.jpg"
    image_obj = pdf.add_image_from_file(img_path, 400, 400)
    
    image_obj.should_not be_nil
    image_obj.image_info.should_not be_nil
    
    image_obj.image_info.format.should eql(PDF::Writer::Graphics::ImageInfo::Formats::JPEG)
    
    image_obj.image_info.width.should_not be_nil
    image_obj.image_info.height.should_not be_nil
    
    image_obj.image_info.width.should be > 0
    image_obj.image_info.height.should be > 0
    
    rendered_pdf = pdf.render
    rendered_pdf.should_not be_nil
    
  end
  
  
  it "should render pdf with image and text" do 
    
    img_path = "images/bluesmoke.jpg"
    image_obj = pdf.image(img_path, pad: 10, width: 100, justification: :right, border: true)
    image_obj.should_not be_nil
    image_obj.image_info.format.should eql(PDF::Writer::Graphics::ImageInfo::Formats::JPEG)
    
    pdf.add_text(10, 400, "sample text", 12)
    
    rendered_pdf = pdf.render
    rendered_pdf.should_not be_nil
    
  end
  
  it "should render pdf with linked text and images" do
    img_path = "images/bluesmoke.jpg"
    image_obj = pdf.image(img_path, pad: 10, width: 100, justification: :right, link: {type: :external, target: "http://www.apple.com"} )
    image_obj.should_not be_nil
    image_obj.image_info.format.should eql(PDF::Writer::Graphics::ImageInfo::Formats::JPEG)
    
    pdf.add_text(10, 400, "<c:alink uri=\"http://www.apple.com/\">www.apple.com</c:alink>", 12)
    pdf.add_text(10, 370, "<b>some bold téxt tóø with some other specîål ° characters</b>")
    
    rendered_pdf = pdf.render
    rendered_pdf.should_not be_nil
    
    # look at this pdf
    Dir.mkdir('tmp') unless File.directory?('tmp')
    pdf_path = 'tmp/test_pdf_linked_text_images.pdf'
    File.unlink(pdf_path) if File.file?(pdf_path)
    pdf.save_as(pdf_path)
    result = `pdfinfo #{pdf_path}`
    puts "Result of pdfinfo #{pdf_path} ist #{result}" if $VERBOSE
    result.should match /Suspects:\s+no/
    result.should match /PDF version:\s+1.3/
  end
  
  
end
