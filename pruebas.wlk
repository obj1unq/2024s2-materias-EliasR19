object prueba{
    const list1 = [1,2,3,4,5]
    const list2 = [1,3,5,7]
    const list3 = [2,4,6,8]
    const list1B = [1,2,3,4,5]
    const listTotal = [list1, list2, list3]


    method pruebaF(){
        return [list1, list2, list3].flatten()
    }

    method allA(){
        return list1.all({num => list1B.contains(num)})
    }


}