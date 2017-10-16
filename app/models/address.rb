require_relative '../../lib/zipcode'

class Address < ActiveRecord::Base
  belongs_to :state

  validates_format_of :zip_code, with: Servpro::Zipcode.regexp, message: "Zip should be 5 digits", if: -> { zip_code.present? }

  delegate :name, to: :state, allow_nil: true, prefix: true

  def full_address(separator = ' ')
    join_fields([address_1, address_2, city, state_name, zip_code, county], separator)
  end

  def address_without_county
    spaces = join_fields([address_1, address_2], ' ')
    commas = join_fields([city, state_name, zip_code], ', ')
    join_fields([spaces, commas], ' ')
  end

  def format_address(type = :condensed)
    case type
    when :breaks
      address_without_county('<br />')
    when :spaces
      address_without_county(' ')
    when :condensed
      first = join_fields([address_1, address_2], ', ')
      last = join_fields([city, state_name, zip_code], ', ')
      join_fields([first, last], '<br />')
    end
  end

  private

  def join_fields(fields, separator)
    fields.delete_if(&:blank?).join(separator)
  end
end
