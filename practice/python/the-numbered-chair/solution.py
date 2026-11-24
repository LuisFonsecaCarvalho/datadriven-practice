def nth_highest_key(n: int, data: dict[str, int]) -> str:
  
  if len(data) > n-1:
    sort_data = dict(sorted(data.items(), key=lambda item: (-item[1], item[0])))
    return list(sort_data.keys())[n-1]
  return None

  

  
