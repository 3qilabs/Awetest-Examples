module BootcampLibrary

  def run
    @timestamp = Time.now.strftime("%Y%m%d%H%M%S")
    get_variables(@xls_path, :role)
    set_login

    browser = open_browser
    go_to_url(browser, @url)
    log_in(browser)
    run_test(browser)
    sign_out(browser)
    logout(browser)
  end

  def set_login
    @login.each_key do |key|
      if @login[key]['enabled'] == 'Y'
        @user = @login[key]['userid']
        @pass = @login[key]['password']
        @role = @login[key]['role']
        @url  = @login[key]['url']
        debug_to_report("@user: #{@user}, @pass: #{@pass}, @role: #{@role}")
        break
      end
    end
  end

  def log_in(browser)
    set_text_field(browser, :name, 'lid', @user)
    set_text_field(browser, :name, 'pwd', @pass)
    click(browser, :button, :value, 'Sign In')
    sleep(2)
  end

  def navigate_to_accounts_in_crm(browser)
    mark_test_level()
    click(browser, :link, :title, 'CRM Software')
    sleep_for(2)
    click(browser, :link, :id, 'tab_Accounts')
    sleep_for(2)
  end

  def open_new_account(browser, acct_name)
    mark_test_level()
    click(browser, :button, :value, 'New Account')
    sleep_for(2)
    set_text_field(browser, :name, /Account Name/, acct_name)
  end

  def verify_account_saved(browser, acct_name)
    mark_test_level()
    element_contains_text?(browser, :span, :id, 'value_Account Name', acct_name)
    sleep_for(2)
    click(browser, :link, :id, 'tab_Accounts')
    sleep_for(2)
    validate_text(browser, acct_name)
    sleep_for(2)
  end

  def delete_account(browser, acct_name)
    mark_test_level()
    click(browser, :link, :text, acct_name)
    sleep_for(2)
    click_no_wait(browser, :button, :name, 'Delete2')
    close_modal(browser, "Message from webpage")
  end

  def sign_out(browser)
    mark_test_level()
    click(browser, :button, :value, 'Sign Out')
    sleep(4)
  end

end
