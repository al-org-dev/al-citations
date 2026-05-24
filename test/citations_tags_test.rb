require 'minitest/autorun'
require 'liquid'
require 'stringio'

require_relative '../lib/al_citations'

class AlCitationsTagsTest < Minitest::Test
  def setup
    Jekyll::GoogleScholarCitationsTag::Citations.clear
    Jekyll::InspireHEPCitationsTag::Citations.clear
  end

  def render_google(vars)
    template = Liquid::Template.parse('{% google_scholar_citations scholar_id article_id %}')
    template.render(vars)
  end

  def render_inspire(vars)
    template = Liquid::Template.parse('{% inspirehep_citations recid_var %}')
    template.render(vars)
  end

  def with_singleton_method_stub(object, method_name, replacement)
    original = object.method(method_name)
    object.define_singleton_method(method_name, replacement)
    yield
  ensure
    object.define_singleton_method(method_name, original)
  end

  def test_google_scholar_parses_citation_count_from_meta_description
    html = '<html><head><meta name="description" content="Something. Cited by 1,234"></head></html>'

    with_singleton_method_stub(Kernel, :rand, ->(*) { 0 }) do
      with_singleton_method_stub(URI, :open, ->(*_args) { StringIO.new(html) }) do
        output = render_google('scholar_id' => 'abc', 'article_id' => 'def')

        assert_match(/K|1,234|1234/, output)
      end
    end
  end

  def test_google_scholar_uses_cache_after_first_call
    html = '<html><head><meta property="og:description" content="Cited by 15"></head></html>'
    calls = 0

    with_singleton_method_stub(Kernel, :rand, ->(*) { 0 }) do
      with_singleton_method_stub(URI, :open, ->(*_args) { calls += 1; StringIO.new(html) }) do
        first = render_google('scholar_id' => 'a', 'article_id' => 'b')
        second = render_google('scholar_id' => 'a', 'article_id' => 'b')

        assert_equal first, second
        assert_equal 1, calls
      end
    end
  end

  def test_inspirehep_formats_response
    payload = {
      'hits' => {
        'hits' => [
          { 'metadata' => { 'citation_count' => 1532 } }
        ]
      }
    }

    with_singleton_method_stub(Net::HTTP, :get, ->(*) { payload.to_json }) do
      output = render_inspire('recid_var' => '12345')

      assert_match(/K|1532/, output)
    end
  end

  def test_inspirehep_returns_na_on_error
    with_singleton_method_stub(Net::HTTP, :get, ->(*) { raise StandardError, 'network down' }) do
      output = render_inspire('recid_var' => '99999')

      assert_equal 'N/A', output
    end
  end
end
