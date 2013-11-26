$LOAD_PATH.unshift("lib")     
require "pdf/writer"
require "pdf/simpletable"

describe PDF::SimpleTable do
  
  let!(:pdf) { PDF::Writer.new }
  
  it "should render pdf with simpletable" do 
    # image_obj = pdf.add_image_from_file(image, x, y, width = nil, height = nil, link = nil)
    
    PDF::SimpleTable.new do |table|
      table.column_order.push(*%w(left 1 2 3 4 5))
  
      table.columns["left"] = PDF::SimpleTable::Column.new("left") { |col| col.justification = :center }
      table.columns["1"] = PDF::SimpleTable::Column.new("1") { |col| col.justification = :center }
      table.columns["2"] = PDF::SimpleTable::Column.new("2") { |col| col.justification = :center }
      table.columns["3"] = PDF::SimpleTable::Column.new("3") { |col| col.justification = :center }
      table.columns["4"] = PDF::SimpleTable::Column.new("4") { |col| col.justification = :center }
      table.columns["5"] = PDF::SimpleTable::Column.new("5") { |col| col.justification = :center }
  
      table.width = 500
      table.show_lines    = :all
      table.show_headings = false
      table.orientation   = :center
      table.position      = :center
  
      data = [
        { "left" => "<b># of Member</b>", "1" => "Up to 50", "2" => "51 - 100", "3" => "101 - 150", "4" => "151 - 200", "5" => "201 and up" },
        { "left" => "<b>Deposit</b>", "1" => "$500.00", "2" => "$1,100.00", "3" => "$1,900.00", "4" => "$2,500.00", "5" => "$3,200" },
      ]
  
      table.data.replace(data)
      table.render_on(pdf)
    end
    
    rendered_pdf = pdf.render
    rendered_pdf.should_not be_nil
    
  end
  
  
  
end
