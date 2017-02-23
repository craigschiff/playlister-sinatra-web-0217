
module Slugify
  module ClassMethods
    def find_by_slug(slug)
       unslug = slug.split('-').map {|word| word }.join(' ')
       found = self.where("lower(name) = \'#{unslug}\'").first
    end
  end
  module InstanceMethods
     def slug
       name.split(' ').join('-').downcase
     end
  end
end

# def slugify(title)
#   slug = title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
# end
