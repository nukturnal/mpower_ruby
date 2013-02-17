[![Code Climate](https://codeclimate.com/github/nukturnal/mpower_ruby.png)](https://codeclimate.com/github/nukturnal/mpower_ruby) [![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/nukturnal/mpower_ruby) [![Build Status](https://secure.travis-ci.org/nukturnal/mpower_ruby.png?branch=master)](https://travis-ci.org/nukturnal/mpower_ruby) [![Dependency Status](https://gemnasium.com/nukturnal/mpower_ruby.png)](https://gemnasium.com/nukturnal/mpower_ruby)

# Mpower Ruby Client API
========================
MPower Payments Ruby Client Library

## Offical Documentation
http://mpowerpayments.com/developers/docs/ruby.html

## Installation

Add this line to your application's Gemfile:

    gem 'mpower'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mpower

## Usage

## Setup your API Keys
If you are using rails you may create an file under `RAILS_ROOT/config/initializers` and put these setting there.

    MPower::Setup.master_key = "YOUR_API_MASTER_KEY"
    MPower::Setup.public_key = "YOUR_API_PUBLIC_KEY"
    MPower::Setup.private_key = "YOUR_API_PRIVATE_KEY"
    MPower::Setup.mode = "test|live"
    MPower::Setup.token = "YOUR_API_TOKEN"

## Setup your checkout store information
Configurations for checkout store are all optional. You may however want to set your Store Name and Tagline :)

    MPower::Checkout::Store.name = "NAME OF YOUR STORE"
    MPower::Checkout::Store.tagline = "STORE'S TAGLINE"
    MPower::Checkout::Store.postal_address = "STORE POSTAL ADDRESS"
    MPower::Checkout::Store.phone_number = "STORE CONTACT NUMBER"
    MPower::Checkout::Store.website_url = "STORE WEBSITE URL"
    MPower::Checkout::Store.logo_url = "LOGO URL"

Customer will be redirected back to this URL when he cancels the checkout on MPower website

    MPower::Checkout::Store.cancel_url = "CHECKOUT CANCEL URL"

MPower will automatically redirect customer to this URL after successfull payment.
This setup is optional and highly recommended you dont set it, unless you want to customize the payment experience of your customers.
When a returnURL is not set, MPower will redirect the customer to the receipt page.

    MPower::Checkout::Store.return_url = "CHECKOUT RETURN URL"

## Create your Checkout Invoice

    co = MPower::Checkout::Invoice.new

## Create your Onsite Payment Request Invoice

    co = MPower::Onsite::Invoice.new

Params for addItem function `add_item(name_of_item,quantity,unit_price,total_price,optional_description)`

    co.add_item("13' Apple Retina 500 HDD",1,999.99,999.99)
    co.add_item("Case Logic laptop Bag",2,100.50,201,"My optional item description")
    co.add_item("Mordecai's Bag",2,100.50,400)

## Set the total amount to be charged ! Important

    co.total_amount = 1200.99

## Setup Tax Information (Optional)

    co.add_tax("VAT (15)",50);
    co.add_tax("NHIL (10)",50);

## You can add custom data to your invoice which can be called back later

    co.add_custom_data("Firstname","Alfred")
    co.add_custom_data("Lastname","Rowe")
    co.add_custom_data("CartId",929292872)

## Redirecting to your checkout invoice page

		if co.create
			redirect_to co.invoice_url
		else
			@message = co.response_text
		end

## Onsite Payment Request(OPR) Charge
First step is to take the customers mpower account alias, this could be the phoneno, username or mpower account number.
pass this as a param for the `create` action of the `MPower::Onsite::Invoice` class instance. MPower will return an OPR TOKEN after the request is successfull. The customer will also receieve a confirmation TOKEN.
        
        if co.create("CUSTOMER_MPOWER_USERNAME_OR_PHONE")
            @opr_token = co.token
        else
            @message = co.response_text
        end

Second step requires you to accept the confirmation TOKEN from the customer, add your OPR Token and issue the charge. Upon successfull charge you should be able to access the digital receipt URL and other objects outlined in the offical docs.

        if co.charge("OPR_TOKEN","CUSTOMER_CONFIRM_TOKEN")
            @receipt = co.receipt_url
            @customer_name = co.customer['name']
        else
            @message = co.response_text
        end

## Download MPower RubyOnRails Demo
https://github.com/nukturnal/MPower_Rails_Demo

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

