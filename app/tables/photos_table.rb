class PhotosTable < TableCloth::Base
  column :filename do |photo|
    image_tag photo.filename, size: '100x100'
  end

  column :caption

  actions separator: ' - ' do 
    actions do |photo|
      link_to 'Edit Photo', edit_photo_path(photo)
    end

 
    action do |photo|
      link_to 'Add Comment', new_photo_comment_path(photo)
    end

     action do |photo|
      if photo.comments.any?
      link_to 'View All Comments', photo_comments_path(photo)
    end
    end
  end

  config.table.class = "table table-bordered"


  # Define columns with the #column method
  # column :name, :email

  # Columns can be provided a block
  #
  # column :name do |object|
  #   object.downcase
  # end
  #
  # Columns can also have conditionals if you want.
  # The conditions are checked against the table's methods.
  # As a convenience, the table has a #view method which will return the current view context.
  # This gives you access to current user, params, etc...
  #
  # column :email, if: :admin?
  #
  # def admin?
  #   view.current_user.admin?
  # end
  #
  # Actions give you the ability to create a column for any actions you'd like to provide.
  # Pass a block with an arity of 2, (object, view context).
  # You can add as many actions as you want.
  # Make sure you include the actions extension.
  #
  # actions do
  #   action {|object| link_to "Edit", edit_object_path(object) }
  #   action(if: :valid?) {|object| link_to "Invalidate", invalidate_object_path(object) }
  # end
  #
  # If action provides an "if:" option, it will call that method on the object. It can also take a block with an arity of 1.
end
