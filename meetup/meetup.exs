defmodule Meetup do
  @moduledoc """
  Calculate meetup dates.
  """

  @type weekday ::
      :monday | :tuesday | :wednesday
    | :thursday | :friday | :saturday | :sunday

  @type schedule :: :first | :second | :third | :fourth | :last | :teenth

  @doc """
  Calculate a meetup date.

  The schedule is in which week (1..4, last or "teenth") the meetup date should
  fall.
  """
  @spec meetup(pos_integer, pos_integer, weekday, schedule) :: :calendar.date
  def meetup(year, month, weekday, schedule) do
    weekdays = [monday: 1, tuesday: 2, wednesday: 3, thursday: 4, friday: 5, saturday: 6, sunday: 7]

    last_day = :calendar.last_day_of_the_month(year, month)
    {_, day_index} = List.keyfind(weekdays, weekday, 0)
    for day <- 1..last_day do
      {day, :calendar.day_of_the_week({year, month, day})}
    end
    |> Enum.filter_map(fn {_, m} -> m == day_index end, fn {l, _} -> l end)
    |> find_date(schedule)
    |> wrap(year, month)
  end

  defp wrap(day, year, month) do
    {year, month, day}
  end

  defp find_date(dates, schedule) do
    case schedule do
      :first -> dates |> List.first
      :second -> dates |> Enum.drop(1) |> List.first
      :third -> dates |> Enum.drop(2) |> List.first
      :fourth -> dates |> Enum.drop(3) |> List.first
      :last -> dates |> List.last
      :teenth -> dates |> Enum.filter(&(&1 > 12 and &1 < 20)) |> List.first
    end
  end
end