% Function to find the next neighbor using 4-connect pixel image mode
% Example:
%                    edge=3
%            edge=2  PIXEL  edge=0
%                    edge=1
%
function neighbor = f_neighbor_pixel(current_pixel, current_edge, width, height)
  % VECTOR MODE - If we want to search in VECTOR MODE
  % We need this two vars because our image now is a long vector
  x = mod(current_pixel, width); % Give us the offset in the line of the image
  if x == 0
    x = width;
  end
  y = floor(current_pixel/width); % Give us the line that we are working

  neighbor = current_pixel;

  switch current_edge
    case 0   % >>>>>>
      if (x < width)
        neighbor = current_pixel + 1;
      end
    case 1   % vvvvvv
      if (y < (height-1))
        neighbor = current_pixel + width;
      end
    case 2   % <<<<<<
      if (x > 1)
        neighbor = current_pixel - 1;
      end
    case 3   % ^^^^^^
      if (y > 1)
        neighbor = current_pixel - width;
      end
    otherwise
      neighbor = current_pixel;
  end


  % neighbor = current_pixel;
  % current_pixel = current_pixel;
  % current_edge = current_edge + 1;
  % offsets = [1 0; 0 1;-1 0; 0 -1; 1 1;-1 1;-1 -1; 1 -1];
  % x = mod(current_pixel,width);
  % y = floor(current_pixel / width);
  % nx = x + offsets(current_edge,1);
  % ny = y + offsets(current_edge,2);
  % if (nx >= 0 && ny >= 0 && nx <= width && ny < height)
  %   neighbor = (ny * width) + nx;
  % end
  % if neighbor == 0
  %   neighbor = current_pixel;
  % end
  %
  % if current_pixel == width
  %   neighbor = current_pixel;
  % end

  % MATRIX MODE - If we want to search in MATRIX MODE
  % neighbor = current_pixel;
  %
  % switch current_edge
  %   case 0   % >>>>>>
  %     if (current_pixel.width_X < width)
  %       neighbor.width_X = current_pixel.width_X + 1;
  %     end
  %   case 1   % vvvvvv
  %     if (current_pixel.height_Y < height)
  %       neighbor.height_Y = current_pixel.height_Y + 1;
  %     end
  %   case 2   % <<<<<<
  %     if (current_pixel.width_X > 1)
  %       neighbor.width_X = current_pixel.width_X - 1;
  %     end
  %   case 3   % ^^^^^^
  %     if (current_pixel.height_Y > 1)
  %       neighbor.height_Y = current_pixel.height_Y - 1;
  %     end
  %   otherwise
  %     neighbor = current_pixel;
  % end
end
