class AddEmailConstraintToUsers < ActiveRecord::Migration

  def change
    reversible do |direction|
 	direction.up{
	  execute %{
	  	ALTER TABLE
		  users
		ADD CONSTRAINT
		  email_must_be_company_email
		CHECK(email ~* '^[^@]+@example\\.com')
	  }
	}

  	direction.down{
	  execute %{
	  	ALTER TABLE
		  users
		DROP CONSTRAINT
		  email_must_be_company_email
	  }
  	}
    end
  end

/*
  def up
    execute %{
      ALTER TABLE
        users
      ADD CONSTRAINT
	email_must_be_company_email
      CHECK(email ~* '^[^@]+@example\\.com')
    }
  end

  def down
    execute %{
      ALTER TABLE
        users
      DROP CONSTRAINT
      	email_must_be_company_email
    }
  end
*/
end
