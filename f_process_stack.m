function [region_stack rect index_regions g_index_stack stack] = f_process_stack(new_pixel_grey_level, region_stack, stack, g_index_stack, index_regions, rect)
  while (new_pixel_grey_level > region_stack(stack(g_index_stack).node).level)
    index_top = stack(g_index_stack).node;
    g_index_stack = g_index_stack - 1;
    index_new_top = stack(g_index_stack).node;
    new_top_level = region_stack(index_new_top).level;
    if (new_pixel_grey_level < new_top_level)
      % PUSH AND MERGE
      index_regions = index_regions + 1;
      region_stack(index_regions).level = new_pixel_grey_level;
      region_stack(index_regions).area = region_stack(index_top).area;
      region_stack(index_regions).mom(1) = region_stack(index_top).mom(1);
      region_stack(index_regions).mom(2) = region_stack(index_top).mom(2);
      region_stack(index_regions).mom(3) = region_stack(index_top).mom(3);
      region_stack(index_regions).mom(4) = region_stack(index_top).mom(4);
      region_stack(index_regions).mom(5) = region_stack(index_top).mom(5);
      region_stack(index_regions).variation_mser = 999999;
      region_stack(index_regions).stable = 0;
      region_stack(index_regions).parent = 0;
      region_stack(index_top).next = region_stack(index_regions).child;
      region_stack(index_top).parent = index_regions;
      region_stack(index_regions).child = index_top;
      region_stack(index_regions).next = 0;

      rect(index_regions).top = Inf;
      rect(index_regions).bottom = 0;
      rect(index_regions).left = Inf;
      rect(index_regions).right = 0;
      rect(index_regions).draw = 1;

      rect(index_regions).top    = min(rect(index_top).top,rect(index_regions).top);
      rect(index_regions).bottom = max(rect(index_top).bottom,rect(index_regions).bottom);
      rect(index_regions).left   = min(rect(index_top).left,rect(index_regions).left);
      rect(index_regions).right  = max(rect(index_top).right,rect(index_regions).right);

      g_index_stack = g_index_stack + 1;
      stack(g_index_stack).node = index_regions;
      break;
    end
    % MERGE WITH OLD REGION
    region_stack(index_new_top).area = region_stack(index_top).area + region_stack(index_new_top).area;
    region_stack(index_new_top).mom(1) = region_stack(index_top).mom(1) + region_stack(index_new_top).mom(1);
    region_stack(index_new_top).mom(2) = region_stack(index_top).mom(2) + region_stack(index_new_top).mom(2);
    region_stack(index_new_top).mom(3) = region_stack(index_top).mom(3) + region_stack(index_new_top).mom(3);
    region_stack(index_new_top).mom(4) = region_stack(index_top).mom(4) + region_stack(index_new_top).mom(4);
    region_stack(index_new_top).mom(5) = region_stack(index_top).mom(5) + region_stack(index_new_top).mom(5);
    region_stack(index_top).parent = index_new_top;
    region_stack(index_top).next = region_stack(index_new_top).child;
    region_stack(index_new_top).child = index_top;

    rect(index_new_top).top = Inf;
    rect(index_new_top).bottom = 0;
    rect(index_new_top).left = Inf;
    rect(index_new_top).right = 0;
    rect(index_new_top).draw = 1;

    rect(index_new_top).top    = min(rect(index_top).top,rect(index_new_top).top);
    rect(index_new_top).bottom = max(rect(index_top).bottom,rect(index_new_top).bottom);
    rect(index_new_top).left   = min(rect(index_top).left,rect(index_new_top).left);
    rect(index_new_top).right  = max(rect(index_top).right,rect(index_new_top).right);

    stack(g_index_stack).node = index_new_top;
  end
end
