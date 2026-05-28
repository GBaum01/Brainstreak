# frozen_string_literal: true
#
# Use this setup block to configure all options available in SimpleForm.
SimpleForm.setup do |config|
  # Wrappers are used by the form builder to generate a complete input.
  # This default wrapper is custom-tailored to implement the standard Tailwind UI Stacked Form style.
  config.wrappers :default, class: 'mb-6 text-left', hint_class: 'has-hint', error_class: 'has-error' do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :minlength
    b.optional :pattern
    b.optional :min_max
    b.optional :readonly

    # Standard Tailwind UI Label style
    b.use :label, class: 'block text-sm font-medium leading-6 text-slate-900 mb-2 pl-0.5'
    
    # Standard Tailwind UI Input ring style
    b.use :input, class: 'block w-full rounded-lg border-0 py-2.5 px-3.5 text-slate-900 shadow-sm ring-1 ring-inset ring-slate-300 placeholder:text-slate-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6 transition-all duration-200 bg-white'
    
    # Standard Tailwind UI error and hint styles
    b.use :error, wrap_with: { tag: :span, class: 'block mt-2 text-sm text-red-600 font-medium pl-0.5' }
    b.use :hint,  wrap_with: { tag: :span, class: 'block mt-2 text-sm text-slate-500 pl-0.5' }
  end

  # Custom wrapper specifically for checkboxes and booleans
  config.wrappers :boolean, tag: 'div', class: 'flex items-start mb-6', error_class: 'has-error' do |b|
    b.use :html5
    b.optional :readonly
    
    b.wrapper tag: 'div', class: 'flex items-center h-6' do |ba|
      ba.use :input, class: 'h-4 w-4 rounded border-slate-300 text-indigo-600 focus:ring-indigo-500 cursor-pointer'
    end
    
    b.wrapper tag: 'div', class: 'ml-3 text-sm leading-6' do |bb|
      bb.use :label, class: 'font-medium text-slate-900 cursor-pointer'
      bb.use :hint,  wrap_with: { tag: :span, class: 'block text-sm text-slate-500' }
      bb.use :error, wrap_with: { tag: :span, class: 'block text-sm text-red-600 font-medium' }
    end
  end

  # Configs
  config.default_wrapper = :default
  config.boolean_style = :nested
  
  # Tailwind UI primary button style
  config.button_class = 'rounded-lg bg-indigo-600 px-4 py-2.5 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600 cursor-pointer transition-all duration-200'
  
  config.error_notification_tag = :div
  config.error_notification_class = 'mb-6 rounded-lg bg-red-50 p-4 border border-red-100'
  config.browser_validations = false
  config.boolean_label_class = 'checkbox'
end
