module BiddingsService::Download
  module PriceMethods
    include ActionView::Helpers::NumberHelper

    private

    # do not use this array on const definition,
    # use on method, for `with_locale` to work.
    def header_price_columns
      [
        I18n.t('services.biddings.download.header.price.title'),
        I18n.t('services.biddings.download.header.price.columns')
      ]
    end

    def price_sheet
      @price_sheet ||= book.create_sheet(
        I18n.t('services.biddings.download.header.price.sheet')
      )
    end

    def row_price_values(lot, lot_group_item)
      [
        bidding.id,
        lot.id,
        lot.name,
        lot_group_item.id,
        lot_group_item.group_item.item.classification.name,
        lot_group_item.group_item.item.description,
        unit(lot_group_item),
        number_with_delimiter(lot_group_item.quantity)        
      ]
    end

    def unit(lot_group_item)
      lot_group_item.group_item.item.unit_name
    end

  end
end
