module Carb
  class Logger

    def log(text, type)
      case type
      when 'WARNING'
        red(text)
      when 'INFO'
        blue(text)
      when 'SUCCESS'
        green(text)
      else
        text
      end
    end

    def colorize(text, color_code)
      "\e[#{color_code}m#{text}\e[0m"
    end

    def red(text); colorize(text, 31); end
    def green(text); colorize(text, 32); end
    def blue(text); colorize(text, 33); end

  end
end
