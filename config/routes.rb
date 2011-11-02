ExcelTestApp::Application.routes.draw do
  
  
  resources :people do
    get "load_from_excel", :on => :collection
    get "upload",  :on => :collection
    post "store_excel_file",  :on => :collection
    post "parse_save_from_excel",  :on => :collection
  end

   root :to => 'people#index'
  
end
