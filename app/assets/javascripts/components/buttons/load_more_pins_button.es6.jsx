class LoadMorePinsButton extends React.Component {
    constructor(props) {
        super(props);
        this.state = {}
    }

    render() {
        return (
            <div className="ui two column center aligned stackable grid">
                <div className="six wide column">
                    <div className="ui horizontal divider"></div>
                </div>
            </div>

        )
    }
}

// .ui.horizontal.divider
//   %div.ui.two.column.center.aligned.stackable.grid
//     %div.six.wide.column
//       %div.ui.pagination.menu
//
//
//         -# %div{href: "#{'/?page='+ @pins.previous_page.to_s}", class: "#{@pins.previous_page || 'disabled'} item"}
//         -#   Previous
//         %a{href: "#{'/?page='+ @pins.next_page.to_s}", class: "item #{@pins.next_page || 'disabled'}"}
//           Next
