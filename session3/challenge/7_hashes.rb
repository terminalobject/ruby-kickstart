class HTMLTag
  FONTS = {
    :serif      => '"Times New Roman", "Georgia"',
    :sans_serif => '"Arial", "Verdana"',
    :monospace  => '"Courier New", "Lucida Console"' 
  }

  COLORS = {
    :red   => '#FF0000',
    :green => '#00FF00',
    :blue  => '#0000FF'
  }

  attr_accessor :name, :innerHTML, :font, :options, :color, :multiline

  def initialize(name, innerHTML, options = {})
    @name, @innerHTML = name, innerHTML
    @font      = FONTS[options[:font]]
    @color     = COLORS[options[:color]]
    @multiline = options[:multiline]
  end

  def style
    return nil unless font || color
    style = "style='"
    style << "font-family:#{font};" if font
    style << "color:#{color};"      if color
    style << "'"
  end

  def to_s
    line_end = ""
    line_end = "\n" if multiline 
    "<#{name} #{style}>#{line_end}"   \
      "#{innerHTML.chomp}#{line_end}" \
    "</#{name}>\n"
  end
end