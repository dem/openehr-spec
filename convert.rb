#!/usr/bin/env ruby
# encoding: utf-8
require 'rubygems'
require 'nokogiri'


file_en = File.open('openehr.en.html')
file_ru = File.open('openehr.ru.html')
file_en_ru = File.open('openehr.en-ru.html','w')

doc_en = Nokogiri::HTML.parse(file_en.read)
doc_ru = Nokogiri::HTML.parse(file_ru.read)

doc_en.remove_namespaces!
doc_ru.remove_namespaces!

title_en = doc_en.xpath('html/head/title')[0].text
title_ru = doc_ru.xpath('html/head/title')[0].text

body_en = doc_en.xpath('html/body')[0]
body_ru = doc_ru.xpath('html/body')[0]

#Заголовок
file_en_ru.write('<html xmlns="http://www.w3.org/1999/xhtml"><head><meta content="text/html; charset=utf-8" http-equiv="Content-Type"><title>title</title></head><body>')

#таблица
file_en_ru.write('<table>')

en_position = 0
ru_position = 0
body_en.children.each do |en_child|
  file_en_ru.write('<tr>')
  file_en_ru.write('<td>')
  file_en_ru.write(en_child)
  file_en_ru.write('</td>')
  file_en_ru.write('<td>')
  file_en_ru.write(body_ru.children[ru_position])
  file_en_ru.write('</td>')
  file_en_ru.write('</tr>')
  
  en_position += 1
  ru_position += 1
end






file_en_ru.write('</table>')
file_en_ru.write('</body></html>')
file_en_ru.close

