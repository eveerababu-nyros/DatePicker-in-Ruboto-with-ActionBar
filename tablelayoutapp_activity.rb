require 'ruboto/widget'
require 'ruboto/util/toast'

java_import "android.graphics.Color"
java_import "android.view.Gravity"

ruboto_import_widgets :Button, :TextView, :TableLayout, :TableRow, :ImageButton, :LinearLayout, :RelativeLayout, :ScrollView

class TablelayoutappActivity
	def onCreate(bundle)
	    super
	    set_title 'Inquiries'

						#Heading Layout 
		title_layout = relative_layout(:background_color => android.graphics.Color.parse_color("#FF7791A8"), :padding => [10,10,10,10] ) do
		next_btn = button :text => "Inquiries", 
				:text_size => 12,
				:id => 1,
				:text_color => Color::WHITE,
				:layout => {:left_margin= => 20,
							:width= => :wrap_content,
							:height= => 40,
							:right_margin= => 20,
							:top_margin= => 10
				},
				:on_click_listener => proc { goto_inquiries_activity }, 
				:padding => [5,5,5,5],
				:background_resource => Ruboto::R::drawable::my_btn
		tv = text_view :text => 'Available', 
				:id => 2,
				:text_size => 18.0, 
				:layout => {:add_rule => [:right_of, next_btn.id],
							:top_margin= => 2, 
							:width= => 300,
							:left_margin= => 100
				}, 
				:padding => [10,10,0,0],
				:text_color => android.graphics.Color::GREEN 
		prev_btn = button :text => "Quote", 
				:text_size => 12,
				:id => 3,
				:layout => {:add_rule => [:right_of, tv.id],
							:width= => :wrap_content,
							:height= => 40,
							:left_margin= => 25,
							:top_margin= => 10
				},
				:on_click_listener => proc { goto_quote_activity },
				:padding => [5,5,5,5],
				:background_resource => Ruboto::R::drawable::edit_btn_style
				 
	end


				#Middle Body Layout
		tl = scroll_view :background_color => Color.parse_color("#FFC4CBD1") do
		linear_layout :background_color => Color.parse_color("#FFC4CBD1"), 
			 :padding => [10,10,10,10], 
			 :orientation => :vertical,
			 :height => :fill_parent do
			table_layout :background_color => Color.parse_color("#FFC4CBD1"), :padding => [10,10,10,10] do
				table_row :background_resource => Ruboto::R::drawable::my_bg, :gravity => :center, :layout => { :top_margin= => 5}  do
					table_row  :layout => {:width= => 200,
											:height= => 70 }  do
						@guest = text_view :text => "Guest", 
								:text_color => Color::BLACK,
								:width => :wrap_content,
								:layout => { :top_margin= => 12 }
								
						end
					table_row :layout => {:width= => 300,
											:height= => 70 }do
						@guest_value = text_view :text => "Theressa French",
								:text_color => Color::BLACK,
								:width => :wrap_content,
								:layout => { :top_margin= => 12 }
								
					end
				end
				table_row :background_resource => Ruboto::R::drawable::my_bg, :gravity => :center, :layout => { :top_margin= => 5}  do
					table_row :layout => {:width= => 200,
											:height= => 70 } do
						@check_in = text_view :text => "Check In",
									:text_color => Color::BLACK,
									:width => :wrap_content,
									:layout => { :top_margin= => 12 }
					end
					table_row :layout => {:width= => 300,
											:height= => 70 } do
						@check_in_date = text_view :text => "Jul 9, 2013",
									:text_color => Color::BLACK,
									:width => :wrap_content,
									:layout => { :top_margin= => 12, :right_margin= => 20 }
						@check_in_button = image_button :image_resource => Ruboto::R::drawable::next_btn,
									:background_color => Color::WHITE,
									:on_click_listener => (proc { |view| check_in_date(view) })
					end
				end
				table_row :background_resource => Ruboto::R::drawable::my_bg, :gravity => :center, :layout => { :top_margin= => 5} do
					table_row :layout => {:width= => 200,
											:height= => 70 } do
						@check_out = text_view :text => "Check Out",
									:text_color => Color::BLACK,
									:width => :wrap_content,
									:layout => { :top_margin= => 12 }
					end
					table_row :layout => {:width= => 300,
											:height= => 70 } do
						@check_out_date = text_view :text => "Aug 10, 2013",
									:text_color => Color::BLACK,
									:width => :wrap_content,
									:layout => { :top_margin= => 12, :right_margin= => 20}
						@check_out_button = image_button :image_resource => Ruboto::R::drawable::next_btn,
									:background_color => Color::WHITE,
									:on_click_listener => (proc { |view| check_out_date(view) })
					end
				end
				table_row :background_resource => Ruboto::R::drawable::my_bg, :gravity => :center, :layout => { :top_margin= => 5} do
					table_row :layout => {:width= => 200,
											:height= => 70 } do
						@night = text_view :text => "#Night",
									:text_color => Color::BLACK,
									:width => :wrap_content,
									:layout => { :top_margin= => 12 }
					end
					table_row :layout => {:width= => 300,
											:height= => 70 } do
						@night_value = text_view :text => "0",
									:text_color => Color::BLACK,
									:width => :wrap_content,
									:layout => { :top_margin= => 12 }
					end
				end
				table_row :background_resource => Ruboto::R::drawable::my_bg, :gravity => :center, :layout => { :top_margin= => 5} do
					table_row :layout => {:width= => 200,
											:height= => 70 } do
						@guests = text_view :text => "Guests",
									:text_color => Color::BLACK,
									:width => :wrap_content,
									:layout => { :top_margin= => 12, :right_margin= =>10 }
						@guests_values = text_view :text => "2",
									:text_color => Color::BLACK,
									:width => :wrap_content,
									:layout => { :top_margin= => 12 }
					end
					table_row :layout => {:width= => 300,
											:height= => 70 } do
						@adults = text_view :text => "Adults",
									:text_color => Color::BLACK,
									:width => :wrap_content,
									:layout => { :top_margin= => 12, :right_margin= => 10 }
						@adults_value = text_view :text => "0",
									:text_color => Color::BLACK,
									:width => :wrap_content,
									:layout => { :top_margin= => 12, :right_margin= => 10 }
						@children = text_view :text => "Children",
									:text_color => Color::BLACK,
									:width => :wrap_content,
									:layout => { :top_margin= => 12 }
					end
				end

				table_row :background_resource => Ruboto::R::drawable::my_bg, :gravity => :center, :layout => { :top_margin= => 5}  do
					table_row  :layout => {:width= => 200,
											:height= => 70 }  do
						@email = text_view :text => "Email", 
								:text_color => Color::BLACK,
								:width => :wrap_content,
								:layout => { :top_margin= => 12 }
								
						end
					table_row :layout => {:width= => 300,
											:height= => 70 }do
						@email_value = text_view :text => "theressafrench@gmail.com",
								:text_color => Color::BLACK,
								:width => :wrap_content,
								:layout => { :top_margin= => 12 }
								
					end
				end

				table_row :background_resource => Ruboto::R::drawable::my_bg, :gravity => :center, :layout => { :top_margin= => 5}  do
					table_row  :layout => {:width= => 200,
											:height= => 70 }  do
						@phone = text_view :text => "Phone", 
								:text_color => Color::BLACK,
								:width => :wrap_content,
								:layout => { :top_margin= => 12 }
								
						end
					table_row :layout => {:width= => 300,
											:height= => 70 }do
						@phone_value = text_view :text => "702-555-5683",
								:text_color => Color::BLACK,
								:width => :wrap_content,
								:layout => { :top_margin= => 12 }
								
					end
				end
				table_row :background_resource => Ruboto::R::drawable::my_bg, :gravity => :center, :layout => { :top_margin= => 5}  do
					table_row  :layout => {:width= => 200,
											:height= => 70 }  do
						@comments = text_view :text => "Comments", 
								:text_color => Color::BLACK,
								:width => :wrap_content,
								:layout => { :top_margin= => 12 }
								
						end
					table_row  :layout => {:width= => 300,
											:height= => 70 }  do
						
								
						end
				end
		end  #Table Layout completed
			button :text => "Edit",
					:background_resource => Ruboto::R::drawable::edit_btn_style,
					:layout => { :top_margin= => 12, 
								 :width= => :fill_parent,
								 :left_margin= => 20,		
								 :right_margin= => 20,
								 :bottom_margin= => 10  },
					:on_click_listener => (proc {|view| editing_details(view)})
		end
	end
					#Creating Footer Layout (Action Bar)
				
		setContentView(tl)
		getActionBar().setDisplayOptions(android.app.ActionBar::DISPLAY_SHOW_CUSTOM)
		getActionBar().setCustomView(title_layout)

			#Creating Time values
		t = Time.now
		@mYear = t.year
		@mMonth = t.month
		@mDay = t.day
	end

			#Method to invoke Action bar (Menu items)
	def on_create_options_menu(menu)
			m1 = menu.add('Dashboard')
		    m1.set_icon Ruboto::R::drawable::info
		    m1.set_show_as_action 2
		    m1.set_on_menu_item_click_listener do |menu_item|
			  toast menu_item.title
			  true # Prevent other listeners from executing.
		    end

		    m2 = menu.add('Properties')
		    m2.set_icon Ruboto::R::drawable::prop
		    m2.set_show_as_action 2
		    m2.set_on_menu_item_click_listener do |menu_item|
				toast menu_item.title
				true # Prevent other listeners from executing.
		    end

		    m3 = menu.add('Settings')
		    m3.set_icon Ruboto::R::drawable::settings
		    m3.set_show_as_action 2
		    m3.set_on_menu_item_click_listener do |menu_item|
				toast menu_item.title
				true # Prevent other listeners from executing.
		    end

		    m4 = menu.add('More')
		    m4.set_icon Ruboto::R::drawable::more
		    m4.set_show_as_action 2
		    m4.set_on_menu_item_click_listener do |menu_item|
				toast menu_item.title
				true # Prevent other listeners from executing.
		    end
		 true # Display the menu.
	end

			#Event Handling Methods
	def goto_inquiries_activity
			toast "Going to Inquiries Activity"
	end

	def goto_quote_activity
			toast "Going to Quote Activity"
	end

	def editing_details(view)
		toast view.getText
	end

	def check_in_date(view)
		showDialog(0)
	end
	
	def check_out_date(view)
		showDialog(1)
	end

	def onCreateDialog(id, view)
			datePicker = GettingDatePicker.new(self, @check_in_date, @check_out_date, id)
		case id
			when 0
				return android.app.DatePickerDialog.new(self,  datePicker, @mYear, @mMonth, @mDay)
			when 1
				return android.app.DatePickerDialog.new(self,  datePicker, @mYear, @mMonth, @mDay)
		end
		return nil
	end

	

end	

class GettingDatePicker
		include android.app.DatePickerDialog::OnDateSetListener
	def initialize(activity, check_in_date, check_out_date, idvalue)
		@activity = activity
		@check_in = check_in_date
		@check_out = check_out_date
		@idvalue = idvalue
	end

   	def onDateSet(view, yy, mm, dd) 
			t = Time.new(yy,mm+1,dd)
			puts yy
			mm = t.strftime("%b")
			puts t.strftime("%b")
			puts dd
			updateDisplay(mm,dd,yy)
	end
	
	def updateDisplay(mon, day, year) 
		case @idvalue
			when 0
			@check_in.setText(java.lang.StringBuilder.new().append(mon).append(" ").append(day).append(",").append(year))
			when 1
			@check_out.setText(java.lang.StringBuilder.new().append(mon).append(" ").append(day).append(",").append(year))
		end
	end
end		
