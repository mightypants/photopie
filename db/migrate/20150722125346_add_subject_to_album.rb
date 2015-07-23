class AddSubjectToAlbum < ActiveRecord::Migration
  def change
    add_column "albums", "is_pie_album", :boolean, default: 1
    add_column "albums", "subject_first", :string
    add_column "albums", "subject_middle", :string
    add_column "albums", "subject_last", :string
    add_column "albums", "subject_dob", :date
  end
end
