class Formatter
  def output_report(title, text)
    raise 'Abstract method called'
  end
end

class HTMLFormatter < Formatter
  def output_report(context)
    puts '<html>'
    puts '  <head>'
    puts "    <title>#{context.title}</title>"
    puts '  </head>'
    puts '  <body>'
    context.text.each do |line|
      puts "      <p>#{line}</p>"
    end
    puts '  </body>'
    puts '</html>'
  end
end

class PlaintextFormatter < Formatter
  def output_report(context)
    puts "***** #{context.title} *****"
    context.text.each do |line|
      puts(line)
    end
  end
end

class Report
  attr_reader :title, :text
  attr_accessor :formatter

  def initialize(formatter)
    @title = '月次報告'
    @text = ['順調', '最高の調子']
    @formatter = formatter
  end

  def output_report
    @formatter.output_report(self)
  end
end

report = Report.new(HTMLFormatter.new)
report.formatter = PlaintextFormatter.new
report.output_report
