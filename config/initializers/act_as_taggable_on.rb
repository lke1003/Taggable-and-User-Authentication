require Rails.root.join 'lib', 'my_parser.rb'

ActsAsTaggableOn.default_parser = MyParser