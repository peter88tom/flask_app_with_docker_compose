from app import welcome


def test_welcome():
  assert welcome() == "This is my welcome page"
