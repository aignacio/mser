function img = f_segmentation(img, color_threshold, color_of_interest, ratio)
  height = size(img,1);
  width = size(img,2);
  for lin=1:height
    for col=1:width
      r = img(lin,col,1);
      g = img(lin,col,2);
      b = img(lin,col,3);
      switch color_of_interest
        case 'red'
          if (r > color_threshold && (r/g > ratio*2 && r/g > ratio*2))
            img(lin,col,1) = 0;
            img(lin,col,2) = 0;
            img(lin,col,3) = 0;
          else
            img(lin,col,1) = 255;
            img(lin,col,2) = 255;
            img(lin,col,3) = 255;
          end
        case 'green'
          if (g > color_threshold && (g/r > ratio && g/b > ratio/2))
            img(lin,col,1) = 0;
            img(lin,col,2) = 0;
            img(lin,col,3) = 0;
          else
            img(lin,col,1) = 255;
            img(lin,col,2) = 255;
            img(lin,col,3) = 255;
          end
        case 'blue'
          if (b > color_threshold && (b/r > ratio && b/g > ratio))
            img(lin,col,1) = 0;
            img(lin,col,2) = 0;
            img(lin,col,3) = 0;
          else
            img(lin,col,1) = 255;
            img(lin,col,2) = 255;
            img(lin,col,3) = 255;
          end
      end
    end
  end
end
