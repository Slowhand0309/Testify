# coding: utf-8
require 'erb'

module Recot
  module Render
    class HtmlRender

      # Path of indexdoc template.
      INDEXDOC_TEMPLATE = "#{Dir.pwd}/template/index.html.erb".freeze

      # Path of resdoc template.
      RESDOC_TEMPLATE = "#{Dir.pwd}/template/resdoc.html.erb".freeze

      # Render index html file.
      #
      # == Parameters:
      # data::
      #   Hash object of binding data.
      # out_file::
      #   Path of index html file.
      def render_indexdoc(data, out_file)
        unless data
          $stderr.puts "binding args invalid : #{data}"
        else
          render(INDEXDOC_TEMPLATE, out_file, data)
        end
      end

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
        begin
          erb = ERB.new(File.read(template_file), nil, '-')
          ret = erb.result(binding)
          File.open(out_file, "w:utf-8") do |f|
            f.write(ret)
          end
        rescue => ex
          $stderr.puts "render html exception #{ex}"
        end
      end

    end
  end
end
