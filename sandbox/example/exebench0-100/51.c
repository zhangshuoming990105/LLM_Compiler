float UI_ClampCvar(float min, float max, float value) {
  if (value < min)
    return min;
  if (value > max)
    return max;
  return value;
}