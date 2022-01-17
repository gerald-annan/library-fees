defmodule LibraryFees do
  def datetime_from_string(string) do
    NaiveDateTime.from_iso8601!(string)
  end

  def before_noon?(datetime) do
    :lt == NaiveDateTime.to_time(datetime) |> Time.compare(~T[12:00:00])
  end

  def return_date(checkout_datetime) do
    if before_noon?(checkout_datetime),
      do: Date.add(checkout_datetime, 28),
      else: Date.add(checkout_datetime, 29)
  end

  def days_late(planned_return_date, actual_return_datetime) do
    result = Date.diff(actual_return_datetime, planned_return_date)
    if result < 0, do: 0, else: result
  end

  def monday?(datetime) do
  end

  def calculate_late_fee(checkout, return, rate) do
  end
end
