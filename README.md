# Git Marked

Preview [GitHub Flavored Markdown][ghfm] using the [Marked app][marked] for Mac (_adapted from [alampros/Docter][docter]_).

## Requirements:

* [Ruby][ruby]
* [Rubygems][gems]
* [RedCarpet _(1.17.2)_][redcarpet]
* [Albino][albino]
* [Nokogiri][nokogiri]
* [Pygments][pygments]

If you have Ruby and Rubygems:

```bash
gem install redcarpet --version=1.17.2
gem install albino nokogiri
sudo easy_install pygments
```
## Installation

```bash
git clone https://github.com/johnmdonahue/git_marked
```
In Marked preferences:

1. Behavior > Advanced > Custom Markdown Processor: `/Users/[your path]/git_marked/gfm.rb`
2. Style tab: Add the included `gfm.css` as a "Custom CSS"

## Gotchas
* Marked uses the system install of ruby. If you use a version manager like [RVM][rvm] or [rbenv][rbenv], you will need to make sure that the gems are installed for the **System version** and not your shell version.
* If you are having trouble with pygments you may need to link it:

```bash
ln -s /usr/local/bin/pygmentize /usr/bin
```

## What This Adds to Marked
Strikethru: ~~Woot!~~

Fenced codeblocks with syntax highlighting via [`pygments`][pygments]

```ruby
require 'redcarpet'
def markdown(text)
  options = [:fenced_code,:generate_toc,:hard_wrap,:no_intraemphasis,:strikethrough,:gh_blockcode,:autolink,:xhtml,:tables]
  html = Redcarpet.new(text, *options).to_html 
  syntax_highlighter(html)
end
```

Auto-linking: www.auto-linking.com

Tables:

| First Header  | Second Header |
| ------------- | ------------- |
| Content Cell  | Content Cell  |
| Content Cell  | Content Cell  |

## Screenshot
![Screenshot][screenshot]



[docter]: https://github.com/alampros/Docter
[ghfm]: http://github.github.com/github-flavored-markdown/ "Github Flavored Markdown"
[redcarpet]: https://github.com/tanoku/redcarpet
[albino]: https://github.com/github/albino
[nokogiri]: https://github.com/tenderlove/nokogiri
[pygments]: http://pygments.org/
[marked]: http://markedapp.com/
[ruby]: http://www.ruby-lang.org/en/downloads/
[gems]: http://rubygems.org/
[rvm]: http://beginrescueend.com/
[rbenv]: https://github.com/sstephenson/rbenv
[screenshot]: http://dl.dropbox.com/u/3290198/github/marked.jpg
