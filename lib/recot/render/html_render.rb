# coding: utf-8
require 'erb'

module Recot
  module Render
    class HtmlRender

      # Path of resdoc template.
      RESDOC_TEMPLATE = "#{Dir.pwd}/template/resdoc.html.erb".freeze

      # Render resource html file.
      #
      # == Parameters:
      # data::
      #   Hash object of binding data.
      # out_file::
      #   Path of resource html file.
      def render_resdoc(data, out_file)
        unless data
          $stderr.puts "binding args invalid : #{data}"
        else
          render(RESDOC_TEMPLATE, out_file, data)
        end
      end

private

      # Render html file.
      #
      # == Parameters:
      # template_file::
      #   Path of template for render html.
      # out_file::
      #   Path of resource html file.
      # data::
      #   Hash object of binding data.
      def render(template_file, out_file, data)
        erb = ERB.new(File.read(template_file), nil, '-')
        ret = erb.result(binding)
        File.open(out_file, "w:utf-8") do |f|
          f.write(ret)
        end
      end

    end
  end
end
