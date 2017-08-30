module ApplicationHelper
  # Adds a sortable column to the header of any table.
  # example:
  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "ASC" ? "DESC" : "ASC"
    link_to title, {:sort => column, :direction => direction}, {:class => css_class}
  end

  # Menu and Action Icons helper
  def menu_button(link_name = nil, link_action = nil, icon_class = nil, button_class = nil)
    if button_class == nil
      button_class = "btn btn-large btn-inverse btn-block"
    end
    "<a href='#{link_action}' class='#{button_class}'><i class='#{icon_class}'></i> #{link_name}</a>".html_safe

  end
# Help Icon Linkhelper
  def help_button(help_page = nil)

    "<a href='/help/#{help_page}', target='_blank'><i class='icon-question-sign'></i></a>".html_safe

  end

#  TEXT Helpers
  def markdown(text)
    #rendered_text =text.gsub( /(\[([a-zA-Z0-9]{1,60})\:)+[a-zA-Z0-9]{2,60}\]/,'<a href='"/\2"'>Link</a>')
    interlinked = %r{([a-zA-Z0-9]{1,60}):([a-zA-Z0-9]{1,60})+}i
    rendered_text =text.gsub(interlinked, '<a href=' '/\1/\2' '>/\1/\2</a>')
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, with_toc_data:true)
    markdown.render(rendered_text).html_safe
  end
  # Shows markdown examples in a slide down div. The @inst_id is used to randomly generate a unique div id when
  # the link is displayed more then once on the same page
  def markdown_hint
    @inst_id = rand(1..10)
    render "layouts/markdown_examples"
  end

end

# <%= f.input :due_date, :as => :date_picker %>
module SimpleForm
  module Inputs
    class DatePickerInput < SimpleForm::Inputs::StringInput
      def input_html_options
        value = object.send(attribute_name)
        options = {
            value: value.nil? ? nil : I18n.localize(value),
            data: {behaviour: 'datepicker'} # for example
        }
        # add all html option you need...
        super.merge options
      end
    end
  end
end
