#ДАНО: Робот - в произвольной клетке ограниченного прямоугольного поля
#РЕЗУЛЬТАТ: Робот - в исходном положении, и все клетки поля промакированы

function markall(r::Robot)
    nun_vert = get_num_steps_movements!(r,Sud)
    nun_hor = get_num_steps_movements!(r,West)
    #УТВ: Робот в юго-западном углу

    side=orthogonal_side
    mark_row!(r,side)
    while isborder!(r,Nord)==false
        side=inverse(side)
        mark_row!(r,side)
    end
    #Робот у северной границы, в одном из углов

    movements!(r,Ost,num_hor)
    movements!(r,Nord,num_hor)
end