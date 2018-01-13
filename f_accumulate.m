function [region_stack rect] = f_accumulate(region_stack, rect, stack, g_index_stack, x, y)
  top = stack(g_index_stack).node;
  region_stack(top).area   = 1 + region_stack(top).area;
  region_stack(top).mom(1) = x + region_stack(top).mom(1);
  region_stack(top).mom(2) = y + region_stack(top).mom(2);
  region_stack(top).mom(3) = (x*x) + region_stack(top).mom(3);
  region_stack(top).mom(4) = (x*y) + region_stack(top).mom(4);
  region_stack(top).mom(5) = (y*y) + region_stack(top).mom(5);
  rect(top).top = min(rect(top).top,y);
  rect(top).bottom = max(rect(top).bottom,y+1);
  rect(top).left = min(rect(top).left,x);
  rect(top).right = max(rect(top).right,x+1);
end
