class EighteenValidator < ActiveModel::EachValidator
def validate_each(record, attribute, value) # バリデーションメソッド
	  year_old = Happybirthday.born_on(birthday.year.to_s + '/' + birthday.month.to_s + '/' + birthday.day.to_s).age.years_old
	  p year_old
	  if year_old.to_i < 18
        record.errors.add(attribute, " は hoge_ から始まるようにしましょう！")
	  end
end
end