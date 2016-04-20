#encoding: UTF-8
$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")     
require "pdf/writer"

MAIN_TEXT_WIDTH        = 330
MAIN_TEXT_LINE_SPACING = 16
PADDING_BOTTOM         = 20

def write_text(pdf, text, options = {})
  y       = options[:y] if options[:y]
  left    = options[:left] if options[:left]
  width   = options[:width] if options[:width]  
  size    = options[:font_size] || 0
  height  = options[:leading]

  # Filled with the text that would flow onto the next page
  next_page_text = nil

  text.each_line do |line|
    start = true
    loop do 
      break if (line.nil? or line.empty?) and not start

      start = false

      y -= height

      if y < (pdf.absolute_bottom_margin + PADDING_BOTTOM)
        if options[:no_newpage]
          # Collect remaining text so it can be returned
          next_page_text = "" if next_page_text.nil?
          next_page_text += line
          line = nil
        else
          pdf.start_new_page
          y  = options[:new_page_y] || multi_page_top_y(pdf)
        end
      end

      if next_page_text.nil?
        line = pdf.add_text_wrap(left, y, width, line, size)
      end
    end
  end

  if options[:no_newpage]
    {:leftover_text => next_page_text, :next_line_y => y}
  else
    y
  end
end


pdf = PDF::Writer.new    
top_logo_file = 'images/chunkybacon.jpg'
pdf.image(top_logo_file, {:width => 85, :justification => :right, :pad => 0 })

body = <<END

<strong>Heading</strong>

	<C:bullet/>bullet "point 1"
	<C:bullet/>bullet point 2
	<C:bullet/>


<strong>More Stuff</strong>

	<C:bullet/><em>something inside em tags</em> and something° else

END


write_text(pdf, 
  body, 
  {
    :no_newpage => true, 
    :y => pdf.absolute_top_margin - 140, 
    :left => pdf.absolute_left_margin, 
    :leading => MAIN_TEXT_LINE_SPACING, 
    :width => MAIN_TEXT_WIDTH
  }
)

# pdf.render
Dir.mkdir('tmp') unless File.directory?('tmp')
File.unlink('tmp/test_image_read.pdf') if File.file?('tmp/test_image_read.pdf')
pdf.save_as("tmp/test_image_read.pdf")
`open tmp/test_image_read.pdf`

