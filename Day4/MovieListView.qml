import QtQuick 2.7

ListView {
    id : root
    model: ListModel{
        ListElement{movie_name:"Recep İvedik1"}
        ListElement{movie_name:"Recep İvedik2"}
        ListElement{movie_name:"Recep İvedik3"}
        ListElement{movie_name:"Recep İvedik4"}

    }

    delegate: Component{
    MovieListItem{
        width:parent.width
        height:50
        name:movie_name
        movieIndex:index+1
    }
    }

}
