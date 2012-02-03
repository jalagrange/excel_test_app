ExcelTestApp::Application.routes.draw do
  
  
  resources :people do
    get "load_from_excel", :on => :collection
    get "load_from_excel_select_column", :on => :collection
    get "upload",  :on => :collection
    get "upload_ajax",  :on => :collection
    get "save_many_people",  :on => :collection
    get "delayed_job", :on => :collection
    post "store_excel_file",  :on => :collection
    post "store_excel_file_ajax",  :on => :collection
    post "parse_save_from_excel",  :on => :collection
    post "parse_save_from_excel_select_column",:on => :collection 
    post "upload_and_validate",  :on => :collection
    post "upload_select_column",  :on => :collection
    
  end

   root :to => 'people#index'
  
   resources :photos do
     post "hola", :on => :collection
     post "upload_select_column", :on => :member
   end
   
   
end
