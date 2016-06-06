defmodule MathTest do
  use Assertion

  test "integers can do +,-" do
    assert 1 + 1 == 2
    assert 2 + 3 == 5
    assert 5 + 5 == 10
  end

  test "integers can do *,/ " do
    assert 10/2 == 5
    assert 2 * 3 == 6
  end

  test "assert booleans" do
    assert true
    assert []
  end
end