defmodule Meetup do
  @moduledoc """
  Calculate meetup dates.
  """

  @type weekday ::
      :monday | :tuesday | :wednesday
    | :thursday | :friday | :saturday | :sunday

  @type schedule :: :first | :second | :third | :fourth | :last | :teenth

  @weekdays %{
    monday: 1,
    tuesday: 2,
    wednesday: 3,
    thursday: 4,
    friday: 5,
    saturday: 6,
    sunday: 7
  }

  @doc """
  Calculate a meetup date.

  The schedule is in which week (1..4, last or "teenth") the meetup date should
  fall.
  """
  @spec meetup(pos_integer, pos_integer, weekday, schedule) :: :calendar.date
  def meetup(year, month, weekday, schedule) do
    last_day = :calendar.last_day_of_the_month(year, month)
    day_index = @weekdays[weekday]
    day = for d <- 1..last_day do
      {d, :calendar.day_of_the_week({year, month, d})}
    end
    |> Enum.filter_map(fn {_, m} -> m == day_index end, fn {l, _} -> l end)
    |> find_day(schedule)
    {year, month, day}
  end

  defp find_day(dates, schedule) do
    case schedule do
      :first -> dates |> List.first
      :second -> dates |> Enum.at(1)
      :third -> dates |> Enum.at(2)
      :fourth -> dates |> Enum.at(3)
      :last -> dates |> List.last
      :teenth -> dates |> Enum.filter(&(&1 > 12 and &1 < 20)) |> List.first
    end
  end
end
