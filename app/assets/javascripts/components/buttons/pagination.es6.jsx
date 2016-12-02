class Pagination extends React.Component {
    constructor(props) {
        super(props);
        this.state = props;
    }
    previous_page() {
        if (this.state.previous_page) {
            return (
                <a className="item" href={"/?page=" + this.state.previous_page}>Previous</a>
            )
        } else {
            return (
                <div className="disabled item">Previous</div>
            )
        }

    }
    next_page() {
        if (this.state.next_page) {
            return (
                <a className="item" href={"/?page=" + this.state.next_page}>Next</a>
            )
        } else {
            return (
                <div className="disabled item">Next</div>
            )
        }

    }
    render() {

        if (this.state.total_pages > 1) {
            return (
                <div className="ui two column center aligned stackable grid">
                    <div className="six wide column">
                        <div className="ui horizontal divider">
                            <div className="ui pagination menu">
                                {this.previous_page()}
                                {this.next_page()}
                            </div>
                        </div>
                    </div>
                </div>

            )
        } else {
            return (
                <span></span>
            );
        }

    }
}
