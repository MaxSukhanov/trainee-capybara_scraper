# frozen_string_literal: true

module SectionXPaths
  TIDINGS          = "//div[contains(@class, 'news-tidings__list')]//div[contains(@class, 'news-tidings__item news-tidings__item_1of3 news-tidings__item_condensed')]"
  TIDINGS_IMAGES   = "#{TIDINGS}//div[contains(@class, 'news-tidings__preview')]//div[contains(@class, 'news-tidings__image news-helpers_hide_mobile-small')]/@style"
  TIDINGS_TITLES   = "#{TIDINGS}//div[contains(@class, 'news-tidings__clamping')]//div[contains(@class, 'news-tidings__subtitle')]//span[contains(@class, 'news-helpers_hide_mobile-small')]"
  TIDINGS_PREVIEWS = "#{TIDINGS}//div[contains(@class, 'news-tidings__clamping')]//div[contains(@class, 'news-tidings__speech')]"

  TILES_LINKS    = "//div[contains(@class, 'news-tiles__list')]//div[contains(@class, 'news-tiles__item')]//div/a[contains(@class, 'news-tiles__stub')]/@href"
  TILES_IMAGES   = "//div[contains(@class, 'news-header__image')]/@style"
  TILES_TITLES   = "//div[contains(@class, 'news-header__title')]"
  TILES_PREVIEWS = "//div[contains(@class, 'news-text')]/p"
end
