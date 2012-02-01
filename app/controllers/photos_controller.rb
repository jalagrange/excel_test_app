class PhotosController < ApplicationController
  
def show
end

def new
end

def edit
end

def create
end

def hola
  @photo = Photo.new(params[:photo])
   if @photo.save
     respond_to do |format|
       format.html { redirect_to [@photo], :notice => 'Photo successfully created' }
       format.js
     end
   else
     render :new
   end
end


def update
  if @photo.update_attributes(params[:photo])
    redirect_to [@photo], :notice => 'Photo successfully updated'
  else
    render :edit
  end
end

def destroy
  @photo.destroy
  redirect_to @story
end

def upload_select_column
  @photo = Photo.find(params[:id])
  first_name  = params[:name].to_i
  last_name = params[:last_name].to_i
  age = params[:age].to_i
  book = nil
  open @photo.image_url do |f|
    book = Spreadsheet.open f
  end
  sheet1 = book.worksheet 0
  @people = []
  @errors = Hash.new
  @counter = 0
  sheet1.each 1 do |row|
    @counter+=1
    p = Person.new
    p.first_name = row[first_name]
    p.last_name = row[last_name]
    p.age = row[age]
    if p.valid?
      @people << p
    else
      @errors["#{@counter+1}"] = p.errors
    end
  end
  @people.each { |p| p.save } if @errors.empty?
end

end

