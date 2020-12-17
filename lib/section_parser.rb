# frozen_string_literal: true

require 'open-uri'
require 'section_xpathes'

class SectionParser
  def initialize(section_url)
    @section_url = section_url
    @section = Nokogiri::HTML(open(@section_url))
    @tiles = tiles_bodies
  end

  def parse_section
    parsed_tidings + parsed_tiles
  end

  def parsed_tidings
    images(@section, SectionXPaths::TIDINGS_IMAGES)
      .zip(
        titles(@section, SectionXPaths::TIDINGS_TITLES),
        previews(@section, SectionXPaths::TIDINGS_PREVIEWS)
      )
  end

  def parsed_tiles
    @tiles.map do |tile|
      images(tile, SectionXPaths::TILES_IMAGES).zip(
        titles(tile, SectionXPaths::TILES_TITLES),
        previews(tile, SectionXPaths::TILES_PREVIEWS)
      ).flatten
    end
  end

  def tiles_bodies
    @section
      .xpath(SectionXPaths::TILES_LINKS)
      .map { |link| Nokogiri::HTML(open(link)) }
  end

  def images(body, xpaths)
    body
      .xpath(xpaths)
      .map { |image| get_image_link(image) }
  end

  def get_image_link(element)
    element.value.match(/\((.+)\)/)[1]
  end

  def titles(body, xpaths)
    body
      .xpath(xpaths)
      .map { |title| title.text.strip }
  end

  def previews(body, xpaths)
    body
      .xpath(xpaths)
      .map { |preview| preview.text[0..200].strip }
  end
end
