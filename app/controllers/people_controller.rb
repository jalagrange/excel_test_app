class PeopleController < ApplicationController
  # GET /people
  # GET /people.json
  def index
    @people = Person.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @people }
    end
  end

  # GET /people/1
  # GET /people/1.json
  def show
    @person = Person.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @person }
    end
  end

  # GET /people/new
  # GET /people/new.json
  def new
    @person = Person.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @person }
    end
  end

  # GET /people/1/edit
  def edit
    @person = Person.find(params[:id])
  end

  # POST /people
  # POST /people.json
  def create
    @person = Person.new(params[:person])

    respond_to do |format|
      if @person.save
        format.html { redirect_to @person, notice: 'Person was successfully created.' }
        format.json { render json: @person, status: :created, location: @person }
      else
        format.html { render action: "new" }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /people/1
  # PUT /people/1.json
  def update
    @person = Person.find(params[:id])

    respond_to do |format|
      if @person.update_attributes(params[:person])
        format.html { redirect_to @person, notice: 'Person was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @person = Person.find(params[:id])
    @person.destroy

    respond_to do |format|
      format.html { redirect_to people_url }
      format.json { head :ok }
    end
  end

  def load_from_excel

  end

  def upload

  end
  
  def upload_ajax

  end
   
  def save_many_people
    
  end

  def store_excel_file
    #raise params.to_yaml
    #binding.pry
    test_file = params[:excel_file]
    @name = test_file.original_filename
    file = FileUploader.new
    if file.store!(test_file)
      render action: "process_excel_file"
    end

  end


  def store_excel_file_ajax
    #raise params.to_yaml
    #binding.pry
    test_file = params[:excel_file]
    @name = test_file.original_filename
    file = FileUploader.new
    if file.store!(test_file)
      render action: "process_excel_file"
    end

  end
  
  def parse_save_from_excel
    test_file = params[:excel_file]
    file = FileUploader.new
    file.store!(test_file)
    book = Spreadsheet.open "#{file.store_path}"
    sheet1 = book.worksheet 0
    @people = []
    sheet1.each 1 do |row|
      p = Person.new
      p.first_name = row[0]
      p.last_name = row[1]
      p.age = row[2]
      @people << p
    end
    file.remove!
  end

  def upload_and_validate
    test_file = params[:excel_file]
    file = FileUploader.new
    file.store!(test_file)
    book = Spreadsheet.open "#{file.store_path}"
    sheet1 = book.worksheet 0
    @people = []
    @errors = Hash.new
    @counter = 0
    
    sheet1.each 1 do |row|
      @counter+=1
      p = Person.new
      p.first_name = row[0]
      p.last_name = row[1]
      p.age = row[2]
      if p.valid?
        @people << p
      else
        @errors["#{@counter+1}"] = p.errors
      end
    end
    file.remove!
  end
  
  def upload_select_column
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
        p.save
      else
        @errors["#{@counter+1}"] = p.errors
      end
    end
  end
  
  def load_from_excel_select_column
    
  end
  
  def parse_save_from_excel_select_column
    
    @photo = Photo.new(params[:photo])
     if @photo.save
       book = nil
       open @photo.image_url do |f|
         book = Spreadsheet.open f
       end
     sheet1 = book.worksheet 0
     @title_columns = []
      num_column = 0
      sheet1.first.each do |row|
        @title_columns << [row, num_column]
        num_column = num_column + 1
      end
      
       respond_to do |format|
         format.html { redirect_to [@photo], :notice => 'Photo successfully created' }
         format.js
       end
     else
       render :new 
     end
      
  end

  def delayed_job
    Person.delay(priority: 28).delayed_job("Nakarid")
    redirect_to upload_people_path(), notice: "Delivering newsletter."
  end
  
end
