class Report
  def initialize
    @title = '月次報告'
    @text = ['順調', '最高の調子']
  end

  def output_report(format)
    if format == :plain
      puts "*** #{@title} ***"
    elsif format == :html
      puts '<html>'
      puts ' <head>'
      puts " <title>#{@title}</title>"
      puts ' </head>'
      puts ' <body>'
    else
      raise "Unknown format: #{format}"
    end

    @text.each do |line|
      if format == :plain
        puts line
      else
        puts " <p>#{line}</p>"
      end
    end

    if format == :html
      puts ' </body>'
      puts '</html>'
    end
  end
end

report = Report.new
report.output_report(:plain)
report.output_report(:html)
