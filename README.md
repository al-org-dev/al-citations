# Al-Citations

A Jekyll plugin that allows you to fetch and display citation counts from Google Scholar and InspireHEP in your Jekyll site.

## Installation

Add this line to your Jekyll site's Gemfile:

```ruby
gem 'al_citations'
```

And then execute:

```bash
$ bundle install
```

## Usage

1. Add the plugin to your site's `_config.yml`:

```yaml
plugins:
  - al_citations
```

2. Use the tags in your templates:

For Google Scholar:
```liquid
{% google_scholar_citations scholar_id article_id %}
```

For InspireHEP:
```liquid
{% inspirehep_citations recid %}
```

### Example

```liquid
Citations: {% google_scholar_citations "YOUR_SCHOLAR_ID" "ARTICLE_ID" %}
InspireHEP Citations: {% inspirehep_citations "INSPIRE_RECID" %}
```

## Development

After checking out the repo, run `bundle install` to install dependencies.

## Contributing

Bug reports and pull requests are welcome on GitHub.