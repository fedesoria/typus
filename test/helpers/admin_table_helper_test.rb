require 'test/helper'

class AdminTableHelperTest < ActiveSupport::TestCase

  include AdminTableHelper
  include ActionView::Helpers::UrlHelper

  def test_build_typus_table
    assert true
  end

  def test_typus_table_header
    assert true
  end

  def test_typus_table_belongs_to_field

    comment = comments(:without_post_id)
    output = typus_table_belongs_to_field('post', comment)
    expected = <<-HTML
<td></td>
    HTML

    assert_equal expected, output

  end

  def test_typus_table_has_and_belongs_to_many_field
    assert true
  end

  def test_typus_table_string_field

    post = posts(:published)
    output = typus_table_string_field(:title, post, :created_at)
    expected = <<-HTML
<td>#{post.title}</td>
    HTML

    assert_equal expected, output

  end

  def test_typus_table_tree_field

    page = pages(:published)
    output = typus_table_tree_field('test', page)
    expected = <<-HTML
<td></td>
    HTML

    assert_equal expected, output

    page = pages(:unpublished)
    output = typus_table_tree_field('test', page)
    expected = <<-HTML
<td>Page#1</td>
    HTML

    assert_equal expected, output

  end

  def test_typus_table_position_field
    assert true
  end

  def test_typus_table_datetime_field

    post = posts(:published)
    Time::DATE_FORMATS[:post_short] = '%m/%y'

    output = typus_table_datetime_field(:created_at, post)
    expected = <<-HTML
<td>11/07</td>
    HTML

    assert_equal expected, output

  end

  def test_typus_table_boolean_field

    Typus::Configuration.options[:icon_on_boolean] = false
    Typus::Configuration.options[:toggle] = false

    post = posts(:published)
    output = typus_table_boolean_field(:status, post)
    expected = <<-HTML
<td align="center">True</td>
    HTML

    assert_equal expected, output

    post = posts(:unpublished)
    output = typus_table_boolean_field(:status, post)
    expected = <<-HTML
<td align="center">False</td>
    HTML

    assert_equal expected, output

  end

end