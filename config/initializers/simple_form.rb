# frozen_string_literal: true
#
# Use this setup block to configure all options available in SimpleForm.
SimpleForm.setup do |config|
  # Wrappers are used by the form builder to generate a complete input.
  # This default wrapper is custom-tailored to implement our premium Tailwind CSS input design.
  config.wrappers :default, class: 'mb-5 text-left', hint_class: 'has-hint', error_class: 'has-error' do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :minlength
    b.optional :pattern
    b.optional :min_max
    b.optional :readonly

    # Premium slate label styling
    b.use :label, class: 'block text-xs font-semibold text-slate-500 mb-2 pl-1 uppercase tracking-wider'
    
    # Premium glassmorphic input styling
    b.use :input, class: 'w-full px-5 py-4 border border-slate-200 rounded-2xl text-[0.95rem] text-slate-800 bg-white placeholder-slate-400 focus:outline-none focus:border-slate-900 focus:ring-4 focus:ring-slate-100 transition-all duration-200'
    
    # Polished micro-level feedback
    b.use :error, wrap_with: { tag: :span, class: 'block text-xs font-semibold text-rose-600 mt-2 pl-1' }
    b.use :hint,  wrap_with: { tag: :span, class: 'block text-xs text-slate-400 mt-1 pl-1' }
  end

  # Custom wrapper specifically for checkboxes and booleans
  config.wrappers :boolean, tag: 'div', class: 'flex items-start mb-5', error_class: 'has-error' do |b|
    b.use :html5
    b.optional :readonly
    
    b.wrapper tag: 'div', class: 'flex items-center h-5' do |ba|
      ba.use :input, class: 'h-4 w-4 rounded border-slate-300 text-slate-900 focus:ring-slate-500'
    end
    
    b.wrapper tag: 'div', class: 'ml-3 text-sm' do |bb|
      bb.use :label, class: 'font-semibold text-slate-700 cursor-pointer'
      bb.use :hint,  wrap_with: { tag: :span, class: 'block text-xs text-slate-400 mt-1' }
      bb.use :error, wrap_with: { tag: :span, class: 'block text-xs text-rose-600 mt-1' }
    end
  end

  # Configs
  config.default_wrapper = :default
  config.boolean_style = :nested
  
  # Premium matching slate buttons
  config.button_class = 'inline-flex items-center justify-center px-6 py-3 border border-transparent text-base font-semibold rounded-2xl text-white bg-slate-900 hover:bg-slate-800 active:bg-slate-950 shadow-md hover:shadow-lg active:shadow-sm focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-slate-500 transition-all duration-200 cursor-pointer'
  
  config.error_notification_tag = :div
  config.error_notification_class = 'mb-6 p-4 text-sm text-rose-800 rounded-2xl bg-rose-50 border border-rose-100 shadow-sm'
  config.browser_validations = false
  config.boolean_label_class = 'checkbox'
end
