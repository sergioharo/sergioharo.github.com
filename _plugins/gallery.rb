module Jekyll

  class PhotoGalleryTag < Liquid::Block
    include Convertible
    attr_accessor :content, :data

    def initialize(tag_name, markup, tokens)
      super
    end

    def render(context)
      site = context.registers[:site]
      page = context.environments.first["page"]

      photos = page['photosDir']
      thumbs = 'thumbs'
      photos_dir = File.join(site.source, photos)
      thumbs_dir = File.join(photos_dir, thumbs)

      context.registers[:gallery] ||= Hash.new(0)

      files = Dir[File.join(photos_dir, "*.{jpg,png,gif}")]
      files.sort! {|x,y| x.length == y.length ? x <=> y : x.length <=> y.length }
      length = files.length
      result = []

      context.stack do
        files.each_with_index do |filename, index|
          basename = File.basename(filename)
          url  = File.join('/', photos, basename)
          thumbnail = File.join('/', photos, thumbs, basename)

          context['file'] = {
            'name' => basename,
            'url' => url,
            'thumb' => thumbnail
          }

          context['forloop'] = {
            'name' => 'PhotoGallery',
            'length' => length,
            'index' => index + 1,
            'index0' => index,
            'rindex' => length - index,
            'rindex0' => length - index - 1,
            'first' => (index == 0),
            'last' => (index == length - 1)
          }

          result << render_all(@nodelist, context)
        end
      end
      result
    end

  end

end

Liquid::Template.register_tag('PhotoGallery', Jekyll::PhotoGalleryTag)
