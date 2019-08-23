ActiveAdmin.register Run do

 permit_params :date_of_run, :training_week, :miles_planned, :miles_actual, :treadmill_incline, :run_duration_minutes, :run_duration_seconds, :actual_pace, :location_id, :notes, :user_id, :shoe_id
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
