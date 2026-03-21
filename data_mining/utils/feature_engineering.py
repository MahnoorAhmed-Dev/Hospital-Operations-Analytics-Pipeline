def classify_measure(measure_name):
  name = measure_name.lower()
  if "percentage" in name or "rate" in name:
    return "percentage"
  elif "time" in name or "waiting" in name:
    return "time"
  elif "cost" in name:
    return "cost"
  elif "number" in name:
    return "volume"
  else:
    return "other"
  
def performance_direction(measure_name):
  name = measure_name.lower()
  if "percentage" in name or "rate" in name:
    return "higher_better"
  elif "time" in name or "waiting" in name or "cost" in name:
    return "lower_better"
  else:
    return "neutral"
  