# coding: utf-8
require 'erb'

module Recot
  module Render
    class HtmlRenderer

      # Render html file.
      #
      # == Parameters:
      # template::
      #   Template file path for render.
      # output::
      #   Path of index html file.
      # data::
      #   Hash object of binding data.
      def render_doc(template, output, data)
        unless data
          $stderr.puts "binding args invalid : #{data}"
        else
          render(template, output, data)
        end
      end

private

      # Render html file.
      #
      # == Parameters:
      # template::
      #   Path of template for render html.
      # output::
      #   Path of resource html file.
      # data::
      #   Hash object of binding data.
      def render(template, output, data)
        begin
          erb = ERB.new(File.read(template), nil, '-')
          ret = erb.result(binding)
          File.open(output, "w:utf-8") do |f|
            f.write(ret)
          end
        rescue => ex
          $stderr.puts "render html exception #{ex}"
        end
      end

    end
  end
end
