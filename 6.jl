function mark_innerrectangle_perimetr!(r::Robot)
    if side == Nord
        # обходить прямоугольник следует по часовой стрелке
        direction_of_movement=(Nord,Ost,Sud, West)
        direction_to_border=(Ost,Sud,West,Nord)
    else 
        # обходить прямоугольник следует против часовой стрелки
        direction_of_movement=(Sud,Ost,Nord,West)
        direction_to_border=(Ost,Nord,West,Sud)
    end

    for i ∈ 1:4   
        # надо ставить маркеры вдоль очередной стороны внутренней перегородки 
        # (перемещаться надо в одном направлении, а следить за перегородеой в - 
        # перпендикулярном ему)
        putmarkers!(r,  direction_of_movement[i], direction_to_border[i]) 
    end
end

function mark_innerrectangle_perimetr!(r::Robot, side::HorizonSide)
    direction_of_movement, direction_to_border = get_directions(side)
    for i ∈ 1:4   
        putmarkers!(r, direction_of_movement[i], direction_to_border[i]) 
    end
end


get_directions(side::HorizonSide) = if side == Nord  
    # - обход будет по часовой стрелке      
        return (Nord,Ost,Sud, West), (Ost,Sud,West,Nord)
    else # - обход будет против часовой стрелки
        return (Sud,Ost,Nord,West), (Ost,Nord,West,Sud) 
    end

    function putmarkers!(r::Robot, direction_of_movement::HorizonSide, direction_to_border::HorizonSide)
        while isborder(r,direction_to_border)==true
            move!(r,direction_of_movement)
        end
    end