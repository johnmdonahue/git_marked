#!/usr/bin/env ruby

require 'rubygems'

gem 'redcarpet', '1.17.2'
require 'redcarpet'
require 'albino'
require 'nokogiri'

def markdown(text)
  options = [:fenced_code, :hard_wrap, :autolink, :no_intraemphasis, :generate_toc, :strikethrough, :gh_blockcode, :xhtml, :tables]
  syntax_highlighter(Redcarpet.new(text, *options).to_html)
end

def syntax_highlighter(html)
  doc = Nokogiri::HTML(html)
  doc.search("//pre[@lang]").each do |pre|
    pre.replace Albino.colorize(pre.text.rstrip, pre[:lang])
  end
  doc.to_s
end

puts markdown(ARGF.read)

