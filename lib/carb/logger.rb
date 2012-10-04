module Carb
  class Logger

    SUCCESS = 'success'
    ERROR = 'error'
    WARNING = 'warning'
    INFO = 'info'

    class << self

      def log(text, type)
        case type
        when ERROR
          output = red(text)
        when INFO 
          output = blue(text)
        when SUCCESS
          output = green(text)
        when WARNING
          output = grey(text)
        else
          output = text
        end

        puts output
      end

      def colorize(text, fg)
        ret = "\e[#{fg}m#{text}\e[0m"
      end

      def red(text); colorize(text, 31); end
      def green(text); colorize(text, 32); end
      def blue(text); colorize(text, 34); end
      def grey(text); colorize(text, 30); end

    end
  end
end
